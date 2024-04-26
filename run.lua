-- run

-- pcall(os.execute, "git clone git@github.com:kompasim/my-build-tools.git ./my-build-tools")
package.path = package.path .. ";./pure-lua-tools/?.lua"
package.path = package.path .. ";./../pure-lua-tools/?.lua"
package.path = package.path .. ";./my-build-tools/?.lua"
package.path = package.path .. ";./../my-build-tools/?.lua"
local builder = require("builder")

-- require('./alphabets')

do
    -- os.execute("haxe ./others/run.hxml")
    -- os.execute("haxe ./others/build.hxml")
    -- return
end

local builder = builder.code {}
local target = "./UyghurLanguageTools.hx"
local heads = {}

-- merge files
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
builder:onMacro(function(code, command)
    if command == "HEAD_RAISE" then
        table.insert(heads, code)
    elseif command == "HEAD_IGNORE" then
        return nil
    end
end)
builder:setOutput(target)
builder:start()

-- prepend header
local headers = table.concat(heads, "\n")
local content = files.read(target, "r")
files.write(target, headers, "w")
files.write(target, content, "a")

-- run target
os.execute("haxe ./others/run.hxml")
