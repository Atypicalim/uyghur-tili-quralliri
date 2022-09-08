// Alphabets


enum LANG_KEYS {
    common;
    arabic;
    cyrillic;
    newly;
    latin;
}

// types
enum TYPES {
// [M[ TYPES_START ]M]
    MARKS;
    COMPOUNDS;
    VOWELS;
    CONSONANTS;
// [M[ TYPES_END ]M]
}

// names
enum NAMES {
// [M[ NAMES_START ]M]
    HEMZE;
    COMMA;
    EXCLA;
    QUESS;
    COLON;
    A;
    AE;
    O;
    U;
    OO;
    UU;
    I;
    E;
    B;
    P;
    T;
    DJ;
    CH;
    X;
    D;
    R;
    Z;
    J;
    S;
    SH;
    GH;
    F;
    Q;
    K;
    G;
    NG;
    L;
    M;
    N;
    H;
    V;
    Y;
    YU;
    YA;
// [M[ NAMES_END ]M]
}

// ALPHABETS
class Alphabets {

public static var ALPHABETS = [
// [M[ ALPHABETS_START ]M]
    // HEMZE
    NAMES.HEMZE => {
        idx : 0,
        tp : TYPES.MARKS,
        ipa : "'",
        nm : NAMES.HEMZE,
        alpha : ["'", "ئ", "'", "'", "'"],
    },
    // COMMA
    NAMES.COMMA => {
        idx : 0,
        tp : TYPES.MARKS,
        ipa : ",",
        nm : NAMES.COMMA,
        alpha : [",", "،", ",", ",", ","],
    },
    // EXCLA
    NAMES.EXCLA => {
        idx : 0,
        tp : TYPES.MARKS,
        ipa : "!",
        nm : NAMES.EXCLA,
        alpha : ["!", "!", "!", "!", "!"],
    },
    // QUESS
    NAMES.QUESS => {
        idx : 0,
        tp : TYPES.MARKS,
        ipa : "?",
        nm : NAMES.QUESS,
        alpha : ["?", "؟", "?", "?", "?"],
    },
    // COLON
    NAMES.COLON => {
        idx : 0,
        tp : TYPES.MARKS,
        ipa : ";",
        nm : NAMES.COLON,
        alpha : [";", "؛", ";", ";", ";"],
    },
    // A
    NAMES.A => {
        idx : 1,
        tp : TYPES.VOWELS,
        ipa : "ɑ",
        nm : NAMES.A,
        alpha : ["a", "ا", "a", "a", "a"],
    },
    // AE
    NAMES.AE => {
        idx : 2,
        tp : TYPES.VOWELS,
        ipa : "æ",
        nm : NAMES.AE,
        alpha : ["ä", "ە", "ә", "ə", "e"],
    },
    // O
    NAMES.O => {
        idx : 25,
        tp : TYPES.VOWELS,
        ipa : "",
        nm : NAMES.O,
        alpha : ["o", "و", "о", "o", "o"],
    },
    // U
    NAMES.U => {
        idx : 26,
        tp : TYPES.VOWELS,
        ipa : "",
        nm : NAMES.U,
        alpha : ["u", "ۇ", "у", "u", "u"],
    },
    // OO
    NAMES.OO => {
        idx : 27,
        tp : TYPES.VOWELS,
        ipa : "",
        nm : NAMES.OO,
        alpha : ["ö", "ۆ", "ө", "ɵ", "ö"],
    },
    // UU
    NAMES.UU => {
        idx : 28,
        tp : TYPES.VOWELS,
        ipa : "",
        nm : NAMES.UU,
        alpha : ["ü", "ۈ", "ү", "ü", "ü"],
    },
    // I
    NAMES.I => {
        idx : 31,
        tp : TYPES.VOWELS,
        ipa : "",
        nm : NAMES.I,
        alpha : ["i", "ى", "и", "i", "i"],
    },
    // E
    NAMES.E => {
        idx : 30,
        tp : TYPES.VOWELS,
        ipa : "",
        nm : NAMES.E,
        alpha : ["e", "ې", "е", "e", "ë"],
    },
    // B
    NAMES.B => {
        idx : 3,
        tp : TYPES.CONSONANTS,
        ipa : "b",
        nm : NAMES.B,
        alpha : ["b", "ب", "б", "b", "b"],
    },
    // P
    NAMES.P => {
        idx : 4,
        tp : TYPES.CONSONANTS,
        ipa : "p",
        nm : NAMES.P,
        alpha : ["p", "پ", "п", "p", "p"],
    },
    // T
    NAMES.T => {
        idx : 5,
        tp : TYPES.CONSONANTS,
        ipa : "t",
        nm : NAMES.T,
        alpha : ["t", "ت", "т", "t", "t"],
    },
    // DJ
    NAMES.DJ => {
        idx : 6,
        tp : TYPES.CONSONANTS,
        ipa : "dʒ",
        nm : NAMES.DJ,
        alpha : ["c", "ج", "җ", "j", "j"],
    },
    // CH
    NAMES.CH => {
        idx : 7,
        tp : TYPES.CONSONANTS,
        ipa : "tʃ",
        nm : NAMES.CH,
        alpha : ["ç", "چ", "ч", "q", "ch"],
    },
    // X
    NAMES.X => {
        idx : 8,
        tp : TYPES.CONSONANTS,
        ipa : "x",
        nm : NAMES.X,
        alpha : ["x", "خ", "х", "h", "x"],
    },
    // D
    NAMES.D => {
        idx : 9,
        tp : TYPES.CONSONANTS,
        ipa : "d",
        nm : NAMES.D,
        alpha : ["d", "د", "д", "d", "d"],
    },
    // R
    NAMES.R => {
        idx : 10,
        tp : TYPES.CONSONANTS,
        ipa : "r",
        nm : NAMES.R,
        alpha : ["r", "ر", "р", "r", "r"],
    },
    // Z
    NAMES.Z => {
        idx : 11,
        tp : TYPES.CONSONANTS,
        ipa : "z",
        nm : NAMES.Z,
        alpha : ["z", "ز", "з", "z", "z"],
    },
    // J
    NAMES.J => {
        idx : 12,
        tp : TYPES.CONSONANTS,
        ipa : "ʒ",
        nm : NAMES.J,
        alpha : ["j", "ژ", "ж", "ⱬ", "zh"],
    },
    // S
    NAMES.S => {
        idx : 13,
        tp : TYPES.CONSONANTS,
        ipa : "s",
        nm : NAMES.S,
        alpha : ["s", "س", "с", "s", "s"],
    },
    // SH
    NAMES.SH => {
        idx : 14,
        tp : TYPES.CONSONANTS,
        ipa : "ʃ",
        nm : NAMES.SH,
        alpha : ["ş", "ش", "ш", "x", "sh"],
    },
    // GH
    NAMES.GH => {
        idx : 15,
        tp : TYPES.CONSONANTS,
        ipa : "ɣ",
        nm : NAMES.GH,
        alpha : ["ğ", "غ", "ғ", "ƣ", "gh"],
    },
    // F
    NAMES.F => {
        idx : 16,
        tp : TYPES.CONSONANTS,
        ipa : "f",
        nm : NAMES.F,
        alpha : ["f", "ف", "ф", "f", "f"],
    },
    // Q
    NAMES.Q => {
        idx : 17,
        tp : TYPES.CONSONANTS,
        ipa : "q",
        nm : NAMES.Q,
        alpha : ["q", "ق", "қ", "ⱪ", "q"],
    },
    // K
    NAMES.K => {
        idx : 18,
        tp : TYPES.CONSONANTS,
        ipa : "k",
        nm : NAMES.K,
        alpha : ["k", "ك", "к", "k", "k"],
    },
    // G
    NAMES.G => {
        idx : 19,
        tp : TYPES.CONSONANTS,
        ipa : "g",
        nm : NAMES.G,
        alpha : ["g", "گ", "г", "g", "g"],
    },
    // NG
    NAMES.NG => {
        idx : 20,
        tp : TYPES.CONSONANTS,
        ipa : "ŋ",
        nm : NAMES.NG,
        alpha : ["ñ", "ڭ", "ң", "ng", "ng"],
    },
    // L
    NAMES.L => {
        idx : 21,
        tp : TYPES.CONSONANTS,
        ipa : "l",
        nm : NAMES.L,
        alpha : ["l", "ل", "л", "l", "l"],
    },
    // M
    NAMES.M => {
        idx : 22,
        tp : TYPES.CONSONANTS,
        ipa : "m",
        nm : NAMES.M,
        alpha : ["m", "م", "м", "m", "m"],
    },
    // N
    NAMES.N => {
        idx : 23,
        tp : TYPES.CONSONANTS,
        ipa : "n",
        nm : NAMES.N,
        alpha : ["n", "ن", "н", "n", "n"],
    },
    // H
    NAMES.H => {
        idx : 24,
        tp : TYPES.CONSONANTS,
        ipa : "h",
        nm : NAMES.H,
        alpha : ["h", "ھ", "һ", "ⱨ", "h"],
    },
    // V
    NAMES.V => {
        idx : 29,
        tp : TYPES.CONSONANTS,
        ipa : "v",
        nm : NAMES.V,
        alpha : ["v", "ۋ", "в", "v", "w"],
    },
    // Y
    NAMES.Y => {
        idx : 32,
        tp : TYPES.CONSONANTS,
        ipa : "j",
        nm : NAMES.Y,
        alpha : ["y", "ي", "й", "y", "y"],
    },
    // YU
    NAMES.YU => {
        idx : 0,
        tp : TYPES.COMPOUNDS,
        ipa : "ju",
        nm : NAMES.YU,
        alpha : ["yu", "ي‍‍ۇ", "ю", "yu", "yu"],
    },
    // YA
    NAMES.YA => {
        idx : 0,
        tp : TYPES.COMPOUNDS,
        ipa : "jɑ",
        nm : NAMES.YA,
        alpha : ["ya", "ي‍‍ا", "я", "ya", "ya"],
    },
// [M[ ALPHABETS_END ]M]
];

    public static var INDEX_MAP : Map<LANG_KEYS, Int> = [
        LANG_KEYS.common => 0,
        LANG_KEYS.arabic => 1,
        LANG_KEYS.cyrillic => 2,
        LANG_KEYS.newly => 3,
        LANG_KEYS.latin => 4,
    ];

    public static var NUMBERS_LIST = "1234567890";
    public static var SPECIALS_LIST = "\\\"!`'#%&,:;<>=@{}~$()*+/?[]^|؛،؟";

    public static function replaceAllSpecials(text : String, replacement : String) : String {
        if (text.length == 0) return text;
        var buf = new StringBuf();
        var idx = 0;
        while (idx < text.length) {
            var ch = text.substr(idx, 1);
            buf.add(SPECIALS_LIST.indexOf(ch) >= 0 ? " " : ch);
            idx++;
        }
        return buf.toString();
    }

    public static function mergeAllSpace(text : String) : String {
        text = StringTools.trim(text);
        if (text.length == 0) return text;
        var buf = new StringBuf();
        var idx = 0;
        var isSpace = false;
        while (idx < text.length) {
            var ch = text.substr(idx, 1);
            if (!isSpace || ch != " ") buf.add(ch);
            isSpace = ch == " ";
            idx++;
        }
        return buf.toString();
    }

    public static function splitByDelimiter(text : String, delimiter = " ") : Array<String> {
        var arr = new Array<String>();
        var buf = new StringBuf();
        var idx = 0;
        text = mergeAllSpace(text);
        if (text.length == 0) return arr;
        while (idx < text.length) {
            var ch = text.substr(idx, 1);
            if (ch == delimiter) {
                arr.push(buf.toString());
                buf = new StringBuf();
            } else {
                buf.add(ch);
            }
            idx++;
        }
        arr.push(buf.toString());
        return arr;
    }
}