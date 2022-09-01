-- keyboard

local map = {
	[48] = "0",
	[49] = "1",
	[50] = "2",
	[51] = "3",
	[52] = "4",
	[53] = "5",
	[54] = "6",
	[55] = "7",
	[56] = "8",
	[57] = "9",

	[8] = "backspace",
	[9] = "tab",
	[32] = "space",
	[20] = "capslock",
	[145] = "scrolllock",
	[19] = "pausebreak",

	[44] = "printscreen",
	[46] = "delete",
	[45] = "insert",
	[35] = "end",
	[36] = "home",
	[33] = "pageup",
	[34] = "pagedown",
	[27] = "escape",

	[0xA0] = "lshift",
	[0xA1] = "rshift",
	[0xA2] = "lctrl",
	[0xA3] = "rctrl",
	[0xA4] = "lmenu",
	[0xA5] = "rmenu",
	[91] = "super",
	[0xBA] = ";",
	[0xBB] = "+",
	[0xBC] = ",",
	[0xBD] = "-",
	[0xBE] = ".",
	[0xBF] = "/",
	[0xC0] = "`",
	[0xDB] = "[",
	[0xDC] = "\\",
	[0xDD] = "]",
	[0xDE] = "'",

	[0x60] = "np0",
	[0x61] = "np1",
	[0x62] = "np2",
	[0x63] = "np3",
	[0x64] = "np4",
	[0x65] = "np5",
	[0x66] = "np6",
	[0x67] = "np7",
	[0x68] = "np8",
	[0x69] = "np9",
	[0x6A] = "MULTIPLY",
	[0x6B] = "ADD",
	[0x6C] = "SEPARATOR",
	[0x6D] = "SUBTRACT",
	[0x6E] = "DECIMAL",
	[0x6F] = "DIVIDE",
	[0x70] = "f1",
	[0x71] = "f2",
	[0x72] = "f3",
	[0x73] = "f4",
	[0x74] = "f5",
	[0x75] = "f6",
	[0x76] = "f7",
	[0x77] = "f8",
	[0x78] = "f9",
	[0x79] = "f10",
	[0x7A] = "f11",
	[0x7B] = "f12",
	[0x7C] = "f13",
	[0x7D] = "f14",
	[0x7E] = "f15",
	[0x7F] = "f16",
	[0x80] = "f17",
	[0x81] = "f18",
	[0x82] = "f19",
	[0x83] = "f20",
	[0x84] = "f21",
	[0x85] = "f22",
	[0x86] = "f23",
	[0x87] = "f24",
}

for i = 0x41, 0x5A do
	map[i] = string.char(i):lower()
end

-- table.print(map)

-- np8
-- Char code: 56
-- Key code: 104
-- string.byte 56
-- map.key 104


local s = io.read("*l")

print("[[" .. tostring(s) .. "]]")
print("[[" .. string.byte(s) .. "]]")
print("[[" .. string.char(string.byte(s)) .. "]]")

-- while true do
-- 	if s == "exit" then
-- 		--todo
-- 	end
-- end


