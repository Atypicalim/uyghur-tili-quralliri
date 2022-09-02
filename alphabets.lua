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

local function alphabet(tp, ...)
    local arr = {...}
    for _,v in ipairs(arr) do
        local conf = {
            ["tp"] = tp,
            ["nm"] = v[1],
            ["ipa"] = v[2],
            [LANGUAGES.UYGHURS] = {v[3], v[4], v[5], v[6], v[7]}, -- {cts, uas, ucs, uns, uls}
        }
        table.insert(infos, conf)
    end
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

M({
    "HEMZE",
    "'",
    "'",
    "ئ",
    "'",
    "'",
    "'",
})

-- Vowels

V({
    "A",
    "ɑ",
    "a",
    "ا",
    "a",
    "a",
    "a",
},{
    "AE",
    "æ",
    "ä",
    "ە",
    "ә",
    "ə",
    "e"
}
)

V({
    "E",
    "",
    "e",
    "ې",
    "е",
    "e",
    "ë"
}, {
    "I",
    "",
    "i",
    "ى",
    "и",
    "i",
    "i"
}, {
    "O",
    "",
    "o",
    "و",
    "о",
    "o",
    "o"
}, {
    "OO",
    "",
    "ö",
    "ۆ",
    "ө",
    "ɵ",
    "ö"
}, {
    "U",
    "",
    "u",
    "ۇ",
    "у",
    "u",
    "u"
}, {
    "UU",
    "",
    "ü",
    "ۈ",
    "ү",
    "ü",
    "ü"
})

-- Consonants

C({
    "B",
    "b",
    "b",
    "ب",
    "б",
    "b",
    "b"
}, {
    "DJ",
    "dʒ",
    "c",
    "ج",
    "җ",
    "j",
    "j"
}, {
    "CH",
    "tʃ",
    "ç",
    "چ",
    "ч",
    "q",
    "ch"
}, {
    "D",
    "d",
    "d",
    "د",
    "д",
    "d",
    "d"
}, {
    "F",
    "f",
    "f",
    "ف",
    "ф",
    "f",
    "f"
}, {
    "G",
    "g",
    "g",
    "گ",
    "г",
    "g",
    "g"
}, {
    "GH",
    "ɣ",
    "ğ",
    "غ",
    "ғ",
    "ƣ",
    "gh"
}, {
    "H",
    "h",
    "h",
    "ھ",
    "һ",
    "ⱨ",
    "h"
}, {
    "J",
    "ʒ",
    "j",
    "ژ",
    "ж",
    "ⱬ",
    "zh"
}, {
    "K",
    "k",
    "k",
    "ك",
    "к",
    "k",
    "k"
}, {
    "L",
    "l",
    "l",
    "ل",
    "л",
    "l",
    "l"
}, {
    "M",
    "m",
    "m",
    "م",
    "м",
    "m",
    "m"
}, {
    "N",
    "n",
    "n",
    "ن",
    "н",
    "n",
    "n"
}, {
    "NG",
    "ŋ",
    "ñ",
    "ڭ",
    "ң",
    "ng",
    "ng"
}, {
    "P",
    "p",
    "p",
    "پ",
    "п",
    "p",
    "p"
}, {
    "Q",
    "q",
    "q",
    "ق",
    "қ",
    "ⱪ",
    "q"
}, {
    "R",
    "r",
    "r",
    "ر",
    "р",
    "r",
    "r"
}, {
    "S",
    "s",
    "s",
    "س",
    "с",
    "s",
    "s"
}, {
    "SH",
    "ʃ",
    "ş",
    "ش",
    "ш",
    "x",
    "sh"
}, {
    "T",
    "t",
    "t",
    "ت",
    "т",
    "t",
    "t"
}, {
    "X",
    "x",
    "x",
    "خ",
    "х",
    "h",
    "x"
}, {
    "Z",
    "z",
    "z",
    "ز",
    "з",
    "z",
    "z"
})

-- Semivowels

S({
    "Y",
    "j",
    "y",
    "ي",
    "й",
    "y",
    "y"
}, {
    "V",
    "v",
    "v",
    "ۋ",
    "в",
    "v",
    "w"
})

-- Compounds from Cyrillic

K({
    "YU",
    "ju",
    "yu",
    "ي‍‍ۇ",
    "ю",
    "yu",
    "yu"
}, {
    "YA",
    "jɑ",
    "ya",
    "ي‍‍ا",
    "я",
    "ya",
    "ya"
})

-- write to haxe

local alphabetContent = [[]]
local ALPHABET_KEYS = {
    nm = {"NAMES", "english name"},
    tp = {"TYPES", "alphabet type"},
    ipa = {"String", "reading sound"},
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

