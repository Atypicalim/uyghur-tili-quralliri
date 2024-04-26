// haxe tilida ishlitish misali

// 1. hx hojjitini uzimizning tur xojjet xaltisidiki melum urungha kuchurwalimiz
// 2. andin tuwendiki misaldek ishletsek bulidu

import ../relase/UyghurLanguageTools

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
