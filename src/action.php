<?php
require_once "vendor/autoload.php";

$hello = new Rivsen\Demo\Hello();
echo $hello->hello(), PHP_EOL;

echo 'PHP: Arg values' . PHP_EOL;
print_r($argv);

echo 'PHP: phpinfo()' . PHP_EOL;
phpinfo();
