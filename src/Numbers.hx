// syllable

class Numbers {

    private static var valid : Bool = false;
    private static var COMPLETE : String = "پۈتۈن";
    private static var ZERO : String = "نۆل";
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
        "يۈز",
        "مىڭ",
        "مىليون",
        "مىليارد",
        "تىرىليون",
        "تىرىليارد"
    ];
    private static var NAMES_N_SUFFIX : Array<String> = [
        "دە",
        "دا",
        "دا",
        "تا",
        "دا",
        "تا"
    ];

    private function new() {
    }

    private static function getNumName(num : Int) : String {
        return num == 0 ? "" : NAMES_1[num - 1];
    }

    private static function getTenTimes(num : Int) : String {
        return num == 0 ? "" : NAMES_10[num - 1];
    }

    private static function getHundredTimes(text : String, num : Int) : String {
        return (text.length == 0) ? text : text + " " + NAMES_N[0];
    }

    private static function getHighTimes(text : String, times : Int) : String {
        return (!valid) ? text : text + " " + NAMES_N[times];
    }

    private static function appendNumTimes(times : Int, num : Int, text : String) {
        switch (times) {
            case 2: return getTenTimes(num);
            case 3: return getHundredTimes(text, num);
            case 4: return getHighTimes(text, 1);
            case 5: return getTenTimes(num);
            case 6: return getHundredTimes(text, num);
            case 7: return getHighTimes(text, 2);
            case 8: return getTenTimes(num);
            case 9: return getHundredTimes(text, num);
            case 10: return getHighTimes(text, 3);
            case 11: return getTenTimes(num);
            case 12: return getHundredTimes(text, num);
            case 13: return getHighTimes(text, 4);
            case 14: return getTenTimes(num);
            case 15: return getHundredTimes(text, num);
            case 16: return getHighTimes(text, 5);
            case 17: return getTenTimes(num);
            case 18: return getHundredTimes(text, num);
            default: return text;
        }
    }

    private static function process(num : Int) : String {
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
        trace("-----------");
        trace(result);
        return result.join(" ");
    }


    private static function appendFloatSuffix(text : String) : String {
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
        trace("text", text);
        var dot = ~/^\d+(\.\d+)*$/gi;
        var isMatch = dot.match(text);
        if (!isMatch) return "";
        var numStr = dot.matched(0);
        var num = Std.parseFloat(numStr);
        trace("num", num);
        dot = ~/\./gi;
        var nums = dot.split(Std.string(num));
        if (nums.length == 1) {
            var num1 : Int = Std.parseInt(nums[0]);
            return process(num1);
        } else {
            var num1 : Int = Std.parseInt(nums[0]);
            var num2 : Int = Std.parseInt(nums[1]);
            var numx : Int = 10;
            while (numx < num2) {
                numx *= 10;
            }
            var text1 = process(num1);
            var text2 = process(num2);
            var textX = process(numx);
            trace("numx", numx, textX);
            return text1 + " " + COMPLETE + " " + appendFloatSuffix(textX) + " " + text2;
        }
        return "";
    }

    static function main() {
        trace("numbers...");
        var txt = "1234";
        // var txt = "12345678";
        // var txt = "100001";
        var txt = "123.45";
        var r : String = read(txt);
        trace(r);
        #if sys
            sys.io.File.saveContent('output/test.txt', r);
        #end
    }

}
