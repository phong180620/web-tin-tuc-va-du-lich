<?php
$open = "news";
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


    $error = [];

    if (postInput("name") == NULL) {
        $error['name'] = 'Tên tiêu đề không được trống';
    } else {
        $name = postInput('name');
        $name = htmlspecialchars($name,ENT_QUOTES);
    }

    if (postInput("content") == NULL) {
        $error['content'] = 'Nội dung không được trống';
    } else {
        $content = postInput('content');
    }


    if ($_FILES['image']['name'] == null) {
        $error['image'] = "Bạn chưa chon file";
    }

    if (!isset($_POST['danhmuc']) || $_POST['danhmuc'] == '') {
        $error['danhmuc'] = 'Vui lòng chọn danh mục';
    } else {
        $danhmuc = postInput("danhmuc");
    }

    $image = $_FILES['image']['name'];
    $image_name = time() . '.' . $image;

    if (empty($error)) {

        $isset = $db->fetchOne("tin_tuc", "tieu_de	 = '" . $name . "'");
        if ($isset > 0) {
            $_SESSION['error'] = "Tiêu đề bài viết đã tồn tại";
        } else {
            move_uploaded_file($_FILES['image']['tmp_name'], '../../../public/uploads/tintuc/' . $image_name);

            $result = $db->query("INSERT INTO tin_tuc(tieu_de, danh_muc_id, hinh_anh, noi_dung) 
            VALUES('$name' , $danhmuc, '$image_name', '$content')");
            if (isset($result)) {
                $_SESSION['success'] = "Thêm mới thành công";
                redirectAdmin("news");
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
                Tin tức
                <small>Thêm</small>
            </h1>

        </section>

        <!-- Main content -->
        <section class="content">

            <!-- Default box -->
            <div class="box">

                <div class="box-body">
                    <div class="col-xs-10 col-sm-10 col-md-10 col-lg-10">
                        <?php require_once '../../../partials/notification.php'; ?>

                        <form action="" method="post" role="form" enctype="multipart/form-data">
                            <?php $cates = $db->fetchAll('danh_muc') ?>
                            <div class="form-group">
                                <label for="">Danh mục</label>
                                <select name="danhmuc"  class="form-control">
                                    <option value=""> -- Chọn danh mục --</option>
                                    <?php foreach ($cates as $item): ?>
                                         <option value="<?= $item['id'] ?>" <?php echo old('danhmuc') == $item['id'] ? "selected" : "" ?>><?= $item['ten_danh_muc'] ?></option>
                                    <?php endforeach; ?>
                                </select>
                                <?php
                                    if (isset($error['danhmuc'])) echo "<p class='text-danger'>" . $error['danhmuc'];
                                ?>
                            </div>
                            <div class="form-group">
                                <label for="">Tiêu đề</label>
                                <input type="text" class="form-control" name="name" id="" placeholder="Tiêu đề bài viết" value="<?php echo old('name')?>">
                                <?php
                                if (isset($error['name'])) echo "<p class='text-danger'>" . $error['name'];
                                ?>
                            </div>

                            
                            <div class="form-group">
                                <label for="">Nội dung</label>
                                <textarea name="content" id="content"  rows="10" class="form-control">
                                    <?= old('content') ?>
                                </textarea>
                                <?php
                                if (isset($error['content'])) echo "<p class='text-danger'>" . $error['content'];
                                ?>
                                <script>

                                    CKEDITOR.replace('content');

                                </script>
                            </div>

                            <div class="form-group">
                                <label for="">Hình ảnh</label>
                                <input type="file" name="image">
                                <?php
                                if (isset($error['image'])) echo "<p class='text-danger'>" . $error['image'];
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