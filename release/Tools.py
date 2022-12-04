import sys

import math as python_lib_Math
import math as Math
import inspect as python_lib_Inspect
import sys as python_lib_Sys
import functools as python_lib_Functools
import traceback as python_lib_Traceback
from io import StringIO as python_lib_io_StringIO


class _hx_AnonObject:
    _hx_disable_getattr = False
    def __init__(self, fields):
        self.__dict__ = fields
    def __repr__(self):
        return repr(self.__dict__)
    def __contains__(self, item):
        return item in self.__dict__
    def __getitem__(self, item):
        return self.__dict__[item]
    def __getattr__(self, name):
        if (self._hx_disable_getattr):
            raise AttributeError('field does not exist')
        else:
            return None
    def _hx_hasattr(self,field):
        self._hx_disable_getattr = True
        try:
            getattr(self, field)
            self._hx_disable_getattr = False
            return True
        except AttributeError:
            self._hx_disable_getattr = False
            return False



class Enum:
    _hx_class_name = "Enum"
    __slots__ = ("tag", "index", "params")
    _hx_fields = ["tag", "index", "params"]
    _hx_methods = ["__str__"]

    def __init__(self,tag,index,params):
        self.tag = tag
        self.index = index
        self.params = params

    def __str__(self):
        if (self.params is None):
            return self.tag
        else:
            return self.tag + '(' + (', '.join(str(v) for v in self.params)) + ')'



class Class: pass


class Reflect:
    _hx_class_name = "Reflect"
    __slots__ = ()
    _hx_statics = ["field", "callMethod", "isFunction", "compare", "isEnumValue"]

    @staticmethod
    def field(o,field):
        return python_Boot.field(o,field)

    @staticmethod
    def callMethod(o,func,args):
        if callable(func):
            return func(*args)
        else:
            return None

    @staticmethod
    def isFunction(f):
        if (not ((python_lib_Inspect.isfunction(f) or python_lib_Inspect.ismethod(f)))):
            return python_Boot.hasField(f,"func_code")
        else:
            return True

    @staticmethod
    def compare(a,b):
        if ((a is None) and ((b is None))):
            return 0
        if (a is None):
            return 1
        elif (b is None):
            return -1
        elif HxOverrides.eq(a,b):
            return 0
        elif (a > b):
            return 1
        else:
            return -1

    @staticmethod
    def isEnumValue(v):
        if not HxOverrides.eq(v,Enum):
            return isinstance(v,Enum)
        else:
            return False


class Std:
    _hx_class_name = "Std"
    __slots__ = ()
    _hx_statics = ["is", "isOfType", "string", "parseInt", "shortenPossibleNumber", "parseFloat"]

    @staticmethod
    def _hx_is(v,t):
        return Std.isOfType(v,t)

    @staticmethod
    def isOfType(v,t):
        if ((v is None) and ((t is None))):
            return False
        if (t is None):
            return False
        if ((type(t) == type) and (t == Dynamic)):
            return (v is not None)
        isBool = isinstance(v,bool)
        if (((type(t) == type) and (t == Bool)) and isBool):
            return True
        if ((((not isBool) and (not ((type(t) == type) and (t == Bool)))) and ((type(t) == type) and (t == Int))) and isinstance(v,int)):
            return True
        vIsFloat = isinstance(v,float)
        tmp = None
        tmp1 = None
        if (((not isBool) and vIsFloat) and ((type(t) == type) and (t == Int))):
            f = v
            tmp1 = (((f != Math.POSITIVE_INFINITY) and ((f != Math.NEGATIVE_INFINITY))) and (not python_lib_Math.isnan(f)))
        else:
            tmp1 = False
        if tmp1:
            tmp1 = None
            try:
                tmp1 = int(v)
            except BaseException as _g:
                None
                tmp1 = None
            tmp = (v == tmp1)
        else:
            tmp = False
        if ((tmp and ((v <= 2147483647))) and ((v >= -2147483648))):
            return True
        if (((not isBool) and ((type(t) == type) and (t == Float))) and isinstance(v,(float, int))):
            return True
        if ((type(t) == type) and (t == str)):
            return isinstance(v,str)
        isEnumType = ((type(t) == type) and (t == Enum))
        if ((isEnumType and python_lib_Inspect.isclass(v)) and hasattr(v,"_hx_constructs")):
            return True
        if isEnumType:
            return False
        isClassType = ((type(t) == type) and (t == Class))
        if ((((isClassType and (not isinstance(v,Enum))) and python_lib_Inspect.isclass(v)) and hasattr(v,"_hx_class_name")) and (not hasattr(v,"_hx_constructs"))):
            return True
        if isClassType:
            return False
        tmp = None
        try:
            tmp = isinstance(v,t)
        except BaseException as _g:
            None
            tmp = False
        if tmp:
            return True
        if python_lib_Inspect.isclass(t):
            cls = t
            loop = None
            def _hx_local_1(intf):
                f = (intf._hx_interfaces if (hasattr(intf,"_hx_interfaces")) else [])
                if (f is not None):
                    _g = 0
                    while (_g < len(f)):
                        i = (f[_g] if _g >= 0 and _g < len(f) else None)
                        _g = (_g + 1)
                        if (i == cls):
                            return True
                        else:
                            l = loop(i)
                            if l:
                                return True
                    return False
                else:
                    return False
            loop = _hx_local_1
            currentClass = v.__class__
            result = False
            while (currentClass is not None):
                if loop(currentClass):
                    result = True
                    break
                currentClass = python_Boot.getSuperClass(currentClass)
            return result
        else:
            return False

    @staticmethod
    def string(s):
        return python_Boot.toString1(s,"")

    @staticmethod
    def parseInt(x):
        if (x is None):
            return None
        try:
            return int(x)
        except BaseException as _g:
            None
            base = 10
            _hx_len = len(x)
            foundCount = 0
            sign = 0
            firstDigitIndex = 0
            lastDigitIndex = -1
            previous = 0
            _g = 0
            _g1 = _hx_len
            while (_g < _g1):
                i = _g
                _g = (_g + 1)
                c = (-1 if ((i >= len(x))) else ord(x[i]))
                if (((c > 8) and ((c < 14))) or ((c == 32))):
                    if (foundCount > 0):
                        return None
                    continue
                else:
                    c1 = c
                    if (c1 == 43):
                        if (foundCount == 0):
                            sign = 1
                        elif (not (((48 <= c) and ((c <= 57))))):
                            if (not (((base == 16) and ((((97 <= c) and ((c <= 122))) or (((65 <= c) and ((c <= 90))))))))):
                                break
                    elif (c1 == 45):
                        if (foundCount == 0):
                            sign = -1
                        elif (not (((48 <= c) and ((c <= 57))))):
                            if (not (((base == 16) and ((((97 <= c) and ((c <= 122))) or (((65 <= c) and ((c <= 90))))))))):
                                break
                    elif (c1 == 48):
                        if (not (((foundCount == 0) or (((foundCount == 1) and ((sign != 0))))))):
                            if (not (((48 <= c) and ((c <= 57))))):
                                if (not (((base == 16) and ((((97 <= c) and ((c <= 122))) or (((65 <= c) and ((c <= 90))))))))):
                                    break
                    elif ((c1 == 120) or ((c1 == 88))):
                        if ((previous == 48) and ((((foundCount == 1) and ((sign == 0))) or (((foundCount == 2) and ((sign != 0))))))):
                            base = 16
                        elif (not (((48 <= c) and ((c <= 57))))):
                            if (not (((base == 16) and ((((97 <= c) and ((c <= 122))) or (((65 <= c) and ((c <= 90))))))))):
                                break
                    elif (not (((48 <= c) and ((c <= 57))))):
                        if (not (((base == 16) and ((((97 <= c) and ((c <= 122))) or (((65 <= c) and ((c <= 90))))))))):
                            break
                if (((foundCount == 0) and ((sign == 0))) or (((foundCount == 1) and ((sign != 0))))):
                    firstDigitIndex = i
                foundCount = (foundCount + 1)
                lastDigitIndex = i
                previous = c
            if (firstDigitIndex <= lastDigitIndex):
                digits = HxString.substring(x,firstDigitIndex,(lastDigitIndex + 1))
                try:
                    return (((-1 if ((sign == -1)) else 1)) * int(digits,base))
                except BaseException as _g:
                    return None
            return None

    @staticmethod
    def shortenPossibleNumber(x):
        r = ""
        _g = 0
        _g1 = len(x)
        while (_g < _g1):
            i = _g
            _g = (_g + 1)
            c = ("" if (((i < 0) or ((i >= len(x))))) else x[i])
            _g2 = HxString.charCodeAt(c,0)
            if (_g2 is None):
                break
            else:
                _g3 = _g2
                if (((((((((((_g3 == 57) or ((_g3 == 56))) or ((_g3 == 55))) or ((_g3 == 54))) or ((_g3 == 53))) or ((_g3 == 52))) or ((_g3 == 51))) or ((_g3 == 50))) or ((_g3 == 49))) or ((_g3 == 48))) or ((_g3 == 46))):
                    r = (("null" if r is None else r) + ("null" if c is None else c))
                else:
                    break
        return r

    @staticmethod
    def parseFloat(x):
        try:
            return float(x)
        except BaseException as _g:
            None
            if (x is not None):
                r1 = Std.shortenPossibleNumber(x)
                if (r1 != x):
                    return Std.parseFloat(r1)
            return Math.NaN


class Float: pass


class Int: pass


class Bool: pass


class Dynamic: pass


class StringBuf:
    _hx_class_name = "StringBuf"
    __slots__ = ("b",)
    _hx_fields = ["b"]
    _hx_methods = ["get_length"]

    def __init__(self):
        self.b = python_lib_io_StringIO()

    def get_length(self):
        pos = self.b.tell()
        self.b.seek(0,2)
        _hx_len = self.b.tell()
        self.b.seek(pos,0)
        return _hx_len



class StringTools:
    _hx_class_name = "StringTools"
    __slots__ = ()
    _hx_statics = ["isSpace", "ltrim", "rtrim", "trim", "lpad", "replace"]

    @staticmethod
    def isSpace(s,pos):
        if (((len(s) == 0) or ((pos < 0))) or ((pos >= len(s)))):
            return False
        c = HxString.charCodeAt(s,pos)
        if (not (((c > 8) and ((c < 14))))):
            return (c == 32)
        else:
            return True

    @staticmethod
    def ltrim(s):
        l = len(s)
        r = 0
        while ((r < l) and StringTools.isSpace(s,r)):
            r = (r + 1)
        if (r > 0):
            return HxString.substr(s,r,(l - r))
        else:
            return s

    @staticmethod
    def rtrim(s):
        l = len(s)
        r = 0
        while ((r < l) and StringTools.isSpace(s,((l - r) - 1))):
            r = (r + 1)
        if (r > 0):
            return HxString.substr(s,0,(l - r))
        else:
            return s

    @staticmethod
    def trim(s):
        return StringTools.ltrim(StringTools.rtrim(s))

    @staticmethod
    def lpad(s,c,l):
        if (len(c) <= 0):
            return s
        buf = StringBuf()
        l = (l - len(s))
        while (buf.get_length() < l):
            s1 = Std.string(c)
            buf.b.write(s1)
        s1 = Std.string(s)
        buf.b.write(s1)
        return buf.b.getvalue()

    @staticmethod
    def replace(s,sub,by):
        _this = (list(s) if ((sub == "")) else s.split(sub))
        return by.join([python_Boot.toString1(x1,'') for x1 in _this])


class Sys:
    _hx_class_name = "Sys"
    __slots__ = ()
    _hx_statics = ["systemName"]

    @staticmethod
    def systemName():
        _g = python_lib_Sys.platform
        x = _g
        if x.startswith("linux"):
            return "Linux"
        else:
            _g1 = _g
            _hx_local_0 = len(_g1)
            if (_hx_local_0 == 5):
                if (_g1 == "win32"):
                    return "Windows"
                else:
                    raise haxe_Exception.thrown("not supported platform")
            elif (_hx_local_0 == 6):
                if (_g1 == "cygwin"):
                    return "Windows"
                elif (_g1 == "darwin"):
                    return "Mac"
                else:
                    raise haxe_Exception.thrown("not supported platform")
            else:
                raise haxe_Exception.thrown("not supported platform")

class LANG_KEYS(Enum):
    __slots__ = ()
    _hx_class_name = "LANG_KEYS"
    _hx_constructs = ["common", "arabic", "cyrillic", "newly", "latin"]
LANG_KEYS.common = LANG_KEYS("common", 0, ())
LANG_KEYS.arabic = LANG_KEYS("arabic", 1, ())
LANG_KEYS.cyrillic = LANG_KEYS("cyrillic", 2, ())
LANG_KEYS.newly = LANG_KEYS("newly", 3, ())
LANG_KEYS.latin = LANG_KEYS("latin", 4, ())

class TYPES(Enum):
    __slots__ = ()
    _hx_class_name = "TYPES"
    _hx_constructs = ["MARKS", "COMPOUNDS", "VOWELS", "CONSONANTS"]
TYPES.MARKS = TYPES("MARKS", 0, ())
TYPES.COMPOUNDS = TYPES("COMPOUNDS", 1, ())
TYPES.VOWELS = TYPES("VOWELS", 2, ())
TYPES.CONSONANTS = TYPES("CONSONANTS", 3, ())

class NAMES(Enum):
    __slots__ = ()
    _hx_class_name = "NAMES"
    _hx_constructs = ["HEMZE", "COMMA", "EXCLA", "QUESS", "COLON", "A", "AE", "O", "U", "OO", "UU", "I", "E", "B", "P", "T", "DJ", "CH", "X", "D", "R", "Z", "J", "S", "SH", "GH", "F", "Q", "K", "G", "NG", "L", "M", "N", "H", "V", "Y", "YU", "YA"]
NAMES.HEMZE = NAMES("HEMZE", 0, ())
NAMES.COMMA = NAMES("COMMA", 1, ())
NAMES.EXCLA = NAMES("EXCLA", 2, ())
NAMES.QUESS = NAMES("QUESS", 3, ())
NAMES.COLON = NAMES("COLON", 4, ())
NAMES.A = NAMES("A", 5, ())
NAMES.AE = NAMES("AE", 6, ())
NAMES.O = NAMES("O", 7, ())
NAMES.U = NAMES("U", 8, ())
NAMES.OO = NAMES("OO", 9, ())
NAMES.UU = NAMES("UU", 10, ())
NAMES.I = NAMES("I", 11, ())
NAMES.E = NAMES("E", 12, ())
NAMES.B = NAMES("B", 13, ())
NAMES.P = NAMES("P", 14, ())
NAMES.T = NAMES("T", 15, ())
NAMES.DJ = NAMES("DJ", 16, ())
NAMES.CH = NAMES("CH", 17, ())
NAMES.X = NAMES("X", 18, ())
NAMES.D = NAMES("D", 19, ())
NAMES.R = NAMES("R", 20, ())
NAMES.Z = NAMES("Z", 21, ())
NAMES.J = NAMES("J", 22, ())
NAMES.S = NAMES("S", 23, ())
NAMES.SH = NAMES("SH", 24, ())
NAMES.GH = NAMES("GH", 25, ())
NAMES.F = NAMES("F", 26, ())
NAMES.Q = NAMES("Q", 27, ())
NAMES.K = NAMES("K", 28, ())
NAMES.G = NAMES("G", 29, ())
NAMES.NG = NAMES("NG", 30, ())
NAMES.L = NAMES("L", 31, ())
NAMES.M = NAMES("M", 32, ())
NAMES.N = NAMES("N", 33, ())
NAMES.H = NAMES("H", 34, ())
NAMES.V = NAMES("V", 35, ())
NAMES.Y = NAMES("Y", 36, ())
NAMES.YU = NAMES("YU", 37, ())
NAMES.YA = NAMES("YA", 38, ())


class Alphabets:
    _hx_class_name = "Alphabets"
    __slots__ = ()
    _hx_statics = ["ALPHABETS", "INDEX_MAP", "SPECIALS_LIST", "replaceAllSpecials", "mergeAllSpace", "splitByDelimiter"]

    @staticmethod
    def replaceAllSpecials(text,replacement):
        if (len(text) == 0):
            return text
        buf_b = python_lib_io_StringIO()
        idx = 0
        while (idx < len(text)):
            ch = HxString.substr(text,idx,1)
            _this = Alphabets.SPECIALS_LIST
            startIndex = None
            buf_b.write(Std.string((" " if ((((_this.find(ch) if ((startIndex is None)) else HxString.indexOfImpl(_this,ch,startIndex))) >= 0)) else ch)))
            idx = (idx + 1)
        return buf_b.getvalue()

    @staticmethod
    def mergeAllSpace(text):
        text = StringTools.trim(text)
        if (len(text) == 0):
            return text
        buf_b = python_lib_io_StringIO()
        idx = 0
        isSpace = False
        while (idx < len(text)):
            ch = HxString.substr(text,idx,1)
            if ((not isSpace) or ((ch != " "))):
                buf_b.write(Std.string(ch))
            isSpace = (ch == " ")
            idx = (idx + 1)
        return buf_b.getvalue()

    @staticmethod
    def splitByDelimiter(text,delimiter = None):
        if (delimiter is None):
            delimiter = " "
        arr = list()
        buf = StringBuf()
        idx = 0
        text = Alphabets.mergeAllSpace(text)
        if (len(text) == 0):
            return arr
        while (idx < len(text)):
            ch = HxString.substr(text,idx,1)
            if (ch == delimiter):
                x = buf.b.getvalue()
                arr.append(x)
                buf = StringBuf()
            else:
                s = Std.string(ch)
                buf.b.write(s)
            idx = (idx + 1)
        x = buf.b.getvalue()
        arr.append(x)
        return arr


class Converter:
    _hx_class_name = "Converter"
    __slots__ = ("_hx_from", "to", "fromIdx", "toIdx", "text", "index", "result", "lastAlpha", "chLast", "chCurr", "chNext")
    _hx_fields = ["from", "to", "fromIdx", "toIdx", "text", "index", "result", "lastAlpha", "chLast", "chCurr", "chNext"]
    _hx_methods = ["pushString", "pushName", "move", "isFinished", "getChar", "getAlphabet", "handleUyghur", "process", "convert"]
    _hx_statics = ["work"]

    def __init__(self,_hx_from,to):
        self.chNext = None
        self.chCurr = None
        self.chLast = None
        self.lastAlpha = None
        self.result = StringBuf()
        self.index = 0
        self.text = None
        self.toIdx = -1
        self.fromIdx = -1
        self._hx_from = _hx_from
        self.to = to
        self.fromIdx = Alphabets.INDEX_MAP.get(self._hx_from)
        self.toIdx = Alphabets.INDEX_MAP.get(self.to)
        if ((self.fromIdx < 0) or ((self.toIdx < 0))):
            raise haxe_Exception.thrown("key not supported for this language")

    def pushString(self,_hx_str):
        self.lastAlpha = None
        _this = self.result
        s = Std.string(_hx_str)
        _this.b.write(s)

    def pushName(self,name):
        conf = Alphabets.ALPHABETS.get(name)
        idx = Alphabets.INDEX_MAP.get(self.to)
        _hx_str = (conf.alpha[idx] if idx >= 0 and idx < len(conf.alpha) else None)
        if (((self.to == LANG_KEYS.arabic) and ((conf.tp == TYPES.VOWELS))) and (((self.lastAlpha is None) or ((self.lastAlpha.tp == TYPES.VOWELS))))):
            _this = self.result
            s = Std.string(python_internal_ArrayImpl._get(Alphabets.ALPHABETS.get(NAMES.HEMZE).alpha, self.toIdx))
            _this.b.write(s)
        self.lastAlpha = conf
        _this = self.result
        s = Std.string(_hx_str)
        _this.b.write(s)

    def move(self,indent):
        def _hx_local_2():
            _hx_local_0 = self
            _hx_local_1 = _hx_local_0.index
            _hx_local_0.index = (_hx_local_1 + indent)
            return _hx_local_0.index
        a = _hx_local_2()
        b = (len(self.text) - 1)
        a1 = (a if (python_lib_Math.isnan(a)) else (b if (python_lib_Math.isnan(b)) else min(a,b)))
        def _hx_local_4():
            _hx_local_3 = (a1 if (python_lib_Math.isnan(a1)) else (0 if (python_lib_Math.isnan(0)) else max(a1,0)))
            if (Std.isOfType(_hx_local_3,Int) or ((_hx_local_3 is None))):
                _hx_local_3
            else:
                raise "Class cast error"
            return _hx_local_3
        self.index = _hx_local_4()

    def isFinished(self):
        return (self.index == ((len(self.text) - 1)))

    def getChar(self,indent = None):
        if (indent is None):
            indent = 0
        _this = self.text
        index = (self.index + indent)
        ch = ("" if (((index < 0) or ((index >= len(_this))))) else _this[index])
        if ((ch is None) or ((ch == ""))):
            return None
        return ch

    def getAlphabet(self,ch):
        conf = Alphabets.ALPHABETS.iterator()
        while conf.hasNext():
            conf1 = conf.next()
            idx = Alphabets.INDEX_MAP.get(self._hx_from)
            if ((conf1.alpha[idx] if idx >= 0 and idx < len(conf1.alpha) else None) == ch):
                return conf1
        return None

    def handleUyghur(self):
        if (self._hx_from == LANG_KEYS.latin):
            if (self.chNext == "h"):
                if (self.chCurr == "c"):
                    self.pushName(NAMES.CH)
                    self.move(1)
                    return
                elif (self.chCurr == "g"):
                    self.pushName(NAMES.GH)
                    self.move(1)
                    return
                elif (self.chCurr == "s"):
                    chLastLast = self.getChar(-2)
                    alphaLastLast = self.getAlphabet(chLastLast)
                    if ((self.chLast == "i") and ((alphaLastLast is None))):
                        self.pushName(NAMES.S)
                        return
                    self.pushName(NAMES.SH)
                    self.move(1)
                    return
                elif (self.chCurr == "z"):
                    self.pushName(NAMES.J)
                    self.move(1)
                    return
            elif (self.chNext == "g"):
                if (self.chCurr == "n"):
                    chNextNext = self.getChar(2)
                    chLastLast = self.getChar(-2)
                    alphaNextNext = self.getAlphabet(chNextNext)
                    alphaLastLast = self.getAlphabet(chLastLast)
                    if (chNextNext == "h"):
                        self.pushName(NAMES.N)
                        return
                    elif ((chNextNext == chLastLast) or ((alphaNextNext.tp == TYPES.CONSONANTS))):
                        self.pushName(NAMES.NG)
                        self.move(1)
                        return
                    self.pushName(NAMES.N)
                    return
        elif (self._hx_from == LANG_KEYS.arabic):
            if (self.chCurr == "ئ"):
                if ((self.chLast is None) or StringTools.isSpace(self.chLast,0)):
                    return
        alpha = self.getAlphabet(self.chCurr)
        if (alpha is not None):
            self.pushName(alpha.nm)
        else:
            self.pushString(self.chCurr)

    def process(self):
        self.chLast = self.getChar(-1)
        self.chCurr = self.getChar(0)
        self.chNext = self.getChar(1)
        self.handleUyghur()
        if (not self.isFinished()):
            self.move(1)
            self.process()

    def convert(self,text):
        self.text = text
        self.index = 0
        self.result = StringBuf()
        self.lastAlpha = None
        self.process()
        return self.result.b.getvalue()

    @staticmethod
    def work(_hx_from,to,text):
        fromLang = Type.createEnum(LANG_KEYS,_hx_from,None)
        toLang = Type.createEnum(LANG_KEYS,to,None)
        converter = Converter(fromLang,toLang)
        result = converter.convert(text)
        return result



class Keyboard:
    _hx_class_name = "Keyboard"
    __slots__ = ()
    _hx_statics = ["toAlphabet", "fromAlphabet"]

    @staticmethod
    def toAlphabet(alphabet,isSHiftPressed):
        if (len(alphabet) != 1):
            return None
        index = (2 if isSHiftPressed else 1)
        _hx_map = _Tools_Tools_Fields_.KEYCODES
        _g_map = _hx_map
        _g_keys = _hx_map.keys()
        while _g_keys.hasNext():
            key = _g_keys.next()
            _g1_value = _g_map.get(key)
            _g1_key = key
            _ = _g1_key
            values = _g1_value
            if ((values[index] if index >= 0 and index < len(values) else None) != alphabet):
                continue
            return (values[0] if 0 < len(values) else None)
        return None

    @staticmethod
    def fromAlphabet(alphabet,isSHiftPressed):
        if (len(alphabet) != 1):
            return None
        index = (2 if isSHiftPressed else 1)
        _hx_map = _Tools_Tools_Fields_.KEYCODES
        _g_map = _hx_map
        _g_keys = _hx_map.keys()
        while _g_keys.hasNext():
            key = _g_keys.next()
            _g1_value = _g_map.get(key)
            _g1_key = key
            _ = _g1_key
            values = _g1_value
            if ((values[0] if 0 < len(values) else None) != alphabet):
                continue
            return (values[index] if index >= 0 and index < len(values) else None)
        return None


class Numbers:
    _hx_class_name = "Numbers"
    __slots__ = ()
    _hx_statics = ["valid", "COMPLETE", "ZERO", "TEN", "TEN_SUFFIX", "HUNDRED", "HUNDRED_SUFFIX", "NAMES_1", "NAMES_10", "NAMES_N", "NAMES_N_SUFFIX", "getNumName", "getTenTimes", "getHundredTimes", "getHighTimes", "appendNumTimes", "processRead", "appendFloatSuffix", "read", "processWrite", "write"]

    @staticmethod
    def getNumName(num):
        if (num == 0):
            return ""
        else:
            return python_internal_ArrayImpl._get(Numbers.NAMES_1, (num - 1))

    @staticmethod
    def getTenTimes(num):
        if (num == 0):
            return ""
        else:
            return python_internal_ArrayImpl._get(Numbers.NAMES_10, (num - 1))

    @staticmethod
    def getHundredTimes(text,num):
        if (len(text) == 0):
            return text
        else:
            return ((("null" if text is None else text) + " ") + HxOverrides.stringOrNull(Numbers.HUNDRED))

    @staticmethod
    def getHighTimes(text,times):
        if (not Numbers.valid):
            return text
        else:
            return ((("null" if text is None else text) + " ") + HxOverrides.stringOrNull(python_internal_ArrayImpl._get(Numbers.NAMES_N, times)))

    @staticmethod
    def appendNumTimes(times,num,text):
        times1 = times
        if (times1 == 2):
            return Numbers.getTenTimes(num)
        elif (times1 == 3):
            return Numbers.getHundredTimes(text,num)
        elif (times1 == 4):
            return Numbers.getHighTimes(text,0)
        elif (times1 == 5):
            return Numbers.getTenTimes(num)
        elif (times1 == 6):
            return Numbers.getHundredTimes(text,num)
        elif (times1 == 7):
            return Numbers.getHighTimes(text,1)
        elif (times1 == 8):
            return Numbers.getTenTimes(num)
        elif (times1 == 9):
            return Numbers.getHundredTimes(text,num)
        elif (times1 == 10):
            return Numbers.getHighTimes(text,2)
        elif (times1 == 11):
            return Numbers.getTenTimes(num)
        elif (times1 == 12):
            return Numbers.getHundredTimes(text,num)
        elif (times1 == 13):
            return Numbers.getHighTimes(text,3)
        elif (times1 == 14):
            return Numbers.getTenTimes(num)
        elif (times1 == 15):
            return Numbers.getHundredTimes(text,num)
        elif (times1 == 16):
            return Numbers.getHighTimes(text,5)
        elif (times1 == 17):
            return Numbers.getTenTimes(num)
        elif (times1 == 18):
            return Numbers.getHundredTimes(text,num)
        else:
            return text

    @staticmethod
    def processRead(num):
        if (num <= 0):
            return Numbers.ZERO
        result = list()
        times = 0
        while (num > 0):
            times = (times + 1)
            n = HxOverrides.mod(num, 10)
            t = HxOverrides.mod(num, 1000)
            s = Numbers.getNumName(n)
            Numbers.valid = (t > 0)
            s = Numbers.appendNumTimes(times,n,s)
            if (len(s) > 0):
                x = StringTools.trim(s)
                result.insert(0, x)
            num1 = None
            try:
                num1 = int((((num - n)) / 10))
            except BaseException as _g:
                None
                num1 = None
            num = num1
        return " ".join([python_Boot.toString1(x1,'') for x1 in result])

    @staticmethod
    def appendFloatSuffix(text):
        end = Numbers.TEN
        if text.endswith(end):
            text = (("null" if text is None else text) + HxOverrides.stringOrNull(Numbers.TEN_SUFFIX))
        else:
            end = Numbers.HUNDRED
            if text.endswith(end):
                text = (("null" if text is None else text) + HxOverrides.stringOrNull(Numbers.HUNDRED_SUFFIX))
        _g_current = 0
        _g_array = Numbers.NAMES_N
        while (_g_current < len(_g_array)):
            _g1_value = (_g_array[_g_current] if _g_current >= 0 and _g_current < len(_g_array) else None)
            _g1_key = _g_current
            _g_current = (_g_current + 1)
            k = _g1_key
            v = _g1_value
            if text.endswith(v):
                text = (("null" if text is None else text) + HxOverrides.stringOrNull(python_internal_ArrayImpl._get(Numbers.NAMES_N_SUFFIX, k)))
        start = python_internal_ArrayImpl._get(Numbers.NAMES_1, 0)
        if text.startswith(start):
            text = StringTools.replace(text,python_internal_ArrayImpl._get(Numbers.NAMES_1, 0),"")
        return StringTools.trim(text)

    @staticmethod
    def read(text):
        text = StringTools.trim(text)
        num = Std.parseFloat(text)
        _hx_str = Std.string(num)
        if (_hx_str == "nan"):
            return ""
        nums = Alphabets.splitByDelimiter(Std.string(num),".")
        if (len(nums) == 1):
            num1 = Std.parseInt((nums[0] if 0 < len(nums) else None))
            return Numbers.processRead(num1)
        else:
            num1 = Std.parseInt((nums[0] if 0 < len(nums) else None))
            num2 = Std.parseInt((nums[1] if 1 < len(nums) else None))
            x = Math.pow(10,len((nums[1] if 1 < len(nums) else None)))
            numx = None
            try:
                numx = int(x)
            except BaseException as _g:
                None
                numx = None
            text1 = Numbers.processRead(num1)
            text2 = Numbers.processRead(num2)
            textX = Numbers.processRead(numx)
            return ((((((("null" if text1 is None else text1) + " ") + HxOverrides.stringOrNull(Numbers.COMPLETE)) + " ") + HxOverrides.stringOrNull(Numbers.appendFloatSuffix(textX))) + " ") + ("null" if text2 is None else text2))

    @staticmethod
    def processWrite(words):
        result = 0
        length = len(words)
        power = 1
        times = 1
        if (length == 0):
            return ""
        while (length > 0):
            length = (length - 1)
            word = (words[length] if length >= 0 and length < len(words) else None)
            isPower = False
            _g_current = 0
            _g_array = Numbers.NAMES_N
            while (_g_current < len(_g_array)):
                _g1_value = (_g_array[_g_current] if _g_current >= 0 and _g_current < len(_g_array) else None)
                _g1_key = _g_current
                _g_current = (_g_current + 1)
                k = _g1_key
                v = _g1_value
                if (v == word):
                    x = Math.pow(10,(((k + 1)) * 3))
                    try:
                        power = int(x)
                    except BaseException as _g:
                        None
                        power = None
                    times = 1
                    isPower = True
                    break
            if isPower:
                continue
            if (word == Numbers.HUNDRED):
                times = 100
                continue
            num = 0
            _g_current1 = 0
            _g_array1 = Numbers.NAMES_1
            while (_g_current1 < len(_g_array1)):
                _g1_value1 = (_g_array1[_g_current1] if _g_current1 >= 0 and _g_current1 < len(_g_array1) else None)
                _g1_key1 = _g_current1
                _g_current1 = (_g_current1 + 1)
                k1 = _g1_key1
                v1 = _g1_value1
                if (v1 == word):
                    num = (k1 + 1)
            _g_current2 = 0
            _g_array2 = Numbers.NAMES_10
            while (_g_current2 < len(_g_array2)):
                _g1_value2 = (_g_array2[_g_current2] if _g_current2 >= 0 and _g_current2 < len(_g_array2) else None)
                _g1_key2 = _g_current2
                _g_current2 = (_g_current2 + 1)
                k2 = _g1_key2
                v2 = _g1_value2
                if (v2 == word):
                    num = (k2 + 1)
                    times = 10
            result1 = None
            try:
                result1 = int(((num * power) * times))
            except BaseException as _g1:
                None
                result1 = None
            result = (result + result1)
        return Std.string(result)

    @staticmethod
    def write(text):
        words = Alphabets.splitByDelimiter(text," ")
        dotIndex = -1
        _g_current = 0
        _g_array = words
        while (_g_current < len(_g_array)):
            _g1_value = (_g_array[_g_current] if _g_current >= 0 and _g_current < len(_g_array) else None)
            _g1_key = _g_current
            _g_current = (_g_current + 1)
            k = _g1_key
            v = _g1_value
            if (v == Numbers.COMPLETE):
                dotIndex = k
                break
        endIndex = (dotIndex + 1)
        parseWord = python_internal_ArrayImpl._get(words, (dotIndex + 1))
        power = 0
        start = python_internal_ArrayImpl._get(Numbers.NAMES_10, 0)
        if parseWord.startswith(start):
            power = 1
            end = python_internal_ArrayImpl._get(Numbers.NAMES_N_SUFFIX, 0)
            if (not parseWord.endswith(end)):
                endIndex = ((dotIndex + 1) + 1)
                parseWord = (words[endIndex] if endIndex >= 0 and endIndex < len(words) else None)
        else:
            start = Numbers.HUNDRED
            if parseWord.startswith(start):
                power = 2
                end = Numbers.HUNDRED_SUFFIX
                if (not parseWord.endswith(end)):
                    endIndex = ((dotIndex + 1) + 1)
                    parseWord = (words[endIndex] if endIndex >= 0 and endIndex < len(words) else None)
        if ((power == 0) or ((endIndex > ((dotIndex + 1))))):
            _g_current = 0
            _g_array = Numbers.NAMES_N
            while (_g_current < len(_g_array)):
                _g1_value = (_g_array[_g_current] if _g_current >= 0 and _g_current < len(_g_array) else None)
                _g1_key = _g_current
                _g_current = (_g_current + 1)
                k = _g1_key
                v = _g1_value
                if parseWord.startswith(v):
                    power1 = None
                    try:
                        power1 = int((((k + 1)) * 3))
                    except BaseException as _g:
                        None
                        power1 = None
                    power = (power + power1)
        if ((dotIndex < 0) or ((power < 1))):
            return Numbers.processWrite(words)
        else:
            left = Numbers.processWrite(words[0:dotIndex])
            right = Numbers.processWrite(words[(endIndex + 1):len(words)])
            temp = StringTools.lpad(right,"0",power)
            return ((("null" if left is None else left) + ".") + ("null" if temp is None else temp))

class UyHarp(Enum):
    __slots__ = ()
    _hx_class_name = "UyHarp"
    _hx_constructs = ["BASH", "YALGHUZ", "OTTURA", "AHIR"]
UyHarp.BASH = UyHarp("BASH", 0, ())
UyHarp.YALGHUZ = UyHarp("YALGHUZ", 1, ())
UyHarp.OTTURA = UyHarp("OTTURA", 2, ())
UyHarp.AHIR = UyHarp("AHIR", 3, ())


class _Tools_LA_Class:
    _hx_class_name = "_Tools.LA_Class"
    __slots__ = ("base1", "base2", "ex")
    _hx_fields = ["base1", "base2", "ex"]

    def __init__(self,base1,base2,ex):
        self.ex = None
        self.base2 = None
        self.base1 = None
        self.base1 = base1
        self.base2 = base2
        self.ex = ex



class Reshaper:
    _hx_class_name = "Reshaper"
    __slots__ = ()
    _hx_methods = ["containsInArray", "stringToArray", "stringToMap", "arrayToString", "ProLA_HAMZE", "getExChar", "toExttended", "toBasical"]
    _hx_statics = ["toExt", "toBase"]

    def __init__(self):
        pass

    def containsInArray(self,arr,s):
        _g_current = 0
        _g_array = arr
        while (_g_current < len(_g_array)):
            _g1_value = (_g_array[_g_current] if _g_current >= 0 and _g_current < len(_g_array) else None)
            _g1_key = _g_current
            _g_current = (_g_current + 1)
            key = _g1_key
            val = _g1_value
            if (val == s):
                return key
        return -1

    def stringToArray(self,_hx_str):
        arr = []
        _g = 0
        _g1 = len(_hx_str)
        while (_g < _g1):
            key = _g
            _g = (_g + 1)
            x = HxString.substr(_hx_str,key,1)
            arr.append(x)
        return arr

    def stringToMap(self,_hx_str):
        arr = haxe_ds_IntMap()
        _g = 0
        _g1 = len(_hx_str)
        while (_g < _g1):
            key = _g
            _g = (_g + 1)
            v = HxString.substr(_hx_str,key,1)
            arr.set(key,v)
        return arr

    def arrayToString(self,arr):
        res_b = python_lib_io_StringIO()
        _g_current = 0
        _g_array = arr
        while (_g_current < len(_g_array)):
            _g1_value = (_g_array[_g_current] if _g_current >= 0 and _g_current < len(_g_array) else None)
            _g1_key = _g_current
            _g_current = (_g_current + 1)
            key = _g1_key
            val = _g1_value
            res_b.write(Std.string(val))
        return res_b.getvalue()

    def ProLA_HAMZE(self,aWord):
        arr = self.stringToArray(aWord)
        _hx_map = self.stringToMap(aWord)
        result = []
        skipNext = False
        _g_current = 0
        _g_array = arr
        while (_g_current < len(_g_array)):
            _g1_value = (_g_array[_g_current] if _g_current >= 0 and _g_current < len(_g_array) else None)
            _g1_key = _g_current
            _g_current = (_g_current + 1)
            i = _g1_key
            v = _g1_value
            if (i == ((len(arr) - 1))):
                continue
            elif skipNext:
                skipNext = False
                continue
            elif ((_hx_map.h.get(i,None) == _Tools_Tools_Fields_.la1.base2) and ((_hx_map.h.get((i + 1),None) == _Tools_Tools_Fields_.la1.base1))):
                x = _Tools_Tools_Fields_.la1.ex
                result.append(x)
                skipNext = True
            elif ((_hx_map.h.get(i,None) == _Tools_Tools_Fields_.la2.base2) and ((_hx_map.h.get((i + 1),None) == _Tools_Tools_Fields_.la2.base1))):
                x1 = _Tools_Tools_Fields_.la2.ex
                result.append(x1)
                skipNext = True
            else:
                x2 = _hx_map.h.get(i,None)
                result.append(x2)
        if (len(aWord) < 2):
            result.append(aWord)
        elif (not (((_hx_map.h.get((len(arr) - 2),None) == _Tools_Tools_Fields_.la1.base1) and ((_hx_map.h.get((len(arr) - 1),None) == _Tools_Tools_Fields_.la1.base2))))):
            if (not (((_hx_map.h.get((len(arr) - 2),None) == _Tools_Tools_Fields_.la2.base1) and ((_hx_map.h.get((len(arr) - 1),None) == _Tools_Tools_Fields_.la2.base2))))):
                x = _hx_map.h.get((len(arr) - 1),None)
                result.append(x)
        return self.arrayToString(result)

    def getExChar(self,character,alphabet):
        index = self.containsInArray(_Tools_Tools_Fields_.ALPHABET_BASE,character)
        if (index > -1):
            if (alphabet == UyHarp.BASH):
                return python_internal_ArrayImpl._get(_Tools_Tools_Fields_.ALPHABET_EXT_BEGIN, index)
            elif (alphabet == UyHarp.OTTURA):
                return python_internal_ArrayImpl._get(_Tools_Tools_Fields_.ALPHABET_EXT_MIDDLE, index)
            elif (alphabet == UyHarp.AHIR):
                return python_internal_ArrayImpl._get(_Tools_Tools_Fields_.ALPHABET_EXT_END, index)
            elif (alphabet == UyHarp.YALGHUZ):
                return python_internal_ArrayImpl._get(_Tools_Tools_Fields_.ALPHABET_EXT_SINGLE, index)
        return character

    def toExttended(self,text):
        if (len(text) == 0):
            return ""
        array = self.stringToArray(text)
        _hx_map = self.stringToMap(text)
        result = []
        if (len(text) == 1):
            index = self.containsInArray(_Tools_Tools_Fields_.ALPHABET_BASE,text)
            if (index == -1):
                return ""
            else:
                return python_internal_ArrayImpl._get(_Tools_Tools_Fields_.ALPHABET_EXT_SINGLE, index)
        if (len(text) == 2):
            char1 = _hx_map.h.get(1,None)
            char2 = _hx_map.h.get(2,None)
            if (self.containsInArray(_Tools_Tools_Fields_.ALPHABET_FRIENDLY,char1) > -1):
                char1Ext = self.getExChar(char1,UyHarp.BASH)
                char2Ext = self.getExChar(char2,UyHarp.AHIR)
                return (("null" if char1Ext is None else char1Ext) + ("null" if char2Ext is None else char2Ext))
        firstChar = _hx_map.h.get(0,None)
        firstCharExt = self.getExChar(firstChar,UyHarp.BASH)
        result.append(firstCharExt)
        _g_current = 0
        _g_array = array
        while (_g_current < len(_g_array)):
            _g1_value = (_g_array[_g_current] if _g_current >= 0 and _g_current < len(_g_array) else None)
            _g1_key = _g_current
            _g_current = (_g_current + 1)
            i = _g1_key
            v = _g1_value
            if ((i == 0) or ((i == ((len(array) - 1))))):
                continue
            lastChar = _hx_map.h.get((i - 1),None)
            currentChar = _hx_map.h.get(i,None)
            nextChar = _hx_map.h.get((i + 1),None)
            lastCharIndex = self.containsInArray(_Tools_Tools_Fields_.ALPHABET_BASE,lastChar)
            currentIndex = self.containsInArray(_Tools_Tools_Fields_.ALPHABET_BASE,currentChar)
            nextIndex = self.containsInArray(_Tools_Tools_Fields_.ALPHABET_BASE,nextChar)
            currentCharExt = None
            if (currentIndex == -1):
                currentCharExt = currentChar
            elif (self.containsInArray(_Tools_Tools_Fields_.ALPHABET_FRIENDLY,lastChar) > -1):
                if (nextIndex > -1):
                    currentCharExt = self.getExChar(currentChar,UyHarp.OTTURA)
                else:
                    currentCharExt = self.getExChar(currentChar,UyHarp.AHIR)
            elif (nextIndex > -1):
                currentCharExt = self.getExChar(currentChar,UyHarp.BASH)
            else:
                currentCharExt = self.getExChar(currentChar,UyHarp.YALGHUZ)
            result.append(currentCharExt)
        solKolExt = None
        if (self.containsInArray(_Tools_Tools_Fields_.ALPHABET_FRIENDLY,_hx_map.h.get((len(array) - 2),None)) > -1):
            solKolExt = self.getExChar(_hx_map.h.get((len(array) - 1),None),UyHarp.AHIR)
        else:
            solKolExt = self.getExChar(_hx_map.h.get((len(array) - 1),None),UyHarp.YALGHUZ)
        result.append(solKolExt)
        result.reverse()
        _hx_str = self.arrayToString(result)
        return self.ProLA_HAMZE(_hx_str)

    def toBasical(self,text):
        if (len(text) == 0):
            return ""
        _hx_map = _Tools_Tools_Fields_.REPLACE_MAP
        _g_map = _hx_map
        _g_keys = _hx_map.keys()
        while _g_keys.hasNext():
            key = _g_keys.next()
            _g1_value = _g_map.get(key)
            _g1_key = key
            key1 = _g1_key
            val = _g1_value
            text = StringTools.replace(text,key1,val)
        array = self.stringToArray(text)
        _hx_map = self.stringToMap(text)
        result = []
        _g_current = 0
        _g_array = array
        while (_g_current < len(_g_array)):
            _g1_value = (_g_array[_g_current] if _g_current >= 0 and _g_current < len(_g_array) else None)
            _g1_key = _g_current
            _g_current = (_g_current + 1)
            i = _g1_key
            v = _g1_value
            base = _hx_map.h.get(i,None)
            _g2_current = 0
            _g2_array = _Tools_Tools_Fields_.ALPHABET_BASE
            while (_g2_current < len(_g2_array)):
                _g3_value = (_g2_array[_g2_current] if _g2_current >= 0 and _g2_current < len(_g2_array) else None)
                _g3_key = _g2_current
                _g2_current = (_g2_current + 1)
                j = _g3_key
                w = _g3_value
                isA = (python_internal_ArrayImpl._get(_Tools_Tools_Fields_.ALPHABET_EXT_END, j) == _hx_map.h.get(i,None))
                isB = (python_internal_ArrayImpl._get(_Tools_Tools_Fields_.ALPHABET_EXT_BEGIN, j) == _hx_map.h.get(i,None))
                isO = (python_internal_ArrayImpl._get(_Tools_Tools_Fields_.ALPHABET_EXT_MIDDLE, j) == _hx_map.h.get(i,None))
                isY = (python_internal_ArrayImpl._get(_Tools_Tools_Fields_.ALPHABET_EXT_SINGLE, j) == _hx_map.h.get(i,None))
                if (((isA or isB) or isO) or isY):
                    base = python_internal_ArrayImpl._get(_Tools_Tools_Fields_.ALPHABET_BASE, j)
                    break
            result.append(base)
        result.reverse()
        return self.arrayToString(result)

    @staticmethod
    def toExt(text):
        return Reshaper().toExttended(text)

    @staticmethod
    def toBase(text):
        return Reshaper().toBasical(text)



class Syllable:
    _hx_class_name = "Syllable"
    __slots__ = ("blocks", "text", "index", "chLastLast", "chLast", "chCurr", "chNext", "chNextNext", "alphaLast", "alphaCurr", "alphaNext")
    _hx_fields = ["blocks", "text", "index", "chLastLast", "chLast", "chCurr", "chNext", "chNextNext", "alphaLast", "alphaCurr", "alphaNext"]
    _hx_methods = ["getChar", "getAlphabet", "isType", "pushBuf", "pushChar", "handle", "process", "convert"]
    _hx_statics = ["parse"]

    def __init__(self):
        self.alphaNext = None
        self.alphaCurr = None
        self.alphaLast = None
        self.chNextNext = None
        self.chNext = None
        self.chCurr = None
        self.chLast = None
        self.chLastLast = None
        self.index = 0
        self.text = ""
        self.blocks = list()

    def getChar(self,indent = None):
        if (indent is None):
            indent = 0
        _this = self.text
        index = (self.index + indent)
        ch = ("" if (((index < 0) or ((index >= len(_this))))) else _this[index])
        if (ch == ""):
            return None
        return ch

    def getAlphabet(self,ch):
        conf = Alphabets.ALPHABETS.iterator()
        while conf.hasNext():
            conf1 = conf.next()
            idx = Alphabets.INDEX_MAP.get(LANG_KEYS.arabic)
            if ((conf1.alpha[idx] if idx >= 0 and idx < len(conf1.alpha) else None) == ch):
                return conf1
        return None

    def isType(self,tp,indent = None):
        if (indent is None):
            indent = 0
        _this = self.text
        index = (self.index + indent)
        ch = ("" if (((index < 0) or ((index >= len(_this))))) else _this[index])
        if ((ch is None) or ((ch == ""))):
            return False
        alpha = self.getAlphabet(ch)
        if (alpha is None):
            return False
        return (alpha.tp == tp)

    def pushBuf(self):
        python_internal_ArrayImpl._set(self.blocks, len(self.blocks), StringBuf())

    def pushChar(self,ch):
        _this = python_internal_ArrayImpl._get(self.blocks, (len(self.blocks) - 1))
        s = Std.string(ch)
        _this.b.write(s)

    def handle(self):
        if (len(self.blocks) == 0):
            self.pushBuf()
            self.pushChar(self.chCurr)
        elif (self.isType(TYPES.MARKS,0) and ((self.alphaLast is not None))):
            self.pushBuf()
            self.pushChar(self.chCurr)
        elif (self.isType(TYPES.CONSONANTS,0) and self.isType(TYPES.VOWELS,1)):
            self.pushBuf()
            self.pushChar(self.chCurr)
        else:
            self.pushChar(self.chCurr)

    def process(self):
        self.chLastLast = self.getChar(-2)
        self.chLast = self.getChar(-1)
        self.chCurr = self.getChar(0)
        self.chNext = self.getChar(1)
        self.chNextNext = self.getChar(2)
        self.alphaLast = self.getAlphabet(self.chLast)
        self.alphaCurr = self.getAlphabet(self.chCurr)
        self.alphaNext = self.getAlphabet(self.chNext)
        self.handle()
        if (self.index < ((len(self.text) - 1))):
            _hx_local_0 = self
            _hx_local_1 = _hx_local_0.index
            _hx_local_0.index = (_hx_local_1 + 1)
            _hx_local_1
            self.process()

    def convert(self,text):
        self.text = text
        self.index = 0
        self.process()
        _this = self.blocks
        return " ".join([python_Boot.toString1(x1,'') for x1 in _this])

    @staticmethod
    def parse(text):
        text = Alphabets.replaceAllSpecials(text," ")
        words = Alphabets.splitByDelimiter(text)
        r = StringBuf()
        _g = 0
        while (_g < len(words)):
            word = (words[_g] if _g >= 0 and _g < len(words) else None)
            _g = (_g + 1)
            syllable = Syllable()
            temp = syllable.convert(word)
            if (r.get_length() != 0):
                r.b.write(" | ")
            s = Std.string(temp)
            r.b.write(s)
        return r.b.getvalue()



class Tools:
    _hx_class_name = "Tools"
    __slots__ = ()
    _hx_statics = ["toExtended", "fromExtended", "toCommon", "toCyrillic", "toLatin", "fromCommon", "fromCyrillic", "fromLatin", "toAlphabet", "fromAlphabet", "doSyllable", "readNumber", "writeNumber", "main"]

    @staticmethod
    def toExtended(text):
        return Reshaper.toExt(text)

    @staticmethod
    def fromExtended(text):
        return Reshaper.toBase(text)

    @staticmethod
    def toCommon(text):
        return Converter.work("arabic","common",text)

    @staticmethod
    def toCyrillic(text):
        return Converter.work("arabic","cyrillic",text)

    @staticmethod
    def toLatin(text):
        return Converter.work("arabic","latin",text)

    @staticmethod
    def fromCommon(text):
        return Converter.work("common","arabic",text)

    @staticmethod
    def fromCyrillic(text):
        return Converter.work("cyrillic","arabic",text)

    @staticmethod
    def fromLatin(text):
        return Converter.work("arabic","latin",text)

    @staticmethod
    def toAlphabet(text,isSHiftPressed):
        return Keyboard.toAlphabet(text,isSHiftPressed)

    @staticmethod
    def fromAlphabet(alphabet,isSHiftPressed):
        return Keyboard.fromAlphabet(alphabet,isSHiftPressed)

    @staticmethod
    def doSyllable(text):
        return Syllable.parse(text)

    @staticmethod
    def readNumber(text):
        return Numbers.read(text)

    @staticmethod
    def writeNumber(text):
        return Numbers.write(text)

    @staticmethod
    def main():
        haxe_Log.trace("\n\n--->TEST:",_hx_AnonObject({'fileName': "Tools.hx", 'lineNumber': 1347, 'className': "Tools", 'methodName': "main"}))
        haxe_Log.trace("converter:",_hx_AnonObject({'fileName': "Tools.hx", 'lineNumber': 1350, 'className': "Tools", 'methodName': "main"}))
        origin = "ئالىمجان ۋە ئەسئەتجان سۇ تۇتتى."
        haxe_Log.trace("origin",_hx_AnonObject({'fileName': "Tools.hx", 'lineNumber': 1352, 'className': "Tools", 'methodName': "main", 'customParams': [origin]}))
        result = Tools.toCommon(origin)
        haxe_Log.trace("result",_hx_AnonObject({'fileName': "Tools.hx", 'lineNumber': 1354, 'className': "Tools", 'methodName': "main", 'customParams': [result]}))
        reverse = Tools.fromCommon(result)
        haxe_Log.trace("reverse",_hx_AnonObject({'fileName': "Tools.hx", 'lineNumber': 1356, 'className': "Tools", 'methodName': "main", 'customParams': [reverse]}))
        haxe_Log.trace("alphabet:",_hx_AnonObject({'fileName': "Tools.hx", 'lineNumber': 1359, 'className': "Tools", 'methodName': "main"}))
        origin = "گ"
        haxe_Log.trace("origin",_hx_AnonObject({'fileName': "Tools.hx", 'lineNumber': 1361, 'className': "Tools", 'methodName': "main", 'customParams': [origin]}))
        result = Tools.toAlphabet(origin,True)
        haxe_Log.trace("result",_hx_AnonObject({'fileName': "Tools.hx", 'lineNumber': 1363, 'className': "Tools", 'methodName': "main", 'customParams': [result]}))
        reverse = Tools.fromAlphabet(result,True)
        haxe_Log.trace("reverse",_hx_AnonObject({'fileName': "Tools.hx", 'lineNumber': 1365, 'className': "Tools", 'methodName': "main", 'customParams': [reverse]}))
        haxe_Log.trace("numbers:",_hx_AnonObject({'fileName': "Tools.hx", 'lineNumber': 1368, 'className': "Tools", 'methodName': "main"}))
        origin = "123.40110001"
        haxe_Log.trace("origin",_hx_AnonObject({'fileName': "Tools.hx", 'lineNumber': 1370, 'className': "Tools", 'methodName': "main", 'customParams': [origin]}))
        result = Tools.readNumber(origin)
        haxe_Log.trace("result",_hx_AnonObject({'fileName': "Tools.hx", 'lineNumber': 1372, 'className': "Tools", 'methodName': "main", 'customParams': [result]}))
        reverse = Tools.writeNumber(result)
        haxe_Log.trace("reverse",_hx_AnonObject({'fileName': "Tools.hx", 'lineNumber': 1374, 'className': "Tools", 'methodName': "main", 'customParams': [reverse]}))
        haxe_Log.trace("reshaper:",_hx_AnonObject({'fileName': "Tools.hx", 'lineNumber': 1377, 'className': "Tools", 'methodName': "main"}))
        origin = "جەمئىيەت"
        haxe_Log.trace("origin",_hx_AnonObject({'fileName': "Tools.hx", 'lineNumber': 1379, 'className': "Tools", 'methodName': "main", 'customParams': [origin]}))
        result = Tools.toExtended(origin)
        haxe_Log.trace("result",_hx_AnonObject({'fileName': "Tools.hx", 'lineNumber': 1381, 'className': "Tools", 'methodName': "main", 'customParams': [result]}))
        reverse = Tools.fromExtended(result)
        haxe_Log.trace("reverse",_hx_AnonObject({'fileName': "Tools.hx", 'lineNumber': 1383, 'className': "Tools", 'methodName': "main", 'customParams': [reverse]}))
        haxe_Log.trace("syllable:",_hx_AnonObject({'fileName': "Tools.hx", 'lineNumber': 1386, 'className': "Tools", 'methodName': "main"}))
        origin = "ئاھلىرىم"
        haxe_Log.trace("origin",_hx_AnonObject({'fileName': "Tools.hx", 'lineNumber': 1388, 'className': "Tools", 'methodName': "main", 'customParams': [origin]}))
        result = Tools.doSyllable(origin)
        haxe_Log.trace("result",_hx_AnonObject({'fileName': "Tools.hx", 'lineNumber': 1390, 'className': "Tools", 'methodName': "main", 'customParams': [result]}))
        reverse = StringTools.replace(result," ","")
        haxe_Log.trace("reverse",_hx_AnonObject({'fileName': "Tools.hx", 'lineNumber': 1392, 'className': "Tools", 'methodName': "main", 'customParams': [reverse]}))


class _Tools_Tools_Fields_:
    _hx_class_name = "_Tools.Tools_Fields_"
    __slots__ = ()
    _hx_statics = ["KEYCODES", "ALPHABET_BASE", "ALPHABET_EXT_BEGIN", "ALPHABET_EXT_SINGLE", "ALPHABET_EXT_MIDDLE", "ALPHABET_EXT_END", "ALPHABET_FRIENDLY", "REPLACE_MAP", "la1", "la2"]


class Type:
    _hx_class_name = "Type"
    __slots__ = ()
    _hx_statics = ["createEnum"]

    @staticmethod
    def createEnum(e,constr,params = None):
        f = Reflect.field(e,constr)
        if (f is None):
            raise haxe_Exception.thrown(("No such constructor " + ("null" if constr is None else constr)))
        if Reflect.isFunction(f):
            if (params is None):
                raise haxe_Exception.thrown((("Constructor " + ("null" if constr is None else constr)) + " need parameters"))
            return Reflect.callMethod(e,f,params)
        if ((params is not None) and ((len(params) != 0))):
            raise haxe_Exception.thrown((("Constructor " + ("null" if constr is None else constr)) + " does not need parameters"))
        return f


class haxe_IMap:
    _hx_class_name = "haxe.IMap"
    __slots__ = ()
    _hx_methods = ["get", "keys"]


class haxe_Exception(Exception):
    _hx_class_name = "haxe.Exception"
    __slots__ = ("_hx___nativeStack", "_hx___skipStack", "_hx___nativeException", "_hx___previousException")
    _hx_fields = ["__nativeStack", "__skipStack", "__nativeException", "__previousException"]
    _hx_methods = ["unwrap", "get_native"]
    _hx_statics = ["caught", "thrown"]
    _hx_interfaces = []
    _hx_super = Exception


    def __init__(self,message,previous = None,native = None):
        self._hx___previousException = None
        self._hx___nativeException = None
        self._hx___nativeStack = None
        self._hx___skipStack = 0
        super().__init__(message)
        self._hx___previousException = previous
        if ((native is not None) and Std.isOfType(native,BaseException)):
            self._hx___nativeException = native
            self._hx___nativeStack = haxe_NativeStackTrace.exceptionStack()
        else:
            self._hx___nativeException = self
            infos = python_lib_Traceback.extract_stack()
            if (len(infos) != 0):
                infos.pop()
            infos.reverse()
            self._hx___nativeStack = infos

    def unwrap(self):
        return self._hx___nativeException

    def get_native(self):
        return self._hx___nativeException

    @staticmethod
    def caught(value):
        if Std.isOfType(value,haxe_Exception):
            return value
        elif Std.isOfType(value,BaseException):
            return haxe_Exception(str(value),None,value)
        else:
            return haxe_ValueException(value,None,value)

    @staticmethod
    def thrown(value):
        if Std.isOfType(value,haxe_Exception):
            return value.get_native()
        elif Std.isOfType(value,BaseException):
            return value
        else:
            e = haxe_ValueException(value)
            e._hx___skipStack = (e._hx___skipStack + 1)
            return e



class haxe_Log:
    _hx_class_name = "haxe.Log"
    __slots__ = ()
    _hx_statics = ["formatOutput", "trace"]

    @staticmethod
    def formatOutput(v,infos):
        _hx_str = Std.string(v)
        if (infos is None):
            return _hx_str
        pstr = ((HxOverrides.stringOrNull(infos.fileName) + ":") + Std.string(infos.lineNumber))
        if (Reflect.field(infos,"customParams") is not None):
            _g = 0
            _g1 = Reflect.field(infos,"customParams")
            while (_g < len(_g1)):
                v = (_g1[_g] if _g >= 0 and _g < len(_g1) else None)
                _g = (_g + 1)
                _hx_str = (("null" if _hx_str is None else _hx_str) + ((", " + Std.string(v))))
        return ((("null" if pstr is None else pstr) + ": ") + ("null" if _hx_str is None else _hx_str))

    @staticmethod
    def trace(v,infos = None):
        _hx_str = haxe_Log.formatOutput(v,infos)
        str1 = Std.string(_hx_str)
        python_Lib.printString((("" + ("null" if str1 is None else str1)) + HxOverrides.stringOrNull(python_Lib.lineEnd)))


class haxe_NativeStackTrace:
    _hx_class_name = "haxe.NativeStackTrace"
    __slots__ = ()
    _hx_statics = ["saveStack", "exceptionStack"]

    @staticmethod
    def saveStack(exception):
        pass

    @staticmethod
    def exceptionStack():
        exc = python_lib_Sys.exc_info()
        if (exc[2] is not None):
            infos = python_lib_Traceback.extract_tb(exc[2])
            infos.reverse()
            return infos
        else:
            return []


class haxe_ValueException(haxe_Exception):
    _hx_class_name = "haxe.ValueException"
    __slots__ = ("value",)
    _hx_fields = ["value"]
    _hx_methods = ["unwrap"]
    _hx_statics = []
    _hx_interfaces = []
    _hx_super = haxe_Exception


    def __init__(self,value,previous = None,native = None):
        self.value = None
        super().__init__(Std.string(value),previous,native)
        self.value = value

    def unwrap(self):
        return self.value



class haxe_ds_BalancedTree:
    _hx_class_name = "haxe.ds.BalancedTree"
    __slots__ = ("root",)
    _hx_fields = ["root"]
    _hx_methods = ["set", "get", "iterator", "keys", "setLoop", "keysLoop", "balance", "compare"]
    _hx_statics = ["iteratorLoop"]
    _hx_interfaces = [haxe_IMap]

    def __init__(self):
        self.root = None

    def set(self,key,value):
        self.root = self.setLoop(key,value,self.root)

    def get(self,key):
        node = self.root
        while (node is not None):
            c = self.compare(key,node.key)
            if (c == 0):
                return node.value
            if (c < 0):
                node = node.left
            else:
                node = node.right
        return None

    def iterator(self):
        ret = []
        haxe_ds_BalancedTree.iteratorLoop(self.root,ret)
        return haxe_iterators_ArrayIterator(ret)

    def keys(self):
        ret = []
        self.keysLoop(self.root,ret)
        return haxe_iterators_ArrayIterator(ret)

    def setLoop(self,k,v,node):
        if (node is None):
            return haxe_ds_TreeNode(None,k,v,None)
        c = self.compare(k,node.key)
        if (c == 0):
            return haxe_ds_TreeNode(node.left,k,v,node.right,(0 if ((node is None)) else node._height))
        elif (c < 0):
            nl = self.setLoop(k,v,node.left)
            return self.balance(nl,node.key,node.value,node.right)
        else:
            nr = self.setLoop(k,v,node.right)
            return self.balance(node.left,node.key,node.value,nr)

    def keysLoop(self,node,acc):
        if (node is not None):
            self.keysLoop(node.left,acc)
            x = node.key
            acc.append(x)
            self.keysLoop(node.right,acc)

    def balance(self,l,k,v,r):
        hl = (0 if ((l is None)) else l._height)
        hr = (0 if ((r is None)) else r._height)
        if (hl > ((hr + 2))):
            _this = l.left
            _this1 = l.right
            if (((0 if ((_this is None)) else _this._height)) >= ((0 if ((_this1 is None)) else _this1._height))):
                return haxe_ds_TreeNode(l.left,l.key,l.value,haxe_ds_TreeNode(l.right,k,v,r))
            else:
                return haxe_ds_TreeNode(haxe_ds_TreeNode(l.left,l.key,l.value,l.right.left),l.right.key,l.right.value,haxe_ds_TreeNode(l.right.right,k,v,r))
        elif (hr > ((hl + 2))):
            _this = r.right
            _this1 = r.left
            if (((0 if ((_this is None)) else _this._height)) > ((0 if ((_this1 is None)) else _this1._height))):
                return haxe_ds_TreeNode(haxe_ds_TreeNode(l,k,v,r.left),r.key,r.value,r.right)
            else:
                return haxe_ds_TreeNode(haxe_ds_TreeNode(l,k,v,r.left.left),r.left.key,r.left.value,haxe_ds_TreeNode(r.left.right,r.key,r.value,r.right))
        else:
            return haxe_ds_TreeNode(l,k,v,r,(((hl if ((hl > hr)) else hr)) + 1))

    def compare(self,k1,k2):
        return Reflect.compare(k1,k2)

    @staticmethod
    def iteratorLoop(node,acc):
        if (node is not None):
            haxe_ds_BalancedTree.iteratorLoop(node.left,acc)
            x = node.value
            acc.append(x)
            haxe_ds_BalancedTree.iteratorLoop(node.right,acc)



class haxe_ds_TreeNode:
    _hx_class_name = "haxe.ds.TreeNode"
    __slots__ = ("left", "right", "key", "value", "_height")
    _hx_fields = ["left", "right", "key", "value", "_height"]

    def __init__(self,l,k,v,r,h = None):
        if (h is None):
            h = -1
        self._height = None
        self.left = l
        self.key = k
        self.value = v
        self.right = r
        if (h == -1):
            tmp = None
            _this = self.left
            _this1 = self.right
            if (((0 if ((_this is None)) else _this._height)) > ((0 if ((_this1 is None)) else _this1._height))):
                _this = self.left
                tmp = (0 if ((_this is None)) else _this._height)
            else:
                _this = self.right
                tmp = (0 if ((_this is None)) else _this._height)
            self._height = (tmp + 1)
        else:
            self._height = h



class haxe_ds_EnumValueMap(haxe_ds_BalancedTree):
    _hx_class_name = "haxe.ds.EnumValueMap"
    __slots__ = ()
    _hx_fields = []
    _hx_methods = ["compare", "compareArgs", "compareArg"]
    _hx_statics = []
    _hx_interfaces = [haxe_IMap]
    _hx_super = haxe_ds_BalancedTree


    def __init__(self):
        super().__init__()

    def compare(self,k1,k2):
        d = (k1.index - k2.index)
        if (d != 0):
            return d
        p1 = list(k1.params)
        p2 = list(k2.params)
        if ((len(p1) == 0) and ((len(p2) == 0))):
            return 0
        return self.compareArgs(p1,p2)

    def compareArgs(self,a1,a2):
        ld = (len(a1) - len(a2))
        if (ld != 0):
            return ld
        _g = 0
        _g1 = len(a1)
        while (_g < _g1):
            i = _g
            _g = (_g + 1)
            d = self.compareArg((a1[i] if i >= 0 and i < len(a1) else None),(a2[i] if i >= 0 and i < len(a2) else None))
            if (d != 0):
                return d
        return 0

    def compareArg(self,v1,v2):
        if (Reflect.isEnumValue(v1) and Reflect.isEnumValue(v2)):
            return self.compare(v1,v2)
        elif (Std.isOfType(v1,list) and Std.isOfType(v2,list)):
            return self.compareArgs(v1,v2)
        else:
            return Reflect.compare(v1,v2)



class haxe_ds_IntMap:
    _hx_class_name = "haxe.ds.IntMap"
    __slots__ = ("h",)
    _hx_fields = ["h"]
    _hx_methods = ["set", "get", "keys"]
    _hx_interfaces = [haxe_IMap]

    def __init__(self):
        self.h = dict()

    def set(self,key,value):
        self.h[key] = value

    def get(self,key):
        return self.h.get(key,None)

    def keys(self):
        return python_HaxeIterator(iter(self.h.keys()))



class haxe_ds_StringMap:
    _hx_class_name = "haxe.ds.StringMap"
    __slots__ = ("h",)
    _hx_fields = ["h"]
    _hx_methods = ["get", "keys"]
    _hx_interfaces = [haxe_IMap]

    def __init__(self):
        self.h = dict()

    def get(self,key):
        return self.h.get(key,None)

    def keys(self):
        return python_HaxeIterator(iter(self.h.keys()))



class haxe_iterators_ArrayIterator:
    _hx_class_name = "haxe.iterators.ArrayIterator"
    __slots__ = ("array", "current")
    _hx_fields = ["array", "current"]
    _hx_methods = ["hasNext", "next"]

    def __init__(self,array):
        self.current = 0
        self.array = array

    def hasNext(self):
        return (self.current < len(self.array))

    def next(self):
        def _hx_local_3():
            def _hx_local_2():
                _hx_local_0 = self
                _hx_local_1 = _hx_local_0.current
                _hx_local_0.current = (_hx_local_1 + 1)
                return _hx_local_1
            return python_internal_ArrayImpl._get(self.array, _hx_local_2())
        return _hx_local_3()



class haxe_iterators_ArrayKeyValueIterator:
    _hx_class_name = "haxe.iterators.ArrayKeyValueIterator"
    __slots__ = ("current", "array")
    _hx_fields = ["current", "array"]
    _hx_methods = ["hasNext", "next"]

    def __init__(self,array):
        self.current = 0
        self.array = array

    def hasNext(self):
        return (self.current < len(self.array))

    def next(self):
        def _hx_local_3():
            def _hx_local_2():
                _hx_local_0 = self
                _hx_local_1 = _hx_local_0.current
                _hx_local_0.current = (_hx_local_1 + 1)
                return _hx_local_1
            return _hx_AnonObject({'value': python_internal_ArrayImpl._get(self.array, self.current), 'key': _hx_local_2()})
        return _hx_local_3()



class python_Boot:
    _hx_class_name = "python.Boot"
    __slots__ = ()
    _hx_statics = ["keywords", "toString1", "fields", "simpleField", "hasField", "field", "getInstanceFields", "getSuperClass", "getClassFields", "prefixLength", "unhandleKeywords"]

    @staticmethod
    def toString1(o,s):
        if (o is None):
            return "null"
        if isinstance(o,str):
            return o
        if (s is None):
            s = ""
        if (len(s) >= 5):
            return "<...>"
        if isinstance(o,bool):
            if o:
                return "true"
            else:
                return "false"
        if (isinstance(o,int) and (not isinstance(o,bool))):
            return str(o)
        if isinstance(o,float):
            try:
                if (o == int(o)):
                    return str(Math.floor((o + 0.5)))
                else:
                    return str(o)
            except BaseException as _g:
                None
                return str(o)
        if isinstance(o,list):
            o1 = o
            l = len(o1)
            st = "["
            s = (("null" if s is None else s) + "\t")
            _g = 0
            _g1 = l
            while (_g < _g1):
                i = _g
                _g = (_g + 1)
                prefix = ""
                if (i > 0):
                    prefix = ","
                st = (("null" if st is None else st) + HxOverrides.stringOrNull(((("null" if prefix is None else prefix) + HxOverrides.stringOrNull(python_Boot.toString1((o1[i] if i >= 0 and i < len(o1) else None),s))))))
            st = (("null" if st is None else st) + "]")
            return st
        try:
            if hasattr(o,"toString"):
                return o.toString()
        except BaseException as _g:
            None
        if hasattr(o,"__class__"):
            if isinstance(o,_hx_AnonObject):
                toStr = None
                try:
                    fields = python_Boot.fields(o)
                    _g = []
                    _g1 = 0
                    while (_g1 < len(fields)):
                        f = (fields[_g1] if _g1 >= 0 and _g1 < len(fields) else None)
                        _g1 = (_g1 + 1)
                        x = ((("" + ("null" if f is None else f)) + " : ") + HxOverrides.stringOrNull(python_Boot.toString1(python_Boot.simpleField(o,f),(("null" if s is None else s) + "\t"))))
                        _g.append(x)
                    fieldsStr = _g
                    toStr = (("{ " + HxOverrides.stringOrNull(", ".join([x1 for x1 in fieldsStr]))) + " }")
                except BaseException as _g:
                    None
                    return "{ ... }"
                if (toStr is None):
                    return "{ ... }"
                else:
                    return toStr
            if isinstance(o,Enum):
                o1 = o
                l = len(o1.params)
                hasParams = (l > 0)
                if hasParams:
                    paramsStr = ""
                    _g = 0
                    _g1 = l
                    while (_g < _g1):
                        i = _g
                        _g = (_g + 1)
                        prefix = ""
                        if (i > 0):
                            prefix = ","
                        paramsStr = (("null" if paramsStr is None else paramsStr) + HxOverrides.stringOrNull(((("null" if prefix is None else prefix) + HxOverrides.stringOrNull(python_Boot.toString1(o1.params[i],s))))))
                    return (((HxOverrides.stringOrNull(o1.tag) + "(") + ("null" if paramsStr is None else paramsStr)) + ")")
                else:
                    return o1.tag
            if hasattr(o,"_hx_class_name"):
                if (o.__class__.__name__ != "type"):
                    fields = python_Boot.getInstanceFields(o)
                    _g = []
                    _g1 = 0
                    while (_g1 < len(fields)):
                        f = (fields[_g1] if _g1 >= 0 and _g1 < len(fields) else None)
                        _g1 = (_g1 + 1)
                        x = ((("" + ("null" if f is None else f)) + " : ") + HxOverrides.stringOrNull(python_Boot.toString1(python_Boot.simpleField(o,f),(("null" if s is None else s) + "\t"))))
                        _g.append(x)
                    fieldsStr = _g
                    toStr = (((HxOverrides.stringOrNull(o._hx_class_name) + "( ") + HxOverrides.stringOrNull(", ".join([x1 for x1 in fieldsStr]))) + " )")
                    return toStr
                else:
                    fields = python_Boot.getClassFields(o)
                    _g = []
                    _g1 = 0
                    while (_g1 < len(fields)):
                        f = (fields[_g1] if _g1 >= 0 and _g1 < len(fields) else None)
                        _g1 = (_g1 + 1)
                        x = ((("" + ("null" if f is None else f)) + " : ") + HxOverrides.stringOrNull(python_Boot.toString1(python_Boot.simpleField(o,f),(("null" if s is None else s) + "\t"))))
                        _g.append(x)
                    fieldsStr = _g
                    toStr = (((("#" + HxOverrides.stringOrNull(o._hx_class_name)) + "( ") + HxOverrides.stringOrNull(", ".join([x1 for x1 in fieldsStr]))) + " )")
                    return toStr
            if ((type(o) == type) and (o == str)):
                return "#String"
            if ((type(o) == type) and (o == list)):
                return "#Array"
            if callable(o):
                return "function"
            try:
                if hasattr(o,"__repr__"):
                    return o.__repr__()
            except BaseException as _g:
                None
            if hasattr(o,"__str__"):
                return o.__str__([])
            if hasattr(o,"__name__"):
                return o.__name__
            return "???"
        else:
            return str(o)

    @staticmethod
    def fields(o):
        a = []
        if (o is not None):
            if hasattr(o,"_hx_fields"):
                fields = o._hx_fields
                if (fields is not None):
                    return list(fields)
            if isinstance(o,_hx_AnonObject):
                d = o.__dict__
                keys = d.keys()
                handler = python_Boot.unhandleKeywords
                for k in keys:
                    if (k != '_hx_disable_getattr'):
                        a.append(handler(k))
            elif hasattr(o,"__dict__"):
                d = o.__dict__
                keys1 = d.keys()
                for k in keys1:
                    a.append(k)
        return a

    @staticmethod
    def simpleField(o,field):
        if (field is None):
            return None
        field1 = (("_hx_" + field) if ((field in python_Boot.keywords)) else (("_hx_" + field) if (((((len(field) > 2) and ((ord(field[0]) == 95))) and ((ord(field[1]) == 95))) and ((ord(field[(len(field) - 1)]) != 95)))) else field))
        if hasattr(o,field1):
            return getattr(o,field1)
        else:
            return None

    @staticmethod
    def hasField(o,field):
        if isinstance(o,_hx_AnonObject):
            return o._hx_hasattr(field)
        return hasattr(o,(("_hx_" + field) if ((field in python_Boot.keywords)) else (("_hx_" + field) if (((((len(field) > 2) and ((ord(field[0]) == 95))) and ((ord(field[1]) == 95))) and ((ord(field[(len(field) - 1)]) != 95)))) else field)))

    @staticmethod
    def field(o,field):
        if (field is None):
            return None
        if isinstance(o,str):
            field1 = field
            _hx_local_0 = len(field1)
            if (_hx_local_0 == 10):
                if (field1 == "charCodeAt"):
                    return python_internal_MethodClosure(o,HxString.charCodeAt)
                else:
                    field1 = (("_hx_" + field) if ((field in python_Boot.keywords)) else (("_hx_" + field) if (((((len(field) > 2) and ((ord(field[0]) == 95))) and ((ord(field[1]) == 95))) and ((ord(field[(len(field) - 1)]) != 95)))) else field))
                    if hasattr(o,field1):
                        return getattr(o,field1)
                    else:
                        return None
            elif (_hx_local_0 == 11):
                if (field1 == "lastIndexOf"):
                    return python_internal_MethodClosure(o,HxString.lastIndexOf)
                elif (field1 == "toLowerCase"):
                    return python_internal_MethodClosure(o,HxString.toLowerCase)
                elif (field1 == "toUpperCase"):
                    return python_internal_MethodClosure(o,HxString.toUpperCase)
                else:
                    field1 = (("_hx_" + field) if ((field in python_Boot.keywords)) else (("_hx_" + field) if (((((len(field) > 2) and ((ord(field[0]) == 95))) and ((ord(field[1]) == 95))) and ((ord(field[(len(field) - 1)]) != 95)))) else field))
                    if hasattr(o,field1):
                        return getattr(o,field1)
                    else:
                        return None
            elif (_hx_local_0 == 9):
                if (field1 == "substring"):
                    return python_internal_MethodClosure(o,HxString.substring)
                else:
                    field1 = (("_hx_" + field) if ((field in python_Boot.keywords)) else (("_hx_" + field) if (((((len(field) > 2) and ((ord(field[0]) == 95))) and ((ord(field[1]) == 95))) and ((ord(field[(len(field) - 1)]) != 95)))) else field))
                    if hasattr(o,field1):
                        return getattr(o,field1)
                    else:
                        return None
            elif (_hx_local_0 == 5):
                if (field1 == "split"):
                    return python_internal_MethodClosure(o,HxString.split)
                else:
                    field1 = (("_hx_" + field) if ((field in python_Boot.keywords)) else (("_hx_" + field) if (((((len(field) > 2) and ((ord(field[0]) == 95))) and ((ord(field[1]) == 95))) and ((ord(field[(len(field) - 1)]) != 95)))) else field))
                    if hasattr(o,field1):
                        return getattr(o,field1)
                    else:
                        return None
            elif (_hx_local_0 == 7):
                if (field1 == "indexOf"):
                    return python_internal_MethodClosure(o,HxString.indexOf)
                else:
                    field1 = (("_hx_" + field) if ((field in python_Boot.keywords)) else (("_hx_" + field) if (((((len(field) > 2) and ((ord(field[0]) == 95))) and ((ord(field[1]) == 95))) and ((ord(field[(len(field) - 1)]) != 95)))) else field))
                    if hasattr(o,field1):
                        return getattr(o,field1)
                    else:
                        return None
            elif (_hx_local_0 == 8):
                if (field1 == "toString"):
                    return python_internal_MethodClosure(o,HxString.toString)
                else:
                    field1 = (("_hx_" + field) if ((field in python_Boot.keywords)) else (("_hx_" + field) if (((((len(field) > 2) and ((ord(field[0]) == 95))) and ((ord(field[1]) == 95))) and ((ord(field[(len(field) - 1)]) != 95)))) else field))
                    if hasattr(o,field1):
                        return getattr(o,field1)
                    else:
                        return None
            elif (_hx_local_0 == 6):
                if (field1 == "charAt"):
                    return python_internal_MethodClosure(o,HxString.charAt)
                elif (field1 == "length"):
                    return len(o)
                elif (field1 == "substr"):
                    return python_internal_MethodClosure(o,HxString.substr)
                else:
                    field1 = (("_hx_" + field) if ((field in python_Boot.keywords)) else (("_hx_" + field) if (((((len(field) > 2) and ((ord(field[0]) == 95))) and ((ord(field[1]) == 95))) and ((ord(field[(len(field) - 1)]) != 95)))) else field))
                    if hasattr(o,field1):
                        return getattr(o,field1)
                    else:
                        return None
            else:
                field1 = (("_hx_" + field) if ((field in python_Boot.keywords)) else (("_hx_" + field) if (((((len(field) > 2) and ((ord(field[0]) == 95))) and ((ord(field[1]) == 95))) and ((ord(field[(len(field) - 1)]) != 95)))) else field))
                if hasattr(o,field1):
                    return getattr(o,field1)
                else:
                    return None
        elif isinstance(o,list):
            field1 = field
            _hx_local_1 = len(field1)
            if (_hx_local_1 == 11):
                if (field1 == "lastIndexOf"):
                    return python_internal_MethodClosure(o,python_internal_ArrayImpl.lastIndexOf)
                else:
                    field1 = (("_hx_" + field) if ((field in python_Boot.keywords)) else (("_hx_" + field) if (((((len(field) > 2) and ((ord(field[0]) == 95))) and ((ord(field[1]) == 95))) and ((ord(field[(len(field) - 1)]) != 95)))) else field))
                    if hasattr(o,field1):
                        return getattr(o,field1)
                    else:
                        return None
            elif (_hx_local_1 == 4):
                if (field1 == "copy"):
                    return python_internal_MethodClosure(o,python_internal_ArrayImpl.copy)
                elif (field1 == "join"):
                    return python_internal_MethodClosure(o,python_internal_ArrayImpl.join)
                elif (field1 == "push"):
                    return python_internal_MethodClosure(o,python_internal_ArrayImpl.push)
                elif (field1 == "sort"):
                    return python_internal_MethodClosure(o,python_internal_ArrayImpl.sort)
                else:
                    field1 = (("_hx_" + field) if ((field in python_Boot.keywords)) else (("_hx_" + field) if (((((len(field) > 2) and ((ord(field[0]) == 95))) and ((ord(field[1]) == 95))) and ((ord(field[(len(field) - 1)]) != 95)))) else field))
                    if hasattr(o,field1):
                        return getattr(o,field1)
                    else:
                        return None
            elif (_hx_local_1 == 5):
                if (field1 == "shift"):
                    return python_internal_MethodClosure(o,python_internal_ArrayImpl.shift)
                elif (field1 == "slice"):
                    return python_internal_MethodClosure(o,python_internal_ArrayImpl.slice)
                else:
                    field1 = (("_hx_" + field) if ((field in python_Boot.keywords)) else (("_hx_" + field) if (((((len(field) > 2) and ((ord(field[0]) == 95))) and ((ord(field[1]) == 95))) and ((ord(field[(len(field) - 1)]) != 95)))) else field))
                    if hasattr(o,field1):
                        return getattr(o,field1)
                    else:
                        return None
            elif (_hx_local_1 == 7):
                if (field1 == "indexOf"):
                    return python_internal_MethodClosure(o,python_internal_ArrayImpl.indexOf)
                elif (field1 == "reverse"):
                    return python_internal_MethodClosure(o,python_internal_ArrayImpl.reverse)
                elif (field1 == "unshift"):
                    return python_internal_MethodClosure(o,python_internal_ArrayImpl.unshift)
                else:
                    field1 = (("_hx_" + field) if ((field in python_Boot.keywords)) else (("_hx_" + field) if (((((len(field) > 2) and ((ord(field[0]) == 95))) and ((ord(field[1]) == 95))) and ((ord(field[(len(field) - 1)]) != 95)))) else field))
                    if hasattr(o,field1):
                        return getattr(o,field1)
                    else:
                        return None
            elif (_hx_local_1 == 3):
                if (field1 == "map"):
                    return python_internal_MethodClosure(o,python_internal_ArrayImpl.map)
                elif (field1 == "pop"):
                    return python_internal_MethodClosure(o,python_internal_ArrayImpl.pop)
                else:
                    field1 = (("_hx_" + field) if ((field in python_Boot.keywords)) else (("_hx_" + field) if (((((len(field) > 2) and ((ord(field[0]) == 95))) and ((ord(field[1]) == 95))) and ((ord(field[(len(field) - 1)]) != 95)))) else field))
                    if hasattr(o,field1):
                        return getattr(o,field1)
                    else:
                        return None
            elif (_hx_local_1 == 8):
                if (field1 == "contains"):
                    return python_internal_MethodClosure(o,python_internal_ArrayImpl.contains)
                elif (field1 == "iterator"):
                    return python_internal_MethodClosure(o,python_internal_ArrayImpl.iterator)
                elif (field1 == "toString"):
                    return python_internal_MethodClosure(o,python_internal_ArrayImpl.toString)
                else:
                    field1 = (("_hx_" + field) if ((field in python_Boot.keywords)) else (("_hx_" + field) if (((((len(field) > 2) and ((ord(field[0]) == 95))) and ((ord(field[1]) == 95))) and ((ord(field[(len(field) - 1)]) != 95)))) else field))
                    if hasattr(o,field1):
                        return getattr(o,field1)
                    else:
                        return None
            elif (_hx_local_1 == 16):
                if (field1 == "keyValueIterator"):
                    return python_internal_MethodClosure(o,python_internal_ArrayImpl.keyValueIterator)
                else:
                    field1 = (("_hx_" + field) if ((field in python_Boot.keywords)) else (("_hx_" + field) if (((((len(field) > 2) and ((ord(field[0]) == 95))) and ((ord(field[1]) == 95))) and ((ord(field[(len(field) - 1)]) != 95)))) else field))
                    if hasattr(o,field1):
                        return getattr(o,field1)
                    else:
                        return None
            elif (_hx_local_1 == 6):
                if (field1 == "concat"):
                    return python_internal_MethodClosure(o,python_internal_ArrayImpl.concat)
                elif (field1 == "filter"):
                    return python_internal_MethodClosure(o,python_internal_ArrayImpl.filter)
                elif (field1 == "insert"):
                    return python_internal_MethodClosure(o,python_internal_ArrayImpl.insert)
                elif (field1 == "length"):
                    return len(o)
                elif (field1 == "remove"):
                    return python_internal_MethodClosure(o,python_internal_ArrayImpl.remove)
                elif (field1 == "splice"):
                    return python_internal_MethodClosure(o,python_internal_ArrayImpl.splice)
                else:
                    field1 = (("_hx_" + field) if ((field in python_Boot.keywords)) else (("_hx_" + field) if (((((len(field) > 2) and ((ord(field[0]) == 95))) and ((ord(field[1]) == 95))) and ((ord(field[(len(field) - 1)]) != 95)))) else field))
                    if hasattr(o,field1):
                        return getattr(o,field1)
                    else:
                        return None
            else:
                field1 = (("_hx_" + field) if ((field in python_Boot.keywords)) else (("_hx_" + field) if (((((len(field) > 2) and ((ord(field[0]) == 95))) and ((ord(field[1]) == 95))) and ((ord(field[(len(field) - 1)]) != 95)))) else field))
                if hasattr(o,field1):
                    return getattr(o,field1)
                else:
                    return None
        else:
            field1 = (("_hx_" + field) if ((field in python_Boot.keywords)) else (("_hx_" + field) if (((((len(field) > 2) and ((ord(field[0]) == 95))) and ((ord(field[1]) == 95))) and ((ord(field[(len(field) - 1)]) != 95)))) else field))
            if hasattr(o,field1):
                return getattr(o,field1)
            else:
                return None

    @staticmethod
    def getInstanceFields(c):
        f = (list(c._hx_fields) if (hasattr(c,"_hx_fields")) else [])
        if hasattr(c,"_hx_methods"):
            f = (f + c._hx_methods)
        sc = python_Boot.getSuperClass(c)
        if (sc is None):
            return f
        else:
            scArr = python_Boot.getInstanceFields(sc)
            scMap = set(scArr)
            _g = 0
            while (_g < len(f)):
                f1 = (f[_g] if _g >= 0 and _g < len(f) else None)
                _g = (_g + 1)
                if (not (f1 in scMap)):
                    scArr.append(f1)
            return scArr

    @staticmethod
    def getSuperClass(c):
        if (c is None):
            return None
        try:
            if hasattr(c,"_hx_super"):
                return c._hx_super
            return None
        except BaseException as _g:
            None
        return None

    @staticmethod
    def getClassFields(c):
        if hasattr(c,"_hx_statics"):
            x = c._hx_statics
            return list(x)
        else:
            return []

    @staticmethod
    def unhandleKeywords(name):
        if (HxString.substr(name,0,python_Boot.prefixLength) == "_hx_"):
            real = HxString.substr(name,python_Boot.prefixLength,None)
            if (real in python_Boot.keywords):
                return real
        return name


class python_HaxeIterator:
    _hx_class_name = "python.HaxeIterator"
    __slots__ = ("it", "x", "has", "checked")
    _hx_fields = ["it", "x", "has", "checked"]
    _hx_methods = ["next", "hasNext"]

    def __init__(self,it):
        self.checked = False
        self.has = False
        self.x = None
        self.it = it

    def next(self):
        if (not self.checked):
            self.hasNext()
        self.checked = False
        return self.x

    def hasNext(self):
        if (not self.checked):
            try:
                self.x = self.it.__next__()
                self.has = True
            except BaseException as _g:
                None
                if Std.isOfType(haxe_Exception.caught(_g).unwrap(),StopIteration):
                    self.has = False
                    self.x = None
                else:
                    raise _g
            self.checked = True
        return self.has



class python_Lib:
    _hx_class_name = "python.Lib"
    __slots__ = ()
    _hx_statics = ["lineEnd", "printString"]

    @staticmethod
    def printString(_hx_str):
        encoding = "utf-8"
        if (encoding is None):
            encoding = "utf-8"
        python_lib_Sys.stdout.buffer.write(_hx_str.encode(encoding, "strict"))
        python_lib_Sys.stdout.flush()


class python_internal_ArrayImpl:
    _hx_class_name = "python.internal.ArrayImpl"
    __slots__ = ()
    _hx_statics = ["concat", "copy", "iterator", "keyValueIterator", "indexOf", "lastIndexOf", "join", "toString", "pop", "push", "unshift", "remove", "contains", "shift", "slice", "sort", "splice", "map", "filter", "insert", "reverse", "_get", "_set"]

    @staticmethod
    def concat(a1,a2):
        return (a1 + a2)

    @staticmethod
    def copy(x):
        return list(x)

    @staticmethod
    def iterator(x):
        return python_HaxeIterator(x.__iter__())

    @staticmethod
    def keyValueIterator(x):
        return haxe_iterators_ArrayKeyValueIterator(x)

    @staticmethod
    def indexOf(a,x,fromIndex = None):
        _hx_len = len(a)
        l = (0 if ((fromIndex is None)) else ((_hx_len + fromIndex) if ((fromIndex < 0)) else fromIndex))
        if (l < 0):
            l = 0
        _g = l
        _g1 = _hx_len
        while (_g < _g1):
            i = _g
            _g = (_g + 1)
            if HxOverrides.eq(a[i],x):
                return i
        return -1

    @staticmethod
    def lastIndexOf(a,x,fromIndex = None):
        _hx_len = len(a)
        l = (_hx_len if ((fromIndex is None)) else (((_hx_len + fromIndex) + 1) if ((fromIndex < 0)) else (fromIndex + 1)))
        if (l > _hx_len):
            l = _hx_len
        while True:
            l = (l - 1)
            tmp = l
            if (not ((tmp > -1))):
                break
            if HxOverrides.eq(a[l],x):
                return l
        return -1

    @staticmethod
    def join(x,sep):
        return sep.join([python_Boot.toString1(x1,'') for x1 in x])

    @staticmethod
    def toString(x):
        return (("[" + HxOverrides.stringOrNull(",".join([python_Boot.toString1(x1,'') for x1 in x]))) + "]")

    @staticmethod
    def pop(x):
        if (len(x) == 0):
            return None
        else:
            return x.pop()

    @staticmethod
    def push(x,e):
        x.append(e)
        return len(x)

    @staticmethod
    def unshift(x,e):
        x.insert(0, e)

    @staticmethod
    def remove(x,e):
        try:
            x.remove(e)
            return True
        except BaseException as _g:
            None
            return False

    @staticmethod
    def contains(x,e):
        return (e in x)

    @staticmethod
    def shift(x):
        if (len(x) == 0):
            return None
        return x.pop(0)

    @staticmethod
    def slice(x,pos,end = None):
        return x[pos:end]

    @staticmethod
    def sort(x,f):
        x.sort(key= python_lib_Functools.cmp_to_key(f))

    @staticmethod
    def splice(x,pos,_hx_len):
        if (pos < 0):
            pos = (len(x) + pos)
        if (pos < 0):
            pos = 0
        res = x[pos:(pos + _hx_len)]
        del x[pos:(pos + _hx_len)]
        return res

    @staticmethod
    def map(x,f):
        return list(map(f,x))

    @staticmethod
    def filter(x,f):
        return list(filter(f,x))

    @staticmethod
    def insert(a,pos,x):
        a.insert(pos, x)

    @staticmethod
    def reverse(a):
        a.reverse()

    @staticmethod
    def _get(x,idx):
        if ((idx > -1) and ((idx < len(x)))):
            return x[idx]
        else:
            return None

    @staticmethod
    def _set(x,idx,v):
        l = len(x)
        while (l < idx):
            x.append(None)
            l = (l + 1)
        if (l == idx):
            x.append(v)
        else:
            x[idx] = v
        return v


class HxOverrides:
    _hx_class_name = "HxOverrides"
    __slots__ = ()
    _hx_statics = ["eq", "stringOrNull", "modf", "mod"]

    @staticmethod
    def eq(a,b):
        if (isinstance(a,list) or isinstance(b,list)):
            return a is b
        return (a == b)

    @staticmethod
    def stringOrNull(s):
        if (s is None):
            return "null"
        else:
            return s

    @staticmethod
    def modf(a,b):
        if (b == 0.0):
            return float('nan')
        elif (a < 0):
            if (b < 0):
                return -(-a % (-b))
            else:
                return -(-a % b)
        elif (b < 0):
            return a % (-b)
        else:
            return a % b

    @staticmethod
    def mod(a,b):
        if (a < 0):
            if (b < 0):
                return -(-a % (-b))
            else:
                return -(-a % b)
        elif (b < 0):
            return a % (-b)
        else:
            return a % b


class python_internal_MethodClosure:
    _hx_class_name = "python.internal.MethodClosure"
    __slots__ = ("obj", "func")
    _hx_fields = ["obj", "func"]
    _hx_methods = ["__call__"]

    def __init__(self,obj,func):
        self.obj = obj
        self.func = func

    def __call__(self,*args):
        return self.func(self.obj,*args)



class HxString:
    _hx_class_name = "HxString"
    __slots__ = ()
    _hx_statics = ["split", "charCodeAt", "charAt", "lastIndexOf", "toUpperCase", "toLowerCase", "indexOf", "indexOfImpl", "toString", "substring", "substr"]

    @staticmethod
    def split(s,d):
        if (d == ""):
            return list(s)
        else:
            return s.split(d)

    @staticmethod
    def charCodeAt(s,index):
        if ((((s is None) or ((len(s) == 0))) or ((index < 0))) or ((index >= len(s)))):
            return None
        else:
            return ord(s[index])

    @staticmethod
    def charAt(s,index):
        if ((index < 0) or ((index >= len(s)))):
            return ""
        else:
            return s[index]

    @staticmethod
    def lastIndexOf(s,_hx_str,startIndex = None):
        if (startIndex is None):
            return s.rfind(_hx_str, 0, len(s))
        elif (_hx_str == ""):
            length = len(s)
            if (startIndex < 0):
                startIndex = (length + startIndex)
                if (startIndex < 0):
                    startIndex = 0
            if (startIndex > length):
                return length
            else:
                return startIndex
        else:
            i = s.rfind(_hx_str, 0, (startIndex + 1))
            startLeft = (max(0,((startIndex + 1) - len(_hx_str))) if ((i == -1)) else (i + 1))
            check = s.find(_hx_str, startLeft, len(s))
            if ((check > i) and ((check <= startIndex))):
                return check
            else:
                return i

    @staticmethod
    def toUpperCase(s):
        return s.upper()

    @staticmethod
    def toLowerCase(s):
        return s.lower()

    @staticmethod
    def indexOf(s,_hx_str,startIndex = None):
        if (startIndex is None):
            return s.find(_hx_str)
        else:
            return HxString.indexOfImpl(s,_hx_str,startIndex)

    @staticmethod
    def indexOfImpl(s,_hx_str,startIndex):
        if (_hx_str == ""):
            length = len(s)
            if (startIndex < 0):
                startIndex = (length + startIndex)
                if (startIndex < 0):
                    startIndex = 0
            if (startIndex > length):
                return length
            else:
                return startIndex
        return s.find(_hx_str, startIndex)

    @staticmethod
    def toString(s):
        return s

    @staticmethod
    def substring(s,startIndex,endIndex = None):
        if (startIndex < 0):
            startIndex = 0
        if (endIndex is None):
            return s[startIndex:]
        else:
            if (endIndex < 0):
                endIndex = 0
            if (endIndex < startIndex):
                return s[endIndex:startIndex]
            else:
                return s[startIndex:endIndex]

    @staticmethod
    def substr(s,startIndex,_hx_len = None):
        if (_hx_len is None):
            return s[startIndex:]
        else:
            if (_hx_len == 0):
                return ""
            if (startIndex < 0):
                startIndex = (len(s) + startIndex)
                if (startIndex < 0):
                    startIndex = 0
            return s[startIndex:(startIndex + _hx_len)]

Math.NEGATIVE_INFINITY = float("-inf")
Math.POSITIVE_INFINITY = float("inf")
Math.NaN = float("nan")
Math.PI = python_lib_Math.pi

def _hx_init_Alphabets_ALPHABETS():
    def _hx_local_0():
        _g = haxe_ds_EnumValueMap()
        _g.set(NAMES.HEMZE,_hx_AnonObject({'idx': 0, 'tp': TYPES.MARKS, 'ipa': "'", 'nm': NAMES.HEMZE, 'alpha': ["'", "ئ", "'", "'", "'"]}))
        _g.set(NAMES.COMMA,_hx_AnonObject({'idx': 0, 'tp': TYPES.MARKS, 'ipa': ",", 'nm': NAMES.COMMA, 'alpha': [",", "،", ",", ",", ","]}))
        _g.set(NAMES.EXCLA,_hx_AnonObject({'idx': 0, 'tp': TYPES.MARKS, 'ipa': "!", 'nm': NAMES.EXCLA, 'alpha': ["!", "!", "!", "!", "!"]}))
        _g.set(NAMES.QUESS,_hx_AnonObject({'idx': 0, 'tp': TYPES.MARKS, 'ipa': "?", 'nm': NAMES.QUESS, 'alpha': ["?", "؟", "?", "?", "?"]}))
        _g.set(NAMES.COLON,_hx_AnonObject({'idx': 0, 'tp': TYPES.MARKS, 'ipa': ";", 'nm': NAMES.COLON, 'alpha': [";", "؛", ";", ";", ";"]}))
        _g.set(NAMES.A,_hx_AnonObject({'idx': 1, 'tp': TYPES.VOWELS, 'ipa': "ɑ", 'nm': NAMES.A, 'alpha': ["a", "ا", "a", "a", "a"]}))
        _g.set(NAMES.AE,_hx_AnonObject({'idx': 2, 'tp': TYPES.VOWELS, 'ipa': "æ", 'nm': NAMES.AE, 'alpha': ["ä", "ە", "ә", "ə", "e"]}))
        _g.set(NAMES.O,_hx_AnonObject({'idx': 25, 'tp': TYPES.VOWELS, 'ipa': "", 'nm': NAMES.O, 'alpha': ["o", "و", "о", "o", "o"]}))
        _g.set(NAMES.U,_hx_AnonObject({'idx': 26, 'tp': TYPES.VOWELS, 'ipa': "", 'nm': NAMES.U, 'alpha': ["u", "ۇ", "у", "u", "u"]}))
        _g.set(NAMES.OO,_hx_AnonObject({'idx': 27, 'tp': TYPES.VOWELS, 'ipa': "", 'nm': NAMES.OO, 'alpha': ["ö", "ۆ", "ө", "ɵ", "ö"]}))
        _g.set(NAMES.UU,_hx_AnonObject({'idx': 28, 'tp': TYPES.VOWELS, 'ipa': "", 'nm': NAMES.UU, 'alpha': ["ü", "ۈ", "ү", "ü", "ü"]}))
        _g.set(NAMES.I,_hx_AnonObject({'idx': 31, 'tp': TYPES.VOWELS, 'ipa': "", 'nm': NAMES.I, 'alpha': ["i", "ى", "и", "i", "i"]}))
        _g.set(NAMES.E,_hx_AnonObject({'idx': 30, 'tp': TYPES.VOWELS, 'ipa': "", 'nm': NAMES.E, 'alpha': ["e", "ې", "е", "e", "ë"]}))
        _g.set(NAMES.B,_hx_AnonObject({'idx': 3, 'tp': TYPES.CONSONANTS, 'ipa': "b", 'nm': NAMES.B, 'alpha': ["b", "ب", "б", "b", "b"]}))
        _g.set(NAMES.P,_hx_AnonObject({'idx': 4, 'tp': TYPES.CONSONANTS, 'ipa': "p", 'nm': NAMES.P, 'alpha': ["p", "پ", "п", "p", "p"]}))
        _g.set(NAMES.T,_hx_AnonObject({'idx': 5, 'tp': TYPES.CONSONANTS, 'ipa': "t", 'nm': NAMES.T, 'alpha': ["t", "ت", "т", "t", "t"]}))
        _g.set(NAMES.DJ,_hx_AnonObject({'idx': 6, 'tp': TYPES.CONSONANTS, 'ipa': "dʒ", 'nm': NAMES.DJ, 'alpha': ["c", "ج", "җ", "j", "j"]}))
        _g.set(NAMES.CH,_hx_AnonObject({'idx': 7, 'tp': TYPES.CONSONANTS, 'ipa': "tʃ", 'nm': NAMES.CH, 'alpha': ["ç", "چ", "ч", "q", "ch"]}))
        _g.set(NAMES.X,_hx_AnonObject({'idx': 8, 'tp': TYPES.CONSONANTS, 'ipa': "x", 'nm': NAMES.X, 'alpha': ["x", "خ", "х", "h", "x"]}))
        _g.set(NAMES.D,_hx_AnonObject({'idx': 9, 'tp': TYPES.CONSONANTS, 'ipa': "d", 'nm': NAMES.D, 'alpha': ["d", "د", "д", "d", "d"]}))
        _g.set(NAMES.R,_hx_AnonObject({'idx': 10, 'tp': TYPES.CONSONANTS, 'ipa': "r", 'nm': NAMES.R, 'alpha': ["r", "ر", "р", "r", "r"]}))
        _g.set(NAMES.Z,_hx_AnonObject({'idx': 11, 'tp': TYPES.CONSONANTS, 'ipa': "z", 'nm': NAMES.Z, 'alpha': ["z", "ز", "з", "z", "z"]}))
        _g.set(NAMES.J,_hx_AnonObject({'idx': 12, 'tp': TYPES.CONSONANTS, 'ipa': "ʒ", 'nm': NAMES.J, 'alpha': ["j", "ژ", "ж", "ⱬ", "zh"]}))
        _g.set(NAMES.S,_hx_AnonObject({'idx': 13, 'tp': TYPES.CONSONANTS, 'ipa': "s", 'nm': NAMES.S, 'alpha': ["s", "س", "с", "s", "s"]}))
        _g.set(NAMES.SH,_hx_AnonObject({'idx': 14, 'tp': TYPES.CONSONANTS, 'ipa': "ʃ", 'nm': NAMES.SH, 'alpha': ["ş", "ش", "ш", "x", "sh"]}))
        _g.set(NAMES.GH,_hx_AnonObject({'idx': 15, 'tp': TYPES.CONSONANTS, 'ipa': "ɣ", 'nm': NAMES.GH, 'alpha': ["ğ", "غ", "ғ", "ƣ", "gh"]}))
        _g.set(NAMES.F,_hx_AnonObject({'idx': 16, 'tp': TYPES.CONSONANTS, 'ipa': "f", 'nm': NAMES.F, 'alpha': ["f", "ف", "ф", "f", "f"]}))
        _g.set(NAMES.Q,_hx_AnonObject({'idx': 17, 'tp': TYPES.CONSONANTS, 'ipa': "q", 'nm': NAMES.Q, 'alpha': ["q", "ق", "қ", "ⱪ", "q"]}))
        _g.set(NAMES.K,_hx_AnonObject({'idx': 18, 'tp': TYPES.CONSONANTS, 'ipa': "k", 'nm': NAMES.K, 'alpha': ["k", "ك", "к", "k", "k"]}))
        _g.set(NAMES.G,_hx_AnonObject({'idx': 19, 'tp': TYPES.CONSONANTS, 'ipa': "g", 'nm': NAMES.G, 'alpha': ["g", "گ", "г", "g", "g"]}))
        _g.set(NAMES.NG,_hx_AnonObject({'idx': 20, 'tp': TYPES.CONSONANTS, 'ipa': "ŋ", 'nm': NAMES.NG, 'alpha': ["ñ", "ڭ", "ң", "ng", "ng"]}))
        _g.set(NAMES.L,_hx_AnonObject({'idx': 21, 'tp': TYPES.CONSONANTS, 'ipa': "l", 'nm': NAMES.L, 'alpha': ["l", "ل", "л", "l", "l"]}))
        _g.set(NAMES.M,_hx_AnonObject({'idx': 22, 'tp': TYPES.CONSONANTS, 'ipa': "m", 'nm': NAMES.M, 'alpha': ["m", "م", "м", "m", "m"]}))
        _g.set(NAMES.N,_hx_AnonObject({'idx': 23, 'tp': TYPES.CONSONANTS, 'ipa': "n", 'nm': NAMES.N, 'alpha': ["n", "ن", "н", "n", "n"]}))
        _g.set(NAMES.H,_hx_AnonObject({'idx': 24, 'tp': TYPES.CONSONANTS, 'ipa': "h", 'nm': NAMES.H, 'alpha': ["h", "ھ", "һ", "ⱨ", "h"]}))
        _g.set(NAMES.V,_hx_AnonObject({'idx': 29, 'tp': TYPES.CONSONANTS, 'ipa': "v", 'nm': NAMES.V, 'alpha': ["v", "ۋ", "в", "v", "w"]}))
        _g.set(NAMES.Y,_hx_AnonObject({'idx': 32, 'tp': TYPES.CONSONANTS, 'ipa': "j", 'nm': NAMES.Y, 'alpha': ["y", "ي", "й", "y", "y"]}))
        _g.set(NAMES.YU,_hx_AnonObject({'idx': 0, 'tp': TYPES.COMPOUNDS, 'ipa': "ju", 'nm': NAMES.YU, 'alpha': ["yu", "ي‍‍ۇ", "ю", "yu", "yu"]}))
        _g.set(NAMES.YA,_hx_AnonObject({'idx': 0, 'tp': TYPES.COMPOUNDS, 'ipa': "jɑ", 'nm': NAMES.YA, 'alpha': ["ya", "ي‍‍ا", "я", "ya", "ya"]}))
        return _g
    return _hx_local_0()
Alphabets.ALPHABETS = _hx_init_Alphabets_ALPHABETS()
def _hx_init_Alphabets_INDEX_MAP():
    def _hx_local_0():
        _g = haxe_ds_EnumValueMap()
        _g.set(LANG_KEYS.common,0)
        _g.set(LANG_KEYS.arabic,1)
        _g.set(LANG_KEYS.cyrillic,2)
        _g.set(LANG_KEYS.newly,3)
        _g.set(LANG_KEYS.latin,4)
        return _g
    return _hx_local_0()
Alphabets.INDEX_MAP = _hx_init_Alphabets_INDEX_MAP()
Alphabets.SPECIALS_LIST = "\\\"!`'#%&,:;<>=@{}~$()*+/?[]^|؛،؟"
Numbers.valid = False
Numbers.COMPLETE = "پۈتۈن"
Numbers.ZERO = "نۆل"
Numbers.TEN = "ئون"
Numbers.TEN_SUFFIX = "دا"
Numbers.HUNDRED = "يۈز"
Numbers.HUNDRED_SUFFIX = "دە"
Numbers.NAMES_1 = ["بىر", "ئىككى", "ئۈچ", "تۆت", "بەش", "ئالتە", "يەتتە", "سەككىز", "توققۇز"]
Numbers.NAMES_10 = ["ئون", "يىگىرمە", "ئوتتۇز", "قىرىق", "ئەللىك", "ئاتمىش", "يەتمىش", "سەكسەن", "توقسان"]
Numbers.NAMES_N = ["مىڭ", "مىليون", "مىليارد", "تىرىليون", "تىرىليارد"]
Numbers.NAMES_N_SUFFIX = ["دا", "دا", "تا", "دا", "تا"]
def _hx_init__Tools_Tools_Fields__KEYCODES():
    def _hx_local_0():
        _g = haxe_ds_IntMap()
        _g.set(65,["a", "ھ", ""])
        _g.set(66,["b", "ب", ""])
        _g.set(67,["c", "غ", ""])
        _g.set(68,["d", "د", "ژ"])
        _g.set(69,["e", "ې", ""])
        _g.set(70,["f", "ا", "ف"])
        _g.set(71,["g", "ە", "گ"])
        _g.set(72,["h", "ى", "خ"])
        _g.set(73,["i", "ڭ", ""])
        _g.set(74,["j", "ق", "ج"])
        _g.set(75,["k", "ك", "ۆ"])
        _g.set(76,["l", "ل", "لا"])
        _g.set(77,["m", "م", ""])
        _g.set(78,["n", "ن", ""])
        _g.set(79,["o", "و", ""])
        _g.set(80,["p", "پ", ""])
        _g.set(81,["q", "چ", ""])
        _g.set(82,["r", "ر", ""])
        _g.set(83,["s", "س", ""])
        _g.set(84,["t", "ت", ""])
        _g.set(85,["u", "ۇ", ""])
        _g.set(86,["v", "ۈ", ""])
        _g.set(87,["w", "ۋ", ""])
        _g.set(88,["x", "ش", ""])
        _g.set(89,["y", "ي", ""])
        _g.set(90,["z", "ز", ""])
        _g.set(186,[";", "؛", ":"])
        _g.set(188,[",", "،", ">"])
        _g.set(191,["/", "ئ", "؟"])
        return _g
    return _hx_local_0()
_Tools_Tools_Fields_.KEYCODES = _hx_init__Tools_Tools_Fields__KEYCODES()
_Tools_Tools_Fields_.ALPHABET_BASE = ["ت", "پ", "ب", "ر", "د", "چ", "ج", "ز", "ف", "ق", "ك", "ش", "گ", "س", "ڭ", "ن", "م", "ۋ", "ل", "خ", "غ", "ژ", "ي", "ا", "ە", "و", "ۈ", "ۆ", "ۇ", "ې", "ى", "ھ", "ئ"]
_Tools_Tools_Fields_.ALPHABET_EXT_BEGIN = ["ﺗ", "ﭘ", "ﺑ", "ﺭ", "ﺩ", "ﭼ", "ﺟ", "ﺯ", "ﻓ", "ﻗ", "ﻛ", "ﺷ", "ﮔ", "ﺳ", "ﯕ", "ﻧ", "ﻣ", "ﯞ", "ﻟ", "ﺧ", "ﻏ", "ﮊ", "ﻳ", "ﺍ", "ﻩ", "ﻭ", "ﯛ", "ﯙ", "ﯗ", "ﯦ", "ﯨ", "ﮬ", "ﺋ"]
_Tools_Tools_Fields_.ALPHABET_EXT_SINGLE = ["ﺕ", "ﭖ", "ﺏ", "ﺭ", "ﺩ", "ﭺ", "ﺝ", "ﺯ", "ﻑ", "ﻕ", "ﻙ", "ﺵ", "ﮒ", "ﺱ", "ﯓ", "ﻥ", "ﻡ", "ﯞ", "ﻝ", "ﺥ", "ﻍ", "ﮊ", "ﻱ", "ﺍ", "ﻩ", "ﻭ", "ﯛ", "ﯙ", "ﯗ", "ﯤ", "ﻯ", "ﮪ", "ﺋ"]
_Tools_Tools_Fields_.ALPHABET_EXT_MIDDLE = ["ﺘ", "ﭙ", "ﺒ", "ﺮ", "ﺪ", "ﭽ", "ﺠ", "ﺰ", "ﻔ", "ﻘ", "ﻜ", "ﺸ", "ﮕ", "ﺴ", "ﯖ", "ﻨ", "ﻤ", "ﯟ", "ﻠ", "ﺨ", "ﻐ", "ﮋ", "ﻴ", "ﺎ", "ﻪ", "ﻮ", "ﯜ", "ﯚ", "ﯘ", "ﯧ", "ﯩ", "ﮭ", "ﺌ"]
_Tools_Tools_Fields_.ALPHABET_EXT_END = ["ﺖ", "ﭗ", "ﺐ", "ﺮ", "ﺪ", "ﭻ", "ﺞ", "ﺰ", "ﻒ", "ﻖ", "ﻚ", "ﺶ", "ﮓ", "ﺲ", "ﯔ", "ﻦ", "ﻢ", "ﯟ", "ﻞ", "ﺦ", "ﻎ", "ﮋ", "ﻲ", "ﺎ", "ﻪ", "ﻮ", "ﯜ", "ﯚ", "ﯘ", "ﯥ", "ﻰ", "ﮫ", "ﺌ"]
_Tools_Tools_Fields_.ALPHABET_FRIENDLY = ["ت", "ئ", "خ", "چ", "ج", "پ", "ب", "س", "ش", "غ", "ف", "ق", "ك", "گ", "ڭ", "ل", "م", "ن", "ھ", "ې", "ى", "ي"]
def _hx_init__Tools_Tools_Fields__REPLACE_MAP():
    def _hx_local_0():
        _g = haxe_ds_StringMap()
        _g.h["ﻻ"] = "ﻟﺎ"
        _g.h["ﻼ"] = "ﻠﺎ"
        return _g
    return _hx_local_0()
_Tools_Tools_Fields_.REPLACE_MAP = _hx_init__Tools_Tools_Fields__REPLACE_MAP()
_Tools_Tools_Fields_.la1 = _Tools_LA_Class("ﻟ","ﺎ","ﻻ")
_Tools_Tools_Fields_.la2 = _Tools_LA_Class("ﻠ","ﺎ","ﻼ")
python_Boot.keywords = set(["and", "del", "from", "not", "with", "as", "elif", "global", "or", "yield", "assert", "else", "if", "pass", "None", "break", "except", "import", "raise", "True", "class", "exec", "in", "return", "False", "continue", "finally", "is", "try", "def", "for", "lambda", "while"])
python_Boot.prefixLength = len("_hx_")
python_Lib.lineEnd = ("\r\n" if ((Sys.systemName() == "Windows")) else "\n")