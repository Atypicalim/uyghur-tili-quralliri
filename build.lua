-- pcall(os.execute, "git clone git@github.com:kompasim/my-build-tools.git ./my-build-tools")
package.path = package.path .. ";./my-build-tools/?.lua"


require "./pure-lua-tools/test"
require "./alphabets"

local CodeBuilder = require("./code_builder")
local builder = CodeBuilder(false)
local source = "./src/Converter.hx"

local isSkip = false

builder:setInput(source)
builder:setComment("//")
builder:handleMacro(true)
builder:onMacro(function(code, command)
    if command == "ALPHABETS_START" then
        isSkip = true
        return "// [M[ ALPHABETS_START ]M]"
    elseif command == "ALPHABETS_END" then
        isSkip = false
        return getAlphabets() .. "// [M[ ALPHABETS_END ]M]"
    end
end)
builder:onLine(function(line)
    if not isSkip then
        return line
    end
end)
builder:setOutput(source)
builder:start()

os.execute("haxe ./build.hxml")
