
// tools

// [M[ HEAD_BEGIN ]M]
import Alphabets.LANG_KEYS;
import Alphabets.TYPES;
import Alphabets.NAMES;
// [M[ HEAD_FINISH ]M]

class Tools {

    public static function to_common(text : String) : String {
        return Converter.work("arabic", "common", text);
    }

    public static function to_yrillic(text : String) : String {
        return Converter.work("arabic", "cyrillic", text);
    }

    public static function to_latin(text : String) : String {
        return Converter.work("arabic", "latin", text);
    }

    public static function to_newly(text : String) : String {
        return Converter.work("arabic", "newly", text);
    }

    public static function from_common(text : String) : String {
        return Converter.work("common", "arabic", text);
    }

    public static function from_yrillic(text : String) : String {
        return Converter.work("cyrillic", "arabic", text);
    }

    public static function from_latin(text : String) : String {
        return Converter.work("arabic", "latin", text);
    }

    public static function from_newly(text : String) : String {
        return Converter.work("newly", "arabic", text);
    }

    public static function to_extend(text : String) : String {
        return Reshaper.toExt(text);
    }

    public static function from_extend(text : String) : String {
        return Reshaper.toBase(text);
    }

    public static function to_alphabet(text : String, isSHiftPressed : Bool) : String {
        return Keyboard.toAlphabet(text, isSHiftPressed);
    }

    public static function from_alphabet(alphabet : String, isSHiftPressed : Bool) : String {
        return Keyboard.fromAlphabet(alphabet, isSHiftPressed);
    }

    public static function do_syllable(text : String) : String {
        return Syllable.parse(text);
    }

    public static function read_number(text : String) : String {
        return Numbers.read(text);
    }

    public static function write_number(text : String) : String {
        return Numbers.write(text);
    }


    static function main() {
        trace("\n\n--->TEST:");
        //
        // converter
        trace("converter:");
		var origin = "ئالىمجان ۋە ئەسئەتجان سۇ تۇتتى.";
        trace("origin", origin);
        var result = to_common(origin);
        trace("result", result);
        var reverse = from_common(result);
        trace("reverse", reverse);
        #if sys
            sys.io.File.saveContent('output/test.txt',reverse);
        #end
        //
        // alphabet
        trace("alphabet:");
        origin = "گ";
        trace("origin", origin);
        result = to_alphabet(origin, true);
        trace("result", result);
        reverse = from_alphabet(result, true);
        trace("reverse", reverse);
        // 
        // numbers
        trace("numbers:");
        origin = "123.40110001";
        trace("origin", origin);
        result = read_number(origin);
        trace("result", result);
        reverse = write_number(result);
        trace("reverse", reverse);
        // 
        // reshaper
        trace("reshaper:");
		origin = "جەمئىيەت";
        trace("origin", origin);
        result = to_extend(origin);
        trace("result", result);
        reverse = from_extend(result);
        trace("reverse", reverse);
        // 
        // syllable
        trace("syllable:");
        origin = "ئاھلىرىم";
        trace("origin", origin);
        result = do_syllable(origin);
        trace("result", result);
        reverse = StringTools.replace(result, " ", "");
        trace("reverse", reverse);
        //
    }

}
