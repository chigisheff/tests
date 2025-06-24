<?php
include 'cUser.php';
include 'cAPI.php';
//$dataJSON = file_get_contents('php://input');
//$body = json_decode($dataJSON);
if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST["action"])) {
    $action = $_POST["action"];
    $data = $_POST['array'];
    unset($data["action"]); 
switch ($action) {
    case "getContent":
        $result = getContent($data['user'],$data['sortby']);
        if ($result !== null) {
          echo json_encode(["success" => true, "data" => $result]);
        } else {
          echo json_encode(["success" => false, "message" => "Ошибка при выполнении функции"]);
        }
        break;
    case "putReadComplite":
        $result = putReadComplite($data['usern'],$data['postn']);
        if ($result !== null) {
          echo json_encode(["success" => true, "data" => $result]);
        } else {
          echo json_encode(["success" => false, "message" => "Ошибка при выполнении функции"]);
        }
        break;
    default:
        echo json_encode(["success" => false, "message" => "Неизвестное действие"]);
    }
} else {
  echo json_encode(["success" => false, "message" => "Неверный запрос"]);
}


function getContent($user, $sorting){
    $pAPI = new cAPI;
    //$pUser = new cUser;
    $connectDB = $pAPI->getConnect();
    $query = "SELECT * FROM `post.test3` ";
    $filter = "WHERE `id_post` NOT IN (SELECT `p_id` AS id FROM `post.stat.post3` WHERE `user_id` = ".$user.") AND `viewed` < 1000"; 
    if($sorting === 0){
            $sortStr = " ORDER BY `viewed` DESC";  
        } else {
            $sortStr = '';        
        }
        
    $rep = $pAPI->Read($connectDB, $query.$filter.$sortStr);
    mb_http_output("UTF-8");
    header('Content-Type: text/html; charset=utf-8');
    return $rep;
}
function putReadComplite($userId,$postId){
    $pAPI = new cAPI;
    $connectDB = $pAPI->getConnect();
    $query = "INSERT INTO `post.stat.post3`(`p_id`, `user_id`, `viewed_at`) VALUES (".$postId.",".$userId.",NOW())";
    $rep = $pAPI->Create($connectDB, $query);
    mb_http_output("UTF-8");
    header('Content-Type: text/html; charset=utf-8');
    return $rep;
}
function afterReadPost($postId){
    $pAPI = new cAPI;
    $connectDB = $pAPI->getConnect();
    $query = "UPDATE `post.test3` SET `viewed`=`viewed`+1 WHERE `id_post`=".$postId.";";
    //UPDATE `post.test3` SET `viewed`=`viewed`+1 WHERE `id_post`=1;
    $rep = $pAPI->Create($connectDB, $query);
    mb_http_output("UTF-8");
    header('Content-Type: text/html; charset=utf-8');
    return $rep;
}