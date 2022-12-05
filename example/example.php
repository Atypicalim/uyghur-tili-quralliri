<? // php tilida ishlitish misali 


// 1. phar ambirini uzimizning tur xojjet xaltisidiki melum urungha kuchurwalimiz
// 2. andin php.ini xojjitidin `phar.readonly` ni aqimiz we qimiitini `Off` qilimiz
// 3. andin tuwendiki misaldek ishletsek bulidu

header("Content-Type: text/plain");
include '../release/UyghurLanguageTools.phar';

$origin = "مەرھابا";
echo $origin;
$target = \UyghurLanguageTools::toExtended($origin);
echo $target;
