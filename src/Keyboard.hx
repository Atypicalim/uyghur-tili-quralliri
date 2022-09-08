// keybaord

// [M[ HEAD_BEGIN ]M]
// [M[ HEAD_FINISH ]M]

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

    public static function parseKeycode(isSHiftPressed : Bool, code : Int) : String {
        var values : Array<String> = KEYCODES[code];
        if (values == null) return null;
        return isSHiftPressed ? values[2] : values[1];
    }

    public static function parseAlphabet(isSHiftPressed : Bool, alphabet : String) : String {
        if (alphabet.length != 1) return null;
        for (_ => values in KEYCODES) {
            if (values[0] != alphabet) continue;
            return isSHiftPressed ? values[2] : values[1];
        }
        return null;
    }

}
