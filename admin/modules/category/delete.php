
<?php
    include  "../../autoload/autoload.php";
    $id = getInput('id');
    $db->query("DELETE FROM danh_muc WHERE id = $id");
    $_SESSION['success'] = "Xóa thành công";
    redirectAdmin("category");
?>





