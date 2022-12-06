# Uyghur Tili Quralliri

## 1. Qisqiche chushenche

> bu quralda biz kop ishlitidighan arabche yeziqni kengeytilgen rayungha aylandurush, bashqa yeziqqa aylandurush, bughumgha ayrish qatarliq iqtidarlar emelge ashuruldi. esli kod Haxe tilida yezilghan bulup, nahayiti asanla bashqa asasliq tillarda ishlitishke bulidu.

## 2. Qollaydighan tillar

* [x] [C#](./example/example.cs)

* [x] [Java](./example/Example.java)

* [x] [Node](./example/example.js)

* [x] [PHP](./example/example.php)

* [x] [Python](./example/example.py)

* [ ] Lua

## 3. Qolllinishchan fonkisiyeler

1. arab yeziqini kengeytilgen rayun we asasin rayun arisida aylandurush

```haxe
// asasiy rayun parametiri : مەرھابا
toExtended(text : String) : String // kengeytilgen rayun natije : ﺎﺑﺎﮬﺭﻪﻣ
// asasiy rayun parametiri : ﺎﺑﺎﮬﺭﻪﻣ
fromExtended(text : String) : String // kengeytilgen rayun natije : مەرھابا
```

2. arab yeziqini bashqa yeziqqa aylandurush

```haxe
// arab yeziqi parametiri: مەرھابا
toCommon(text : String) : String // ortaq yeziq netije : märhaba
toCyrillic(text : String) : String // kiril yeziqi netije : мәрһaбa
toLatin(text : String) : String // latin yeziqi netije : merhaba
```

3. bashqa yeziqni arab yeziqigha aylandurush

```haxe
fromCommon(text : String) : String // ortaq yeziq parametiri : märhaba
fromCyrillic(text : String) : String // kiril yeziqi parametiri : мәрһaбa
fromLatin(text : String) : String // latin yeziqi parametiri : merhaba
// arab yeziqi netije: مەرھابا
```

4. yekke harip we kunupka taxtisi ara aylandurush

```haxe
// yekke herip : گ , Shift besildimu : true -> g
toAlphabet(text : String, isSHiftPressed : Bool) : String
// englizche herip : g , Shift besildimu : true -> گ
fromAlphabet(alphabet : String, isSHiftPressed : Bool) : String
```

5. sozni bughumgha ayrish

```haxe
// normal soz : مەرھابا
doSyllable(text : String) : String
// ayrilghan bughum : مەر ھا با
```

6. sanlarni oqush we yezish

```haxe
// san : 123.4011 -> بىر يۈز يىگىرمە ئۈچ پۈتۈن ئون مىڭدا تۆت مىڭ ئون بىر
readNumber(text : String) : String
// xet : بىر مىڭ يەتتە يۈز بىر پۈتۈن يۈزدە بىر -> 1701.01
writeNumber(text : String) : String
```

## 4. Munasiwetlik ulanmilar

* https://github.com/Sabirjan/UyghurWordSyllable

* https://github.com/neouyghur/Multiple-Uyghur-Script-Converter

* https://github.com/gheyret/sanoqughu

> bashqa qurallarni qushush lazim bolsa inkas qaldurghaysiz ...  
