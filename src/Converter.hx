import haxe.EnumTools;

// converter

// [M[ ALPHABETS_START ]M]
// types
enum TYPES {
    VOWELS;
    CONSONANTS;
    MARKS;
    COMPOUNDS;
    SEMIVOWELS;
}

// languages
enum LANGUAGES {
    UYGHURS;
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

// alphabets
typedef Alphabet = {
    var UYGHURS : Array<String>; // language script
    var tp : TYPES; // alphabet type
    var nm : NAMES; // english name
    var ipa : String; // reading sound
}

// ALPHABETS
var ALPHABETS : Map<NAMES, Alphabet> = [
    // HEMZE
    NAMES.HEMZE => {
        UYGHURS : ["'", "ئ", "'", "'", "'"],
        tp : TYPES.MARKS,
        nm : NAMES.HEMZE,
        ipa : "'",
    },

    // A
    NAMES.A => {
        UYGHURS : ["a", "ا", "a", "a", "a"],
        tp : TYPES.VOWELS,
        nm : NAMES.A,
        ipa : "ɑ",
    },

    // AE
    NAMES.AE => {
        UYGHURS : ["ä", "ە", "ә", "ə", "e"],
        tp : TYPES.VOWELS,
        nm : NAMES.AE,
        ipa : "æ",
    },

    // E
    NAMES.E => {
        UYGHURS : ["e", "ې", "е", "e", "ë"],
        tp : TYPES.VOWELS,
        nm : NAMES.E,
        ipa : "",
    },

    // I
    NAMES.I => {
        UYGHURS : ["i", "ى", "и", "i", "i"],
        tp : TYPES.VOWELS,
        nm : NAMES.I,
        ipa : "",
    },

    // O
    NAMES.O => {
        UYGHURS : ["o", "و", "о", "o", "o"],
        tp : TYPES.VOWELS,
        nm : NAMES.O,
        ipa : "",
    },

    // OO
    NAMES.OO => {
        UYGHURS : ["ö", "ۆ", "ө", "ɵ", "ö"],
        tp : TYPES.VOWELS,
        nm : NAMES.OO,
        ipa : "",
    },

    // U
    NAMES.U => {
        UYGHURS : ["u", "ۇ", "у", "u", "u"],
        tp : TYPES.VOWELS,
        nm : NAMES.U,
        ipa : "",
    },

    // UU
    NAMES.UU => {
        UYGHURS : ["ü", "ۈ", "ү", "ü", "ü"],
        tp : TYPES.VOWELS,
        nm : NAMES.UU,
        ipa : "",
    },

    // B
    NAMES.B => {
        UYGHURS : ["b", "ب", "б", "b", "b"],
        tp : TYPES.CONSONANTS,
        nm : NAMES.B,
        ipa : "b",
    },

    // DJ
    NAMES.DJ => {
        UYGHURS : ["c", "ج", "җ", "j", "j"],
        tp : TYPES.CONSONANTS,
        nm : NAMES.DJ,
        ipa : "dʒ",
    },

    // CH
    NAMES.CH => {
        UYGHURS : ["ç", "چ", "ч", "q", "ch"],
        tp : TYPES.CONSONANTS,
        nm : NAMES.CH,
        ipa : "tʃ",
    },

    // D
    NAMES.D => {
        UYGHURS : ["d", "د", "д", "d", "d"],
        tp : TYPES.CONSONANTS,
        nm : NAMES.D,
        ipa : "d",
    },

    // F
    NAMES.F => {
        UYGHURS : ["f", "ف", "ф", "f", "f"],
        tp : TYPES.CONSONANTS,
        nm : NAMES.F,
        ipa : "f",
    },

    // G
    NAMES.G => {
        UYGHURS : ["g", "گ", "г", "g", "g"],
        tp : TYPES.CONSONANTS,
        nm : NAMES.G,
        ipa : "g",
    },

    // GH
    NAMES.GH => {
        UYGHURS : ["ğ", "غ", "ғ", "ƣ", "gh"],
        tp : TYPES.CONSONANTS,
        nm : NAMES.GH,
        ipa : "ɣ",
    },

    // H
    NAMES.H => {
        UYGHURS : ["h", "ھ", "һ", "ⱨ", "h"],
        tp : TYPES.CONSONANTS,
        nm : NAMES.H,
        ipa : "h",
    },

    // J
    NAMES.J => {
        UYGHURS : ["j", "ژ", "ж", "ⱬ", "zh"],
        tp : TYPES.CONSONANTS,
        nm : NAMES.J,
        ipa : "ʒ",
    },

    // K
    NAMES.K => {
        UYGHURS : ["k", "ك", "к", "k", "k"],
        tp : TYPES.CONSONANTS,
        nm : NAMES.K,
        ipa : "k",
    },

    // L
    NAMES.L => {
        UYGHURS : ["l", "ل", "л", "l", "l"],
        tp : TYPES.CONSONANTS,
        nm : NAMES.L,
        ipa : "l",
    },

    // M
    NAMES.M => {
        UYGHURS : ["m", "م", "м", "m", "m"],
        tp : TYPES.CONSONANTS,
        nm : NAMES.M,
        ipa : "m",
    },

    // N
    NAMES.N => {
        UYGHURS : ["n", "ن", "н", "n", "n"],
        tp : TYPES.CONSONANTS,
        nm : NAMES.N,
        ipa : "n",
    },

    // NG
    NAMES.NG => {
        UYGHURS : ["ñ", "ڭ", "ң", "ng", "ng"],
        tp : TYPES.CONSONANTS,
        nm : NAMES.NG,
        ipa : "ŋ",
    },

    // P
    NAMES.P => {
        UYGHURS : ["p", "پ", "п", "p", "p"],
        tp : TYPES.CONSONANTS,
        nm : NAMES.P,
        ipa : "p",
    },

    // Q
    NAMES.Q => {
        UYGHURS : ["q", "ق", "қ", "ⱪ", "q"],
        tp : TYPES.CONSONANTS,
        nm : NAMES.Q,
        ipa : "q",
    },

    // R
    NAMES.R => {
        UYGHURS : ["r", "ر", "р", "r", "r"],
        tp : TYPES.CONSONANTS,
        nm : NAMES.R,
        ipa : "r",
    },

    // S
    NAMES.S => {
        UYGHURS : ["s", "س", "с", "s", "s"],
        tp : TYPES.CONSONANTS,
        nm : NAMES.S,
        ipa : "s",
    },

    // SH
    NAMES.SH => {
        UYGHURS : ["ş", "ش", "ш", "x", "sh"],
        tp : TYPES.CONSONANTS,
        nm : NAMES.SH,
        ipa : "ʃ",
    },

    // T
    NAMES.T => {
        UYGHURS : ["t", "ت", "т", "t", "t"],
        tp : TYPES.CONSONANTS,
        nm : NAMES.T,
        ipa : "t",
    },

    // X
    NAMES.X => {
        UYGHURS : ["x", "خ", "х", "h", "x"],
        tp : TYPES.CONSONANTS,
        nm : NAMES.X,
        ipa : "x",
    },

    // Z
    NAMES.Z => {
        UYGHURS : ["z", "ز", "з", "z", "z"],
        tp : TYPES.CONSONANTS,
        nm : NAMES.Z,
        ipa : "z",
    },

    // Y
    NAMES.Y => {
        UYGHURS : ["y", "ي", "й", "y", "y"],
        tp : TYPES.SEMIVOWELS,
        nm : NAMES.Y,
        ipa : "j",
    },

    // V
    NAMES.V => {
        UYGHURS : ["v", "ۋ", "в", "v", "w"],
        tp : TYPES.SEMIVOWELS,
        nm : NAMES.V,
        ipa : "v",
    },

    // YU
    NAMES.YU => {
        UYGHURS : ["yu", "ي‍‍ۇ", "ю", "yu", "yu"],
        tp : TYPES.COMPOUNDS,
        nm : NAMES.YU,
        ipa : "ju",
    },

    // YA
    NAMES.YA => {
        UYGHURS : ["ya", "ي‍‍ا", "я", "ya", "ya"],
        tp : TYPES.COMPOUNDS,
        nm : NAMES.YA,
        ipa : "jɑ",
    },

];
// [M[ ALPHABETS_END ]M]

enum LANG_KEYS {
    common;
    arabic;
    cyrillic;
    newly;
    latin;
}

var INDEX_MAP : Map<LANGUAGES, Map<LANG_KEYS, Int>> = [
    LANGUAGES.UYGHURS => [
        LANG_KEYS.common => 0,
        LANG_KEYS.arabic => 1,
        LANG_KEYS.cyrillic => 2,
        LANG_KEYS.newly => 3,
        LANG_KEYS.latin => 4,
    ],
];

class Converter {

    // init
    private var lang : LANGUAGES;
    private var from : LANG_KEYS;
    private var to : LANG_KEYS;
    private var fromIdx : Int = null;
    private var toIdx : Int = null;
	// process
    private var text : String = null;
    private var index : Int = 0;
    private var result : StringBuf = new StringBuf();
	private var lastAlpha : Alphabet = null;
    // current
    private var chLast : String = null;
    private var chCurr : String = null;
    private var chNext : String = null;

    private static function init() {
        //
    }

    public function new(from : LANG_KEYS, to : LANG_KEYS) {
        this.lang = LANGUAGES.UYGHURS;
        this.from = from;
        this.to = to;
        this.fromIdx = INDEX_MAP[this.lang][this.from];
        this.toIdx = INDEX_MAP[this.lang][this.to];
        if (this.fromIdx == null || this.toIdx == null) {
            throw "key not supported for this language";
        }
    }

    private function pushString(str : String) {
		lastAlpha = null;
        this.result.add(str);
    }

	private function pushName(name : NAMES) {
		var conf = ALPHABETS[name];
		var arr = getLangArr(conf);
		var idx = INDEX_MAP[this.lang][this.to];
		var str = arr[idx];
		if (this.to == LANG_KEYS.arabic && conf.tp == TYPES.VOWELS && (lastAlpha == null || lastAlpha.tp == TYPES.VOWELS)) {
			this.result.add(this.getLangArr(ALPHABETS[NAMES.HEMZE])[this.toIdx]);
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

    private function getLangArr(conf : Alphabet) : Array<String> {
        if (this.lang == LANGUAGES.UYGHURS) {
            return conf.UYGHURS;
        }
        return null;
    }

    private function getChar(indent : Int = 0) : String {
        var ch = this.text.charAt(this.index + indent);
        if (ch == null || ch == "") {
            return null;
        }
        return ch;
    }

    private function getAlphabet(ch : String) : Alphabet {
        for(conf in ALPHABETS) {
            var arr = getLangArr(conf);
            if (arr == null) continue;
            var idx = INDEX_MAP[this.lang][this.from];
            if (arr[idx] == ch) {
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

    private function handleCurrent() {
        if (this.lang == LANGUAGES.UYGHURS) {
            handleUyghur();
        } else {
            throw "this language have not implemented yet!";
        }
    }

    private function process() {
        this.chLast = this.getChar(-1);
        this.chCurr = this.getChar(0);
        this.chNext = this.getChar(1);
        this.handleCurrent();
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

    static function main() {
        init();
        trace(LANGUAGES.UYGHURS);
		// var origin = "شاڭخەي";
		// var origin = "قول باش پۇت كۆز";
		// var origin = "مائارىپ مۇئەللىم دائىرە مۇئەييەن تەبىئىي پائالىيەت ئۆزبېكىستانغا ھىنگان چەكلەنگەن گاڭگىراپ باشلانغۇچ جەمئىيەت";
		// var origin = "ئەسئەت";
		// var origin = "گاڭگىراپ";
		// var origin = "جەمئىيەت";
		var origin = "ئالىمجان يۈسەن ۋە ئەسئەتجان سۇ تۇتتى.";
        trace("origin", origin);
        var converter = new Converter(LANG_KEYS.arabic, LANG_KEYS.common);
        var result = converter.convert(origin);
        trace("result", result);
        converter = new Converter(LANG_KEYS.common, LANG_KEYS.arabic);
        var reverse = converter.convert(result);
        trace("reverse", reverse);
        #if sys
            sys.io.File.saveContent('output/test.txt',reverse);
        #end
        trace("converter...");
    }

}
