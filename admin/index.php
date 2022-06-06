

<?php
$open = "dashboard";
include "autoload/autoload.php"?>
<?php if (!isset($_SESSION['ten_admin'])) {
  header('Location: http://localhost:8080/tintucdulich/admin/login.php');
} ?>
<?php include "layouts/head.php"?>

<body class="hold-transition skin-blue sidebar-mini">
  <!-- Site wrapper -->
  <div class="wrapper">

    <?php include "layouts/header.php"?>

    <?php include "layouts/sidebar.php"?>

    <div class="content-wrapper">
      <!-- Content Header (Page header) -->
      <section class="content-header">
        <h1>
         Chào mừng bạn đến với trang quản trị
       </h1>

     </section>

     <!-- Main content -->
     <section class="content">

      <!-- Default box -->
      <div class="box">
        <div class="box-body">
          <div class="row">
            <div class="col-md-3 col-sm-6 col-xs-12">
              <div class="info-box">
                <span class="info-box-icon bg-aqua"><i class="fa fa-th"></i></span>

                <div class="info-box-content">
                  <a href="<?php echo modules('category') ?>">
                    <span class="info-box-text">Danh mục</span>
                    <?php $total_cate = $db->countTable('id', 'danh_muc'); ?>
                    <span class="info-box-number"><?= $total_cate ?></span>
                  </a>
                </div>
                <!-- /.info-box-content -->
              </div>
              <!-- /.info-box -->
            </div>
            <!-- /.col -->
            <div class="col-md-3 col-sm-6 col-xs-12">
              <div class="info-box">
                <span class="info-box-icon bg-red"><i class="fa fa-product-hunt"></i></span>

                <div class="info-box-content">
                  <a href="<?php echo modules('news') ?>">
                    <span class="info-box-text">Bài viết</span>
                    <?php $total_news= $db->countTable('id_tin', 'tin_tuc'); ?>
                    <span class="info-box-phone"><?= $total_news ?></span>
                  </a>
                </div>
                <!-- /.info-box-content -->
              </div>
              <!-- /.info-box -->
            </div>




              <!-- /.col -->
            <div class="col-md-3 col-sm-6 col-xs-12">
              <div class="info-box">
                <span class="info-box-icon bg-yellow"><i class="ion ion-ios-people-outline"></i></span>

                <div class="info-box-content">
                  <a href="<?php echo modules('customer') ?>">
                    <span class="info-box-text">Người dùng</span>
                    <?php $total_customer = $db->countTable('id_nguoi_dung', 'nguoi_dung'); ?>

                    <span class="info-box-number"><?= $total_customer ?></span>
                  </a>
                </div>
                <!-- /.info-box-content -->
              </div>
              <!-- /.info-box -->
            </div>
            <div class="col-md-3 col-sm-6 col-xs-12">
              <div class="info-box">
                <span class="info-box-icon bg-yellow"><i class="ion ion-ios-people-outline"></i></span>

                <div class="info-box-content">
                  <a href="<?php echo modules('booktour') ?>">
                    <span class="info-box-text">Book Tour</span>
                    <?php $total_tour = $db->countTable('id_nguoi_book', 'book_tour'); ?>

                    <span class="info-box-number"><?= $total_tour ?></span>
                  </a>
                </div>
                <!-- /.info-box-content -->
              </div>
              <!-- /.info-box -->
            </div>
            <!-- fix for small devices only -->
            <div class="clearfix visible-sm-block"></div>

            <div class="col-md-3 col-sm-6 col-xs-12">
              <div class="info-box">
                <span class="info-box-icon bg-green"><i class="fa fa-comment"></i></span>

                <div class="info-box-content">
                  <a href="<?php echo modules('comment') ?>">
                    <span class="info-box-text">Bình luận</span>
                    <?php $total_comment = $db->countTable('id', 'binh_luan'); ?>
                    <span class="info-box-number"><?= $total_comment ?></span>
                  </a>
                </div>
                <!-- /.info-box-content -->
              </div>
              <!-- /.info-box -->
            </div>
            <!-- /.col -->
              <div class="col-md-4 col-sm-6 col-xs-12">
                  <div class="info-box">
                      <span class="info-box-icon bg-red"><i class="fa fa-product-hunt"></i></span>

                      <div class="info-box-content">
                          <a href="<?php echo modules('userpost') ?>">
                              <span class="info-box-text">Bài viết người dùng</span>
                              <?php $total_news= mysqli_num_rows($db->query("SELECT * FROM tin_tuc WHERE id_nguoi_dang >0")) ?>
                              <span class="info-box-phone"><?= $total_news ?></span>
                          </a>
                      </div>
                      <!-- /.info-box-content -->
                  </div>
                  <!-- /.info-box -->
              </div>

            <!-- /.col -->
          </div>
        </div>


      </div>
      <!-- /.box -->

    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->
  <?php include "layouts/footer.php"?>