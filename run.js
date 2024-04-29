/**
 * run
 */


let builder = require("../my-build-tools");
let files = builder.tools.files;
let tools = builder.tools.tools;

let child_process = require("child_process");


let buildDir = "./build";
let releaseDir = "./release";
let packageDir = "./packages";
let mainName = "UyghurLanguageTools";
let mainPath = buildDir + "/" + mainName + ".hx";
files.mk_folder(buildDir);

let build_alpbets = () => {
    tools.spawn('lua ./alphabets.lua');
    
    let bldr = builder.code({});
    let source = "./src/Alphabets.hx";
    let skipMap = new Map();

    bldr.setInput(source);
    bldr.setComment("//", null);
    bldr.onMacro((code, command) => {
        let [name, tp] = command.split("_");
        if (tp == "START") {
            skipMap.set(name, true);
            return "// [M[ {0}_START ]M]".format(name)
        } else if (tp == "END") {
            skipMap.set(name, false);
            let path = "./build/" + name + ".txt";
            let content = files.read(path, "utf-8");
            return "{0}// [M[ {1}_END ]M]".format(content, name)
        }
    });
    bldr.onLine((line) => {
        let isSkip = false;
        skipMap.forEach((v, k) => {
            if (v) isSkip = true;
        });
        if (isSkip) {
            return null;
        }
        return line
    });
    bldr.setOutput(source);
    bldr.start();
}

let build_tools = (isRun) => {
    let bldr = builder.code({});
    let target = mainPath;
    let heads = [];
    // merge files
    bldr.setInput(
        "./src/Alphabets.hx",
        "./src/Converter.hx",
        "./src/Keyboard.hx",
        "./src/Numbers.hx",
        "./src/Reshaper.hx",
        "./src/Syllable.hx",
        "./src/Tools.hx"
    );
    bldr.setComment("//", undefined);
    bldr.onMacro((code, command) => {
        if (command == "HEAD_RAISE") {
            heads.push(code)
        } else if (command == "HEAD_IGNORE") {
            return null;
        }
    });
    bldr.setOutput(target);
    bldr.start();
    // append header
    let headers = heads.join("\n");
    let content = files.read(target, "utf-8");
    files.write(target, headers + "\n" + content, "utf-8");
    // run tool
    if (isRun) {
        tools.spawn("cd " + buildDir + " & haxe --main " + mainName + " --interp");
    }
}

let build_release = () => {
    console.log('\nbuild release start:');
    // 
    let [isOk, outut] = tools.spawn("haxe ./others/build.hxml");
    console.log('build main:', isOk ? "OK!" : outut);
    // 
    [isOk, outut] = tools.spawn("cp " + mainPath + " release/");
    console.log('copy haxe:', isOk ? "OK!" : outut);
    // 
    [isOk, outut] = tools.spawn("php ./others/phar.php");
    console.log('pack phar:', isOk ? "OK!" : outut);
    [isOk, outut] = tools.spawn("rm -rf release/Tools_php");
    console.log('dell php:', isOk ? "OK!" : outut);
    // 
    [isOk, outut] = tools.spawn("cp release/Tools_csharp/bin/UyghurLanguageTools.dll release/");
    console.log('pack dll:', isOk ? "OK!" : outut);
    [isOk, outut] = tools.spawn("rm -rf release/Tools_csharp");
    console.log('dell csharp:', isOk ? "OK!" : outut);
    // // 
    console.log('build release end!\n');
}

let build_npm = (isPublish) => {
    console.log('\nbuild npm start:');
    let npmPath = packageDir + "/npm";
    let package_npm = () => {
        console.log('package npm ...');
        files.copy(releaseDir + "/UyghurLanguageTools.js", npmPath + "/index.js");
    }
    let publish_npm = () => {
        console.log('publish npm ...');
        tools.spawn("npm config set registry https://registry.npmjs.org/");
        tools.spawn("npm login");
        tools.spawn("cd " + npmPath + " & npm publish");
        // tools.spawn("cd " + npmPath + " & npm link") // test
    }
    package_npm();
    if (isPublish) {
        publish_npm();
    }
    console.log('\nbuild npm end!');
}

let build_pip = (isPublish) => {
    console.log('\nbuild pip start:');
    let pipPath = packageDir + "/pip";
    let package_pip = () => {
        console.log('package pip ...');
        files.copy(releaseDir + "/UyghurLanguageTools.py", pipPath + "/uyghur_language_tools/UyghurLanguageTools.py");
        tools.spawn("cd " + pipPath + " & python3 setup.py sdist");
        // tools.spawn("cd " + pipPath + " & python3 setup.py develop") // test
    }
    let publish_pip = () => {
        console.log('publish pip ...');
        tools.spawn("pip install twine");
        tools.spawn("cd " + pipPath + " & twine upload --skip-existing dist/*");
    }
    package_pip();
    if (isPublish) {
        publish_pip();
    }
    console.log('\nbuild pip end!');
}

// run target

build_alpbets();
// build_tools(true);
// build_release();
// build_npm(false);
// build_pip(false);
