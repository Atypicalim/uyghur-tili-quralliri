# python tilida ishlitish misali

import sys
sys.path.insert(0, "../release/")
from Tools import Tools

origin = "مەرھابا"
print(origin)
target = Tools.toExtended(origin)
print(target)
