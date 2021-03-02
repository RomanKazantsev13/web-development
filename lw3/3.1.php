<?php  //Remove Extra Blanks

$data = $_GET['text'];

header('Content-Type: text/plain');
if (!empty($data))
{
    $data = trim($data, ' ');
    $data = preg_replace('/\s+/', ' ', $data);
    echo $data;
}
else
{
    echo 'Параметер text отсутсвует или  не имеет значения';    
}