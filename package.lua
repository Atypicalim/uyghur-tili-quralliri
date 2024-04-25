-- package

-- pcall(os.execute, "git clone git@github.com:kompasim/my-build-tools.git ./my-build-tools")
package.path = package.path .. ";./pure-lua-tools/?.lua"
package.path = package.path .. ";./../pure-lua-tools/?.lua"
package.path = package.path .. ";./my-build-tools/?.lua"
package.path = package.path .. ";./../my-build-tools/?.lua"
local builder = require("builder")

-- common
local releasePath = "./release"

-- npm
local npmPath = "./packages/npm"
local function package_npm()
    files.copy(releasePath .. "/UyghurLanguageTools.js", npmPath .. "/index.js")
end
local function publish_npm()
    os.execute("npm config set registry https://registry.npmjs.org/")
    os.execute("npm login")
    os.execute("cd " .. npmPath .. " & npm publish")
    -- os.execute("cd " .. npmPath .. " & npm link") -- test
end
-- package_npm()
-- publish_npm()

-- pip
local pipPath = "./packages/pip"
local function package_pip()
    files.copy(releasePath .. "/UyghurLanguageTools.py", pipPath .. "/uyghur_language_tools/UyghurLanguageTools.py")
    os.execute("cd " .. pipPath .. " & python3 setup.py sdist")
    -- os.execute("cd " .. pipPath .. " & python3 setup.py develop") -- test
end
local function publish_pip()
    os.execute("pip install twine")
    os.execute("cd " .. pipPath .. " & twine upload --skip-existing dist/*")
end
-- package_pip()
-- publish_pip()