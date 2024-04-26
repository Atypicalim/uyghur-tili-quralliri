
// syllable

import Alphabets.LANG_KEYS;  // [M[ HEAD_IGNORE ]M]
import Alphabets.TYPES;  // [M[ HEAD_IGNORE ]M]
import Alphabets.NAMES;  // [M[ HEAD_IGNORE ]M]

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
