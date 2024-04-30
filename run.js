/**
 * run
 */


let builder = require("../my-build-tools");
let files = builder.tools.files;
let tools = builder.tools.tools;

//

let buildDir = "./build";
let releaseDir = "./release";
let packageDir = "./packages";
let mainName = "UyghurLanguageTools";
let mainPath = buildDir + "/" + mainName + ".hx";
files.mk_folder(buildDir);

//

let build_alpbets = () => {
    // 
    console.log("\nbuild alpabets start:");
    const space = " ";
    const ALPHABETS_MAP = [];
    const TYPES = {
        MARKS: "MARKS",
        COMPOUNDS: "COMPOUNDS",
        VOWELS: "VOWELS",
        CONSONANTS: "CONSONANTS",
    };
    //
    let ALPHABET = (tp, ...arr) => arr.forEach((v) => ALPHABETS_MAP.push({
        tp: tp,
        nm: v[0],
        idx: v[1],
        ipa: v[2],
        alpha: [v[3], v[4], v[5], v[6], v[7]], // [cts, uas, ucs, uns, uls]
    }))
    let M = (...args) => ALPHABET(TYPES.MARKS, ...args);
    let V = (...args) => ALPHABET(TYPES.VOWELS, ...args);
    let C = (...args) => ALPHABET(TYPES.CONSONANTS, ...args);
    let K = (...args) => ALPHABET(TYPES.COMPOUNDS, ...args);
    // Marks
    M(
        ["HEMZE", 0, "'", "'", "ئ", "'", "'", "'",],
        ["COMMA", 0, ",", ",", "،", ",", ",", ",",],
        ["EXCLA", 0, "!", "!", "!", "!", "!", "!",],
        ["QUESS", 0, "?", "?", "؟", "?", "?", "?",],
        ["COLON", 0, ";", ";", "؛", ";", ";", ";",]
    )
    // Vowels
    V(
        ["A", 1, "ɑ", "a", "ا", "a", "a", "a",],
        ["AE", 2, "æ", "ä", "ە", "ә", "ə", "e"]
    )
    V(
        ["O", 25, "", "o", "و", "о", "o", "o"],
        ["U", 26, "", "u", "ۇ", "у", "u", "u"],
        ["OO", 27, "", "ö", "ۆ", "ө", "ɵ", "ö"],
        ["UU", 28, "", "ü", "ۈ", "ү", "ü", "ü"],
        ["I", 31, "", "i", "ى", "и", "i", "i"],
        ["E", 30, "", "e", "ې", "е", "e", "ë"]
    )
    // Consonants
    C(
        ["B", 3, "b", "b", "ب", "б", "b", "b"],
        ["P", 4, "p", "p", "پ", "п", "p", "p"],
        ["T", 5, "t", "t", "ت", "т", "t", "t"],
        ["DJ", 6, "dʒ", "c", "ج", "җ", "j", "j"],
        ["CH", 7, "tʃ", "ç", "چ", "ч", "q", "ch"],
        ["X", 8, "x", "x", "خ", "х", "h", "x"],
        ["D", 9, "d", "d", "د", "д", "d", "d"],
        ["R", 10, "r", "r", "ر", "р", "r", "r"],
        ["Z", 11, "z", "z", "ز", "з", "z", "z"],
        ["J", 12, "ʒ", "j", "ژ", "ж", "ⱬ", "zh"],
        ["S", 13, "s", "s", "س", "с", "s", "s"],
        ["SH", 14, "ʃ", "ş", "ش", "ш", "x", "sh"],
        ["GH", 15, "ɣ", "ğ", "غ", "ғ", "ƣ", "gh"],
        ["F", 16, "f", "f", "ف", "ф", "f", "f"],
        ["Q", 17, "q", "q", "ق", "қ", "ⱪ", "q"],
        ["K", 18, "k", "k", "ك", "к", "k", "k"],
        ["G", 19, "g", "g", "گ", "г", "g", "g"],
        ["NG", 20, "ŋ", "ñ", "ڭ", "ң", "ng", "ng"],
        ["L", 21, "l", "l", "ل", "л", "l", "l"],
        ["M", 22, "m", "m", "م", "м", "m", "m"],
        ["N", 23, "n", "n", "ن", "н", "n", "n"],
        ["H", 24, "h", "h", "ھ", "һ", "ⱨ", "h"],
        ["V", 29, "v", "v", "ۋ", "в", "v", "w"],
        ["Y", 32, "j", "y", "ي", "й", "y", "y"]
    )
    // Compounds from Cyrillic
    K(
        ["YU", 0, "ju", "yu", "ي‍‍ۇ", "ю", "yu", "yu"],
        ["YA", 0, "jɑ", "ya", "ي‍‍ا", "я", "ya", "ya"]
    )
    // write to haxe
    const NAME_DATA_MAP = {};
    const ALPHABET_KEYS = {
        idx: ["Int", "alphabet order"],
        tp: ["TYPES", "alphabet type"],
        ipa: ["String", "reading sound"],
        nm: ["NAMES", "english name"],
        alpha: ["Array<String>", "language script"],
    };
    //
    let types = null;
    for (const [k, v] of Object.entries(TYPES)) {
        types = (types ? types + "\n" : "") + space.repeat(4) + v + ";";
    }
    NAME_DATA_MAP["TYPES"] = types + "\n";
    //
    let names = null;
    for (let i = 0; i < ALPHABETS_MAP.length; i++) {
        const v = ALPHABETS_MAP[i];
        names = (names ? names + "\n" : "") + space.repeat(4) + v.nm + ";";

    }
    NAME_DATA_MAP["NAMES"] = names + "\n";
    //
    const TEMPLATE_CONFIG = `// {0}
    NAMES.{1} => {{2}
    },\n`;
    const TEMPLATE_PAIRS = `%s : %s,`;
    let alphabets = "";
    for (let index = 0; index < ALPHABETS_MAP.length; index++) {
        const info = ALPHABETS_MAP[index];
        let entry = "";
        for (const [key, _] of Object.entries(ALPHABET_KEYS)) {
            let value = info[key];
            if (key === "tp") {
                value = `TYPES.${value}`;
            } else if (key === "nm") {
                value = `NAMES.${value}`;
            } else if (Array.isArray(value)) {
                const items = value.map((v, i) => (i === 0 ? `"${v}"` : `, "${v}"`)).join("");
                value = `[${items}]`;
            } else if (typeof value === "number") {
                value = `${value}`;
            } else {
                value = `"${value}"`;
            }
            entry += `\n${space.repeat(8)}${TEMPLATE_PAIRS.replace("%s", key).replace("%s", value)}`;
        }
        const conf = TEMPLATE_CONFIG.format(info.nm, info.nm, entry);
        alphabets += `${conf}`;
    }
    NAME_DATA_MAP["ALPHABETS"] = alphabets;
    // 
    // process hx
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
            let content = NAME_DATA_MAP[name];
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
    console.log("build alpabets end!");
}

let build_tools = (isRun) => {
    console.log('\nbuild tools start:');
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
    console.log('build tools end!');
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

//

// build_alpbets();
// build_tools(true);
// build_release();
// build_npm(false);
// build_pip(false);
