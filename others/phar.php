<?php

// need to set phar.readonly = Off in php.ini file

$dir = "./release/Tools_php/";
$phar = new Phar('./release/UyghurLanguageTools.phar');
$phar->buildFromDirectory($dir);  // This does the thing you actually want.
$phar->setDefaultStub('index.php');
