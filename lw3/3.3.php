<?php  //Password Strength

$data = 'HelloRoman123';
echo urlencode('&');


header('Content-Type: text/plain');
if (empty($data))
{
	echo 'Параметр password не имеет значения';
}
elseif(!preg_match('/[^A-Za-z0-9]+/', $data))
{
    $len = strlen($data);
    $reliability = 0;
	if ($len !== 0)
	{
	    $reliability = $reliability + ($len * 4);
	} 

	$calculations = preg_match_all('/[0-9]/', $data);
	if ($calculations !== 0)
	{
	    $reliability = $reliability + ($calculations * 4);
	} 
 
	$calculations = preg_match_all('/[A-Z]/', $data);
	if($calculations !== 0)
	{
	    $reliability = $reliability + (($len - $calculations) * 2);
	} 

	$calculations = preg_match_all('/[a-z]/', $data);
    if ($calculations !== 0)
    {
        $reliability = $reliability + (($len - $calculations) * 2);
    } 
  
	if (!preg_match('/[^A-Za-z]/', $data))
	{
        $reliability = $reliability - $len;
	}

	if (!preg_match('/[^0-9]+/', $data))
	{
        $reliability = $reliability - $len;
	}

	foreach (count_chars($data, 1) as $i => $val)
	{
        if ($val > 1)
        {
        	$reliability = $reliability - $val;
        }
    }

    echo $reliability;	
}
else
{
	echo 'Вы ввели некорректный пароль';
}