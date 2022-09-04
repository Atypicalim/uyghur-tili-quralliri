import haxe.EnumTools;
import Alphabets.LANG_KEYS;
import Alphabets.TYPES;
import Alphabets.NAMES;

class Converter {

    // init
    private var from : LANG_KEYS;
    private var to : LANG_KEYS;
    private var fromIdx : Int = null;
    private var toIdx : Int = null;
	// process
    private var text : String = null;
    private var index : Int = 0;
    private var result : StringBuf = new StringBuf();
	private var lastAlpha = null;
    // current
    private var chLast : String = null;
    private var chCurr : String = null;
    private var chNext : String = null;

    private static function init() {
        //
    }

    public function new(from : LANG_KEYS, to : LANG_KEYS) {
        this.from = from;
        this.to = to;
        this.fromIdx = Alphabets.INDEX_MAP[this.from];
        this.toIdx = Alphabets.INDEX_MAP[this.to];
        if (this.fromIdx == null || this.toIdx == null) {
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

    static function main() {
        init();
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
