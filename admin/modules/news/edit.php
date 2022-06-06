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
$id = getInput('id');
$news =  $db->fetchsql("select * from tin_tuc where id_tin = $id");

if ($_SERVER["REQUEST_METHOD"] == "POST") {

    $error = [];

    if (postInput("name") == NULL) {
        $error['name'] = 'Tiêu đề không được trống';
    } else {
        $name = postInput('name');
    }


    if (postInput("content") == NULL) {
        $error['content'] = 'Nội dung không được trống';
    } else {
        $content = postInput('content');
    }

    if (!isset($_POST['danhmuc']) || $_POST['danhmuc'] == '') {
        $error['danhmuc'] = 'Vui lòng chọn danh mục';
    } else {
        $danhmuc = postInput("danhmuc");
    }



    if (empty($error)) {
        if ($_FILES['image']['size'] == '') {
            $file_name = $news['hinh_anh'];
        }
        else{

            $file_name = time().$_FILES['image']['name'];
            unlink('../../../public/uploads/tintuc/'.$news['hinh_anh']);
            move_uploaded_file($_FILES['image']['tmp_name'],'../../../public/uploads/tintuc/'.$file_name);
        }

            $result = $db->query("UPDATE tin_tuc SET tieu_de = '$name', danh_muc_id = $danhmuc, hinh_anh = '$file_name', noi_dung = '$content' WHERE id_tin = $id");

            if (isset($result)) {
                $_SESSION['success'] = "Sửa thành công";
                redirectAdmin("news");
            } else {
                $_SESSION['success'] = "Sửa thất bại";
            }
        }


    }

?>
    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <h1>
                Tin tức
                <small>Sửa</small>
            </h1>

        </section>
        <section class="content">

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
                                        <option value="<?= $item['id'] ?>" <?php echo $news['danh_muc_id'] == $item['id'] ? "selected" : "" ?>><?= $item['ten_danh_muc'] ?></option>
                                    <?php endforeach; ?>
                                </select>

                            </div>
                            <div class="form-group">
                                <label for="">Tên sản phẩm</label>
                                <input type="text" class="form-control" name="name" id="" placeholder="Tên sản phẩm" value="<?php echo $news['tieu_de']?>">
                                <?php
                                if (isset($error['name'])) echo "<p class='text-danger'>" . $error['name'];
                                ?>
                            </div>

                    
                            <div class="form-group">
                                <label for="">Nội dung</label>
                                <textarea name="content" id="content"  rows="10" class="form-control">
                                    <?= $news['noi_dung']?>
                                </textarea>
                                <?php
                                if (isset($error['content'])) echo "<p class='text-danger'>" . $error['content'];
                                ?>
                                <script>

                                    CKEDITOR.replace('content');

                                </script>
                            </div>

                            <div class="form-group">
                                <label for="">Hình ảnh</label><br>
                                <img src="<?= base_url() ?>public/uploads/tintuc/<?= $news['hinh_anh'] ?>" alt="" width="200px" height="160px">
                                <br><input type="file" name="image">
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