import os
import time
import subprocess
import sys

sys.path.append('../my-build-tools/')
from builder import builder
files = builder.tools.files
tools = builder.tools.tools


buildDir = "./build"
releaseDir = "./release"
packageDir = "./packages"
mainName = "UyghurLanguageTools"
mainPath = os.path.join(buildDir, f"{mainName}.hx")

files.mk_folder(buildDir)

# 

def build_alphabets():
    #
    print("\nbuild alphabets start:")
    space = " "
    ALPHABETS_MAP = []
    TYPES = {
        "MARKS": "MARKS",
        "COMPOUNDS": "COMPOUNDS",
        "VOWELS": "VOWELS",
        "CONSONANTS": "CONSONANTS",
    }

    def ALPHABET(tp, *arr):
        for v in arr:
            ALPHABETS_MAP.append({
                "tp": tp,
                "nm": v[0],
                "idx": v[1],
                "ipa": v[2],
                "alpha": [v[3], v[4], v[5], v[6], v[7]],  # [cts, uas, ucs, uns, uls]
            })

    def M(*args):
        ALPHABET(TYPES["MARKS"], *args)

    def V(*args):
        ALPHABET(TYPES["VOWELS"], *args)

    def C(*args):
        ALPHABET(TYPES["CONSONANTS"], *args)

    def K(*args):
        ALPHABET(TYPES["COMPOUNDS"], *args)

    # Marks
    M(
        ["HEMZE", 0, "'", "'", "ئ", "'", "'", "'"],
        ["COMMA", 0, ",", ",", "،", ",", ",", ","],
        ["EXCLA", 0, "!", "!", "!", "!", "!", "!"],
        ["QUESS", 0, "?", "?", "؟", "?", "?", "?"],
        ["COLON", 0, ";", ";", "؛", ";", ";", ";"]
    )
    # Vowels
    V(
        ["A", 1, "ɑ", "a", "ا", "a", "a", "a"],
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
    # Consonants
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
    # Compounds from Cyrillic
    K(
        ["YU", 0, "ju", "yu", "ي‍‍ۇ", "ю", "yu", "yu"],
        ["YA", 0, "jɑ", "ya", "ي‍‍ا", "я", "ya", "ya"]
    )

    # Write to Haxe
    NAME_DATA_MAP = {}
    ALPHABET_KEYS = {
        "idx": ["Int", "alphabet order"],
        "tp": ["TYPES", "alphabet type"],
        "ipa": ["String", "reading sound"],
        "nm": ["NAMES", "english name"],
        "alpha": ["Array<String>", "language script"],
    }

    types = "\n".join([f"    {v};" for v in TYPES.values()])
    NAME_DATA_MAP["TYPES"] = types + "\n"

    names = "\n".join([f"    {v['nm']};" for v in ALPHABETS_MAP])
    NAME_DATA_MAP["NAMES"] = names + "\n"

    TEMPLATE_CONFIG = '''    // {0}
    NAMES.{1} => {{{2}
    }},\n'''
    TEMPLATE_PAIRS = "%s : %s,"
    alphabets = ""
    for info in ALPHABETS_MAP:
        entry = ""
        for key in ALPHABET_KEYS.keys():
            value = info[key]
            if key == "tp":
                value = f"TYPES.{value}"
            elif key == "nm":
                value = f"NAMES.{value}"
            elif isinstance(value, list):
                items = ', '.join([f'"{v}"' for v in value])
                value = f'[{items}]'
            elif isinstance(value, int):
                value = f"{value}"
            else:
                value = f'"{value}"'
            entry += f"\n        {TEMPLATE_PAIRS % (key, value)}"
        conf = TEMPLATE_CONFIG.format(info['nm'], info['nm'], entry)
        alphabets += conf

    NAME_DATA_MAP["ALPHABETS"] = alphabets
    #
    # process hx
    bldr = builder.code()
    source = "./src/Alphabets.hx"
    skipMap = dict()

    bldr.setInput(source)
    bldr.setComment("//", "")
    def macro_handler(code, command):
        name, tp = command.split("_")
        if tp == "START":
            skipMap[name] = True
            return f"// [M[ {name}_START ]M]"
        elif tp == "END":
            skipMap[name] = False
            content = NAME_DATA_MAP[name]
            return f"{content}// [M[ {name}_END ]M]"
    bldr.onMacro(macro_handler)
    def line_handler(line):
        is_skip = any(skipMap.values())
        if is_skip:
            return None
        return line
    bldr.onLine(line_handler)
    bldr.setOutput(source)
    bldr.start()
    print("build alphabets end!")

def build_tools(isRun):
    print('\nbuild tools start:')
    bldr = builder.code()
    target = mainPath
    heads = []
    # merge files
    bldr.setInput(
        "./src/Alphabets.hx",
        "./src/Converter.hx",
        "./src/Keyboard.hx",
        "./src/Numbers.hx",
        "./src/Reshaper.hx",
        "./src/Syllable.hx",
        "./src/Tools.hx"
    )
    bldr.setComment("//", None)
    def macro_handler(code, command):
        if command == "HEAD_RAISE":
            heads.append(code)
        elif command == "HEAD_IGNORE":
            return None

    bldr.onMacro(macro_handler)
    bldr.setOutput(target)
    bldr.start()

    # append header
    headers = "\n".join(heads)
    with open(target, 'r', encoding='utf-8') as f:
        content = f.read()

    with open(target, 'w', encoding='utf-8') as f:
        f.write(headers + "\n" + content)

    # run tool
    if isRun:
        os.system(f"cd {buildDir} && haxe --main {mainName} --interp")
    print('build tools end!')


def build_release():
    print('\nbuild release start:')
    is_ok, output = tools.spawn("haxe ./others/build.hxml")
    print('build main:', "OK!" if is_ok else output)
    #
    is_ok, output = tools.spawn(f"cp {mainPath} release/")
    print('copy haxe:', "OK!" if is_ok else output)
    #
    is_ok, output = tools.spawn("php ./others/phar.php")
    print('pack phar:', "OK!" if is_ok else output)
    #
    is_ok, output = tools.spawn("rm -rf release/Tools_php")
    print('delete php:', "OK!" if is_ok else output)
    #
    is_ok, output = tools.spawn("cp release/Tools_csharp/bin/UyghurLanguageTools.dll release/")
    print('pack dll:', "OK!" if is_ok else output)
    #
    is_ok, output = tools.spawn("rm -rf release/Tools_csharp")
    print('delete csharp:', "OK!" if is_ok else output)
    # 
    print('build release end!\n')


def build_npm(is_publish):
    print('\nbuild npm start:')
    npmPath = os.path.join(packageDir, "npm")

    def package_npm():
        print('package npm ...')
        files.copy(os.path.join(releaseDir, "UyghurLanguageTools.js"), os.path.join(npmPath, "index.js"))

    def publish_npm():
        print('publish npm ...')
        tools.spawn("npm config set registry https://registry.npmjs.org/")
        tools.spawn("npm login")
        tools.spawn(f"cd {npmPath} & npm publish")

    package_npm()
    if is_publish:
        publish_npm()
    print('build npm end!')

def build_pip(is_publish):
    print('\nbuild pip start:')
    pip_path = os.path.join(packageDir, "pip")

    def package_pip():
        print('package pip ...')
        files.copy(os.path.join(releaseDir, "UyghurLanguageTools.py"), os.path.join(pip_path, "uyghur_language_tools", "UyghurLanguageTools.py"))
        tools.spawn(f"cd {pip_path} & python3 setup.py sdist")
        # tools.spawn(f"cd {pip_path} & python3 setup.py develop") # test

    def publish_pip():
        print('publish pip ...')
        tools.spawn("pip install twine")
        tools.spawn(f"cd {pip_path} & twine upload --skip-existing dist/*")

    package_pip()
    if is_publish:
        publish_pip()
    print('build pip end!')

#################################################

# haxelib install hxjava
# haxelib install hxcs

build_alphabets()
build_tools(True)
# build_release()
# build_npm(False)
# build_pip(False)
