--[[
    alphabets
]]

local alphabets = {}

local TYPES = {
    VOWELS = "VOWELS",
    CONSONANTS = "CONSONANTS",
    SEMIVOWELS = "SEMIVOWELS",
    COMPOUNDS = "COMPOUNDS",
}

local count = 0
local LANGUAGES = {
    UYGHURS = "UYGHURS",
}

local function alphabet(tp, nm, ipa, cm, uyghurs)
    count = count + 1
    alphabets[nm] = {
        ["tp"] = tp,
        ["nm"] = nm,
        ["ipa"] = ipa,
        ["cm"] = cm,
        [LANGUAGES.UYGHURS] = uyghurs,
    }
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

-- Vowels

V(
    "A",
    "ɑ",
    "a",
    {
        "ئا",
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
        "ئە",
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
        "ئې",
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
        "ئى",
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
        "ئو",
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
        "ئۆ",
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
        "ئۇ",
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
        "ئۈ",
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

print(count == 34)
