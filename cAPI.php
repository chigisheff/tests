<?php
/**
 * Description of cAPI
 *
 * @author andreych
 */
include 'config.php';

class cAPI {
    public function getConnect(){

        $pConf = new config;
        $connect = new mysqli($pConf->HOST, $pConf->USERDB, $pConf->PWDUSRBD,$pConf->DBNAME);
        return $connect;
    }
    function Create($connect,$option){
        $result = $connect->query($option); 
        return $result;
    }
    function Read($connect,$option){
        $result = $connect->query($option);
        if($result){
            foreach ($row = $result as $row){
                $arr[] = $row;
            }
        }
        return $arr;
    }
    function Update($connect,$option){
        
    }
    function Delete($connect,$option){
        
    }
        
}
