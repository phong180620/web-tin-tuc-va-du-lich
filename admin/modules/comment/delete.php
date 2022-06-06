<?php
    include  "../../autoload/autoload.php";
    $id = getInput('id');
    $db->query("DELETE FROM binh_luan WHERE id = $id");
    $_SESSION['success'] = "Xóa thành công";
    redirectAdmin("comment");
?>



