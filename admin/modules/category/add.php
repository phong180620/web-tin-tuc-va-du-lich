<?php
$open = "danhmuc";
include  "../../autoload/autoload.php"
?>

<?php include "../../layouts/head.php"?>
    <body class="hold-transition skin-blue sidebar-mini">
    <!-- Site wrapper -->
<div class="wrapper">

<?php include "../../layouts/header.php"?>

<?php include "../../layouts/sidebar.php"?>
<?php
    if ($_SERVER["REQUEST_METHOD"] == "POST") {
        $datas = [
            "ten_danh_muc" => postInput("name"),

        ];

        $error = [];

        if (postInput("name") == NULL) {
            $error['name'] = 'Tên danh mục không được trống';
        }


        if (empty($error)) {

            $isset = $db->fetchOne("danh_muc", "ten_danh_muc	 = '" . $datas['ten_danh_muc'] . "'");
            if ($isset > 0) {
                $_SESSION['error'] = "Tên đã tồn tại";
            } else {
                $result = $db->insert('danh_muc', $datas);
                if (isset($result)) {
                    $_SESSION['success'] = "Thêm mới thành công";
                    redirectAdmin("category");
                } else {
                    $_SESSION['success'] = "Thêm mới thất bại";
                }
            }


        }
    }
?>
    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <h1>
                Danh mục
                <small>Thêm</small>
            </h1>

        </section>

        <!-- Main content -->
        <section class="content">

            <!-- Default box -->
            <div class="box">

                <div class="box-body">
                    <div class="col-xs-7 col-sm-7 col-md-7 col-lg-7">
                        <?php require_once '../../../partials/notification.php'; ?>

                        <form action="" method="post" role="form">

                            <div class="form-group">
                                <label for="">Tên danh mục</label>
                                <input type="text" class="form-control" name="name" id="" placeholder="Tên danh mục" value="<?php echo old('name')?>">
                                <?php
                                if (isset($error['name'])) echo "<p class='text-danger'>" . $error['name'];
                                ?>
                            </div>

                            <button type="submit" class="btn btn-primary">Lưu lại</button>
                        </form>
                    </div>

                </div>

            </div>
            <!-- /.box -->

        </section>
        <!-- /.content -->
    </div>
    <!-- /.content-wrapper -->
<?php include "../../layouts/footer.php"?>