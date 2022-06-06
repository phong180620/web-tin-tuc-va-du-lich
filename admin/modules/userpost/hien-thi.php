<?php
include "../../autoload/autoload.php";
$id = getInput('id');
$hien_thi = $db->fetchsql("SELECT * FROM tin_tuc WHERE id_tin = $id");
if( $hien_thi['hien_thi'] == 1){
    $update = $db->query("UPDATE tin_tuc SET hien_thi = 0 WHERE id_tin = $id");

}
if( $hien_thi['hien_thi'] == 0){
    $update = $db->query("UPDATE tin_tuc SET hien_thi = 1 WHERE id_tin = $id");

}
redirectAdmin('userpost');
?>
