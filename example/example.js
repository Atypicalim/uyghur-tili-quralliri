// javascript tilida ishlitish misali

// 1. js hojjitini uzimizning tur xojjet xaltisidiki melum urungha kuchurwalimiz
// 2. andin tuwendiki misaldek ishletsek bulidu

var UyghurLanguageTools = require('../release/UyghurLanguageTools.js').UyghurLanguageTools;

var origin = "مەرھابا";
console.log(origin)
var target = UyghurLanguageTools.toExtended(origin);
console.log(target)
