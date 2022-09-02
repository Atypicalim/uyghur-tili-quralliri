
// tools

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
        return Keyboard.parseAlphabet(isSHiftPressed, text);
    }

    public static function from_keycode(code : Int, isSHiftPressed : Bool) : String {
        return Keyboard.parseKeycode(isSHiftPressed, text);
    }

    static function main() {
        trace("keybaord...");
        trace(parseAlphabet(true, "f"));
    }

}
