// java tilida ishlitish misali

// 1. jar ambirini uzimizning tur xojjet xaltisidiki melum urungha kuchurwalimiz
// 2. andin Intellij Idea da jar ambirini ong chikish arqiliq turge qushiwalimiz
// 3. andin tuwendiki misaldek ishletsek bulidu

import haxe.root.UyghurLanguageTools;

public class Example {
    public static void main(String[] args) {
        String origin = "مەرھابا";
        System.out.println(origin);
        String target = UyghurLanguageTools.toExtended(origin);
        System.out.println(target);
    }
}
