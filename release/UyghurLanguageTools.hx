import haxe.EnumTools; 
// date:2024-04-26 20:02:44 file:./src/Alphabets.hx 

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
    MARKS;
    COMPOUNDS;
    VOWELS;
    CONSONANTS;
}

// names
enum NAMES {
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
}

// ALPHABETS
class Alphabets {

public static var ALPHABETS = [
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

// date:2024-04-26 20:02:44 file:./src/Converter.hx 

// converter



class Converter {

    // init
    private var from : LANG_KEYS;
    private var to : LANG_KEYS;
    private var fromIdx : Int = -1;
    private var toIdx : Int = -1;
	// process
    private var text : String = null;
    private var index : Int = 0;
    private var result : StringBuf = new StringBuf();
	private var lastAlpha = null;
    // current
    private var chLast : String = null;
    private var chCurr : String = null;
    private var chNext : String = null;

    private function new(from : LANG_KEYS, to : LANG_KEYS) {
        this.from = from;
        this.to = to;
        this.fromIdx = Alphabets.INDEX_MAP[this.from];
        this.toIdx = Alphabets.INDEX_MAP[this.to];
        if (this.fromIdx < 0 || this.toIdx < 0) {
            throw "key not supported for this language";
        }
    }

    private function pushString(str : String) {
		lastAlpha = null;
        this.result.add(str);
    }

	private function pushName(name) {
		var conf = Alphabets.ALPHABETS[name];
		var idx = Alphabets.INDEX_MAP[this.to];
		var str = conf.alpha[idx];
		if (this.to == LANG_KEYS.arabic && conf.tp == TYPES.VOWELS && (lastAlpha == null || lastAlpha.tp == TYPES.VOWELS)) {
			this.result.add(Alphabets.ALPHABETS[NAMES.HEMZE].alpha[this.toIdx]);
		}
		lastAlpha = conf;
        this.result.add(str);
	}

    private function move(indent : Int) {
        this.index += indent;
        this.index = cast(Math.max(Math.min(this.index, this.text.length - 1), 0), Int);
    }

    private function atBeginning() : Bool {
        return this.index <= 0;
    }

    private function atEnding() : Bool {
        return this.index >= this.text.length - 1;
    }

    private function isFinished() : Bool {
        return this.index == this.text.length - 1;
    }

    private function getChar(indent : Int = 0) : String {
        var ch = this.text.charAt(this.index + indent);
        if (ch == null || ch == "") {
            return null;
        }
        return ch;
    }

    private function getAlphabet(ch : String) : Dynamic {
        for(conf in Alphabets.ALPHABETS) {
            var idx = Alphabets.INDEX_MAP[this.from];
            if (conf.alpha[idx] == ch) {
                return conf;
            }
        }
        return null;
    }

    private function handleUyghur() {
		if (this.from == LANG_KEYS.latin) {
			if (this.chNext == "h") {
				if (this.chCurr == "c") {
					this.pushName(NAMES.CH);
					this.move(1);
					return;
				} else if (this.chCurr == "g") {
					this.pushName(NAMES.GH);
					this.move(1);
					return;
				} else if (this.chCurr == "s") {
					var chLastLast = this.getChar(-2);
					var alphaLastLast = this.getAlphabet(chLastLast);
					if (this.chLast == "i" && alphaLastLast == null) {
						this.pushName(NAMES.S);
						return;
					}
					this.pushName(NAMES.SH);
					this.move(1);
					return;
				} else if (this.chCurr == "z") {
					this.pushName(NAMES.J);
					this.move(1);
					return;
				}
			} else if (this.chNext == "g") {
				if (this.chCurr == "n") {
					var chNextNext = this.getChar(2);
					var chLastLast = this.getChar(-2);
					var alphaNextNext = this.getAlphabet(chNextNext);
					var alphaLastLast = this.getAlphabet(chLastLast);
					if (chNextNext == 'h') {
						this.pushName(NAMES.N);
						return;
					} else if (chNextNext == chLastLast || alphaNextNext.tp == TYPES.CONSONANTS) {
						this.pushName(NAMES.NG);
						this.move(1);
						return;
					}
					this.pushName(NAMES.N);
					return;
				}
			}
		} else if (this.from == LANG_KEYS.arabic) {
			if (this.chCurr == "ئ") {
                if (this.chLast == null || StringTools.isSpace(this.chLast, 0)) return;
            }
		}
		//
		var alpha = this.getAlphabet(this.chCurr);
		if (alpha != null) {
			this.pushName(alpha.nm);
		} else {
            this.pushString(this.chCurr);
		}
    }

    private function process() {
        this.chLast = this.getChar(-1);
        this.chCurr = this.getChar(0);
        this.chNext = this.getChar(1);
        handleUyghur();
        if (!this.isFinished()) {
            this.move(1);
            this.process();
        }
    }

    private function convert(text : String) : String {
		this.text = text;
        this.index = 0;
		this.result = new StringBuf();
		this.lastAlpha = null;
        this.process();
        return result.toString();
    }

    public static function work(from : String, to : String, text : String) {
        var fromLang : LANG_KEYS = EnumTools.createByName(LANG_KEYS, from);
        var toLang : LANG_KEYS = EnumTools.createByName(LANG_KEYS, to);
        var converter = new Converter(fromLang, toLang);
        var result = converter.convert(text);
        return result;
    }

}


// date:2024-04-26 20:02:44 file:./src/Keyboard.hx 

// keybaord

var KEYCODES : Map<Int, Array<String>> = [
    65 => ["a", "ھ", ""],
    66 => ["b", "ب", ""],
    67 => ["c", "غ", ""],
    68 => ["d", "د", "ژ"],
    69 => ["e", "ې", ""],
    70 => ["f", "ا", "ف"],
    71 => ["g", "ە", "گ"],
    72 => ["h", "ى", "خ"],
    73 => ["i", "ڭ", ""],
    74 => ["j", "ق", "ج"],
    75 => ["k", "ك", "ۆ"],
    76 => ["l", "ل", "لا"],
    77 => ["m", "م", ""],
    78 => ["n", "ن", ""],
    79 => ["o", "و", ""],
    80 => ["p", "پ", ""],
    81 => ["q", "چ", ""],
    82 => ["r", "ر", ""],
    83 => ["s", "س", ""],
    84 => ["t", "ت", ""],
    85 => ["u", "ۇ", ""],
    86 => ["v", "ۈ", ""],
    87 => ["w", "ۋ", ""],
    88 => ["x", "ش", ""],
    89 => ["y", "ي", ""],
    90 => ["z", "ز", ""],
    186 => [";", "؛", ":"],
    188 => [",", "،", ">"],
    191 => ["/", "ئ", "؟"],
];

class Keyboard {


    public static function toAlphabet(character : String) : String {
        if (character.length != 1) return null;
        var isUpper = false;
        var alphabet = null;
        for (_ => values in KEYCODES) {
            if (values[1] == character) {
                alphabet = values[0];
                isUpper = false;
                break;
            } else if (values[2] == character) {
                alphabet = values[0];
                isUpper = true;
                break;
            }
        }
        if (alphabet != null && isUpper == true) {
            alphabet = alphabet.toUpperCase();
        }
        return alphabet;
    }

    public static function fromAlphabet(alphabet : String) : String {
        if (alphabet.length != 1) return null;
        var index = 1;
        var isUpper = alphabet.toUpperCase() == alphabet;
        if (isUpper) {
            alphabet = alphabet.toLowerCase();
            index = 2;
        }
        for (_ => values in KEYCODES) {
            if (values[0] != alphabet) continue;
            return values[index];
        }
        return null;
    }

}


// date:2024-04-26 20:02:44 file:./src/Numbers.hx 

// numbers

class Numbers {

    private static var valid : Bool = false;
    private static var COMPLETE : String = "پۈتۈن";
    private static var ZERO : String = "نۆل";
    private static var TEN : String = "ئون";
    private static var TEN_SUFFIX : String = "دا";
    private static var HUNDRED : String = "يۈز";
    private static var HUNDRED_SUFFIX : String = "دە";
    private static var NAMES_1 : Array<String> = [
        "بىر",
        "ئىككى",
        "ئۈچ",
        "تۆت",
        "بەش",
        "ئالتە",
        "يەتتە",
        "سەككىز",
        "توققۇز",
    ];
    private static var NAMES_10 : Array<String> = [
        "ئون",
        "يىگىرمە",
        "ئوتتۇز",
        "قىرىق",
        "ئەللىك",
        "ئاتمىش",
        "يەتمىش",
        "سەكسەن",
        "توقسان",
    ];
    private static var NAMES_N : Array<String> = [
        "مىڭ",
        "مىليون",
        "مىليارد",
        "تىرىليون",
        "تىرىليارد"
    ];
    private static var NAMES_N_SUFFIX : Array<String> = [
        "دا",
        "دا",
        "تا",
        "دا",
        "تا"
    ];

    public function new() {
    }

    private static function getNumName(num : Int) : String {
        return num == 0 ? "" : NAMES_1[num - 1];
    }

    private static function getTenTimes(num : Int) : String {
        return num == 0 ? "" : NAMES_10[num - 1];
    }

    private static function getHundredTimes(text : String, num : Int) : String {
        return (text.length == 0) ? text : text + " " + HUNDRED;
    }

    private static function getHighTimes(text : String, times : Int) : String {
        return (!valid) ? text : text + " " + NAMES_N[times];
    }

    private static function appendNumTimes(times : Int, num : Int, text : String) {
        switch (times) {
            case 2: return getTenTimes(num);
            case 3: return getHundredTimes(text, num);
            case 4: return getHighTimes(text, 0);
            case 5: return getTenTimes(num);
            case 6: return getHundredTimes(text, num);
            case 7: return getHighTimes(text, 1);
            case 8: return getTenTimes(num);
            case 9: return getHundredTimes(text, num);
            case 10: return getHighTimes(text, 2);
            case 11: return getTenTimes(num);
            case 12: return getHundredTimes(text, num);
            case 13: return getHighTimes(text, 3);
            case 14: return getTenTimes(num);
            case 15: return getHundredTimes(text, num);
            case 16: return getHighTimes(text, 5);
            case 17: return getTenTimes(num);
            case 18: return getHundredTimes(text, num);
            default: return text;
        }
    }

    private static function processRead(num : Int) : String {
        if (num <= 0) {
            return ZERO;
        }
        var result : Array<String> = new Array<String>();
        var times : Int = 0;
        while (num > 0) {
            times++;
            var n : Int = num % 10;
            var t : Int = num % 1000;
            var s : String = getNumName(n);
            valid = t > 0;
            s = appendNumTimes(times, n, s);
            if (s.length > 0) {
                result.insert(0, StringTools.trim(s));
            }
            num = Std.int((num - n) / 10);
        }
        return result.join(" ");
    }


    private static function appendFloatSuffix(text : String) : String {
        if (StringTools.endsWith(text, TEN)) {
            text += TEN_SUFFIX;
        } else if (StringTools.endsWith(text, HUNDRED)) {
            text += HUNDRED_SUFFIX;
        }
        for (k => v in NAMES_N) {
            if (StringTools.endsWith(text, v)) {
                text += NAMES_N_SUFFIX[k];
            }
        }
        if (StringTools.startsWith(text, NAMES_1[0])) {
            text = StringTools.replace(text, NAMES_1[0], "");
        }
        return StringTools.trim(text);
    }

    public static function read(text: String) : String {
        text = StringTools.trim(text);
        //
        var num = Std.parseFloat(text);
        var str = Std.string(num);
        if (str == "nan") return "";
        //
        var nums = Alphabets.splitByDelimiter(Std.string(num), ".");
        if (nums.length == 1) {
            var num1 : Int = Std.parseInt(nums[0]);
            return processRead(num1);
        } else {
            var num1 : Int = Std.parseInt(nums[0]);
            var num2 : Int = Std.parseInt(nums[1]);
            var numx : Int = Std.int(Math.pow(10, nums[1].length));
            var text1 = processRead(num1);
            var text2 = processRead(num2);
            var textX = processRead(numx);
            return text1 + " " + COMPLETE + " " + appendFloatSuffix(textX) + " " + text2;
        }
        return "";
    }

    public static function processWrite(words: Array<String>) : String {
        var result = 0;
        var length = words.length;
        var power = 1;
        var times = 1;
        if (length == 0) {
            return "";
        }
        while (length > 0) {
            length--;
            var word = words[length];
            //
            var isPower = false;
            for (k => v in NAMES_N) {
                if (v == word) {
                    power = Std.int(Math.pow(10, (k + 1) * 3));
                    times = 1;
                    isPower = true;
                    break;
                }
            }
            if (isPower) {
                continue;
            }
            if (word == HUNDRED) {
                times = 100;
                continue;
            }
            //
            var num = 0;
            for(k => v in NAMES_1) {
                if (v == word) {
                    num = k + 1;
                }
            }
            for(k => v in NAMES_10) {
                if (v == word) {
                    num = k + 1;
                    times = 10;
                }
            }
            //
            result += Std.int(num * power * times);
        }
        return Std.string(result);
    }

    
    public static function write(text: String) : String {
        var words = Alphabets.splitByDelimiter(text, " ");
        var dotIndex = -1;
        for(k => v in words) {
            if (v == COMPLETE) {
                dotIndex = k;
                break;
            }
        }
        var endIndex = dotIndex + 1;
        var parseWord = words[dotIndex + 1];
        var power = 0;
        if (StringTools.startsWith(parseWord, NAMES_10[0])) {
            power = 1;
            if (!StringTools.endsWith(parseWord, NAMES_N_SUFFIX[0])) {
                endIndex = dotIndex + 1 + 1;
                parseWord = words[endIndex];
            }
        } else if (StringTools.startsWith(parseWord, HUNDRED)) {
            power = 2;
            if (!StringTools.endsWith(parseWord, HUNDRED_SUFFIX)) {
                endIndex = dotIndex + 1 + 1;
                parseWord = words[endIndex];
            }
        }
        if (power == 0 || endIndex > dotIndex + 1) {
            for(k => v in NAMES_N) {
                if (StringTools.startsWith(parseWord, v)) {
                    power += Std.int((k + 1) * 3);
                }
            }
        }
        if (dotIndex < 0 || power < 1) {
            return processWrite(words);
        } else {
            var left = processWrite(words.slice(0, dotIndex));
            var right = processWrite(words.slice(endIndex + 1, words.length));
            var temp = StringTools.lpad(right, "0", power); 
            return left + "." + temp;
        }
    }

}


// date:2024-04-26 20:02:44 file:./src/Reshaper.hx 


// reshaper

enum UyHarp {
    BASH;
    YALGHUZ;
    OTTURA;
    AHIR;
}

private class LA_Class {
    public var base1 : String = null;
    public var base2 : String = null;
    public var ex : String = null;
    public function new(base1, base2, ex) {
        this.base1 = base1;
        this.base2 = base2;
        this.ex = ex;
    }
}

var ALPHABET_BASE : Array<String> = ['ت', 'پ', 'ب', 'ر', 'د', 'چ', 'ج', 'ز', 'ف', 'ق', 'ك', 'ش', 'گ', 'س', 'ڭ', 'ن', 'م', 'ۋ', 'ل', 'خ', 'غ', 'ژ', 'ي', 'ا', 'ە', 'و', 'ۈ', 'ۆ', 'ۇ', 'ې', 'ى', 'ھ', 'ئ'];

var ALPHABET_EXT_BEGIN : Array<String> = ['ﺗ', 'ﭘ', 'ﺑ', 'ﺭ', 'ﺩ', 'ﭼ', 'ﺟ', 'ﺯ', 'ﻓ', 'ﻗ', 'ﻛ', 'ﺷ', 'ﮔ', 'ﺳ', 'ﯕ', 'ﻧ', 'ﻣ', 'ﯞ', 'ﻟ', 'ﺧ', 'ﻏ', 'ﮊ', 'ﻳ', 'ﺍ', 'ﻩ', 'ﻭ', 'ﯛ', 'ﯙ', 'ﯗ', 'ﯦ', 'ﯨ', 'ﮬ', 'ﺋ'];

var ALPHABET_EXT_SINGLE : Array<String> = ['ﺕ', 'ﭖ', 'ﺏ', 'ﺭ', 'ﺩ', 'ﭺ', 'ﺝ', 'ﺯ', 'ﻑ', 'ﻕ', 'ﻙ', 'ﺵ', 'ﮒ', 'ﺱ', 'ﯓ', 'ﻥ', 'ﻡ', 'ﯞ', 'ﻝ', 'ﺥ', 'ﻍ', 'ﮊ', 'ﻱ', 'ﺍ', 'ﻩ', 'ﻭ', 'ﯛ', 'ﯙ', 'ﯗ', 'ﯤ', 'ﻯ', 'ﮪ', 'ﺋ'];

var ALPHABET_EXT_MIDDLE : Array<String> = ['ﺘ', 'ﭙ', 'ﺒ', 'ﺮ', 'ﺪ', 'ﭽ', 'ﺠ', 'ﺰ', 'ﻔ', 'ﻘ', 'ﻜ', 'ﺸ', 'ﮕ', 'ﺴ', 'ﯖ', 'ﻨ', 'ﻤ', 'ﯟ', 'ﻠ', 'ﺨ', 'ﻐ', 'ﮋ', 'ﻴ', 'ﺎ', 'ﻪ', 'ﻮ', 'ﯜ', 'ﯚ', 'ﯘ', 'ﯧ', 'ﯩ', 'ﮭ', 'ﺌ'];

var ALPHABET_EXT_END : Array<String> = ['ﺖ', 'ﭗ', 'ﺐ', 'ﺮ', 'ﺪ', 'ﭻ', 'ﺞ', 'ﺰ', 'ﻒ', 'ﻖ', 'ﻚ', 'ﺶ', 'ﮓ', 'ﺲ', 'ﯔ', 'ﻦ', 'ﻢ', 'ﯟ', 'ﻞ', 'ﺦ', 'ﻎ', 'ﮋ', 'ﻲ', 'ﺎ', 'ﻪ', 'ﻮ', 'ﯜ', 'ﯚ', 'ﯘ', 'ﯥ', 'ﻰ', 'ﮫ', 'ﺌ'];

var ALPHABET_FRIENDLY : Array<String> = ['ت', 'ئ', 'خ', 'چ', 'ج', 'پ', 'ب', 'س', 'ش', 'غ', 'ف', 'ق', 'ك', 'گ', 'ڭ', 'ل', 'م', 'ن', 'ھ', 'ې', 'ى', 'ي'];

var REPLACE_MAP : Map<String, String> = [
    "ﻻ" => "ﻟﺎ",
    "ﻼ" => "ﻠﺎ",
];

var la1 = new LA_Class('ﻟ', 'ﺎ', 'ﻻ');
var la2 = new LA_Class('ﻠ', 'ﺎ', 'ﻼ');

class Reshaper {

    // init

    public function new() {
    }

    private function containsInArray(arr : Array<String>, s: String) : Int {
        for (key => val in arr) {
            if (val == s) {
                return key;
            }
        }
        return -1;
    }

    private function stringToArray(str : String) : Array<String> {
        var arr : Array<String> = [];
        for (key in 0 ... str.length) {
            arr.push(str.substr(key, 1));
        }
        return arr;
    }

    private function stringToMap(str : String) : Map<Int, String> {
        var arr : Map<Int, String> = [];
        for (key in 0 ... str.length) {
            arr[key] = str.substr(key, 1);
        }
        return arr;
    }

    private function arrayToString(arr : Array<String>) : String {
        var res : StringBuf = new StringBuf();
        for (key => val in arr) {
            res.add(val);
        }
        return res.toString();
    }

    private function ProLA_HAMZE(aWord : String) {
        var arr = stringToArray(aWord);
        var map = stringToMap(aWord);
        var result : Array<String> = [];
        var skipNext : Bool = false;
        for (i => v in arr) {
            if (i == arr.length - 1) {
                continue;
            } else if (skipNext) {
                skipNext = false;
                continue;
            } else if (map[i] == la1.base2 && map[i + 1] == la1.base1) {
                result.push(la1.ex);
                skipNext = true;
            } else if (map[i] == la2.base2 && map[i + 1] == la2.base1) {
                result.push(la2.ex);
                skipNext = true;
            } else {
                result.push(map[i]);
            }
        }
        if (aWord.length < 2) {
            result.push(aWord);
        } else {
            if (map[arr.length - 2] == la1.base1 && map[arr.length - 1] == la1.base2) {
                //
            } else if (map[arr.length - 2] == la2.base1 && map[arr.length - 1] == la2.base2) {
                //
            } else {
                result.push(map[arr.length - 1]);
            }
        }
        return arrayToString(result);
    }

    private function getExChar(character : String, alphabet : UyHarp) {
        var index = this.containsInArray(ALPHABET_BASE, character);
        if (index > -1) {
            if (alphabet == UyHarp.BASH) {
                return ALPHABET_EXT_BEGIN[index];
            } else if (alphabet == UyHarp.OTTURA) {
                return ALPHABET_EXT_MIDDLE[index];
            } else if (alphabet == UyHarp.AHIR) {
                return ALPHABET_EXT_END[index];
            } else if (alphabet == UyHarp.YALGHUZ) {
                return ALPHABET_EXT_SINGLE[index];
            }
        }
        return character;
    }
    
    private function toExttended(text : String) : String {
        if (text.length == 0) {
            return "";
        }
        var array = stringToArray(text);
        var map = stringToMap(text);
        var result : Array<String> = [];
        // one character
        if (text.length == 1) {
            var index = this.containsInArray(ALPHABET_BASE, text);
            return index == -1 ? "" : ALPHABET_EXT_SINGLE[index];
        }
        // two characters
        if (text.length == 2) {
            var char1 = map[1];
            var char2 = map[2];
            if (this.containsInArray(ALPHABET_FRIENDLY, char1) > -1) {
                var char1Ext = this.getExChar(char1, UyHarp.BASH);
                var char2Ext = this.getExChar(char2, UyHarp.AHIR);
                return char1Ext + char2Ext;
            }
        }
        //more characters
        var firstChar = map[0];
        var firstCharExt = this.getExChar(firstChar, UyHarp.BASH);
        result.push(firstCharExt);
        for (i => v in array) {
            if (i == 0 || i == array.length - 1) {
                continue;
            }
            var lastChar = map[i - 1];
            var currentChar = map[i];
            var nextChar = map[i + 1];
            var lastCharIndex = this.containsInArray(ALPHABET_BASE, lastChar);
            var currentIndex = this.containsInArray(ALPHABET_BASE, currentChar);
            var nextIndex = this.containsInArray(ALPHABET_BASE, nextChar);
            var currentCharExt = null;
            if (currentIndex == -1) {
                currentCharExt = currentChar;
            } else {
                if (this.containsInArray(ALPHABET_FRIENDLY, lastChar) > -1) {
                    if (nextIndex > -1) {
                        currentCharExt = this.getExChar(currentChar, UyHarp.OTTURA);
                    } else {
                        currentCharExt = this.getExChar(currentChar, UyHarp.AHIR);
                    }
                } else {
                    if (nextIndex > -1) {
                        currentCharExt = this.getExChar(currentChar, UyHarp.BASH);
                    } else {
                        currentCharExt = this.getExChar(currentChar, UyHarp.YALGHUZ);
                    }
                }
            }
            result.push(currentCharExt);
        }
        // sol lol
        var solKolExt = null;
        if (this.containsInArray(ALPHABET_FRIENDLY, map[array.length - 2]) > -1) {
            solKolExt = this.getExChar(map[array.length - 1], UyHarp.AHIR);
        } else {
            solKolExt = this.getExChar(map[array.length - 1], UyHarp.YALGHUZ);
        }
        result.push(solKolExt);
        // hemze
        result.reverse();
        var str : String = arrayToString(result);
        return this.ProLA_HAMZE(str);
    }

    private function toBasical(text : String) : String {
        if (text.length == 0) {
            return "";
        }
        //
        for (key => val in REPLACE_MAP) {
            text = StringTools.replace(text, key, val);
        }
        //
        var array = stringToArray(text);
        var map = stringToMap(text);
        var result : Array<String> = [];
        for (i => v in array) {
            var base = map[i];
            for (j => w in ALPHABET_BASE) {
                var isA = ALPHABET_EXT_END[j] == map[i];
                var isB = ALPHABET_EXT_BEGIN[j] == map[i];
                var isO = ALPHABET_EXT_MIDDLE[j] == map[i];
                var isY = ALPHABET_EXT_SINGLE[j] == map[i];
                if (isA || isB || isO || isY) {
                    base = ALPHABET_BASE[j];
                    break;
                }
            }
            result.push(base);
        }
        result.reverse();
        return arrayToString(result);
    }

    public static function toExt(text : String) : String {
        return new Reshaper().toExttended(text);
    }

    public static function toBase(text : String) : String {
        return new Reshaper().toBasical(text);
    }

}


// date:2024-04-26 20:02:44 file:./src/Syllable.hx 


// syllable


class Syllable {

    private var blocks : Array<StringBuf> = new Array<StringBuf>();
    private var text : String = "";
    private var index : Int = 0;
    //
    private var chLastLast : String = null;
    private var chLast : String = null;
    private var chCurr : String = null;
    private var chNext : String = null;
    private var chNextNext : String = null;
    //
    private var alphaLast : Dynamic = null;
    private var alphaCurr : Dynamic = null;
    private var alphaNext : Dynamic = null;

    private function new() {
    }

    private function getChar(indent : Int = 0) : String {
        var ch = this.text.charAt(this.index + indent);
        if (ch == "") return null;
        return ch;
    }

    private function getAlphabet(ch : String) : Dynamic {
        for(conf in Alphabets.ALPHABETS) {
            var idx = Alphabets.INDEX_MAP[LANG_KEYS.arabic];
            if (conf.alpha[idx] == ch) return conf;
        }
        return null;
    }

    private function isType(tp : TYPES, indent : Int = 0) : Bool {
        var ch = this.text.charAt(this.index + indent);
        if (ch == null || ch == "") return false;
        var alpha = this.getAlphabet(ch);
        if (alpha == null) return false;
        return alpha.tp == tp;
    }

    private function pushBuf() {
        this.blocks[this.blocks.length] = new StringBuf();
    }

    private function pushChar(ch : String) {
        this.blocks[this.blocks.length - 1].add(ch);
    }

    private function handle() {
        if (this.blocks.length == 0) {
            this.pushBuf();
            this.pushChar(this.chCurr);
        } else if (isType(TYPES.MARKS, 0) && this.alphaLast != null) {
            this.pushBuf();
            this.pushChar(this.chCurr);
        } else if (isType(TYPES.CONSONANTS, 0) && isType(TYPES.VOWELS, 1)) {
            this.pushBuf();
            this.pushChar(this.chCurr);
        } else {
            this.pushChar(this.chCurr);
        }
    }

    private function process() {
        this.chLastLast = this.getChar(-2);
        this.chLast = this.getChar(-1);
        this.chCurr = this.getChar(0);
        this.chNext = this.getChar(1);
        this.chNextNext = this.getChar(2);
        this.alphaLast = this.getAlphabet(this.chLast);
        this.alphaCurr = this.getAlphabet(this.chCurr);
        this.alphaNext = this.getAlphabet(this.chNext);
        handle();
        if (this.index < this.text.length - 1) {
            this.index++;
            this.process();
        }
    }

    private function convert(text : String) : String {
		this.text = text;
        this.index = 0;
        this.process();
        return blocks.join(" ");
    }

    public static function parse(text: String) : String {
        text = Alphabets.replaceAllSpecials(text, " ");
        var words : Array<String> = Alphabets.splitByDelimiter(text);
        var r : StringBuf = new StringBuf();
        for(word in words) {
            var syllable = new Syllable();
            var temp = syllable.convert(word);
            if (r.length != 0) r.add(" | ");
            r.add(temp);
        }
        return r.toString();
    }

}


// date:2024-04-26 20:02:44 file:./src/Tools.hx 


// UyghurLanguageTools

@:keep
@:expose
class UyghurLanguageTools {

    public static function getVersion() : String {
        return "0.1";
    }

    public static function toExtended(text : String) : String {
        return Reshaper.toExt(text);
    }

    public static function fromExtended(text : String) : String {
        return Reshaper.toBase(text);
    }

    public static function toCommon(text : String) : String {
        return Converter.work("arabic", "common", text);
    }

    public static function toCyrillic(text : String) : String {
        return Converter.work("arabic", "cyrillic", text);
    }

    public static function toLatin(text : String) : String {
        return Converter.work("arabic", "latin", text);
    }

    public static function fromCommon(text : String) : String {
        return Converter.work("common", "arabic", text);
    }

    public static function fromCyrillic(text : String) : String {
        return Converter.work("cyrillic", "arabic", text);
    }

    public static function fromLatin(text : String) : String {
        return Converter.work("arabic", "latin", text);
    }

    public static function toAlphabet(character : String) : String {
        return Keyboard.toAlphabet(character);
    }

    public static function fromAlphabet(alphabet : String) : String {
        return Keyboard.fromAlphabet(alphabet);
    }

    public static function doSyllable(text : String) : String {
        return Syllable.parse(text);
    }

    public static function readNumber(text : String) : String {
        return Numbers.read(text);
    }

    public static function writeNumber(text : String) : String {
        return Numbers.write(text);
    }


    static function main() {
        //
        trace("Uyghur Language Tools (" + getVersion() + "), for more infomation please visit https://github.com/kompasim");
        // trace("\n\n--->TEST:");
        // //
        // // converter
        // trace("converter:");
		// var origin = "ئالىمجان ۋە ئەسئەتجان سۇ تۇتتى.";
        // trace("origin", origin);
        // var result = toCommon(origin);
        // trace("result", result);
        // var reverse = fromCommon(result);
        // trace("reverse", reverse);
        // //
        // // alphabet
        // trace("alphabet:");
        // origin = "گ";
        // trace("origin", origin);
        // result = toAlphabet(origin, true);
        // trace("result", result);
        // reverse = fromAlphabet(result, true);
        // trace("reverse", reverse);
        // // 
        // // numbers
        // trace("numbers:");
        // origin = "123.40110001";
        // trace("origin", origin);
        // result = readNumber(origin);
        // trace("result", result);
        // reverse = writeNumber(result);
        // trace("reverse", reverse);
        // // 
        // // reshaper
        // trace("reshaper:");
		// origin = "جەمئىيەت";
        // trace("origin", origin);
        // result = toExtended(origin);
        // trace("result", result);
        // reverse = fromExtended(result);
        // trace("reverse", reverse);
        // // 
        // // syllable
        // trace("syllable:");
        // origin = "ئاھلىرىم";
        // trace("origin", origin);
        // result = doSyllable(origin);
        // trace("result", result);
        // reverse = StringTools.replace(result, " ", "");
        // trace("reverse", reverse);
        //
    }

}
