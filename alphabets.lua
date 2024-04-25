--[[
    alphabets
]]

local ALPHABETS_MAP = {}

local TYPES = {
    MARKS = "MARKS",
    VOWELS = "VOWELS",
    CONSONANTS = "CONSONANTS",
    COMPOUNDS = "COMPOUNDS",
}

local function alphabet(tp, ...)
    local arr = {...}
    for _,v in ipairs(arr) do
        local conf = {
            ["tp"] = tp,
            ["nm"] = v[1],
            ["idx"] = v[2],
            ["ipa"] = v[3],
            ["alpha"] = {v[4], v[5], v[6], v[7], v[8]}, -- {cts, uas, ucs, uns, uls}
        }
        table.insert(ALPHABETS_MAP, conf)
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

local function K(...)
    alphabet(TYPES.COMPOUNDS, ...)
end

-- Marks

M(
    {"HEMZE", 0, "'", "'", "ئ", "'", "'", "'",},
    {"COMMA", 0, ",", ",", "،", ",", ",", ",",},
    {"EXCLA", 0, "!", "!", "!", "!", "!", "!",},
    {"QUESS", 0, "?", "?", "؟", "?", "?", "?",},
    {"COLON", 0, ";", ";", "؛", ";", ";", ";",}
)

-- Vowels

V(
    {"A", 1, "ɑ", "a", "ا", "a", "a", "a",},
    {"AE", 2, "æ", "ä", "ە", "ә", "ə", "e"}
)

V(
    {"O", 25, "", "o", "و", "о", "o", "o"},
    {"U", 26, "", "u", "ۇ", "у", "u", "u"},
    {"OO", 27, "", "ö", "ۆ", "ө", "ɵ", "ö"},
    {"UU", 28, "", "ü", "ۈ", "ү", "ü", "ü"},
    {"I", 31, "", "i", "ى", "и", "i", "i"},
    {"E", 30, "", "e", "ې", "е", "e", "ë"}
)

-- Consonants

C(
    {"B", 3, "b", "b", "ب", "б", "b", "b"},
    {"P", 4, "p", "p", "پ", "п", "p", "p"},
    {"T", 5, "t", "t", "ت", "т", "t", "t"},
    {"DJ", 6, "dʒ", "c", "ج", "җ", "j", "j"},
    {"CH", 7, "tʃ", "ç", "چ", "ч", "q", "ch"},
    {"X", 8, "x", "x", "خ", "х", "h", "x"},
    {"D", 9, "d", "d", "د", "д", "d", "d"},
    {"R", 10, "r", "r", "ر", "р", "r", "r"},
    {"Z", 11, "z", "z", "ز", "з", "z", "z"},
    {"J", 12, "ʒ", "j", "ژ", "ж", "ⱬ", "zh"},
    {"S", 13, "s", "s", "س", "с", "s", "s"},
    {"SH", 14, "ʃ", "ş", "ش", "ш", "x", "sh"},
    {"GH", 15, "ɣ", "ğ", "غ", "ғ", "ƣ", "gh"},
    {"F", 16, "f", "f", "ف", "ф", "f", "f"},
    {"Q", 17, "q", "q", "ق", "қ", "ⱪ", "q"},
    {"K", 18, "k", "k", "ك", "к", "k", "k"},
    {"G", 19, "g", "g", "گ", "г", "g", "g"},
    {"NG", 20, "ŋ", "ñ", "ڭ", "ң", "ng", "ng"},
    {"L", 21, "l", "l", "ل", "л", "l", "l"},
    {"M", 22, "m", "m", "م", "м", "m", "m"},
    {"N", 23, "n", "n", "ن", "н", "n", "n"},
    {"H", 24, "h", "h", "ھ", "һ", "ⱨ", "h"},
    {"V", 29, "v", "v", "ۋ", "в", "v", "w"},
    {"Y", 32, "j", "y", "ي", "й", "y", "y"}
)

-- Compounds from Cyrillic

K(
    {"YU", 0, "ju", "yu", "ي‍‍ۇ", "ю", "yu", "yu"},
    {"YA", 0, "jɑ", "ya", "ي‍‍ا", "я", "ya", "ya"}
)

-- write to haxe

local NAME_DATA_MAP = {}
local ALPHABET_KEYS = {
    nm = {"NAMES", "english name"},
    tp = {"TYPES", "alphabet type"},
    idx = {"Int", "alphabet order"},
    ipa = {"String", "reading sound"},
    alpha = {"Array<String>", "language script"},
}
local space = " "

--

local types = nil
for k,v in pairs(TYPES) do
    types = (types and types .. "\n" or "") .. space:rep(4) .. v .. ";";
end
NAME_DATA_MAP["TYPES"] = types .. "\n"

--

local names = nil
for k,v in pairs(ALPHABETS_MAP) do
    names = (names and  names .. "\n" or "") .. space:rep(4) .. v.nm .. ";";
end
NAME_DATA_MAP["NAMES"] = names .. "\n"
--

local TEMPLATE_CONFIG = [[
    // %s
    NAMES.%s => {%s
    },
]]
local TEMPLATE_PAIRS = [[%s : %s,]]
local alphabets = ""
for index,info in pairs(ALPHABETS_MAP) do
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
        elseif is_number(value) then
            value = string.format([[%s]], value)
        else
            value = string.format([["%s"]], value)
        end
        entry = entry .. "\n" .. space:rep(8) .. string.format(TEMPLATE_PAIRS, key, value)
    end
    local conf = string.format(TEMPLATE_CONFIG, info.nm, info.nm, entry)
    alphabets = alphabets .. string.format("%s", conf)
end
NAME_DATA_MAP["ALPHABETS"] = alphabets
-- 

local builder = builder.code {}
local source = "./src/Alphabets.hx"
local isSkip = {}

builder:setInput(source)
builder:setComment("//")
builder:onMacro(function(code, command)
    local name, tp = unpack(string.explode(command, "_"))
    if tp == "START" then
        isSkip[name] = true
        return string.format("// [M[ %s_START ]M]", name)
    elseif tp == "END" then
        isSkip[name] = false
        return string.format("%s// [M[ %s_END ]M]", NAME_DATA_MAP[name], name)
    end
end)
builder:onLine(function(line)
    for i,v in pairs(isSkip) do
        if v then return end
    end
    return line
end)
builder:setOutput(source)
builder:start()
