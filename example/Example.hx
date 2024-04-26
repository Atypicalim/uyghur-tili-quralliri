// haxe tilida ishlitish misali

// 1. hx hojjitini mushu ulge bar xojjet xaltisigha kuchurwalimiz
// 2. andin tuwendiki misaldek ishletsek bulidu

import UyghurLanguageTools;

@:keep
@:expose
class Example {

    static function main() {
        var origin = "مەرھابا";
        trace(origin);
        var target = UyghurLanguageTools.toExtended(origin);
        trace(target);
    }

}
