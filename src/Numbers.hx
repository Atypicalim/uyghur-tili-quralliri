// syllable

class Numbers {

    private static var ZERO : String = "نۆل";
    private static var HUNDRED : String = "يۈز";
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

    private function new() {
    }

    private static function getNumName(num : Int) {
        if (1 <= num && num <= NAMES_1.length) {
            return NAMES_1[num - 1];
        } else {
            return "";
        }
    }

    private static function getTenTimes(num : Int) {
        if (1 <= num && num <= NAMES_10.length) {
            return NAMES_10[num - 1];
        } else {
            return "";
        }
    }

    private static function getHighTimes(num : Int) {
        if (1 <= num && num <= NAMES_N.length) {
            return NAMES_N[num - 1];
        } else {
            return "";
        }
    }

    private static function appendNumTimes(times : Int, num : Int, text : String) {
        switch (times) {
            case 2: return getTenTimes(num);
            case 3: return text + " " + HUNDRED;
            case 4: return text + " " + getHighTimes(0);
            case 5: return getTenTimes(num);
            case 6: return text + " " + HUNDRED;
            case 7: return text + " " + getHighTimes(1);
            case 8: return getTenTimes(num);
            case 9: return text + " " + HUNDRED;
            case 10: return text + " " + getHighTimes(2);
            case 11: return getTenTimes(num);
            case 12: return text + " " + HUNDRED;
            case 13: return text + " " + getHighTimes(3);
            case 14: return getTenTimes(num);
            case 15: return text + " " + HUNDRED;
            case 16: return text + " " + getHighTimes(4);
            case 17: return getTenTimes(num);
            case 18: return text + " " + HUNDRED;
            default: return text;
        }
    }

    private static function process(text : String) : String {
        var num : Int = Std.parseInt(text);
        if (num <= 0) {
            return ZERO;
        }
        var result : Array<String> = new Array<String>();
        var times : Int = 0;
        while (num > 0) {
            times++;
            var n : Int = num % 10;
            var s : String = getNumName(n);
            trace(text, times, n, s);
            s = appendNumTimes(times, n, s);
            trace(s);
            result.insert(0, s);
            num = Std.int((num - n) / 10);
        }
        trace("-----------");
        trace(result);
        return result.join(" ");
    }

    public static function read(text: String) : String {
        text = StringTools.trim(text);
        var dot = ~/^\d+(\.\d+)*$/gi;
        var isMatch = dot.match(text);
        if (!isMatch) return "";
        var numStr = dot.matched(0);
        var num = Std.parseFloat(numStr);
        dot = ~/\./gi;
        var nums = dot.split(Std.string(num));
        if (nums.length == 1) {
            return process(nums[0]);
        } else {
            return process(nums[0]) + " پۈتۈن " + process(nums[1]);
        }
        return "";
    }

    static function main() {
        trace("numbers...");
        // var txt = "123";
        var txt = "123.4";
        var r : String = read(txt);
        trace(r);
        #if sys
            sys.io.File.saveContent('output/test.txt', r);
        #end
    }

}
