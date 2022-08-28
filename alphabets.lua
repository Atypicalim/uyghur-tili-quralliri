--[[
    alphabets
]]

local infos = {}

local TYPES = {
    MARKS = "MARKS",
    VOWELS = "VOWELS",
    CONSONANTS = "CONSONANTS",
    SEMIVOWELS = "SEMIVOWELS",
    COMPOUNDS = "COMPOUNDS",
}

local LANGUAGES = {
    UYGHURS = "UYGHURS",
}

local function alphabet(tp, nm, ipa, cmn, uyghurs)
    local conf = {
        ["tp"] = tp,
        ["nm"] = nm,
        ["ipa"] = ipa,
        ["cmn"] = cmn,
        [LANGUAGES.UYGHURS] = uyghurs, -- {uas, ucs, uns, uls}
    }
    table.insert(infos, conf)
end

local function M(...)
    alphabet(TYPES.MARKS, ...)
end

local function V(...)
    alphabet(TYPES.VOWELS, ...)
end

local function C(...)
    alphabet(TYPES.CONSONANTS, ...)
end

local function S(...)
    alphabet(TYPES.SEMIVOWELS, ...)
end

local function K(...)
    alphabet(TYPES.COMPOUNDS, ...)
end

-- Marks

M(
    "HEMZE",
    "",
    "",
    {
        "ئ",
        "",
        "",
        ""
    }
)

-- Vowels

V(
    "A",
    "ɑ",
    "a",
    {
        "ا",
        "a",
        "a",
        "a"
    }
)

V(
    "AE",
    "æ",
    "ä",
    {
        "ە",
        "ә",
        "ə",
        "e"
    }
)

V(
    "E",
    "",
    "e",
    {
        "ې",
        "е",
        "e",
        "ë"
    }
)

V(
    "I",
    "",
    "i",
    {
        "ى",
        "и",
        "i",
        "i"
    }
)

V(
    "O",
    "",
    "o",
    {
        "و",
        "о",
        "o",
        "o"
    }
)

V(
    "OO",
    "",
    "ö",
    {
        "ۆ",
        "ө",
        "ɵ",
        "ö"
    }
)

V(
    "U",
    "",
    "u",
    {
        "ۇ",
        "у",
        "u",
        "u"
    }
)

V(
    "UU",
    "",
    "ü",
    {
        "ۈ",
        "ү",
        "ü",
        "ü"
    }
)

-- Consonants

C(
    "B",
    "b",
    "b",
    {
        "ب",
        "б",
        "b",
        "b"
    }
)

C(
    "DJ",
    "dʒ",
    "c",
    {
        "ج",
        "җ",
        "j",
        "j"
    }
)

C(
    "CH",
    "tʃ",
    "ç",
    {
        "چ",
        "ч",
        "q",
        "ch"
    }
)

C(
    "D",
    "d",
    "d",
    {
        "د",
        "д",
        "d",
        "d"
    }
)

C(
    "F",
    "f",
    "f",
    {
        "ف",
        "ф",
        "f",
        "f"
    }
)

C(
    "G",
    "g",
    "g",
    {
        "گ",
        "г",
        "g",
        "g"
    }
)

C(
    "GH",
    "ɣ",
    "ğ",
    {
        "غ",
        "ғ",
        "ƣ",
        "gh"
    }
)

C(
    "H",
    "h",
    "h",
    {
        "ھ",
        "һ",
        "ⱨ",
        "h"
    }
)

C(
    "J",
    "ʒ",
    "j",
    {
        "ژ",
        "ж",
        "ⱬ",
        "zh"
    }
)

C(
    "K",
    "k",
    "k",
    {
        "ك",
        "к",
        "k",
        "k"
    }
)

C(
    "L",
    "l",
    "l",
    {
        "ل",
        "л",
        "l",
        "l"
    }
)

C(
    "M",
    "m",
    "m",
    {
        "م",
        "м",
        "m",
        "m"
    }
)

C(
    "N",
    "n",
    "n",
    {
        "ن",
        "н",
        "n",
        "n"
    }
)

C(
    "NG",
    "ŋ",
    "ñ",
    {
        "ڭ",
        "ң",
        "ng",
        "ng"
    }
)

C(
    "P",
    "p",
    "p",
    {
        "پ",
        "п",
        "p",
        "p"
    }
)

C(
    "Q",
    "q",
    "q",
    {
        "ق",
        "қ",
        "ⱪ",
        "q"
    }
)

C(
    "R",
    "r",
    "r",
    {
        "ر",
        "р",
        "r",
        "r"
    }
)

C(
    "S",
    "s",
    "s",
    {
        "س",
        "с",
        "s",
        "s"
    }
)

C(
    "SH",
    "ʃ",
    "ş",
    {
        "ش",
        "ш",
        "x",
        "sh"
    }
)

C(
    "T",
    "t",
    "t",
    {
        "ت",
        "т",
        "t",
        "t"
    }
)

C(
    "X",
    "x",
    "x",
    {
        "خ",
        "х",
        "h",
        "x"
    }
)

C(
    "Z",
    "z",
    "z",
    {
        "ز",
        "з",
        "z",
        "z"
    }
)

-- Semivowels

S(
    "Y",
    "j",
    "y",
    {
        "ي",
        "й",
        "y",
        "y"
    }
)

S(
    "V",
    "v",
    "v",
    {
        "ۋ",
        "в",
        "v",
        "w"
    }
)

-- Compounds from Cyrillic

K(
    "YU",
    "ju",
    "yu",
    {
        "ي‍‍ۇ",
        "ю",
        "yu",
        "yu"
    }
)

K(
    "YA",
    "jɑ",
    "ya",
    {
        "ي‍‍ا",
        "я",
        "ya",
        "ya"
    }
)

-- write to haxe

local alphabetContent = [[]]
local ALPHABET_KEYS = {
    nm = {"NAMES", "english name"},
    tp = {"TYPES", "alphabet type"},
    ipa = {"String", "reading sound"},
    cmn = {"String", "common script"},
    [LANGUAGES.UYGHURS] = {"Array<String>", "language script"},
}
local space = " "

--

local TEMPLATE_TYPES = [[// types
enum TYPES {%s
}
]]
local types = ""
for k,v in pairs(TYPES) do
    types = types .. "\n" .. space:rep(4) .. v .. ";";
end
local contentTypes = string.format(TEMPLATE_TYPES, types)
alphabetContent = alphabetContent .. "" .. contentTypes

-- 

local TEMPLATE_LANGUAGES = [[
// languages
enum LANGUAGES {%s
}
]]
local languages = ""
for k,v in pairs(LANGUAGES) do
    languages = languages .. "\n" .. space:rep(4) .. v .. ";";
end
local contentLanguages = string.format(TEMPLATE_LANGUAGES, languages)
alphabetContent = alphabetContent .. "\n" .. contentLanguages

--

local TEMPLATE_NAME = [[
// names
enum NAMES {%s
}
]]
local names = ""
for k,v in pairs(infos) do
    names = names .. "\n" .. space:rep(4) .. v.nm .. ";";
end
local contentNames = string.format(TEMPLATE_NAME, names)
alphabetContent = alphabetContent .. "\n" .. contentNames

--

local TEMPLATE_ALPHABET = [[
// alphabets
typedef Alphabet = {%s
}
]]
local alphabet = ""
for k,v in pairs(ALPHABET_KEYS) do
    alphabet = alphabet .. string.format("\n%svar %s : %s; // %s", space:rep(4), k, v[1], v[2])
end
local contentAlphabet = string.format(TEMPLATE_ALPHABET, alphabet)
alphabetContent = alphabetContent .. "\n" .. contentAlphabet

--

local TEMPLATE_CONFIGS = [[
// ALPHABETS
var ALPHABETS : Map<NAMES, Alphabet> = [%s
];
]]
local TEMPLATE_CONFIG = [[
    // %s
    NAMES.%s => {%s
    },
]]
local TEMPLATE_PAIRS = [[%s : %s,]]
local alphabets = ""
for index,info in pairs(infos) do
    local entry = ""
    for key,_ in pairs(ALPHABET_KEYS) do
        local value = info[key]
        if key == "tp" then
            value = string.format("TYPES.%s", value)
        elseif key == "nm" then
            value = string.format("NAMES.%s", value)
        elseif is_table(value) then
            local items = ""
            for i,v in ipairs(value) do
                items = items .. (i == 1 and string.format([["%s"]], v) or string.format([[, "%s"]], v))
            end
            value = string.format("[%s]", items)
        else
            value = string.format([["%s"]], value)
        end
        entry = entry .. "\n" .. space:rep(8) .. string.format(TEMPLATE_PAIRS, key, value)
    end
    local conf = string.format(TEMPLATE_CONFIG, info.nm, info.nm, entry)
    alphabets = alphabets .. string.format("\n%s", conf)
end
local contenConfigs = string.format(TEMPLATE_CONFIGS, alphabets)
alphabetContent = alphabetContent .. "\n" .. contenConfigs

--
function getAlphabets()
    return alphabetContent
end

