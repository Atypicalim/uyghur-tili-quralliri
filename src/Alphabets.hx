// Alphabets

// [M[ ALPHABETS_START ]M]
// types
enum TYPES {
    VOWELS;
    CONSONANTS;
    MARKS;
    COMPOUNDS;
    SEMIVOWELS;
}

// names
enum NAMES {
    HEMZE;
    A;
    AE;
    E;
    I;
    O;
    OO;
    U;
    UU;
    B;
    DJ;
    CH;
    D;
    F;
    G;
    GH;
    H;
    J;
    K;
    L;
    M;
    N;
    NG;
    P;
    Q;
    R;
    S;
    SH;
    T;
    X;
    Z;
    Y;
    V;
    YU;
    YA;
}

// ALPHABETS
class Alphabets {
public static var ALPHABETS = [
    // HEMZE
    NAMES.HEMZE => {
        alpha : ["'", "ئ", "'", "'", "'"],
        tp : TYPES.MARKS,
        nm : NAMES.HEMZE,
        ipa : "'",
    },

    // A
    NAMES.A => {
        alpha : ["a", "ا", "a", "a", "a"],
        tp : TYPES.VOWELS,
        nm : NAMES.A,
        ipa : "ɑ",
    },

    // AE
    NAMES.AE => {
        alpha : ["ä", "ە", "ә", "ə", "e"],
        tp : TYPES.VOWELS,
        nm : NAMES.AE,
        ipa : "æ",
    },

    // E
    NAMES.E => {
        alpha : ["e", "ې", "е", "e", "ë"],
        tp : TYPES.VOWELS,
        nm : NAMES.E,
        ipa : "",
    },

    // I
    NAMES.I => {
        alpha : ["i", "ى", "и", "i", "i"],
        tp : TYPES.VOWELS,
        nm : NAMES.I,
        ipa : "",
    },

    // O
    NAMES.O => {
        alpha : ["o", "و", "о", "o", "o"],
        tp : TYPES.VOWELS,
        nm : NAMES.O,
        ipa : "",
    },

    // OO
    NAMES.OO => {
        alpha : ["ö", "ۆ", "ө", "ɵ", "ö"],
        tp : TYPES.VOWELS,
        nm : NAMES.OO,
        ipa : "",
    },

    // U
    NAMES.U => {
        alpha : ["u", "ۇ", "у", "u", "u"],
        tp : TYPES.VOWELS,
        nm : NAMES.U,
        ipa : "",
    },

    // UU
    NAMES.UU => {
        alpha : ["ü", "ۈ", "ү", "ü", "ü"],
        tp : TYPES.VOWELS,
        nm : NAMES.UU,
        ipa : "",
    },

    // B
    NAMES.B => {
        alpha : ["b", "ب", "б", "b", "b"],
        tp : TYPES.CONSONANTS,
        nm : NAMES.B,
        ipa : "b",
    },

    // DJ
    NAMES.DJ => {
        alpha : ["c", "ج", "җ", "j", "j"],
        tp : TYPES.CONSONANTS,
        nm : NAMES.DJ,
        ipa : "dʒ",
    },

    // CH
    NAMES.CH => {
        alpha : ["ç", "چ", "ч", "q", "ch"],
        tp : TYPES.CONSONANTS,
        nm : NAMES.CH,
        ipa : "tʃ",
    },

    // D
    NAMES.D => {
        alpha : ["d", "د", "д", "d", "d"],
        tp : TYPES.CONSONANTS,
        nm : NAMES.D,
        ipa : "d",
    },

    // F
    NAMES.F => {
        alpha : ["f", "ف", "ф", "f", "f"],
        tp : TYPES.CONSONANTS,
        nm : NAMES.F,
        ipa : "f",
    },

    // G
    NAMES.G => {
        alpha : ["g", "گ", "г", "g", "g"],
        tp : TYPES.CONSONANTS,
        nm : NAMES.G,
        ipa : "g",
    },

    // GH
    NAMES.GH => {
        alpha : ["ğ", "غ", "ғ", "ƣ", "gh"],
        tp : TYPES.CONSONANTS,
        nm : NAMES.GH,
        ipa : "ɣ",
    },

    // H
    NAMES.H => {
        alpha : ["h", "ھ", "һ", "ⱨ", "h"],
        tp : TYPES.CONSONANTS,
        nm : NAMES.H,
        ipa : "h",
    },

    // J
    NAMES.J => {
        alpha : ["j", "ژ", "ж", "ⱬ", "zh"],
        tp : TYPES.CONSONANTS,
        nm : NAMES.J,
        ipa : "ʒ",
    },

    // K
    NAMES.K => {
        alpha : ["k", "ك", "к", "k", "k"],
        tp : TYPES.CONSONANTS,
        nm : NAMES.K,
        ipa : "k",
    },

    // L
    NAMES.L => {
        alpha : ["l", "ل", "л", "l", "l"],
        tp : TYPES.CONSONANTS,
        nm : NAMES.L,
        ipa : "l",
    },

    // M
    NAMES.M => {
        alpha : ["m", "م", "м", "m", "m"],
        tp : TYPES.CONSONANTS,
        nm : NAMES.M,
        ipa : "m",
    },

    // N
    NAMES.N => {
        alpha : ["n", "ن", "н", "n", "n"],
        tp : TYPES.CONSONANTS,
        nm : NAMES.N,
        ipa : "n",
    },

    // NG
    NAMES.NG => {
        alpha : ["ñ", "ڭ", "ң", "ng", "ng"],
        tp : TYPES.CONSONANTS,
        nm : NAMES.NG,
        ipa : "ŋ",
    },

    // P
    NAMES.P => {
        alpha : ["p", "پ", "п", "p", "p"],
        tp : TYPES.CONSONANTS,
        nm : NAMES.P,
        ipa : "p",
    },

    // Q
    NAMES.Q => {
        alpha : ["q", "ق", "қ", "ⱪ", "q"],
        tp : TYPES.CONSONANTS,
        nm : NAMES.Q,
        ipa : "q",
    },

    // R
    NAMES.R => {
        alpha : ["r", "ر", "р", "r", "r"],
        tp : TYPES.CONSONANTS,
        nm : NAMES.R,
        ipa : "r",
    },

    // S
    NAMES.S => {
        alpha : ["s", "س", "с", "s", "s"],
        tp : TYPES.CONSONANTS,
        nm : NAMES.S,
        ipa : "s",
    },

    // SH
    NAMES.SH => {
        alpha : ["ş", "ش", "ш", "x", "sh"],
        tp : TYPES.CONSONANTS,
        nm : NAMES.SH,
        ipa : "ʃ",
    },

    // T
    NAMES.T => {
        alpha : ["t", "ت", "т", "t", "t"],
        tp : TYPES.CONSONANTS,
        nm : NAMES.T,
        ipa : "t",
    },

    // X
    NAMES.X => {
        alpha : ["x", "خ", "х", "h", "x"],
        tp : TYPES.CONSONANTS,
        nm : NAMES.X,
        ipa : "x",
    },

    // Z
    NAMES.Z => {
        alpha : ["z", "ز", "з", "z", "z"],
        tp : TYPES.CONSONANTS,
        nm : NAMES.Z,
        ipa : "z",
    },

    // Y
    NAMES.Y => {
        alpha : ["y", "ي", "й", "y", "y"],
        tp : TYPES.SEMIVOWELS,
        nm : NAMES.Y,
        ipa : "j",
    },

    // V
    NAMES.V => {
        alpha : ["v", "ۋ", "в", "v", "w"],
        tp : TYPES.SEMIVOWELS,
        nm : NAMES.V,
        ipa : "v",
    },

    // YU
    NAMES.YU => {
        alpha : ["yu", "ي‍‍ۇ", "ю", "yu", "yu"],
        tp : TYPES.COMPOUNDS,
        nm : NAMES.YU,
        ipa : "ju",
    },

    // YA
    NAMES.YA => {
        alpha : ["ya", "ي‍‍ا", "я", "ya", "ya"],
        tp : TYPES.COMPOUNDS,
        nm : NAMES.YA,
        ipa : "jɑ",
    },

];
}
// [M[ ALPHABETS_END ]M]