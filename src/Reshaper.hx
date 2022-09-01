
// reshaper

import haxe.iterators.StringIterator;

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

    private static function init() {
        //
    }

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

    private function toExt(text : String) : String {
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

    private function toBase(text : String) : String {
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

    static function main() {
        init();
		// var origin = "شاڭخەي";
		// var origin = "قول باش پۇت كۆز";
		// var origin = "مائارىپ مۇئەللىم دائىرە مۇئەييەن تەبىئىي پائالىيەت ئۆزبېكىستانغا ھىنگان چەكلەنگەن گاڭگىراپ باشلانغۇچ جەمئىيەت";
		// var origin = "ئەسئەت";
		// var origin = "گاڭگىراپ";
		var origin = "جەمئىيەت";
        trace("origin", origin);
        var reshaper = new Reshaper();
        var result = reshaper.toExt(origin);
        trace("result", result);
        var reverse = reshaper.toBase(result);
        trace("reverse", reverse);
        // #if sys
        //     sys.io.File.saveContent('output/test.txt',reverse);
        // #end
        trace("reshaper...");
    }

}
