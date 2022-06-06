<?php include "layouts/head.php" ?>
<body>
    <?php include "layouts/header.php" ?>
    <!-- header area end here -->
    <?php include "layouts/slide.php" ?>
    <div class="clearfix">

    </div>
    <!-- slider area end here -->
    <?php
    $id_tin = getInput('id_tin');
    $news = $db->fetchsql("SELECT * FROM tin_tuc WHERE id_tin = $id_tin") ;

    ?>
    <section class="offer-package" style="margin-top: 20px">
        <div class="container">
          <h2><?= $news['tieu_de'] ?></h2>
          <p class="text-justify">
            <?= $news['noi_dung'] ?>
        </p>
    </div>
</section>

<?php 
$sessionKey1 = 'post_' . $id_tin;
        // $_SESSION['sessionKey'] = $sessionKey1;
        //  // $sessionView = $_SESSION[$sessionKey];
        // $sessionView = $_SESSION['sessionKey']; 


  if (!isset($_SESSION[$sessionKey1])) { // nếu chưa có session
    $_SESSION[$sessionKey1] = 1;
    dem_lan_xem($id_tin);
}
function dem_lan_xem($id)
{
    $db = new Database();
    $sql_count          = "UPDATE tin_tuc SET luot_xem = luot_xem+1 WHERE id_tin = $id";
    $db->query($sql_count);
    return;
}

?>
<section class="offer-package" style="margin-top: 20px">

     <?php
    $id_tin = getInput('id_tin');
    if (isset($_POST['btn_comment'])) {

        $content = postInput('content');
        $id_nguoi_dung =  $_SESSION['nguoi_dung_id'];

        $sql = "INSERT INTO  binh_luan(nguoi_dung_id, tin_tuc_id, noi_dung) VALUES($id_nguoi_dung, $id_tin,'$content')";
        $result = $db->query($sql);
     //    if ($result) {
     //        echo "<script>alert('Cám ơn bạn đã ');location.href='index.php'</script>";

     // }
    }
    ?>

    <div class="container"><hr>
        <h4 >Bình luận</h4>
        <?php if (isset( $_SESSION['ten_nguoi_dung'])) :?>
            <div class="media-body" >
                <div class="offer-btn" style="display:inline;">
                    <a href="booktour.php" class="travel-booking-btn-lg hvr-shutter-out-horizontal" style="float:right;margin-bottom: 20px;">Book tuor</a>   
                </div>
         </div>
            <div class="well">
                <h4>Viết bình luận ...<span class="glyphicon glyphicon-pencil"></span></h4>
                <form role="form" action="" method="post">
                    <div class="form-group">
                        <textarea class="form-control" rows="3" required="" name="content"></textarea>
                    </div>
                    <button type="submit" class="btn btn-primary" name="btn_comment">Gửi</button>
                </form>
            </div>
        <?php endif; ?>

        <?php $comments = $db->query("SELECT binh_luan.id, binh_luan.nguoi_dung_id, binh_luan.tin_tuc_id, binh_luan.noi_dung, binh_luan.created_at, nguoi_dung.id_nguoi_dung, nguoi_dung.ho_ten FROM binh_luan INNER JOIN nguoi_dung ON binh_luan.nguoi_dung_id = nguoi_dung.id_nguoi_dung WHERE binh_luan.tin_tuc_id = $id_tin ORDER BY binh_luan.id DESC");

        ?>
        <?php foreach($comments as $item) : ?>
            <div class="media">
                <div class="media-body">
                    <?php $timestamp = strtotime($item['created_at']);
                    $new_date_format = date('d-m-Y H:i:s', $timestamp); ?>
                    <h4 class="media-heading"><?= $item['ho_ten'] ?>
                    <small><?=$new_date_format ?></small>
                </h4>
                <p><?= $item['noi_dung'] ?></p>
            </div>

        </div>
    <?php endforeach; ?>
</div>
</section>
<br><br>
<?php include "layouts/footer.php" ?>