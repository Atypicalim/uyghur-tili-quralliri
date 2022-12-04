// java tilida ishlitish misali

import haxe.root.Tools;

public class Example {
    public static void main(String[] args) {
        String origin = "مەرھابا";
        System.out.println(origin);
        String target = Tools.toExtended(origin);
        System.out.println(target);
    }
}
