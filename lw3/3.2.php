<?php  //Check Identifier

$data = $_GET['identifier'];

header('Content-Type: text/plain');
if (empty($data))
{
    echo 'Параметер identifier отсутсвует или  не имеет значения';
}
elseif (ctype_alnum($data) == true) 
	{
		echo 'yes';
	}
	else
	{
		echo 'no';
	}