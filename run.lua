-- run

-- pcall(os.execute, "git clone git@github.com:kompasim/my-build-tools.git ./my-build-tools")
package.path = package.path .. ";./pure-lua-tools/?.lua"
package.path = package.path .. ";./../pure-lua-tools/?.lua"
package.path = package.path .. ";./my-build-tools/?.lua"
package.path = package.path .. ";./../my-build-tools/?.lua"
local builder = require("builder")


local buildDir = "./build"
local releaseDir = "./release"
local packageDir = "./packages"
local mainName = "UyghurLanguageTools"
local mainPath = buildDir .. "/" .. mainName .. ".hx"
files.mk_folder(buildDir)

local function build_tools(isRun)
    local builder = builder.code {}
    local target = mainPath
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
    -- run tool
    if isRun then
        os.execute("cd " .. buildDir .. " & haxe --main " .. mainName .. " --interp")
    end
end

local function build_alpbets()
    require('./alphabets')
end

local function build_release()
    print('\nbuild release start:')
    -- 
    local isOk, outut = tools.execute("haxe ./others/build.hxml")
    print('build main:', isOk and "OK!" or outut)
    -- 
    isOk, outut = tools.execute("cp " .. mainPath .. " release/")
    print('copy haxe:', isOk and "OK!" or outut)
    -- 
    isOk, outut = tools.execute("php ./others/phar.php")
    print('pack phar:', isOk and "OK!" or outut)
    isOk, outut = tools.execute("rm -rf release/Tools_php")
    print('dell php:', isOk and "OK!" or outut)
    -- 
    isOk, outut = tools.execute("cp release/Tools_csharp/bin/UyghurLanguageTools.dll release/")
    print('pack dll:', isOk and "OK!" or outut)
    isOk, outut = tools.execute("rm -rf release/Tools_csharp")
    print('dell csharp:', isOk and "OK!" or outut)
    -- 
    print('build release end!\n')
end

local function build_npm(isPublish)
    -- npm
    local npmPath = packageDir .. "/npm"
    local function package_npm()
        files.copy(releaseDir .. "/UyghurLanguageTools.js", npmPath .. "/index.js")
    end
    local function publish_npm()
        os.execute("npm config set registry https://registry.npmjs.org/")
        os.execute("npm login")
        os.execute("cd " .. npmPath .. " & npm publish")
        -- os.execute("cd " .. npmPath .. " & npm link") -- test
    end
    package_npm()
    if isPublish then
        publish_npm()
    end
end

local function build_pip(isPublish)
    local pipPath = packageDir .. "/pip"
    local function package_pip()
        files.copy(releaseDir .. "/UyghurLanguageTools.py", pipPath .. "/uyghur_language_tools/UyghurLanguageTools.py")
        os.execute("cd " .. pipPath .. " & python3 setup.py sdist")
        -- os.execute("cd " .. pipPath .. " & python3 setup.py develop") -- test
    end
    local function publish_pip()
        os.execute("pip install twine")
        os.execute("cd " .. pipPath .. " & twine upload --skip-existing dist/*")
    end
    package_pip()
    if isPublish then
        publish_pip()
    end
end

-- run target

-- build_alpbets()
build_tools(true)
build_release()
-- build_npm(true)
-- build_pip(false)
