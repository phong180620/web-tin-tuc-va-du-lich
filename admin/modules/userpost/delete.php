<?php
include  "../../autoload/autoload.php";
$id_tin = getInput('id');
$news =  $db->fetchsql("select * from tin_tuc where id_tin = $id_tin");

$path = "../../../public/uploads/tintuc/" . $news["hinh_anh"];
if (file_exists($path)) {
    unlink($path);
}
$db->query("DELETE FROM tin_tuc WHERE id_tin = $id_tin");
$_SESSION['success'] = "Xóa thành công";
redirectAdmin("userpost");
?>

