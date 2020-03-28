<?php
require_once "vendor/autoload.php";

if (! isset($_ENV['MY_SECRET_VALUE'])){
    throw new RuntimeException('ENV value "MY_SECRET_VALUE" not set.');
    exit(1);
}
if (empty(trim($_ENV['MY_SECRET_VALUE']))) {
    throw new RuntimeException('ENV value "MY_SECRET_VALUE" is empty.');
    exit(1);
}

// Check token format to prevent unnecessary request that clearly fails
$token_access=$_ENV['MY_SECRET_VALUE'];
$token_sample='2283551024dc52f714d1eeede01d7274883947fc';
define('LEN_TOKEN_EXPECT', strlen($token_sample));
if (strlen($token_access) === LEN_TOKEN_EXPECT) {
    throw new RuntimeException('Invalid ENV value of "MY_SECRET_VALUE". Token length must be: ' . LEN_TOKEN_EXPECT);
    exit(1);
}
if (ctype_xdigit($token_access) === false){
    throw new RuntimeException('Invalid ENV value of "MY_SECRET_VALUE". Not an hex value token.');
    exit(1);
}

echo substr($token_access, 0, LEN_TOKEN_EXPECT -3) . PHP_EOL;

$hello = new Rivsen\Demo\Hello();
echo $hello->hello(), PHP_EOL;

echo 'PHP: Arg values' . PHP_EOL;
print_r($argv);

echo 'PHP: phpinfo()' . PHP_EOL;
phpinfo();
