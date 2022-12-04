<? // php tilida ishlitish misali 

header("Content-Type: text/plain");
include '../release/tools.phar';

$origin = "مەرھابا";
echo $origin;
$target = \Tools::toExtended($origin);
echo $target;
