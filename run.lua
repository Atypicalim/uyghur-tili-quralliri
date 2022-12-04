-- run

-- pcall(os.execute, "git clone git@github.com:kompasim/my-build-tools.git ./my-build-tools")
package.path = package.path .. ";./my-build-tools/?.lua"
package.path = package.path .. ";./pure-lua-tools/?.lua"
require "./pure-lua-tools/test"
CodeBuilder = require "./my-build-tools/code_builder"

require('./alphabets')

do
    -- os.execute("haxe ./others/run.hxml")
    -- os.execute("haxe ./others/build.hxml")
    -- return
end

local builder = CodeBuilder(false)
local target = "./Tools.hx"
local heads = {}
local isHead = false

builder:setInput(
    "./src/Alphabets.hx",
    "./src/Converter.hx",
    "./src/Keyboard.hx",
    "./src/Numbers.hx",
    "./src/Reshaper.hx",
    "./src/Syllable.hx",
    "./src/Tools.hx"
)
builder:setComment("//")
builder:addHeader()
builder:handleMacro(true)
builder:onMacro(function(code, command)
    if command == "HEAD_BEGIN" then
        isHead = true
    elseif command == "HEAD_FINISH" then
        isHead = false
    end
end)
builder:onLine(function(line)
    if isHead then
        heads[line] = string.find(line, "Alphabets") == nil
    else
        return line
    end
end)
builder:setOutput(target)
builder:start()

local headers = ""
for k,v in pairs(heads) do
    if v then
        headers = headers .. k .. "\n"
    end
end

local content = files.read(target, "r")
files.write(target, headers, "w")
files.write(target, content, "a")

os.execute("haxe ./others/build.hxml")
