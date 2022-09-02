-- run

-- pcall(os.execute, "git clone git@github.com:kompasim/my-build-tools.git ./my-build-tools")
package.path = package.path .. ";./my-build-tools/?.lua"
require "./pure-lua-tools/test"

-- os.execute("haxe ./keyboard.hxml")
require('build')


