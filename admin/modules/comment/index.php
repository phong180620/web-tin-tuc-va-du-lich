<?php
$open = "comment";
include  "../../autoload/autoload.php";
?>

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
                    Bình luận
                    <small>danh sách</small>
                </h1>

            </section>

            <?php
            $comments = $db->query('SELECT binh_luan.id, binh_luan.nguoi_dung_id, binh_luan.tin_tuc_id, binh_luan.noi_dung, binh_luan.created_at, nguoi_dung.id_nguoi_dung, nguoi_dung.ho_ten, tin_tuc.id_tin, tin_tuc.tieu_de FROM binh_luan INNER JOIN nguoi_dung ON binh_luan.nguoi_dung_id = nguoi_dung.id_nguoi_dung
                INNER JOIN tin_tuc ON binh_luan.tin_tuc_id= tin_tuc.id_tin ORDER BY id DESC');

                ?>
                <!-- Main content -->
                <section class="content">
                    <!-- Default box -->
                    <div class="box">
                        <div class="box-body">
                            <?php require_once '../../../partials/notification.php'; ?>

                            <div class="table-responsive">


                                <table class="table table-hover">
                                    <thead>
                                        <tr>
                                            <th>STT</th>
                                            <th>Họ và tên</th>
                                            <th>Tin tức</th>
                                            <th>Nội dung</th>
                                            <th>Thao tác</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <?php $stt = 1; foreach ($comments as $item) : ?>
                                        <tr>
                                            <td><?= $stt ?></td>
                                            <td><?= $item['ho_ten'] ?></td>
                                            <td><?= $item['tieu_de'] ?></td>
                                            <td><?= $item['noi_dung'] ?></td>
                                            <td>

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