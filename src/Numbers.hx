// syllable

class Numbers {

    private static var HUNDRED : String = "يۈز";

    private function new() {
    }

    private static function getNumName(num : Int) {
        switch (num) {
            case 1: return "بىر";
            case 2: return "ئىككى";
            case 3: return "ئۈچ";
            case 4: return "تۆت";
            case 5: return "بەش";
            case 6: return "ئالتە";
            case 7: return "يەتتە";
            case 8: return "سەككىز";
            case 9: return "توققۇز";
            default: return "";
        }
    }

    private static function getTenTimes(num : Int) {
        switch (num) {
            case 1: return "ئون";
            case 2: return "يىگىرمە";
            case 3: return "ئوتتۇز";
            case 4: return "قىرىق";
            case 5: return "ئەللىك";
            case 6: return "ئاتمىز";
            case 7: return "يەتمىش";
            case 8: return "سەكسەن";
            case 9: return "توقسان";
            default: return "";
        }
    }

    private static function appendNumTimes(times : Int, num : Int, text : String) {
        switch (times) {
            case 2: return getTenTimes(num);
            case 3: return text + " " + HUNDRED;
            case 4: return text + " مىڭ";
            case 5: return getTenTimes(num);
            case 6: return text + " " + HUNDRED;
            case 7: return text + " مىليون";
            case 8: return getTenTimes(num);
            case 9: return text + " " + HUNDRED;
            case 10: return text + " مىليارد";
            case 11: return getTenTimes(num);
            case 12: return text + " " + HUNDRED;
            case 13: return text + " تىرىليون";
            case 14: return getTenTimes(num);
            case 15: return text + " " + HUNDRED;
            case 16: return text + " تىرىليارد";
            case 17: return getTenTimes(num);
            case 18: return text  + " " + HUNDRED;
            default: return text + "";
        }
    }

    private static function process(text : String) : String {
        trace(text);
        return "";
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
        var txt = "123";
        var r : String = read(txt);
        trace(r);

    }

}
