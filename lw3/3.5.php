<?php //Survey Info

$filename = 'data/' . $_GET['email'] . '.txt';

header('Content-Type: text/plain');
if (file_exists($filename) === true)
{
    $file = fopen($filename, "rb");
    $contents = fread($file, filesize($filename));
    echo $contents;
    fclose($file);
}
else
{
	echo 'файл ' . $_GET['email'] . '.txt не найден в директории data';
}