# python tilida ishlitish misali

# 1. py hojjitini uzimizning tur xojjet xaltisidiki melum urungha kuchurwalimiz
# 2. andin tuwendiki misaldek ishletsek bulidu

import sys
sys.path.insert(0, "../release/")
from UyghurLanguageTools import UyghurLanguageTools

origin = "مەرھابا"
print(origin)
target = UyghurLanguageTools.toExtended(origin)
print(target)
