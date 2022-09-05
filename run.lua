-- run

-- pcall(os.execute, "git clone git@github.com:kompasim/my-build-tools.git ./my-build-tools")
package.path = package.path .. ";./my-build-tools/?.lua"
package.path = package.path .. ";./pure-lua-tools/?.lua"
require "./pure-lua-tools/test"
CodeBuilder = require "./my-build-tools/code_builder"

require('./alphabets')

-- os.execute("haxe ./hxml/converter.hxml")
-- os.execute("haxe ./hxml/syllable.hxml")
-- os.execute("haxe ./hxml/keyboard.hxml")
