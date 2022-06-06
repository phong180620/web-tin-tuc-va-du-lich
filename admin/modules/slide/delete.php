<?php 
require "../../autoload/autoload.php";

require "../../layouts/head.php";

$id = $_GET['id'];
$slide_info       = $db->fetchsql("SELECT * FROM slides WHERE id = $id");
$path="../../../public/uploads/slides/".$slide_info["links"];
if (file_exists($path)) {
 unlink($path);
}

$result = $db->query("DELETE FROM slides WHERE id = $id");

if (isset($result)) {
  $_SESSION['success'] = "Xóa thành công";
  redirectAdmin("slide");
} else {
  $_SESSION['error'] = "Xóa thất bại";
}


?>
