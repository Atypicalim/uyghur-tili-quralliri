
// tools

// [M[ HEAD_BEGIN ]M]
import Alphabets.LANG_KEYS;
import Alphabets.TYPES;
import Alphabets.NAMES;
// [M[ HEAD_FINISH ]M]

class Tools {

    public static function to_yrillic(text : String) : String {
        return Converter.work("arabic", "cyrillic", text);
    }

    public static function to_latin(text : String) : String {
        return Converter.work("arabic", "latin", text);
    }

    public static function to_newly(text : String) : String {
        return Converter.work("arabic", "newly", text);
    }

    public static function to_extend(text : String) : String {
        return Reshaper.toExt(text);
    }

    public static function from_extend(text : String) : String {
        return Reshaper.toBase(text);
    }

    public static function from_alphabet(alphabet : String, isSHiftPressed : Bool) : String {
        return Keyboard.parseAlphabet(isSHiftPressed, alphabet);
    }

    public static function from_keycode(code : Int, isSHiftPressed : Bool) : String {
        return Keyboard.parseKeycode(isSHiftPressed, code);
    }

    static function main() {
        trace("\n\n--->TEST:");
        //
        // converter
        trace("converter:");
		var origin = "ئالىمجان ۋە ئەسئەتجان سۇ تۇتتى.";
        trace("origin", origin);
        var result = Converter.work("arabic", "common", origin);
        trace("result", result);
        var reverse = Converter.work("common", "arabic", result);
        trace("reverse", reverse);
        #if sys
            sys.io.File.saveContent('output/test.txt',reverse);
        #end
        //
        //
        // keyboard
        trace("keyboard:");
        origin = "f";
        trace("origin", origin);
        result = Keyboard.parseAlphabet(true, "f");
        trace("result", result);
        // 
        // 
        // numbers
        trace("numbers:");
        origin = "123.40110001";
        trace("origin", origin);
        result = Numbers.read(origin);
        trace("result", result);
        reverse = Numbers.write(result);
        trace("reverse", reverse);
        // 
        // 
        // reshaper
        trace("reshaper:");
		origin = "جەمئىيەت";
        trace("origin", origin);
        result = Reshaper.toExt(origin);
        trace("result", result);
        reverse = Reshaper.toBase(result);
        trace("reverse", reverse);
        // 
        // 
        // syllable
        trace("syllable:");
        origin = "ئاھلىرىم";
        trace("origin", origin);
        result = Syllable.parse(origin);
        trace("result", result);
        reverse = StringTools.replace(result, " ", "");
        trace("reverse", reverse);
        //
    }

}
