<?php  //Password Strength

$data = $_GET['password'];
echo urlencode('&');


header('Content-Type: text/plain');
if (empty($data))
{
	echo 'Параметр password не имеет значения';
}
elseif(!preg_match('/[^A-Za-z0-9]+/', $data))
{
    $len = strlen($data);
	if ($len !== 0)
	{
	    $reliability = $reliability + ($len * 4); // symbols (4*n)
	} 

	$calculations = preg_match_all('/[0-9]/', $data);
	if ($calculations !== 0)
	{
	    $reliability = $reliability + ($calculations * 4); // numbers +(4*n)
	} 
 
	$calculations = preg_match_all('/[A-Z]/', $data);
	if($calculations !== 0)
	{
	    $reliability = $reliability + (($len - $calculations) * 2); //capital letters +((len-n)*2)
	} 

	$calculations = preg_match_all('/[a-z]/', $data);
    if ($calculations !== 0)
    {
        $reliability = $reliability + (($len - $calculations) * 2); //uppercase letters +((len-n)*2)
    } 
  
	if (!preg_match('/[^A-Za-z]/', $data))
	{
        $reliability = $reliability - $len; // all sumbols -n
	}

	if (!preg_match('/[^0-9]+/', $data))
	{
        $reliability = $reliability - $len; // all digits -n
	}

	foreach (count_chars($data, 1) as $i => $val)
	{
        if ($val > 1)
        {
        	$reliability = $reliability - $val; // Hello => result - 2
        }
    }

    echo $reliability;	
}
else
{
	echo 'Вы ввели некорректный пароль';
}
// test

// HelloWorld123  = 91
// helloworld123  = 65
// HELLOWORLD123  = 65
// HelloWorld     = 45
// HelloWorld#23  = 45
// HelloWorld&123 = 45
// 1234H          = 44
// H1234          = 44
// 12345          = 35
// 11111          = 30
// helloworld     = 25
// HELLOWORLD     = 25
// HHHHH          = 10
// hhhhh          = 10
// 0              = 7
// h              = 3
//                = Параметр password не имеет значения
// Hello@all      = Вы ввели некорректный пароль