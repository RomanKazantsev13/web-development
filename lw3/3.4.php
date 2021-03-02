<?php //Survey Saver

$filename = 'data/' . $_GET['email'] . '.txt';
$first_name = $_GET['first_name'];
$last_name = $_GET['last_name'];
$email = $_GET['email'];
$age = $_GET['age'];

header('Content-Type: text/plain');
if (!empty($email)){
    $file = fopen($filename, 'w');
    fwrite($file, 'First name: ' . $first_name . PHP_EOL);
	fwrite($file, 'Last name: ' . $last_name . PHP_EOL);
	fwrite($file, 'Email: ' . $email . PHP_EOL);
	fwrite($file, 'Age: ' . $age . PHP_EOL);
	fclose($file);

}
else{
	echo 'Вы не ввели обязательный параметр - email';
}
