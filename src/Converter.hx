
// converter


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
    var ipa : String; // reading sound
    var nm : NAMES; // english name
    var cmn : String; // common script
}

// ALPHABETS
var ALPHABETS : Map<NAMES, Alphabet> = [
    // HEMZE
    NAMES.HEMZE => {
        UYGHURS : ["ئ", "", "", ""],
        tp : TYPES.MARKS,
        ipa : "",
        nm : NAMES.HEMZE,
        cmn : "",
    },

    // A
    NAMES.A => {
        UYGHURS : ["ا", "a", "a", "a"],
        tp : TYPES.VOWELS,
        ipa : "ɑ",
        nm : NAMES.A,
        cmn : "a",
    },

    // AE
    NAMES.AE => {
        UYGHURS : ["ە", "ә", "ə", "e"],
        tp : TYPES.VOWELS,
        ipa : "æ",
        nm : NAMES.AE,
        cmn : "ä",
    },

    // E
    NAMES.E => {
        UYGHURS : ["ې", "е", "e", "ë"],
        tp : TYPES.VOWELS,
        ipa : "",
        nm : NAMES.E,
        cmn : "e",
    },

    // I
    NAMES.I => {
        UYGHURS : ["ى", "и", "i", "i"],
        tp : TYPES.VOWELS,
        ipa : "",
        nm : NAMES.I,
        cmn : "i",
    },

    // O
    NAMES.O => {
        UYGHURS : ["و", "о", "o", "o"],
        tp : TYPES.VOWELS,
        ipa : "",
        nm : NAMES.O,
        cmn : "o",
    },

    // OO
    NAMES.OO => {
        UYGHURS : ["ۆ", "ө", "ɵ", "ö"],
        tp : TYPES.VOWELS,
        ipa : "",
        nm : NAMES.OO,
        cmn : "ö",
    },

    // U
    NAMES.U => {
        UYGHURS : ["ۇ", "у", "u", "u"],
        tp : TYPES.VOWELS,
        ipa : "",
        nm : NAMES.U,
        cmn : "u",
    },

    // UU
    NAMES.UU => {
        UYGHURS : ["ۈ", "ү", "ü", "ü"],
        tp : TYPES.VOWELS,
        ipa : "",
        nm : NAMES.UU,
        cmn : "ü",
    },

    // B
    NAMES.B => {
        UYGHURS : ["ب", "б", "b", "b"],
        tp : TYPES.CONSONANTS,
        ipa : "b",
        nm : NAMES.B,
        cmn : "b",
    },

    // DJ
    NAMES.DJ => {
        UYGHURS : ["ج", "җ", "j", "j"],
        tp : TYPES.CONSONANTS,
        ipa : "dʒ",
        nm : NAMES.DJ,
        cmn : "c",
    },

    // CH
    NAMES.CH => {
        UYGHURS : ["چ", "ч", "q", "ch"],
        tp : TYPES.CONSONANTS,
        ipa : "tʃ",
        nm : NAMES.CH,
        cmn : "ç",
    },

    // D
    NAMES.D => {
        UYGHURS : ["د", "д", "d", "d"],
        tp : TYPES.CONSONANTS,
        ipa : "d",
        nm : NAMES.D,
        cmn : "d",
    },

    // F
    NAMES.F => {
        UYGHURS : ["ف", "ф", "f", "f"],
        tp : TYPES.CONSONANTS,
        ipa : "f",
        nm : NAMES.F,
        cmn : "f",
    },

    // G
    NAMES.G => {
        UYGHURS : ["گ", "г", "g", "g"],
        tp : TYPES.CONSONANTS,
        ipa : "g",
        nm : NAMES.G,
        cmn : "g",
    },

    // GH
    NAMES.GH => {
        UYGHURS : ["غ", "ғ", "ƣ", "gh"],
        tp : TYPES.CONSONANTS,
        ipa : "ɣ",
        nm : NAMES.GH,
        cmn : "ğ",
    },

    // H
    NAMES.H => {
        UYGHURS : ["ھ", "һ", "ⱨ", "h"],
        tp : TYPES.CONSONANTS,
        ipa : "h",
        nm : NAMES.H,
        cmn : "h",
    },

    // J
    NAMES.J => {
        UYGHURS : ["ژ", "ж", "ⱬ", "zh"],
        tp : TYPES.CONSONANTS,
        ipa : "ʒ",
        nm : NAMES.J,
        cmn : "j",
    },

    // K
    NAMES.K => {
        UYGHURS : ["ك", "к", "k", "k"],
        tp : TYPES.CONSONANTS,
        ipa : "k",
        nm : NAMES.K,
        cmn : "k",
    },

    // L
    NAMES.L => {
        UYGHURS : ["ل", "л", "l", "l"],
        tp : TYPES.CONSONANTS,
        ipa : "l",
        nm : NAMES.L,
        cmn : "l",
    },

    // M
    NAMES.M => {
        UYGHURS : ["م", "м", "m", "m"],
        tp : TYPES.CONSONANTS,
        ipa : "m",
        nm : NAMES.M,
        cmn : "m",
    },

    // N
    NAMES.N => {
        UYGHURS : ["ن", "н", "n", "n"],
        tp : TYPES.CONSONANTS,
        ipa : "n",
        nm : NAMES.N,
        cmn : "n",
    },

    // NG
    NAMES.NG => {
        UYGHURS : ["ڭ", "ң", "ng", "ng"],
        tp : TYPES.CONSONANTS,
        ipa : "ŋ",
        nm : NAMES.NG,
        cmn : "ñ",
    },

    // P
    NAMES.P => {
        UYGHURS : ["پ", "п", "p", "p"],
        tp : TYPES.CONSONANTS,
        ipa : "p",
        nm : NAMES.P,
        cmn : "p",
    },

    // Q
    NAMES.Q => {
        UYGHURS : ["ق", "қ", "ⱪ", "q"],
        tp : TYPES.CONSONANTS,
        ipa : "q",
        nm : NAMES.Q,
        cmn : "q",
    },

    // R
    NAMES.R => {
        UYGHURS : ["ر", "р", "r", "r"],
        tp : TYPES.CONSONANTS,
        ipa : "r",
        nm : NAMES.R,
        cmn : "r",
    },

    // S
    NAMES.S => {
        UYGHURS : ["س", "с", "s", "s"],
        tp : TYPES.CONSONANTS,
        ipa : "s",
        nm : NAMES.S,
        cmn : "s",
    },

    // SH
    NAMES.SH => {
        UYGHURS : ["ش", "ш", "x", "sh"],
        tp : TYPES.CONSONANTS,
        ipa : "ʃ",
        nm : NAMES.SH,
        cmn : "ş",
    },

    // T
    NAMES.T => {
        UYGHURS : ["ت", "т", "t", "t"],
        tp : TYPES.CONSONANTS,
        ipa : "t",
        nm : NAMES.T,
        cmn : "t",
    },

    // X
    NAMES.X => {
        UYGHURS : ["خ", "х", "h", "x"],
        tp : TYPES.CONSONANTS,
        ipa : "x",
        nm : NAMES.X,
        cmn : "x",
    },

    // Z
    NAMES.Z => {
        UYGHURS : ["ز", "з", "z", "z"],
        tp : TYPES.CONSONANTS,
        ipa : "z",
        nm : NAMES.Z,
        cmn : "z",
    },

    // Y
    NAMES.Y => {
        UYGHURS : ["ي", "й", "y", "y"],
        tp : TYPES.SEMIVOWELS,
        ipa : "j",
        nm : NAMES.Y,
        cmn : "y",
    },

    // V
    NAMES.V => {
        UYGHURS : ["ۋ", "в", "v", "w"],
        tp : TYPES.SEMIVOWELS,
        ipa : "v",
        nm : NAMES.V,
        cmn : "v",
    },

    // YU
    NAMES.YU => {
        UYGHURS : ["ي‍‍ۇ", "ю", "yu", "yu"],
        tp : TYPES.COMPOUNDS,
        ipa : "ju",
        nm : NAMES.YU,
        cmn : "yu",
    },

    // YA
    NAMES.YA => {
        UYGHURS : ["ي‍‍ا", "я", "ya", "ya"],
        tp : TYPES.COMPOUNDS,
        ipa : "jɑ",
        nm : NAMES.YA,
        cmn : "ya",
    },

];


// [-M[ LINE_CALLBACK | ALPHABETS ]M-]

var AR_STOP_WORDS : Map<String, String> = [
    "ئەس?ەت" => "ئ",
    "تەل?ەت" => "ئ",
    "جەم?ىيەت" => "ئ",
];

enum LANG_KEYS {
    arabic;
    cyrillic;
    newly;
    latin;
}

var INDEX_MAP : Map<LANGUAGES, Map<LANG_KEYS, Int>> = [
    LANGUAGES.UYGHURS => [
        LANG_KEYS.arabic => 0,
        LANG_KEYS.cyrillic => 1,
        LANG_KEYS.newly => 2,
        LANG_KEYS.latin => 3,
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
		if (conf.tp == TYPES.VOWELS && (lastAlpha == null || lastAlpha.tp == TYPES.MARKS || lastAlpha.tp == TYPES.VOWELS)) {
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
			//
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
        var r = result.toString();
        if (this.to == LANG_KEYS.arabic) {
            for(k in AR_STOP_WORDS.keys()) {
                var matchStr = StringTools.replace(k, "?", "");
                var targetStr = StringTools.replace(k, "?", AR_STOP_WORDS[k]);
                r = StringTools.replace(r, matchStr, targetStr);
            }
        }
        return r;
    }

    static function main() {
        init();
        trace(LANGUAGES.UYGHURS);
		// var origin = "شاڭخەي";
		// var origin = "قول باش پۇت كۆز";
		// var origin = "مائارىپ مۇئەللىم دائىرە مۇئەييەن تەبىئىي پائالىيەت ئۆزبېكىستانغا ھىنگان چەكلەنگەن گاڭگىراپ باشلانغۇچ جەمئىيەت";
		// var origin = "ئەسئەت";
		// var origin = "گاڭگىراپ";
		var origin = "جەمئىيەت";
        trace("origin", origin);
        var converter = new Converter(LANG_KEYS.arabic, LANG_KEYS.latin);
        var result = converter.convert(origin);
        trace("result", result);
        converter = new Converter(LANG_KEYS.latin, LANG_KEYS.arabic);
        var reverse = converter.convert(result);
        trace("reverse", reverse);
        #if sys
            sys.io.File.saveContent('output/test.txt',reverse);
        #end
        trace("converter...");
    }

}
