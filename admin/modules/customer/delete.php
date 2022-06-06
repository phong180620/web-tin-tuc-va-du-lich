
<?php
    include  "../../autoload/autoload.php";
    $id = getInput('id');
    $db->query("DELETE FROM nguoi_dung WHERE id_nguoi_dung = $id");
    $_SESSION['success'] = "Xóa thành công";
    redirectAdmin("customer");
?>





