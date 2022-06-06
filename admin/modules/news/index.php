<?php $open = "news"; include  "../../autoload/autoload.php" ?>

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
                Tin tức
                <small>danh sách</small>
            </h1>

        </section>

        <?php
        if (isset($_GET['p'])) {
            $p = $_GET['p'];
        } else {
            $p = 1;
        }
        $total = $db->countTable('id_tin', 'tin_tuc');
        $sql = "SELECT tin_tuc.id_tin, tin_tuc.danh_muc_id,tin_tuc.tieu_de, tin_tuc.hinh_anh, tin_tuc.noi_dung, tin_tuc.luot_xem,
         danh_muc.id, danh_muc.ten_danh_muc
        FROM tin_tuc
        INNER JOIN danh_muc ON tin_tuc.danh_muc_id = danh_muc.id WHERE tin_tuc.id_nguoi_dang = 0 ORDER BY tin_tuc.id_tin DESC";
        $data = $db->fetchJones("tin_tuc", $sql, $total, $p, 10, true);
        $total_page = $data['page'];
        unset($data['page']);

        $path = $_SERVER['SCRIPT_NAME'];
        ?>
        <!-- Main content -->
        <section class="content">
            <!-- Default box -->
            <div class="box">
                <div class="box-body">
                    <?php require_once '../../../partials/notification.php'; ?>

                    <div class="table-responsive">
                        <a href="<?php echo modules('news') ?>/add.php" class="btn btn-primary pull-right">Create</a><br><br>

                        <table class="table table-hover">
                            <thead>
                            <tr>
                                <th>STT</th>
                                <th>Hình ảnh</th>
                                <th>Tiêu đề</th>
                                <th>Danh mục</th>
                                <th>Lượt xem</th>
                                <th>Thao tác</th>
                            </tr>
                            </thead>
                            <tbody>
                            <?php $stt = 1; foreach ($data as $item) : ?>
                                <tr>
                                    <td><?= $stt ?></td>
                                    <td>
                                        <img class="img-responsive" src="<?= base_url() ?>public/uploads/tintuc/<?= $item['hinh_anh'] ?>" alt="" width="90px" height="80px">
                                    </td>
                                    <td><?= $item['tieu_de'] ?></td>
                                    <td><?= $item['ten_danh_muc'] ?></td>
                                    <td><?= $item['luot_xem'] ?></td>
                                    <td>
                                        <a href="edit.php?id=<?= $item['id_tin'] ?>" class="btn btn-primary btn-xs"><i class="fa fa-edit"></i> Edit</a>
                                        <a onclick="return confirm('Bạn chắc chắn xóa ?')" href="delete.php?id=<?= $item['id_tin'] ?>" class="btn btn-danger btn-xs"><i class="fa fa-trash"></i> Delete</a>

                                    </td>
                                </tr>
                                <?php $stt++; endforeach; ?>
                            </tbody>
                        </table>

                        <div style="text-align: center">
                            <nav aria-label="...">
                                <ul class="pagination">

                                    <?php for ($i = 1; $i <= $total_page; $i++): ?>
                                        <?php
                                        if (isset($_GET['p']) && $_GET['p'] == $i) {
                                            $active = "active";
                                        } else {
                                            $active = "";
                                        }

                                        ?>
                                        <li class="page-item <?php echo $active ?>">
                                            <a class="page-link" href="?p=<?= $i ?>"><?= $i ?></a>
                                        </li>
                                    <?php endfor ?>

                                </ul>
                            </nav>
                        </div>

                    </div>
                </div>

            </div>
            <!-- /.box -->
        </section>
        <!-- /.content -->
    </div>
    <!-- /.content-wrapper -->

<?php include "../../layouts/footer.php"?>
    <?php if (!isset($_GET['p'])) {
        echo '<script>
        $(".pagination li:nth-child(1)").addClass("active");
    </script>';
    } ?>
