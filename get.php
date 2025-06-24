<?php
class UNI
{
    function get($opt)
    {
        $arr = array();
        $ALLROW = @mysqli_query($GLOBALS['connect'], $opt);
        while ($row = @mysqli_fetch_array($ALLROW, MYSQLI_ASSOC)) {
            $arr[] = $row;
        }
        return $arr;
    }
}

//$dataJSON = file_get_contents('php://input');
//$data = json_decode($dataJSON);

if (isset($_POST['get'])) {
    $arr = $_POST['arr'];
    $get = UNI::get('SELECT `id`, `name`, `date` FROM `table` WHERE `id`=1;'); // Предположим есть таблица "table". Впишите сюда MySQL запрос чтобы получить колонки (id, name и date)
    $arr['table'] = array('id' => 1, 'name' => 'new', 'date' => '2022.05.16'); // Т.к. таблица предполагаемая, то симулируем.
    $json = json_encode($arr);
    header('Content-type: application/json');
    echo $json;
    exit;
    
}
