(function ($hx_exports, $global) { "use strict";
var $estr = function() { return js_Boot.__string_rec(this,''); },$hxEnums = $hxEnums || {},$_;
function $extend(from, fields) {
	var proto = Object.create(from);
	for (var name in fields) proto[name] = fields[name];
	if( fields.toString !== Object.prototype.toString ) proto.toString = fields.toString;
	return proto;
}
var HxOverrides = function() { };
HxOverrides.__name__ = true;
HxOverrides.cca = function(s,index) {
	var x = s.charCodeAt(index);
	if(x != x) {
		return undefined;
	}
	return x;
};
HxOverrides.substr = function(s,pos,len) {
	if(len == null) {
		len = s.length;
	} else if(len < 0) {
		if(pos == 0) {
			len = s.length + len;
		} else {
			return "";
		}
	}
	return s.substr(pos,len);
};
HxOverrides.now = function() {
	return Date.now();
};
Math.__name__ = true;
var Reflect = function() { };
Reflect.__name__ = true;
Reflect.field = function(o,field) {
	try {
		return o[field];
	} catch( _g ) {
		return null;
	}
};
Reflect.isFunction = function(f) {
	if(typeof(f) == "function") {
		return !(f.__name__ || f.__ename__);
	} else {
		return false;
	}
};
Reflect.compare = function(a,b) {
	if(a == b) {
		return 0;
	} else if(a > b) {
		return 1;
	} else {
		return -1;
	}
};
Reflect.isEnumValue = function(v) {
	if(v != null) {
		return v.__enum__ != null;
	} else {
		return false;
	}
};
var Std = function() { };
Std.__name__ = true;
Std.string = function(s) {
	return js_Boot.__string_rec(s,"");
};
Std.parseInt = function(x) {
	if(x != null) {
		var _g = 0;
		var _g1 = x.length;
		while(_g < _g1) {
			var i = _g++;
			var c = x.charCodeAt(i);
			if(c <= 8 || c >= 14 && c != 32 && c != 45) {
				var nc = x.charCodeAt(i + 1);
				var v = parseInt(x,nc == 120 || nc == 88 ? 16 : 10);
				if(isNaN(v)) {
					return null;
				} else {
					return v;
				}
			}
		}
	}
	return null;
};
var StringBuf = function() {
	this.b = "";
};
StringBuf.__name__ = true;
StringBuf.prototype = {
	toString: function() {
		return this.b;
	}
	,__class__: StringBuf
};
var StringTools = function() { };
StringTools.__name__ = true;
StringTools.startsWith = function(s,start) {
	if(s.length >= start.length) {
		return s.lastIndexOf(start,0) == 0;
	} else {
		return false;
	}
};
StringTools.endsWith = function(s,end) {
	var elen = end.length;
	var slen = s.length;
	if(slen >= elen) {
		return s.indexOf(end,slen - elen) == slen - elen;
	} else {
		return false;
	}
};
StringTools.isSpace = function(s,pos) {
	var c = HxOverrides.cca(s,pos);
	if(!(c > 8 && c < 14)) {
		return c == 32;
	} else {
		return true;
	}
};
StringTools.ltrim = function(s) {
	var l = s.length;
	var r = 0;
	while(r < l && StringTools.isSpace(s,r)) ++r;
	if(r > 0) {
		return HxOverrides.substr(s,r,l - r);
	} else {
		return s;
	}
};
StringTools.rtrim = function(s) {
	var l = s.length;
	var r = 0;
	while(r < l && StringTools.isSpace(s,l - r - 1)) ++r;
	if(r > 0) {
		return HxOverrides.substr(s,0,l - r);
	} else {
		return s;
	}
};
StringTools.trim = function(s) {
	return StringTools.ltrim(StringTools.rtrim(s));
};
StringTools.lpad = function(s,c,l) {
	if(c.length <= 0) {
		return s;
	}
	var buf_b = "";
	l -= s.length;
	while(buf_b.length < l) buf_b += c == null ? "null" : "" + c;
	buf_b += s == null ? "null" : "" + s;
	return buf_b;
};
StringTools.replace = function(s,sub,by) {
	return s.split(sub).join(by);
};
var Type = function() { };
Type.__name__ = true;
Type.createEnum = function(e,constr,params) {
	var f = Reflect.field(e,constr);
	if(f == null) {
		throw haxe_Exception.thrown("No such constructor " + constr);
	}
	if(Reflect.isFunction(f)) {
		if(params == null) {
			throw haxe_Exception.thrown("Constructor " + constr + " need parameters");
		}
		return f.apply(e,params);
	}
	if(params != null && params.length != 0) {
		throw haxe_Exception.thrown("Constructor " + constr + " does not need parameters");
	}
	return f;
};
Type.enumParameters = function(e) {
	var enm = $hxEnums[e.__enum__];
	var params = enm.__constructs__[e._hx_index].__params__;
	if(params != null) {
		var _g = [];
		var _g1 = 0;
		while(_g1 < params.length) {
			var p = params[_g1];
			++_g1;
			_g.push(e[p]);
		}
		return _g;
	} else {
		return [];
	}
};
var LANG_$KEYS = $hxEnums["LANG_KEYS"] = { __ename__:true,__constructs__:null
	,common: {_hx_name:"common",_hx_index:0,__enum__:"LANG_KEYS",toString:$estr}
	,arabic: {_hx_name:"arabic",_hx_index:1,__enum__:"LANG_KEYS",toString:$estr}
	,cyrillic: {_hx_name:"cyrillic",_hx_index:2,__enum__:"LANG_KEYS",toString:$estr}
	,newly: {_hx_name:"newly",_hx_index:3,__enum__:"LANG_KEYS",toString:$estr}
	,latin: {_hx_name:"latin",_hx_index:4,__enum__:"LANG_KEYS",toString:$estr}
};
LANG_$KEYS.__constructs__ = [LANG_$KEYS.common,LANG_$KEYS.arabic,LANG_$KEYS.cyrillic,LANG_$KEYS.newly,LANG_$KEYS.latin];
var TYPES = $hxEnums["TYPES"] = { __ename__:true,__constructs__:null
	,MARKS: {_hx_name:"MARKS",_hx_index:0,__enum__:"TYPES",toString:$estr}
	,COMPOUNDS: {_hx_name:"COMPOUNDS",_hx_index:1,__enum__:"TYPES",toString:$estr}
	,VOWELS: {_hx_name:"VOWELS",_hx_index:2,__enum__:"TYPES",toString:$estr}
	,CONSONANTS: {_hx_name:"CONSONANTS",_hx_index:3,__enum__:"TYPES",toString:$estr}
};
TYPES.__constructs__ = [TYPES.MARKS,TYPES.COMPOUNDS,TYPES.VOWELS,TYPES.CONSONANTS];
var NAMES = $hxEnums["NAMES"] = { __ename__:true,__constructs__:null
	,HEMZE: {_hx_name:"HEMZE",_hx_index:0,__enum__:"NAMES",toString:$estr}
	,COMMA: {_hx_name:"COMMA",_hx_index:1,__enum__:"NAMES",toString:$estr}
	,EXCLA: {_hx_name:"EXCLA",_hx_index:2,__enum__:"NAMES",toString:$estr}
	,QUESS: {_hx_name:"QUESS",_hx_index:3,__enum__:"NAMES",toString:$estr}
	,COLON: {_hx_name:"COLON",_hx_index:4,__enum__:"NAMES",toString:$estr}
	,A: {_hx_name:"A",_hx_index:5,__enum__:"NAMES",toString:$estr}
	,AE: {_hx_name:"AE",_hx_index:6,__enum__:"NAMES",toString:$estr}
	,O: {_hx_name:"O",_hx_index:7,__enum__:"NAMES",toString:$estr}
	,U: {_hx_name:"U",_hx_index:8,__enum__:"NAMES",toString:$estr}
	,OO: {_hx_name:"OO",_hx_index:9,__enum__:"NAMES",toString:$estr}
	,UU: {_hx_name:"UU",_hx_index:10,__enum__:"NAMES",toString:$estr}
	,I: {_hx_name:"I",_hx_index:11,__enum__:"NAMES",toString:$estr}
	,E: {_hx_name:"E",_hx_index:12,__enum__:"NAMES",toString:$estr}
	,B: {_hx_name:"B",_hx_index:13,__enum__:"NAMES",toString:$estr}
	,P: {_hx_name:"P",_hx_index:14,__enum__:"NAMES",toString:$estr}
	,T: {_hx_name:"T",_hx_index:15,__enum__:"NAMES",toString:$estr}
	,DJ: {_hx_name:"DJ",_hx_index:16,__enum__:"NAMES",toString:$estr}
	,CH: {_hx_name:"CH",_hx_index:17,__enum__:"NAMES",toString:$estr}
	,X: {_hx_name:"X",_hx_index:18,__enum__:"NAMES",toString:$estr}
	,D: {_hx_name:"D",_hx_index:19,__enum__:"NAMES",toString:$estr}
	,R: {_hx_name:"R",_hx_index:20,__enum__:"NAMES",toString:$estr}
	,Z: {_hx_name:"Z",_hx_index:21,__enum__:"NAMES",toString:$estr}
	,J: {_hx_name:"J",_hx_index:22,__enum__:"NAMES",toString:$estr}
	,S: {_hx_name:"S",_hx_index:23,__enum__:"NAMES",toString:$estr}
	,SH: {_hx_name:"SH",_hx_index:24,__enum__:"NAMES",toString:$estr}
	,GH: {_hx_name:"GH",_hx_index:25,__enum__:"NAMES",toString:$estr}
	,F: {_hx_name:"F",_hx_index:26,__enum__:"NAMES",toString:$estr}
	,Q: {_hx_name:"Q",_hx_index:27,__enum__:"NAMES",toString:$estr}
	,K: {_hx_name:"K",_hx_index:28,__enum__:"NAMES",toString:$estr}
	,G: {_hx_name:"G",_hx_index:29,__enum__:"NAMES",toString:$estr}
	,NG: {_hx_name:"NG",_hx_index:30,__enum__:"NAMES",toString:$estr}
	,L: {_hx_name:"L",_hx_index:31,__enum__:"NAMES",toString:$estr}
	,M: {_hx_name:"M",_hx_index:32,__enum__:"NAMES",toString:$estr}
	,N: {_hx_name:"N",_hx_index:33,__enum__:"NAMES",toString:$estr}
	,H: {_hx_name:"H",_hx_index:34,__enum__:"NAMES",toString:$estr}
	,V: {_hx_name:"V",_hx_index:35,__enum__:"NAMES",toString:$estr}
	,Y: {_hx_name:"Y",_hx_index:36,__enum__:"NAMES",toString:$estr}
	,YU: {_hx_name:"YU",_hx_index:37,__enum__:"NAMES",toString:$estr}
	,YA: {_hx_name:"YA",_hx_index:38,__enum__:"NAMES",toString:$estr}
};
NAMES.__constructs__ = [NAMES.HEMZE,NAMES.COMMA,NAMES.EXCLA,NAMES.QUESS,NAMES.COLON,NAMES.A,NAMES.AE,NAMES.O,NAMES.U,NAMES.OO,NAMES.UU,NAMES.I,NAMES.E,NAMES.B,NAMES.P,NAMES.T,NAMES.DJ,NAMES.CH,NAMES.X,NAMES.D,NAMES.R,NAMES.Z,NAMES.J,NAMES.S,NAMES.SH,NAMES.GH,NAMES.F,NAMES.Q,NAMES.K,NAMES.G,NAMES.NG,NAMES.L,NAMES.M,NAMES.N,NAMES.H,NAMES.V,NAMES.Y,NAMES.YU,NAMES.YA];
var Alphabets = function() { };
Alphabets.__name__ = true;
Alphabets.replaceAllSpecials = function(text,replacement) {
	if(text.length == 0) {
		return text;
	}
	var buf_b = "";
	var idx = 0;
	while(idx < text.length) {
		var ch = HxOverrides.substr(text,idx,1);
		buf_b += Std.string(Alphabets.SPECIALS_LIST.indexOf(ch) >= 0 ? " " : ch);
		++idx;
	}
	return buf_b;
};
Alphabets.mergeAllSpace = function(text) {
	text = StringTools.trim(text);
	if(text.length == 0) {
		return text;
	}
	var buf_b = "";
	var idx = 0;
	var isSpace = false;
	while(idx < text.length) {
		var ch = HxOverrides.substr(text,idx,1);
		if(!isSpace || ch != " ") {
			buf_b += ch == null ? "null" : "" + ch;
		}
		isSpace = ch == " ";
		++idx;
	}
	return buf_b;
};
Alphabets.splitByDelimiter = function(text,delimiter) {
	if(delimiter == null) {
		delimiter = " ";
	}
	var arr = [];
	var buf = new StringBuf();
	var idx = 0;
	text = Alphabets.mergeAllSpace(text);
	if(text.length == 0) {
		return arr;
	}
	while(idx < text.length) {
		var ch = HxOverrides.substr(text,idx,1);
		if(ch == delimiter) {
			arr.push(buf.b);
			buf = new StringBuf();
		} else {
			buf.b += ch == null ? "null" : "" + ch;
		}
		++idx;
	}
	arr.push(buf.b);
	return arr;
};
var Converter = function(from,to) {
	this.chNext = null;
	this.chCurr = null;
	this.chLast = null;
	this.lastAlpha = null;
	this.result = new StringBuf();
	this.index = 0;
	this.text = null;
	this.toIdx = -1;
	this.fromIdx = -1;
	this.from = from;
	this.to = to;
	this.fromIdx = Alphabets.INDEX_MAP.get(this.from);
	this.toIdx = Alphabets.INDEX_MAP.get(this.to);
	if(this.fromIdx < 0 || this.toIdx < 0) {
		throw haxe_Exception.thrown("key not supported for this language");
	}
};
Converter.__name__ = true;
Converter.work = function(from,to,text) {
	var fromLang = Type.createEnum(LANG_$KEYS,from,null);
	var toLang = Type.createEnum(LANG_$KEYS,to,null);
	var converter = new Converter(fromLang,toLang);
	var result = converter.convert(text);
	return result;
};
Converter.prototype = {
	pushString: function(str) {
		this.lastAlpha = null;
		this.result.b += str == null ? "null" : "" + str;
	}
	,pushName: function(name) {
		var conf = Alphabets.ALPHABETS.get(name);
		var idx = Alphabets.INDEX_MAP.get(this.to);
		var str = conf.alpha[idx];
		if(this.to == LANG_$KEYS.arabic && conf.tp == TYPES.VOWELS && (this.lastAlpha == null || this.lastAlpha.tp == TYPES.VOWELS)) {
			var _this = this.result;
			var x = Alphabets.ALPHABETS.get(NAMES.HEMZE).alpha[this.toIdx];
			_this.b += Std.string(x);
		}
		this.lastAlpha = conf;
		this.result.b += str == null ? "null" : "" + str;
	}
	,move: function(indent) {
		this.index += indent;
		this.index = js_Boot.__cast(Math.max(Math.min(this.index,this.text.length - 1),0) , Int);
	}
	,isFinished: function() {
		return this.index == this.text.length - 1;
	}
	,getChar: function(indent) {
		if(indent == null) {
			indent = 0;
		}
		var ch = this.text.charAt(this.index + indent);
		if(ch == null || ch == "") {
			return null;
		}
		return ch;
	}
	,getAlphabet: function(ch) {
		var conf = Alphabets.ALPHABETS.iterator();
		while(conf.hasNext()) {
			var conf1 = conf.next();
			var idx = Alphabets.INDEX_MAP.get(this.from);
			if(conf1.alpha[idx] == ch) {
				return conf1;
			}
		}
		return null;
	}
	,handleUyghur: function() {
		if(this.from == LANG_$KEYS.latin) {
			if(this.chNext == "h") {
				if(this.chCurr == "c") {
					this.pushName(NAMES.CH);
					this.move(1);
					return;
				} else if(this.chCurr == "g") {
					this.pushName(NAMES.GH);
					this.move(1);
					return;
				} else if(this.chCurr == "s") {
					var chLastLast = this.getChar(-2);
					var alphaLastLast = this.getAlphabet(chLastLast);
					if(this.chLast == "i" && alphaLastLast == null) {
						this.pushName(NAMES.S);
						return;
					}
					this.pushName(NAMES.SH);
					this.move(1);
					return;
				} else if(this.chCurr == "z") {
					this.pushName(NAMES.J);
					this.move(1);
					return;
				}
			} else if(this.chNext == "g") {
				if(this.chCurr == "n") {
					var chNextNext = this.getChar(2);
					var chLastLast = this.getChar(-2);
					var alphaNextNext = this.getAlphabet(chNextNext);
					var alphaLastLast = this.getAlphabet(chLastLast);
					if(chNextNext == "h") {
						this.pushName(NAMES.N);
						return;
					} else if(chNextNext == chLastLast || alphaNextNext.tp == TYPES.CONSONANTS) {
						this.pushName(NAMES.NG);
						this.move(1);
						return;
					}
					this.pushName(NAMES.N);
					return;
				}
			}
		} else if(this.from == LANG_$KEYS.arabic) {
			if(this.chCurr == "ئ") {
				if(this.chLast == null || StringTools.isSpace(this.chLast,0)) {
					return;
				}
			}
		}
		var alpha = this.getAlphabet(this.chCurr);
		if(alpha != null) {
			this.pushName(alpha.nm);
		} else {
			this.pushString(this.chCurr);
		}
	}
	,process: function() {
		this.chLast = this.getChar(-1);
		this.chCurr = this.getChar(0);
		this.chNext = this.getChar(1);
		this.handleUyghur();
		if(!this.isFinished()) {
			this.move(1);
			this.process();
		}
	}
	,convert: function(text) {
		this.text = text;
		this.index = 0;
		this.result = new StringBuf();
		this.lastAlpha = null;
		this.process();
		return this.result.b;
	}
	,__class__: Converter
};
var Keyboard = function() { };
Keyboard.__name__ = true;
Keyboard.toAlphabet = function(alphabet,isSHiftPressed) {
	if(alphabet.length != 1) {
		return null;
	}
	var index = isSHiftPressed ? 2 : 1;
	var map = UyghurLanguageTools_KEYCODES;
	var _g_map = map;
	var _g_keys = map.keys();
	while(_g_keys.hasNext()) {
		var key = _g_keys.next();
		var _g1_value = _g_map.get(key);
		var _g1_key = key;
		var _ = _g1_key;
		var values = _g1_value;
		if(values[index] != alphabet) {
			continue;
		}
		return values[0];
	}
	return null;
};
Keyboard.fromAlphabet = function(alphabet,isSHiftPressed) {
	if(alphabet.length != 1) {
		return null;
	}
	var index = isSHiftPressed ? 2 : 1;
	var map = UyghurLanguageTools_KEYCODES;
	var _g_map = map;
	var _g_keys = map.keys();
	while(_g_keys.hasNext()) {
		var key = _g_keys.next();
		var _g1_value = _g_map.get(key);
		var _g1_key = key;
		var _ = _g1_key;
		var values = _g1_value;
		if(values[0] != alphabet) {
			continue;
		}
		return values[index];
	}
	return null;
};
var Numbers = function() { };
Numbers.__name__ = true;
Numbers.getNumName = function(num) {
	if(num == 0) {
		return "";
	} else {
		return Numbers.NAMES_1[num - 1];
	}
};
Numbers.getTenTimes = function(num) {
	if(num == 0) {
		return "";
	} else {
		return Numbers.NAMES_10[num - 1];
	}
};
Numbers.getHundredTimes = function(text,num) {
	if(text.length == 0) {
		return text;
	} else {
		return text + " " + Numbers.HUNDRED;
	}
};
Numbers.getHighTimes = function(text,times) {
	if(!Numbers.valid) {
		return text;
	} else {
		return text + " " + Numbers.NAMES_N[times];
	}
};
Numbers.appendNumTimes = function(times,num,text) {
	switch(times) {
	case 2:
		return Numbers.getTenTimes(num);
	case 3:
		return Numbers.getHundredTimes(text,num);
	case 4:
		return Numbers.getHighTimes(text,0);
	case 5:
		return Numbers.getTenTimes(num);
	case 6:
		return Numbers.getHundredTimes(text,num);
	case 7:
		return Numbers.getHighTimes(text,1);
	case 8:
		return Numbers.getTenTimes(num);
	case 9:
		return Numbers.getHundredTimes(text,num);
	case 10:
		return Numbers.getHighTimes(text,2);
	case 11:
		return Numbers.getTenTimes(num);
	case 12:
		return Numbers.getHundredTimes(text,num);
	case 13:
		return Numbers.getHighTimes(text,3);
	case 14:
		return Numbers.getTenTimes(num);
	case 15:
		return Numbers.getHundredTimes(text,num);
	case 16:
		return Numbers.getHighTimes(text,5);
	case 17:
		return Numbers.getTenTimes(num);
	case 18:
		return Numbers.getHundredTimes(text,num);
	default:
		return text;
	}
};
Numbers.processRead = function(num) {
	if(num <= 0) {
		return Numbers.ZERO;
	}
	var result = [];
	var times = 0;
	while(num > 0) {
		++times;
		var n = num % 10;
		var t = num % 1000;
		var s = Numbers.getNumName(n);
		Numbers.valid = t > 0;
		s = Numbers.appendNumTimes(times,n,s);
		if(s.length > 0) {
			var x = StringTools.trim(s);
			result.splice(0,0,x);
		}
		num = (num - n) / 10 | 0;
	}
	return result.join(" ");
};
Numbers.appendFloatSuffix = function(text) {
	if(StringTools.endsWith(text,Numbers.TEN)) {
		text += Numbers.TEN_SUFFIX;
	} else if(StringTools.endsWith(text,Numbers.HUNDRED)) {
		text += Numbers.HUNDRED_SUFFIX;
	}
	var _g_current = 0;
	var _g_array = Numbers.NAMES_N;
	while(_g_current < _g_array.length) {
		var _g1_value = _g_array[_g_current];
		var _g1_key = _g_current++;
		var k = _g1_key;
		var v = _g1_value;
		if(StringTools.endsWith(text,v)) {
			text += Numbers.NAMES_N_SUFFIX[k];
		}
	}
	if(StringTools.startsWith(text,Numbers.NAMES_1[0])) {
		text = StringTools.replace(text,Numbers.NAMES_1[0],"");
	}
	return StringTools.trim(text);
};
Numbers.read = function(text) {
	text = StringTools.trim(text);
	var num = parseFloat(text);
	var str = num == null ? "null" : "" + num;
	if(str == "nan") {
		return "";
	}
	var nums = Alphabets.splitByDelimiter(num == null ? "null" : "" + num,".");
	if(nums.length == 1) {
		var num1 = Std.parseInt(nums[0]);
		return Numbers.processRead(num1);
	} else {
		var num1 = Std.parseInt(nums[0]);
		var num2 = Std.parseInt(nums[1]);
		var numx = Math.pow(10,nums[1].length) | 0;
		var text1 = Numbers.processRead(num1);
		var text2 = Numbers.processRead(num2);
		var textX = Numbers.processRead(numx);
		return text1 + " " + Numbers.COMPLETE + " " + Numbers.appendFloatSuffix(textX) + " " + text2;
	}
};
Numbers.processWrite = function(words) {
	var result = 0;
	var length = words.length;
	var power = 1;
	var times = 1;
	if(length == 0) {
		return "";
	}
	while(length > 0) {
		--length;
		var word = words[length];
		var isPower = false;
		var _g_current = 0;
		var _g_array = Numbers.NAMES_N;
		while(_g_current < _g_array.length) {
			var _g1_value = _g_array[_g_current];
			var _g1_key = _g_current++;
			var k = _g1_key;
			var v = _g1_value;
			if(v == word) {
				power = Math.pow(10,(k + 1) * 3) | 0;
				times = 1;
				isPower = true;
				break;
			}
		}
		if(isPower) {
			continue;
		}
		if(word == Numbers.HUNDRED) {
			times = 100;
			continue;
		}
		var num = 0;
		var _g_current1 = 0;
		var _g_array1 = Numbers.NAMES_1;
		while(_g_current1 < _g_array1.length) {
			var _g1_value1 = _g_array1[_g_current1];
			var _g1_key1 = _g_current1++;
			var k1 = _g1_key1;
			var v1 = _g1_value1;
			if(v1 == word) {
				num = k1 + 1;
			}
		}
		var _g_current2 = 0;
		var _g_array2 = Numbers.NAMES_10;
		while(_g_current2 < _g_array2.length) {
			var _g1_value2 = _g_array2[_g_current2];
			var _g1_key2 = _g_current2++;
			var k2 = _g1_key2;
			var v2 = _g1_value2;
			if(v2 == word) {
				num = k2 + 1;
				times = 10;
			}
		}
		result += num * power * times | 0;
	}
	if(result == null) {
		return "null";
	} else {
		return "" + result;
	}
};
Numbers.write = function(text) {
	var words = Alphabets.splitByDelimiter(text," ");
	var dotIndex = -1;
	var _g_current = 0;
	var _g_array = words;
	while(_g_current < _g_array.length) {
		var _g1_value = _g_array[_g_current];
		var _g1_key = _g_current++;
		var k = _g1_key;
		var v = _g1_value;
		if(v == Numbers.COMPLETE) {
			dotIndex = k;
			break;
		}
	}
	var endIndex = dotIndex + 1;
	var parseWord = words[dotIndex + 1];
	var power = 0;
	if(StringTools.startsWith(parseWord,Numbers.NAMES_10[0])) {
		power = 1;
		if(!StringTools.endsWith(parseWord,Numbers.NAMES_N_SUFFIX[0])) {
			endIndex = dotIndex + 1 + 1;
			parseWord = words[endIndex];
		}
	} else if(StringTools.startsWith(parseWord,Numbers.HUNDRED)) {
		power = 2;
		if(!StringTools.endsWith(parseWord,Numbers.HUNDRED_SUFFIX)) {
			endIndex = dotIndex + 1 + 1;
			parseWord = words[endIndex];
		}
	}
	if(power == 0 || endIndex > dotIndex + 1) {
		var _g_current = 0;
		var _g_array = Numbers.NAMES_N;
		while(_g_current < _g_array.length) {
			var _g1_value = _g_array[_g_current];
			var _g1_key = _g_current++;
			var k = _g1_key;
			var v = _g1_value;
			if(StringTools.startsWith(parseWord,v)) {
				power += (k + 1) * 3 | 0;
			}
		}
	}
	if(dotIndex < 0 || power < 1) {
		return Numbers.processWrite(words);
	} else {
		var left = Numbers.processWrite(words.slice(0,dotIndex));
		var right = Numbers.processWrite(words.slice(endIndex + 1,words.length));
		var temp = StringTools.lpad(right,"0",power);
		return left + "." + temp;
	}
};
var UyHarp = $hxEnums["UyHarp"] = { __ename__:true,__constructs__:null
	,BASH: {_hx_name:"BASH",_hx_index:0,__enum__:"UyHarp",toString:$estr}
	,YALGHUZ: {_hx_name:"YALGHUZ",_hx_index:1,__enum__:"UyHarp",toString:$estr}
	,OTTURA: {_hx_name:"OTTURA",_hx_index:2,__enum__:"UyHarp",toString:$estr}
	,AHIR: {_hx_name:"AHIR",_hx_index:3,__enum__:"UyHarp",toString:$estr}
};
UyHarp.__constructs__ = [UyHarp.BASH,UyHarp.YALGHUZ,UyHarp.OTTURA,UyHarp.AHIR];
var _$UyghurLanguageTools_LA_$Class = function(base1,base2,ex) {
	this.ex = null;
	this.base2 = null;
	this.base1 = null;
	this.base1 = base1;
	this.base2 = base2;
	this.ex = ex;
};
_$UyghurLanguageTools_LA_$Class.__name__ = true;
_$UyghurLanguageTools_LA_$Class.prototype = {
	__class__: _$UyghurLanguageTools_LA_$Class
};
var Reshaper = function() {
};
Reshaper.__name__ = true;
Reshaper.toExt = function(text) {
	return new Reshaper().toExttended(text);
};
Reshaper.toBase = function(text) {
	return new Reshaper().toBasical(text);
};
Reshaper.prototype = {
	containsInArray: function(arr,s) {
		var _g_current = 0;
		var _g_array = arr;
		while(_g_current < _g_array.length) {
			var _g1_value = _g_array[_g_current];
			var _g1_key = _g_current++;
			var key = _g1_key;
			var val = _g1_value;
			if(val == s) {
				return key;
			}
		}
		return -1;
	}
	,stringToArray: function(str) {
		var arr = [];
		var _g = 0;
		var _g1 = str.length;
		while(_g < _g1) {
			var key = _g++;
			arr.push(HxOverrides.substr(str,key,1));
		}
		return arr;
	}
	,stringToMap: function(str) {
		var arr = new haxe_ds_IntMap();
		var _g = 0;
		var _g1 = str.length;
		while(_g < _g1) {
			var key = _g++;
			var v = HxOverrides.substr(str,key,1);
			arr.h[key] = v;
		}
		return arr;
	}
	,arrayToString: function(arr) {
		var res_b = "";
		var _g_current = 0;
		var _g_array = arr;
		while(_g_current < _g_array.length) {
			var _g1_value = _g_array[_g_current];
			var _g1_key = _g_current++;
			var key = _g1_key;
			var val = _g1_value;
			res_b += val == null ? "null" : "" + val;
		}
		return res_b;
	}
	,ProLA_HAMZE: function(aWord) {
		var arr = this.stringToArray(aWord);
		var map = this.stringToMap(aWord);
		var result = [];
		var skipNext = false;
		var _g_current = 0;
		var _g_array = arr;
		while(_g_current < _g_array.length) {
			var _g1_value = _g_array[_g_current];
			var _g1_key = _g_current++;
			var i = _g1_key;
			var v = _g1_value;
			if(i == arr.length - 1) {
				continue;
			} else if(skipNext) {
				skipNext = false;
				continue;
			} else if(map.h[i] == UyghurLanguageTools_la1.base2 && map.h[i + 1] == UyghurLanguageTools_la1.base1) {
				result.push(UyghurLanguageTools_la1.ex);
				skipNext = true;
			} else if(map.h[i] == UyghurLanguageTools_la2.base2 && map.h[i + 1] == UyghurLanguageTools_la2.base1) {
				result.push(UyghurLanguageTools_la2.ex);
				skipNext = true;
			} else {
				result.push(map.h[i]);
			}
		}
		if(aWord.length < 2) {
			result.push(aWord);
		} else if(!(map.h[arr.length - 2] == UyghurLanguageTools_la1.base1 && map.h[arr.length - 1] == UyghurLanguageTools_la1.base2)) {
			if(!(map.h[arr.length - 2] == UyghurLanguageTools_la2.base1 && map.h[arr.length - 1] == UyghurLanguageTools_la2.base2)) {
				result.push(map.h[arr.length - 1]);
			}
		}
		return this.arrayToString(result);
	}
	,getExChar: function(character,alphabet) {
		var index = this.containsInArray(UyghurLanguageTools_ALPHABET_BASE,character);
		if(index > -1) {
			if(alphabet == UyHarp.BASH) {
				return UyghurLanguageTools_ALPHABET_EXT_BEGIN[index];
			} else if(alphabet == UyHarp.OTTURA) {
				return UyghurLanguageTools_ALPHABET_EXT_MIDDLE[index];
			} else if(alphabet == UyHarp.AHIR) {
				return UyghurLanguageTools_ALPHABET_EXT_END[index];
			} else if(alphabet == UyHarp.YALGHUZ) {
				return UyghurLanguageTools_ALPHABET_EXT_SINGLE[index];
			}
		}
		return character;
	}
	,toExttended: function(text) {
		if(text.length == 0) {
			return "";
		}
		var array = this.stringToArray(text);
		var map = this.stringToMap(text);
		var result = [];
		if(text.length == 1) {
			var index = this.containsInArray(UyghurLanguageTools_ALPHABET_BASE,text);
			if(index == -1) {
				return "";
			} else {
				return UyghurLanguageTools_ALPHABET_EXT_SINGLE[index];
			}
		}
		if(text.length == 2) {
			var char1 = map.h[1];
			var char2 = map.h[2];
			if(this.containsInArray(UyghurLanguageTools_ALPHABET_FRIENDLY,char1) > -1) {
				var char1Ext = this.getExChar(char1,UyHarp.BASH);
				var char2Ext = this.getExChar(char2,UyHarp.AHIR);
				return char1Ext + char2Ext;
			}
		}
		var firstChar = map.h[0];
		var firstCharExt = this.getExChar(firstChar,UyHarp.BASH);
		result.push(firstCharExt);
		var _g_current = 0;
		var _g_array = array;
		while(_g_current < _g_array.length) {
			var _g1_value = _g_array[_g_current];
			var _g1_key = _g_current++;
			var i = _g1_key;
			var v = _g1_value;
			if(i == 0 || i == array.length - 1) {
				continue;
			}
			var lastChar = map.h[i - 1];
			var currentChar = map.h[i];
			var nextChar = map.h[i + 1];
			var lastCharIndex = this.containsInArray(UyghurLanguageTools_ALPHABET_BASE,lastChar);
			var currentIndex = this.containsInArray(UyghurLanguageTools_ALPHABET_BASE,currentChar);
			var nextIndex = this.containsInArray(UyghurLanguageTools_ALPHABET_BASE,nextChar);
			var currentCharExt = null;
			if(currentIndex == -1) {
				currentCharExt = currentChar;
			} else if(this.containsInArray(UyghurLanguageTools_ALPHABET_FRIENDLY,lastChar) > -1) {
				if(nextIndex > -1) {
					currentCharExt = this.getExChar(currentChar,UyHarp.OTTURA);
				} else {
					currentCharExt = this.getExChar(currentChar,UyHarp.AHIR);
				}
			} else if(nextIndex > -1) {
				currentCharExt = this.getExChar(currentChar,UyHarp.BASH);
			} else {
				currentCharExt = this.getExChar(currentChar,UyHarp.YALGHUZ);
			}
			result.push(currentCharExt);
		}
		var solKolExt = null;
		if(this.containsInArray(UyghurLanguageTools_ALPHABET_FRIENDLY,map.h[array.length - 2]) > -1) {
			solKolExt = this.getExChar(map.h[array.length - 1],UyHarp.AHIR);
		} else {
			solKolExt = this.getExChar(map.h[array.length - 1],UyHarp.YALGHUZ);
		}
		result.push(solKolExt);
		result.reverse();
		var str = this.arrayToString(result);
		return this.ProLA_HAMZE(str);
	}
	,toBasical: function(text) {
		if(text.length == 0) {
			return "";
		}
		var h = UyghurLanguageTools_REPLACE_MAP.h;
		var _g_h = h;
		var _g_keys = Object.keys(h);
		var _g_length = _g_keys.length;
		var _g_current = 0;
		while(_g_current < _g_length) {
			var key = _g_keys[_g_current++];
			var _g1_key = key;
			var _g1_value = _g_h[key];
			var key1 = _g1_key;
			var val = _g1_value;
			text = StringTools.replace(text,key1,val);
		}
		var array = this.stringToArray(text);
		var map = this.stringToMap(text);
		var result = [];
		var _g_current = 0;
		var _g_array = array;
		while(_g_current < _g_array.length) {
			var _g1_value = _g_array[_g_current];
			var _g1_key = _g_current++;
			var i = _g1_key;
			var v = _g1_value;
			var base = map.h[i];
			var _g2_current = 0;
			var _g2_array = UyghurLanguageTools_ALPHABET_BASE;
			while(_g2_current < _g2_array.length) {
				var _g3_value = _g2_array[_g2_current];
				var _g3_key = _g2_current++;
				var j = _g3_key;
				var w = _g3_value;
				var isA = UyghurLanguageTools_ALPHABET_EXT_END[j] == map.h[i];
				var isB = UyghurLanguageTools_ALPHABET_EXT_BEGIN[j] == map.h[i];
				var isO = UyghurLanguageTools_ALPHABET_EXT_MIDDLE[j] == map.h[i];
				var isY = UyghurLanguageTools_ALPHABET_EXT_SINGLE[j] == map.h[i];
				if(isA || isB || isO || isY) {
					base = UyghurLanguageTools_ALPHABET_BASE[j];
					break;
				}
			}
			result.push(base);
		}
		result.reverse();
		return this.arrayToString(result);
	}
	,__class__: Reshaper
};
var Syllable = function() {
	this.alphaNext = null;
	this.alphaCurr = null;
	this.alphaLast = null;
	this.chNextNext = null;
	this.chNext = null;
	this.chCurr = null;
	this.chLast = null;
	this.chLastLast = null;
	this.index = 0;
	this.text = "";
	this.blocks = [];
};
Syllable.__name__ = true;
Syllable.parse = function(text) {
	text = Alphabets.replaceAllSpecials(text," ");
	var words = Alphabets.splitByDelimiter(text);
	var r_b = "";
	var _g = 0;
	while(_g < words.length) {
		var word = words[_g];
		++_g;
		var syllable = new Syllable();
		var temp = syllable.convert(word);
		if(r_b.length != 0) {
			r_b += " | ";
		}
		r_b += temp == null ? "null" : "" + temp;
	}
	return r_b;
};
Syllable.prototype = {
	getChar: function(indent) {
		if(indent == null) {
			indent = 0;
		}
		var ch = this.text.charAt(this.index + indent);
		if(ch == "") {
			return null;
		}
		return ch;
	}
	,getAlphabet: function(ch) {
		var conf = Alphabets.ALPHABETS.iterator();
		while(conf.hasNext()) {
			var conf1 = conf.next();
			var idx = Alphabets.INDEX_MAP.get(LANG_$KEYS.arabic);
			if(conf1.alpha[idx] == ch) {
				return conf1;
			}
		}
		return null;
	}
	,isType: function(tp,indent) {
		if(indent == null) {
			indent = 0;
		}
		var ch = this.text.charAt(this.index + indent);
		if(ch == null || ch == "") {
			return false;
		}
		var alpha = this.getAlphabet(ch);
		if(alpha == null) {
			return false;
		}
		return alpha.tp == tp;
	}
	,pushBuf: function() {
		this.blocks[this.blocks.length] = new StringBuf();
	}
	,pushChar: function(ch) {
		this.blocks[this.blocks.length - 1].b += ch == null ? "null" : "" + ch;
	}
	,handle: function() {
		if(this.blocks.length == 0) {
			this.pushBuf();
			this.pushChar(this.chCurr);
		} else if(this.isType(TYPES.MARKS,0) && this.alphaLast != null) {
			this.pushBuf();
			this.pushChar(this.chCurr);
		} else if(this.isType(TYPES.CONSONANTS,0) && this.isType(TYPES.VOWELS,1)) {
			this.pushBuf();
			this.pushChar(this.chCurr);
		} else {
			this.pushChar(this.chCurr);
		}
	}
	,process: function() {
		this.chLastLast = this.getChar(-2);
		this.chLast = this.getChar(-1);
		this.chCurr = this.getChar(0);
		this.chNext = this.getChar(1);
		this.chNextNext = this.getChar(2);
		this.alphaLast = this.getAlphabet(this.chLast);
		this.alphaCurr = this.getAlphabet(this.chCurr);
		this.alphaNext = this.getAlphabet(this.chNext);
		this.handle();
		if(this.index < this.text.length - 1) {
			this.index++;
			this.process();
		}
	}
	,convert: function(text) {
		this.text = text;
		this.index = 0;
		this.process();
		return this.blocks.join(" ");
	}
	,__class__: Syllable
};
var UyghurLanguageTools = $hx_exports["UyghurLanguageTools"] = function() { };
UyghurLanguageTools.__name__ = true;
UyghurLanguageTools.getVersion = function() {
	return "0.1";
};
UyghurLanguageTools.toExtended = function(text) {
	return Reshaper.toExt(text);
};
UyghurLanguageTools.fromExtended = function(text) {
	return Reshaper.toBase(text);
};
UyghurLanguageTools.toCommon = function(text) {
	return Converter.work("arabic","common",text);
};
UyghurLanguageTools.toCyrillic = function(text) {
	return Converter.work("arabic","cyrillic",text);
};
UyghurLanguageTools.toLatin = function(text) {
	return Converter.work("arabic","latin",text);
};
UyghurLanguageTools.fromCommon = function(text) {
	return Converter.work("common","arabic",text);
};
UyghurLanguageTools.fromCyrillic = function(text) {
	return Converter.work("cyrillic","arabic",text);
};
UyghurLanguageTools.fromLatin = function(text) {
	return Converter.work("arabic","latin",text);
};
UyghurLanguageTools.toAlphabet = function(text,isSHiftPressed) {
	return Keyboard.toAlphabet(text,isSHiftPressed);
};
UyghurLanguageTools.fromAlphabet = function(alphabet,isSHiftPressed) {
	return Keyboard.fromAlphabet(alphabet,isSHiftPressed);
};
UyghurLanguageTools.doSyllable = function(text) {
	return Syllable.parse(text);
};
UyghurLanguageTools.readNumber = function(text) {
	return Numbers.read(text);
};
UyghurLanguageTools.writeNumber = function(text) {
	return Numbers.write(text);
};
UyghurLanguageTools.main = function() {
	console.log("UyghurLanguageTools.hx:1352:","Uyghur Language Tools (" + UyghurLanguageTools.getVersion() + "), for more infomation please visit https://github.com/kompasim");
};
var haxe_IMap = function() { };
haxe_IMap.__name__ = true;
haxe_IMap.__isInterface__ = true;
haxe_IMap.prototype = {
	__class__: haxe_IMap
};
var haxe_Exception = function(message,previous,native) {
	Error.call(this,message);
	this.message = message;
	this.__previousException = previous;
	this.__nativeException = native != null ? native : this;
};
haxe_Exception.__name__ = true;
haxe_Exception.thrown = function(value) {
	if(((value) instanceof haxe_Exception)) {
		return value.get_native();
	} else if(((value) instanceof Error)) {
		return value;
	} else {
		var e = new haxe_ValueException(value);
		return e;
	}
};
haxe_Exception.__super__ = Error;
haxe_Exception.prototype = $extend(Error.prototype,{
	get_native: function() {
		return this.__nativeException;
	}
	,__class__: haxe_Exception
});
var haxe_ValueException = function(value,previous,native) {
	haxe_Exception.call(this,String(value),previous,native);
	this.value = value;
};
haxe_ValueException.__name__ = true;
haxe_ValueException.__super__ = haxe_Exception;
haxe_ValueException.prototype = $extend(haxe_Exception.prototype,{
	__class__: haxe_ValueException
});
var haxe_ds_BalancedTree = function() {
};
haxe_ds_BalancedTree.__name__ = true;
haxe_ds_BalancedTree.__interfaces__ = [haxe_IMap];
haxe_ds_BalancedTree.iteratorLoop = function(node,acc) {
	if(node != null) {
		haxe_ds_BalancedTree.iteratorLoop(node.left,acc);
		acc.push(node.value);
		haxe_ds_BalancedTree.iteratorLoop(node.right,acc);
	}
};
haxe_ds_BalancedTree.prototype = {
	set: function(key,value) {
		this.root = this.setLoop(key,value,this.root);
	}
	,get: function(key) {
		var node = this.root;
		while(node != null) {
			var c = this.compare(key,node.key);
			if(c == 0) {
				return node.value;
			}
			if(c < 0) {
				node = node.left;
			} else {
				node = node.right;
			}
		}
		return null;
	}
	,iterator: function() {
		var ret = [];
		haxe_ds_BalancedTree.iteratorLoop(this.root,ret);
		return new haxe_iterators_ArrayIterator(ret);
	}
	,keys: function() {
		var ret = [];
		this.keysLoop(this.root,ret);
		return new haxe_iterators_ArrayIterator(ret);
	}
	,setLoop: function(k,v,node) {
		if(node == null) {
			return new haxe_ds_TreeNode(null,k,v,null);
		}
		var c = this.compare(k,node.key);
		if(c == 0) {
			return new haxe_ds_TreeNode(node.left,k,v,node.right,node == null ? 0 : node._height);
		} else if(c < 0) {
			var nl = this.setLoop(k,v,node.left);
			return this.balance(nl,node.key,node.value,node.right);
		} else {
			var nr = this.setLoop(k,v,node.right);
			return this.balance(node.left,node.key,node.value,nr);
		}
	}
	,keysLoop: function(node,acc) {
		if(node != null) {
			this.keysLoop(node.left,acc);
			acc.push(node.key);
			this.keysLoop(node.right,acc);
		}
	}
	,balance: function(l,k,v,r) {
		var hl = l == null ? 0 : l._height;
		var hr = r == null ? 0 : r._height;
		if(hl > hr + 2) {
			var _this = l.left;
			var _this1 = l.right;
			if((_this == null ? 0 : _this._height) >= (_this1 == null ? 0 : _this1._height)) {
				return new haxe_ds_TreeNode(l.left,l.key,l.value,new haxe_ds_TreeNode(l.right,k,v,r));
			} else {
				return new haxe_ds_TreeNode(new haxe_ds_TreeNode(l.left,l.key,l.value,l.right.left),l.right.key,l.right.value,new haxe_ds_TreeNode(l.right.right,k,v,r));
			}
		} else if(hr > hl + 2) {
			var _this = r.right;
			var _this1 = r.left;
			if((_this == null ? 0 : _this._height) > (_this1 == null ? 0 : _this1._height)) {
				return new haxe_ds_TreeNode(new haxe_ds_TreeNode(l,k,v,r.left),r.key,r.value,r.right);
			} else {
				return new haxe_ds_TreeNode(new haxe_ds_TreeNode(l,k,v,r.left.left),r.left.key,r.left.value,new haxe_ds_TreeNode(r.left.right,r.key,r.value,r.right));
			}
		} else {
			return new haxe_ds_TreeNode(l,k,v,r,(hl > hr ? hl : hr) + 1);
		}
	}
	,compare: function(k1,k2) {
		return Reflect.compare(k1,k2);
	}
	,__class__: haxe_ds_BalancedTree
};
var haxe_ds_TreeNode = function(l,k,v,r,h) {
	if(h == null) {
		h = -1;
	}
	this.left = l;
	this.key = k;
	this.value = v;
	this.right = r;
	if(h == -1) {
		var tmp;
		var _this = this.left;
		var _this1 = this.right;
		if((_this == null ? 0 : _this._height) > (_this1 == null ? 0 : _this1._height)) {
			var _this = this.left;
			tmp = _this == null ? 0 : _this._height;
		} else {
			var _this = this.right;
			tmp = _this == null ? 0 : _this._height;
		}
		this._height = tmp + 1;
	} else {
		this._height = h;
	}
};
haxe_ds_TreeNode.__name__ = true;
haxe_ds_TreeNode.prototype = {
	__class__: haxe_ds_TreeNode
};
var haxe_ds_EnumValueMap = function() {
	haxe_ds_BalancedTree.call(this);
};
haxe_ds_EnumValueMap.__name__ = true;
haxe_ds_EnumValueMap.__interfaces__ = [haxe_IMap];
haxe_ds_EnumValueMap.__super__ = haxe_ds_BalancedTree;
haxe_ds_EnumValueMap.prototype = $extend(haxe_ds_BalancedTree.prototype,{
	compare: function(k1,k2) {
		var d = k1._hx_index - k2._hx_index;
		if(d != 0) {
			return d;
		}
		var p1 = Type.enumParameters(k1);
		var p2 = Type.enumParameters(k2);
		if(p1.length == 0 && p2.length == 0) {
			return 0;
		}
		return this.compareArgs(p1,p2);
	}
	,compareArgs: function(a1,a2) {
		var ld = a1.length - a2.length;
		if(ld != 0) {
			return ld;
		}
		var _g = 0;
		var _g1 = a1.length;
		while(_g < _g1) {
			var i = _g++;
			var d = this.compareArg(a1[i],a2[i]);
			if(d != 0) {
				return d;
			}
		}
		return 0;
	}
	,compareArg: function(v1,v2) {
		if(Reflect.isEnumValue(v1) && Reflect.isEnumValue(v2)) {
			return this.compare(v1,v2);
		} else if(((v1) instanceof Array) && ((v2) instanceof Array)) {
			return this.compareArgs(v1,v2);
		} else {
			return Reflect.compare(v1,v2);
		}
	}
	,__class__: haxe_ds_EnumValueMap
});
var haxe_ds_IntMap = function() {
	this.h = { };
};
haxe_ds_IntMap.__name__ = true;
haxe_ds_IntMap.__interfaces__ = [haxe_IMap];
haxe_ds_IntMap.prototype = {
	get: function(key) {
		return this.h[key];
	}
	,keys: function() {
		var a = [];
		for( var key in this.h ) if(this.h.hasOwnProperty(key)) a.push(+key);
		return new haxe_iterators_ArrayIterator(a);
	}
	,__class__: haxe_ds_IntMap
};
var haxe_ds_StringMap = function() {
	this.h = Object.create(null);
};
haxe_ds_StringMap.__name__ = true;
haxe_ds_StringMap.__interfaces__ = [haxe_IMap];
haxe_ds_StringMap.prototype = {
	get: function(key) {
		return this.h[key];
	}
	,keys: function() {
		return new haxe_ds__$StringMap_StringMapKeyIterator(this.h);
	}
	,__class__: haxe_ds_StringMap
};
var haxe_ds__$StringMap_StringMapKeyIterator = function(h) {
	this.h = h;
	this.keys = Object.keys(h);
	this.length = this.keys.length;
	this.current = 0;
};
haxe_ds__$StringMap_StringMapKeyIterator.__name__ = true;
haxe_ds__$StringMap_StringMapKeyIterator.prototype = {
	hasNext: function() {
		return this.current < this.length;
	}
	,next: function() {
		return this.keys[this.current++];
	}
	,__class__: haxe_ds__$StringMap_StringMapKeyIterator
};
var haxe_iterators_ArrayIterator = function(array) {
	this.current = 0;
	this.array = array;
};
haxe_iterators_ArrayIterator.__name__ = true;
haxe_iterators_ArrayIterator.prototype = {
	hasNext: function() {
		return this.current < this.array.length;
	}
	,next: function() {
		return this.array[this.current++];
	}
	,__class__: haxe_iterators_ArrayIterator
};
var js_Boot = function() { };
js_Boot.__name__ = true;
js_Boot.getClass = function(o) {
	if(o == null) {
		return null;
	} else if(((o) instanceof Array)) {
		return Array;
	} else {
		var cl = o.__class__;
		if(cl != null) {
			return cl;
		}
		var name = js_Boot.__nativeClassName(o);
		if(name != null) {
			return js_Boot.__resolveNativeClass(name);
		}
		return null;
	}
};
js_Boot.__string_rec = function(o,s) {
	if(o == null) {
		return "null";
	}
	if(s.length >= 5) {
		return "<...>";
	}
	var t = typeof(o);
	if(t == "function" && (o.__name__ || o.__ename__)) {
		t = "object";
	}
	switch(t) {
	case "function":
		return "<function>";
	case "object":
		if(o.__enum__) {
			var e = $hxEnums[o.__enum__];
			var con = e.__constructs__[o._hx_index];
			var n = con._hx_name;
			if(con.__params__) {
				s = s + "\t";
				return n + "(" + ((function($this) {
					var $r;
					var _g = [];
					{
						var _g1 = 0;
						var _g2 = con.__params__;
						while(true) {
							if(!(_g1 < _g2.length)) {
								break;
							}
							var p = _g2[_g1];
							_g1 = _g1 + 1;
							_g.push(js_Boot.__string_rec(o[p],s));
						}
					}
					$r = _g;
					return $r;
				}(this))).join(",") + ")";
			} else {
				return n;
			}
		}
		if(((o) instanceof Array)) {
			var str = "[";
			s += "\t";
			var _g = 0;
			var _g1 = o.length;
			while(_g < _g1) {
				var i = _g++;
				str += (i > 0 ? "," : "") + js_Boot.__string_rec(o[i],s);
			}
			str += "]";
			return str;
		}
		var tostr;
		try {
			tostr = o.toString;
		} catch( _g ) {
			return "???";
		}
		if(tostr != null && tostr != Object.toString && typeof(tostr) == "function") {
			var s2 = o.toString();
			if(s2 != "[object Object]") {
				return s2;
			}
		}
		var str = "{\n";
		s += "\t";
		var hasp = o.hasOwnProperty != null;
		var k = null;
		for( k in o ) {
		if(hasp && !o.hasOwnProperty(k)) {
			continue;
		}
		if(k == "prototype" || k == "__class__" || k == "__super__" || k == "__interfaces__" || k == "__properties__") {
			continue;
		}
		if(str.length != 2) {
			str += ", \n";
		}
		str += s + k + " : " + js_Boot.__string_rec(o[k],s);
		}
		s = s.substring(1);
		str += "\n" + s + "}";
		return str;
	case "string":
		return o;
	default:
		return String(o);
	}
};
js_Boot.__interfLoop = function(cc,cl) {
	if(cc == null) {
		return false;
	}
	if(cc == cl) {
		return true;
	}
	var intf = cc.__interfaces__;
	if(intf != null) {
		var _g = 0;
		var _g1 = intf.length;
		while(_g < _g1) {
			var i = _g++;
			var i1 = intf[i];
			if(i1 == cl || js_Boot.__interfLoop(i1,cl)) {
				return true;
			}
		}
	}
	return js_Boot.__interfLoop(cc.__super__,cl);
};
js_Boot.__instanceof = function(o,cl) {
	if(cl == null) {
		return false;
	}
	switch(cl) {
	case Array:
		return ((o) instanceof Array);
	case Bool:
		return typeof(o) == "boolean";
	case Dynamic:
		return o != null;
	case Float:
		return typeof(o) == "number";
	case Int:
		if(typeof(o) == "number") {
			return ((o | 0) === o);
		} else {
			return false;
		}
		break;
	case String:
		return typeof(o) == "string";
	default:
		if(o != null) {
			if(typeof(cl) == "function") {
				if(js_Boot.__downcastCheck(o,cl)) {
					return true;
				}
			} else if(typeof(cl) == "object" && js_Boot.__isNativeObj(cl)) {
				if(((o) instanceof cl)) {
					return true;
				}
			}
		} else {
			return false;
		}
		if(cl == Class ? o.__name__ != null : false) {
			return true;
		}
		if(cl == Enum ? o.__ename__ != null : false) {
			return true;
		}
		return o.__enum__ != null ? $hxEnums[o.__enum__] == cl : false;
	}
};
js_Boot.__downcastCheck = function(o,cl) {
	if(!((o) instanceof cl)) {
		if(cl.__isInterface__) {
			return js_Boot.__interfLoop(js_Boot.getClass(o),cl);
		} else {
			return false;
		}
	} else {
		return true;
	}
};
js_Boot.__cast = function(o,t) {
	if(o == null || js_Boot.__instanceof(o,t)) {
		return o;
	} else {
		throw haxe_Exception.thrown("Cannot cast " + Std.string(o) + " to " + Std.string(t));
	}
};
js_Boot.__nativeClassName = function(o) {
	var name = js_Boot.__toStr.call(o).slice(8,-1);
	if(name == "Object" || name == "Function" || name == "Math" || name == "JSON") {
		return null;
	}
	return name;
};
js_Boot.__isNativeObj = function(o) {
	return js_Boot.__nativeClassName(o) != null;
};
js_Boot.__resolveNativeClass = function(name) {
	return $global[name];
};
if(typeof(performance) != "undefined" ? typeof(performance.now) == "function" : false) {
	HxOverrides.now = performance.now.bind(performance);
}
String.prototype.__class__ = String;
String.__name__ = true;
Array.__name__ = true;
var Int = { };
var Dynamic = { };
var Float = Number;
var Bool = Boolean;
var Class = { };
var Enum = { };
js_Boot.__toStr = ({ }).toString;
Alphabets.ALPHABETS = (function($this) {
	var $r;
	var _g = new haxe_ds_EnumValueMap();
	_g.set(NAMES.HEMZE,{ idx : 0, tp : TYPES.MARKS, ipa : "'", nm : NAMES.HEMZE, alpha : ["'","ئ","'","'","'"]});
	_g.set(NAMES.COMMA,{ idx : 0, tp : TYPES.MARKS, ipa : ",", nm : NAMES.COMMA, alpha : [",","،",",",",",","]});
	_g.set(NAMES.EXCLA,{ idx : 0, tp : TYPES.MARKS, ipa : "!", nm : NAMES.EXCLA, alpha : ["!","!","!","!","!"]});
	_g.set(NAMES.QUESS,{ idx : 0, tp : TYPES.MARKS, ipa : "?", nm : NAMES.QUESS, alpha : ["?","؟","?","?","?"]});
	_g.set(NAMES.COLON,{ idx : 0, tp : TYPES.MARKS, ipa : ";", nm : NAMES.COLON, alpha : [";","؛",";",";",";"]});
	_g.set(NAMES.A,{ idx : 1, tp : TYPES.VOWELS, ipa : "ɑ", nm : NAMES.A, alpha : ["a","ا","a","a","a"]});
	_g.set(NAMES.AE,{ idx : 2, tp : TYPES.VOWELS, ipa : "æ", nm : NAMES.AE, alpha : ["ä","ە","ә","ə","e"]});
	_g.set(NAMES.O,{ idx : 25, tp : TYPES.VOWELS, ipa : "", nm : NAMES.O, alpha : ["o","و","о","o","o"]});
	_g.set(NAMES.U,{ idx : 26, tp : TYPES.VOWELS, ipa : "", nm : NAMES.U, alpha : ["u","ۇ","у","u","u"]});
	_g.set(NAMES.OO,{ idx : 27, tp : TYPES.VOWELS, ipa : "", nm : NAMES.OO, alpha : ["ö","ۆ","ө","ɵ","ö"]});
	_g.set(NAMES.UU,{ idx : 28, tp : TYPES.VOWELS, ipa : "", nm : NAMES.UU, alpha : ["ü","ۈ","ү","ü","ü"]});
	_g.set(NAMES.I,{ idx : 31, tp : TYPES.VOWELS, ipa : "", nm : NAMES.I, alpha : ["i","ى","и","i","i"]});
	_g.set(NAMES.E,{ idx : 30, tp : TYPES.VOWELS, ipa : "", nm : NAMES.E, alpha : ["e","ې","е","e","ë"]});
	_g.set(NAMES.B,{ idx : 3, tp : TYPES.CONSONANTS, ipa : "b", nm : NAMES.B, alpha : ["b","ب","б","b","b"]});
	_g.set(NAMES.P,{ idx : 4, tp : TYPES.CONSONANTS, ipa : "p", nm : NAMES.P, alpha : ["p","پ","п","p","p"]});
	_g.set(NAMES.T,{ idx : 5, tp : TYPES.CONSONANTS, ipa : "t", nm : NAMES.T, alpha : ["t","ت","т","t","t"]});
	_g.set(NAMES.DJ,{ idx : 6, tp : TYPES.CONSONANTS, ipa : "dʒ", nm : NAMES.DJ, alpha : ["c","ج","җ","j","j"]});
	_g.set(NAMES.CH,{ idx : 7, tp : TYPES.CONSONANTS, ipa : "tʃ", nm : NAMES.CH, alpha : ["ç","چ","ч","q","ch"]});
	_g.set(NAMES.X,{ idx : 8, tp : TYPES.CONSONANTS, ipa : "x", nm : NAMES.X, alpha : ["x","خ","х","h","x"]});
	_g.set(NAMES.D,{ idx : 9, tp : TYPES.CONSONANTS, ipa : "d", nm : NAMES.D, alpha : ["d","د","д","d","d"]});
	_g.set(NAMES.R,{ idx : 10, tp : TYPES.CONSONANTS, ipa : "r", nm : NAMES.R, alpha : ["r","ر","р","r","r"]});
	_g.set(NAMES.Z,{ idx : 11, tp : TYPES.CONSONANTS, ipa : "z", nm : NAMES.Z, alpha : ["z","ز","з","z","z"]});
	_g.set(NAMES.J,{ idx : 12, tp : TYPES.CONSONANTS, ipa : "ʒ", nm : NAMES.J, alpha : ["j","ژ","ж","ⱬ","zh"]});
	_g.set(NAMES.S,{ idx : 13, tp : TYPES.CONSONANTS, ipa : "s", nm : NAMES.S, alpha : ["s","س","с","s","s"]});
	_g.set(NAMES.SH,{ idx : 14, tp : TYPES.CONSONANTS, ipa : "ʃ", nm : NAMES.SH, alpha : ["ş","ش","ш","x","sh"]});
	_g.set(NAMES.GH,{ idx : 15, tp : TYPES.CONSONANTS, ipa : "ɣ", nm : NAMES.GH, alpha : ["ğ","غ","ғ","ƣ","gh"]});
	_g.set(NAMES.F,{ idx : 16, tp : TYPES.CONSONANTS, ipa : "f", nm : NAMES.F, alpha : ["f","ف","ф","f","f"]});
	_g.set(NAMES.Q,{ idx : 17, tp : TYPES.CONSONANTS, ipa : "q", nm : NAMES.Q, alpha : ["q","ق","қ","ⱪ","q"]});
	_g.set(NAMES.K,{ idx : 18, tp : TYPES.CONSONANTS, ipa : "k", nm : NAMES.K, alpha : ["k","ك","к","k","k"]});
	_g.set(NAMES.G,{ idx : 19, tp : TYPES.CONSONANTS, ipa : "g", nm : NAMES.G, alpha : ["g","گ","г","g","g"]});
	_g.set(NAMES.NG,{ idx : 20, tp : TYPES.CONSONANTS, ipa : "ŋ", nm : NAMES.NG, alpha : ["ñ","ڭ","ң","ng","ng"]});
	_g.set(NAMES.L,{ idx : 21, tp : TYPES.CONSONANTS, ipa : "l", nm : NAMES.L, alpha : ["l","ل","л","l","l"]});
	_g.set(NAMES.M,{ idx : 22, tp : TYPES.CONSONANTS, ipa : "m", nm : NAMES.M, alpha : ["m","م","м","m","m"]});
	_g.set(NAMES.N,{ idx : 23, tp : TYPES.CONSONANTS, ipa : "n", nm : NAMES.N, alpha : ["n","ن","н","n","n"]});
	_g.set(NAMES.H,{ idx : 24, tp : TYPES.CONSONANTS, ipa : "h", nm : NAMES.H, alpha : ["h","ھ","һ","ⱨ","h"]});
	_g.set(NAMES.V,{ idx : 29, tp : TYPES.CONSONANTS, ipa : "v", nm : NAMES.V, alpha : ["v","ۋ","в","v","w"]});
	_g.set(NAMES.Y,{ idx : 32, tp : TYPES.CONSONANTS, ipa : "j", nm : NAMES.Y, alpha : ["y","ي","й","y","y"]});
	_g.set(NAMES.YU,{ idx : 0, tp : TYPES.COMPOUNDS, ipa : "ju", nm : NAMES.YU, alpha : ["yu","ي‍‍ۇ","ю","yu","yu"]});
	_g.set(NAMES.YA,{ idx : 0, tp : TYPES.COMPOUNDS, ipa : "jɑ", nm : NAMES.YA, alpha : ["ya","ي‍‍ا","я","ya","ya"]});
	$r = _g;
	return $r;
}(this));
Alphabets.INDEX_MAP = (function($this) {
	var $r;
	var _g = new haxe_ds_EnumValueMap();
	_g.set(LANG_$KEYS.common,0);
	_g.set(LANG_$KEYS.arabic,1);
	_g.set(LANG_$KEYS.cyrillic,2);
	_g.set(LANG_$KEYS.newly,3);
	_g.set(LANG_$KEYS.latin,4);
	$r = _g;
	return $r;
}(this));
Alphabets.SPECIALS_LIST = "\\\"!`'#%&,:;<>=@{}~$()*+/?[]^|؛،؟";
Numbers.valid = false;
Numbers.COMPLETE = "پۈتۈن";
Numbers.ZERO = "نۆل";
Numbers.TEN = "ئون";
Numbers.TEN_SUFFIX = "دا";
Numbers.HUNDRED = "يۈز";
Numbers.HUNDRED_SUFFIX = "دە";
Numbers.NAMES_1 = ["بىر","ئىككى","ئۈچ","تۆت","بەش","ئالتە","يەتتە","سەككىز","توققۇز"];
Numbers.NAMES_10 = ["ئون","يىگىرمە","ئوتتۇز","قىرىق","ئەللىك","ئاتمىش","يەتمىش","سەكسەن","توقسان"];
Numbers.NAMES_N = ["مىڭ","مىليون","مىليارد","تىرىليون","تىرىليارد"];
Numbers.NAMES_N_SUFFIX = ["دا","دا","تا","دا","تا"];
var UyghurLanguageTools_KEYCODES = (function($this) {
	var $r;
	var _g = new haxe_ds_IntMap();
	_g.h[65] = ["a","ھ",""];
	_g.h[66] = ["b","ب",""];
	_g.h[67] = ["c","غ",""];
	_g.h[68] = ["d","د","ژ"];
	_g.h[69] = ["e","ې",""];
	_g.h[70] = ["f","ا","ف"];
	_g.h[71] = ["g","ە","گ"];
	_g.h[72] = ["h","ى","خ"];
	_g.h[73] = ["i","ڭ",""];
	_g.h[74] = ["j","ق","ج"];
	_g.h[75] = ["k","ك","ۆ"];
	_g.h[76] = ["l","ل","لا"];
	_g.h[77] = ["m","م",""];
	_g.h[78] = ["n","ن",""];
	_g.h[79] = ["o","و",""];
	_g.h[80] = ["p","پ",""];
	_g.h[81] = ["q","چ",""];
	_g.h[82] = ["r","ر",""];
	_g.h[83] = ["s","س",""];
	_g.h[84] = ["t","ت",""];
	_g.h[85] = ["u","ۇ",""];
	_g.h[86] = ["v","ۈ",""];
	_g.h[87] = ["w","ۋ",""];
	_g.h[88] = ["x","ش",""];
	_g.h[89] = ["y","ي",""];
	_g.h[90] = ["z","ز",""];
	_g.h[186] = [";","؛",":"];
	_g.h[188] = [",","،",">"];
	_g.h[191] = ["/","ئ","؟"];
	$r = _g;
	return $r;
}(this));
var UyghurLanguageTools_ALPHABET_BASE = ["ت","پ","ب","ر","د","چ","ج","ز","ف","ق","ك","ش","گ","س","ڭ","ن","م","ۋ","ل","خ","غ","ژ","ي","ا","ە","و","ۈ","ۆ","ۇ","ې","ى","ھ","ئ"];
var UyghurLanguageTools_ALPHABET_EXT_BEGIN = ["ﺗ","ﭘ","ﺑ","ﺭ","ﺩ","ﭼ","ﺟ","ﺯ","ﻓ","ﻗ","ﻛ","ﺷ","ﮔ","ﺳ","ﯕ","ﻧ","ﻣ","ﯞ","ﻟ","ﺧ","ﻏ","ﮊ","ﻳ","ﺍ","ﻩ","ﻭ","ﯛ","ﯙ","ﯗ","ﯦ","ﯨ","ﮬ","ﺋ"];
var UyghurLanguageTools_ALPHABET_EXT_SINGLE = ["ﺕ","ﭖ","ﺏ","ﺭ","ﺩ","ﭺ","ﺝ","ﺯ","ﻑ","ﻕ","ﻙ","ﺵ","ﮒ","ﺱ","ﯓ","ﻥ","ﻡ","ﯞ","ﻝ","ﺥ","ﻍ","ﮊ","ﻱ","ﺍ","ﻩ","ﻭ","ﯛ","ﯙ","ﯗ","ﯤ","ﻯ","ﮪ","ﺋ"];
var UyghurLanguageTools_ALPHABET_EXT_MIDDLE = ["ﺘ","ﭙ","ﺒ","ﺮ","ﺪ","ﭽ","ﺠ","ﺰ","ﻔ","ﻘ","ﻜ","ﺸ","ﮕ","ﺴ","ﯖ","ﻨ","ﻤ","ﯟ","ﻠ","ﺨ","ﻐ","ﮋ","ﻴ","ﺎ","ﻪ","ﻮ","ﯜ","ﯚ","ﯘ","ﯧ","ﯩ","ﮭ","ﺌ"];
var UyghurLanguageTools_ALPHABET_EXT_END = ["ﺖ","ﭗ","ﺐ","ﺮ","ﺪ","ﭻ","ﺞ","ﺰ","ﻒ","ﻖ","ﻚ","ﺶ","ﮓ","ﺲ","ﯔ","ﻦ","ﻢ","ﯟ","ﻞ","ﺦ","ﻎ","ﮋ","ﻲ","ﺎ","ﻪ","ﻮ","ﯜ","ﯚ","ﯘ","ﯥ","ﻰ","ﮫ","ﺌ"];
var UyghurLanguageTools_ALPHABET_FRIENDLY = ["ت","ئ","خ","چ","ج","پ","ب","س","ش","غ","ف","ق","ك","گ","ڭ","ل","م","ن","ھ","ې","ى","ي"];
var UyghurLanguageTools_REPLACE_MAP = (function($this) {
	var $r;
	var _g = new haxe_ds_StringMap();
	_g.h["ﻻ"] = "ﻟﺎ";
	_g.h["ﻼ"] = "ﻠﺎ";
	$r = _g;
	return $r;
}(this));
var UyghurLanguageTools_la1 = new _$UyghurLanguageTools_LA_$Class("ﻟ","ﺎ","ﻻ");
var UyghurLanguageTools_la2 = new _$UyghurLanguageTools_LA_$Class("ﻠ","ﺎ","ﻼ");
})(typeof exports != "undefined" ? exports : typeof window != "undefined" ? window : typeof self != "undefined" ? self : this, typeof window != "undefined" ? window : typeof global != "undefined" ? global : typeof self != "undefined" ? self : this);
