-- pcall(os.execute, "git clone git@github.com:kompasim/my-build-tools.git ./my-build-tools")
package.path = package.path .. ";./my-build-tools/?.lua"


require "./pure-lua-tools/test"
require "./alphabets"

local CodeBuilder = require("./code_builder")
local builder = CodeBuilder(false)
local source = "./src/Converter.hx"

-- builder:setInput(source)
-- builder:handleMacro("//")
-- builder:setCallback(function(code, firsArg)
--     if firsArg == "ALPHABETS" then
--         return getAlphabets()
--     end
-- end)
-- builder:setOutput(source)
-- builder:start()

os.execute("haxe ./build.hxml")
