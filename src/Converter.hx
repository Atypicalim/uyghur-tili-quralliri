import haxe.xml.Printer;

// converter

// [-M[ LINE_CALLBACK | ALPHABETS ]M-]

enum LANG_KEYS {
    uas;
    uls;
}

var INDEX_MAP : Map<LANGUAGES, Map<LANG_KEYS, Int>> = [
    LANGUAGES.UYGHURS => [
        LANG_KEYS.uas => 0,
        LANG_KEYS.uls => 3,
    ],
];

class Converter {

    private var text : String;

    public function new(text : String) {
        this.text = text;
    }

    private function getTarget(ch : String, fromLang : LANGUAGES, toLang : LANGUAGES, from : LANG_KEYS, to : LANG_KEYS) : Dynamic {
        for (conf in ALPHABETS) {
            var fromArr = null;
            var toArr = null;
            var fromIndex = -1;
            var toIndex = -1;
            if (fromLang == LANGUAGES.UYGHURS) {
                fromArr = conf.UYGHURS;
                fromIndex = INDEX_MAP[LANGUAGES.UYGHURS][from];
            }
            if (toLang == LANGUAGES.UYGHURS) {
                toArr = conf.UYGHURS;
                toIndex = INDEX_MAP[LANGUAGES.UYGHURS][to];
            }
            if (fromIndex < 0 || toIndex < 0) {
                continue;
            }
            if (fromArr[fromIndex] == ch) {
                return toArr[toIndex];
            }
        }
        return ch;
    }

    private function convert(fromLang : LANGUAGES, toLang : LANGUAGES, from : LANG_KEYS, to : LANG_KEYS) : String {
        var result:StringBuf = new StringBuf();
        for (i in 0 ... this.text.length) {
            var origin = this.text.charAt(i);
            var target = this.getTarget(origin, fromLang, toLang, from, to);
            result.add(target);
        }
        return result.toString();
    }

    static function main() {
        trace(TYPES.VOWELS);
        trace(LANGUAGES.UYGHURS);
        trace(ALPHABETS[NAMES.AE]);
        var origin = "شاڭخەي";
        trace("origin", origin);
        var converter = new Converter(origin);
        var result = converter.convert(LANGUAGES.UYGHURS, LANGUAGES.UYGHURS, LANG_KEYS.uas, LANG_KEYS.uls);
        trace("result", result);
        trace("converter...");
    }

}
