# Uyghur Language Tools

## 0. Description

> a tool box including some useful functions to handle with uyghur writing ...

## 1. Installing

```cmd
npm install -g uyghur-tili-quralliri
```

## 2. Usage

```js
const Tools = require('uyghur-tili-quralliri').UyghurLanguageTools;
Tools.main();
// Uyghur Language Tools (0.1), for more infomation please visit ...
var origin = "مەرھابا";
console.log(origin)
// مەرھابا
var target = Tools.toExtended(origin);
console.log(target)
// مەر ھا با
```

## 3. others

> for more information please visit [github](https://github.com/kompasim/uyghur-tili-quralliri).
