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
$id = getInput('id');
$data = $db->fetchsql("select * from danh_muc where id = $id");
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    if (postInput("name") == NULL) {
        $error['name'] = 'Tên danh mục không được trống';
    } else {
        $name = $_POST['name'];
    }


    if (empty($error)) {

        $isset = $db->fetchOne("danh_muc", "ten_danh_muc	 = '" . $name . "'");
        if ($isset > 0) {
            $_SESSION['success'] = "Dữ liệu không thay đổi";
            redirectAdmin("category");
        } else {
            $result = $db->query("UPDATE danh_muc SET ten_danh_muc = '$name' WHERE id = $id");
            if (isset($result)) {
                $_SESSION['success'] = "Sửa  thành công";
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
                <small>Sửa</small>
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
                                <input type="text" class="form-control" name="name"  value="<?php echo $data['ten_danh_muc'];?>">
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