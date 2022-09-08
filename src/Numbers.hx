// numbers

// [M[ HEAD_BEGIN ]M]
// [M[ HEAD_FINISH ]M]

class Numbers {

    private static var valid : Bool = false;
    private static var COMPLETE : String = "پۈتۈن";
    private static var ZERO : String = "نۆل";
    private static var TEN : String = "ئون";
    private static var TEN_SUFFIX : String = "دا";
    private static var HUNDRED : String = "يۈز";
    private static var HUNDRED_SUFFIX : String = "دە";
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
    private static var NAMES_N_SUFFIX : Array<String> = [
        "دا",
        "دا",
        "تا",
        "دا",
        "تا"
    ];

    public function new() {
    }

    private static function getNumName(num : Int) : String {
        return num == 0 ? "" : NAMES_1[num - 1];
    }

    private static function getTenTimes(num : Int) : String {
        return num == 0 ? "" : NAMES_10[num - 1];
    }

    private static function getHundredTimes(text : String, num : Int) : String {
        return (text.length == 0) ? text : text + " " + HUNDRED;
    }

    private static function getHighTimes(text : String, times : Int) : String {
        return (!valid) ? text : text + " " + NAMES_N[times];
    }

    private static function appendNumTimes(times : Int, num : Int, text : String) {
        switch (times) {
            case 2: return getTenTimes(num);
            case 3: return getHundredTimes(text, num);
            case 4: return getHighTimes(text, 0);
            case 5: return getTenTimes(num);
            case 6: return getHundredTimes(text, num);
            case 7: return getHighTimes(text, 1);
            case 8: return getTenTimes(num);
            case 9: return getHundredTimes(text, num);
            case 10: return getHighTimes(text, 2);
            case 11: return getTenTimes(num);
            case 12: return getHundredTimes(text, num);
            case 13: return getHighTimes(text, 3);
            case 14: return getTenTimes(num);
            case 15: return getHundredTimes(text, num);
            case 16: return getHighTimes(text, 5);
            case 17: return getTenTimes(num);
            case 18: return getHundredTimes(text, num);
            default: return text;
        }
    }

    private static function processRead(num : Int) : String {
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
        return result.join(" ");
    }


    private static function appendFloatSuffix(text : String) : String {
        if (StringTools.endsWith(text, TEN)) {
            text += TEN_SUFFIX;
        } else if (StringTools.endsWith(text, HUNDRED)) {
            text += HUNDRED_SUFFIX;
        }
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
        //
        var num = Std.parseFloat(text);
        var str = Std.string(num);
        if (str == "nan") return "";
        //
        var nums = Alphabets.splitByDelimiter(Std.string(num), ".");
        if (nums.length == 1) {
            var num1 : Int = Std.parseInt(nums[0]);
            return processRead(num1);
        } else {
            var num1 : Int = Std.parseInt(nums[0]);
            var num2 : Int = Std.parseInt(nums[1]);
            var numx : Int = Std.int(Math.pow(10, nums[1].length));
            var text1 = processRead(num1);
            var text2 = processRead(num2);
            var textX = processRead(numx);
            return text1 + " " + COMPLETE + " " + appendFloatSuffix(textX) + " " + text2;
        }
        return "";
    }

    public static function processWrite(words: Array<String>) : String {
        var result = 0;
        var length = words.length;
        var power = 1;
        var times = 1;
        if (length == 0) {
            return "";
        }
        while (length > 0) {
            length--;
            var word = words[length];
            //
            var isPower = false;
            for (k => v in NAMES_N) {
                if (v == word) {
                    power = Std.int(Math.pow(10, (k + 1) * 3));
                    times = 1;
                    isPower = true;
                    break;
                }
            }
            if (isPower) {
                continue;
            }
            if (word == HUNDRED) {
                times = 100;
                continue;
            }
            //
            var num = 0;
            for(k => v in NAMES_1) {
                if (v == word) {
                    num = k + 1;
                }
            }
            for(k => v in NAMES_10) {
                if (v == word) {
                    num = k + 1;
                    times = 10;
                }
            }
            //
            result += Std.int(num * power * times);
        }
        return Std.string(result);
    }

    
    public static function write(text: String) : String {
        var words = Alphabets.splitByDelimiter(text, " ");
        var dotIndex = -1;
        for(k => v in words) {
            if (v == COMPLETE) {
                dotIndex = k;
                break;
            }
        }
        var endIndex = dotIndex + 1;
        var parseWord = words[dotIndex + 1];
        var power = 0;
        if (StringTools.startsWith(parseWord, NAMES_10[0])) {
            power = 1;
            if (!StringTools.endsWith(parseWord, NAMES_N_SUFFIX[0])) {
                endIndex = dotIndex + 1 + 1;
                parseWord = words[endIndex];
            }
        } else if (StringTools.startsWith(parseWord, HUNDRED)) {
            power = 2;
            if (!StringTools.endsWith(parseWord, HUNDRED_SUFFIX)) {
                endIndex = dotIndex + 1 + 1;
                parseWord = words[endIndex];
            }
        }
        if (power == 0 || endIndex > dotIndex + 1) {
            for(k => v in NAMES_N) {
                if (StringTools.startsWith(parseWord, v)) {
                    power += Std.int((k + 1) * 3);
                }
            }
        }
        if (dotIndex < 0 || power < 1) {
            return processWrite(words);
        } else {
            var left = processWrite(words.slice(0, dotIndex));
            var right = processWrite(words.slice(endIndex + 1, words.length));
            var temp = StringTools.lpad(right, "0", power); 
            return left + "." + temp;
        }
    }

}
