// csharp tilida ishlitish misali

// 1. dll ambirini uzimizning tur xojjet xaltisidiki melum urungha kuchurwalimiz
// 2. visual studio da tur xojjitini ong chikish arqiliq, dll ambirini turge qushiwalimiz 
// 3. andin tuwendiki misaldek ishletsek bulidu

String origin = "مەرھابا";
Console.WriteLine(origin);
String target = UyghurLanguageTools.toExtended(origin);
Console.WriteLine(target);
