
<?php
    include  "../../autoload/autoload.php";
    $id = getInput('id');
    $db->query("DELETE FROM book_tour WHERE id_nguoi_book = $id");
    $_SESSION['success'] = "Xóa thành công";
    redirectAdmin("booktour");
?>





