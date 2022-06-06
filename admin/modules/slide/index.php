<?php 
$open = "slide";

include  "../../autoload/autoload.php" ?>

<?php include "../../layouts/head.php"?>
    <body class="hold-transition skin-blue sidebar-mini">
    <!-- Site wrapper -->
<div class="wrapper">

<?php include "../../layouts/header.php"?>

<?php include "../../layouts/sidebar.php"?>

    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <h1>
                Slide
                <small>danh sách</small>
            </h1>

        </section>

        <?php
            $slides = $db->fetchAll('slides');
        ?>
        <!-- Main content -->
        <section class="content">
            <!-- Default box -->
            <div class="box">
                <div class="box-body">
                    <?php require_once '../../../partials/notification.php'; ?>

                    <div class="table-responsive">
                        <a href="<?php echo modules('slide') ?>/add.php" class="btn btn-primary pull-right">Create</a><br><br>

                        <table class="table table-hover">
                            <thead>
                            <tr>
                                <th>STT</th>
                                <th>Tên slide</th>
                                <th>Hình ảnh</th>
                                <th>Thao tác</th>
                            </tr>
                            </thead>
                            <tbody>
                            <?php $stt = 1; foreach ($slides as $item) : ?>
                            <tr>
                                <td><?= $stt ?></td>
                                <td><?= $item['ten'] ?></td>
                                <td><img height="150px" width="200px" src="<?= base_url() ?>public/uploads/slides/<?= $item['links'] ?>" ></td>
                                <td>
                                    <a href="edit.php?id=<?= $item['id'] ?>" class="btn btn-primary btn-xs"><i class="fa fa-edit"></i> Edit</a>
                                    <a onclick="return confirm('Bạn chắc chắn xóa ?')" href="delete.php?id=<?= $item['id'] ?>" class="btn btn-danger btn-xs"><i class="fa fa-trash"></i> Delete</a>

                                </td>
                            </tr>
                            <?php $stt++; endforeach; ?>
                            </tbody>
                        </table>
                    </div>
                </div>

            </div>
            <!-- /.box -->
        </section>
        <!-- /.content -->
    </div>
    <!-- /.content-wrapper -->
<?php include "../../layouts/footer.php"?>