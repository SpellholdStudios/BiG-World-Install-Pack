// Take a list of files (or directories) and perform a search-and-replace
// with strings from a catalog file.
// Catalog format is: replacement tab search1 tab search2 tab ...

// path + name of catalog
catalog_file = "SR_consistence_catalog.txt";

// match whole words only? (surrounded with \b in regular expression)
match_words = false;


// build catalog dictionary from catalog file
var fso = new ActiveXObject("Scripting.FileSystemObject");
if (!fso.FileExists(catalog_file)) {
    // try again in script directory (drag'n'drop weirdness)
    var script_dir = fso.GetParentFolderName(WScript.ScriptFullName);
    catalog_file = fso.BuildPath(script_dir, catalog_file);
    if (!fso.FileExists(catalog_file)) {
        WScript.Echo("Could not find catalog file:\n" + catalog_file);
        WScript.Quit(1);
    }
}

var IO_READ = 1;
var IO_WRITE = 2;
var catalog = new ActiveXObject("Scripting.Dictionary");

catalog_file = fso.OpenTextFile(catalog_file, IO_READ);
while (!catalog_file.AtEndOfStream) {
    var line = catalog_file.ReadLine();
    var tokens = line.split("\t");
    if (tokens.length < 2) {
        WScript.Echo("Malformed line in catalog:\n" + line);
        continue;
    }

    var replace_string = tokens.shift();
    for (i in tokens) {
        var search_string = tokens[i];
        if (match_words) {
            search_string = "\\b" + search_string + "\\b";
        }
        if (catalog.Exists(search_string)) {
            WScript.Echo("Warning: Multiple definitions for \""
                         + tokens[i] + "\"");
        }
        catalog.Add(search_string, replace_string);
    }
}
catalog_file.Close();

var catalog_keys = new VBArray(catalog.Keys()).toArray();

var args = WScript.Arguments;
var TEMP_DIR = fso.GetSpecialFolder(2);

var log = new Object();
for (i = 0; i < args.length; i++) {
    // file or dir?
    if (fso.FileExists(args(i))) {
        handleFile(args(i));
    }
    else if (fso.FolderExists(args(i))) {
        var dir = fso.GetFolder(args(i));
        var file_enum = new Enumerator(dir.files);
        for (; !file_enum.atEnd(); file_enum.moveNext()) {
            handleFile(file_enum.item());
        }
    }
    else {
        WScript.Echo("Unknown argument:\n" + args(i));
    }
}

/*/ make a quick report
var report = "Replaces:\n\n"
for (file in log) {
    report += file + ": " + log[file] + "\n";
}
WScript.Echo(report);*/

WScript.Quit(0);

function handleFile(file) {
    // copy file to temp dir
    var tmp_file = fso.BuildPath(TEMP_DIR, fso.GetFileName(file));
    fso.CopyFile(file, tmp_file);
    var in_file = fso.OpenTextFile(tmp_file, IO_READ);

    // assuming small text files, so read all in one go
    var text = in_file.ReadAll();
    in_file.Close();
    var replace_counter = 0;
    for (k in catalog_keys) {
        var search_string = catalog_keys[k];
        var replace_string = catalog.Item(search_string);
        text = text.replace(new RegExp(search_string, "g"),
                            function($0, $1, $2) {
                                replace_counter++;
                                return new String(replace_string);
                            });
    }
    log[file] = replace_counter;
    var out_file = fso.OpenTextfile(file, IO_WRITE);
    out_file.Write(text);
    out_file.Close();
    fso.DeleteFile(tmp_file);
}
