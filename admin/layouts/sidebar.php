<aside class="main-sidebar">
  <!-- sidebar: style can be found in sidebar.less -->
  <section class="sidebar">
    <!-- Sidebar user panel -->


    <ul class="sidebar-menu" data-widget="tree" style="margin-top:20px ">
      <li class="header"></li>
      <li class="<?php echo(isset($open) && $open == 'dashboard' ? 'active' : '') ?>">
        <a href="<?= base_url() ?>admin">
          <i class="fa fa-dashboard"></i> <span>Dashboard</span>

        </a>

      </li>
      <li class="treeview <?php echo(isset($open) && $open == 'danhmuc' ? 'active' : '') ?>">
        <a href="#">
          <i class="fa fa-edit"></i> <span>Danh mục</span>
          <span class="pull-right-container">
            <i class="fa fa-angle-left pull-right"></i>
          </span>
        </a>
        <ul class="treeview-menu">
          <li><a href="<?= modules("category/add.php") ?>"><i class="fa fa-circle-o"></i> Thêm danh mục</a></li>
          <li><a href="<?= modules("category") ?>"><i class="fa fa-circle-o"></i> Danh sách </a></li>
        </ul>
      </li>


      <li class="treeview <?php echo(isset($open) && $open == 'news' ? 'active' : '') ?>">
        <a href="#">
          <i class="fa fa-edit"></i> <span>Bài viết</span>
          <span class="pull-right-container">
            <i class="fa fa-angle-left pull-right"></i>
          </span>
        </a>
        <ul class="treeview-menu">
          <li><a href="<?= modules("news/add.php") ?>"><i class="fa fa-circle-o"></i> Thêm tin</a></li>
          <li><a href="<?= modules("news") ?>"><i class="fa fa-circle-o"></i> Danh sách </a></li>
        </ul>
      </li>

        

    <li class="<?php echo(isset($open) && $open == 'userpost' ? 'active' : '') ?>">

      
        <a href="<?= modules("userpost") ?>">
          <i class="fa fa-edit"></i> <span>Bài viết đóng góp</span>
          
        </a>
      </li>

      <li class="<?php echo(isset($open) && $open == 'customer' ? 'active' : '') ?>">

        <?php $total = $db->countTable('id_nguoi_dung', 'nguoi_dung'); ?>
        <a href="<?= modules("customer") ?>">
          <i class="fa fa-user"></i> <span>Người dùng</span>
          <span class="pull-right-container">
            <small class="label pull-right bg-green"><?= $total ?></small>
          </span>
        </a>
      </li>
      <li class="<?php echo(isset($open) && $open == 'booktour' ? 'active' : '') ?>">

        <?php $total = $db->countTable('id_nguoi_book', 'book_tour'); ?>
        <a href="<?= modules("booktour") ?>">
          <i class="fa fa-user"></i> <span>Book Tour</span>
          <span class="pull-right-container">
            <small class="label pull-right bg-green"><?= $total ?></small>
          </span>
        </a>
      </li>
      <li class="<?php echo(isset($open) && $open == 'commnent' ? 'active' : '') ?>">
        <?php $total = $db->countTable("id","binh_luan"); ?>

        <a href="<?= modules("comment") ?>">
          <i class="fa fa-comment"></i> <span>Bình luận</span>
          <span class="pull-right-container">
            <small class="label pull-right bg-green"><?= $total ?></small>
          </span>
        </a>
      </li>


      <li class="treeview <?php echo(isset($open) && $open == 'slide' ? 'active' : '') ?>">
        <a href="#">
          <i class="fa fa-edit"></i> <span>Slide</span>
          <span class="pull-right-container">
            <i class="fa fa-angle-left pull-right"></i>
          </span>
        </a>
        <ul class="treeview-menu">
          <li><a href="<?= modules("slide/add.php") ?>"><i class="fa fa-circle-o"></i> Thêm slide</a></li>
          <li><a href="<?= modules("slide") ?>"><i class="fa fa-circle-o"></i> Danh sách </a></li>
        </ul>
      </li>

      <li>
       <a href="../calendar.html">
        <i class="fa fa-calendar"></i> <span>Lịch</span>
        <span class="pull-right-container">
          <small class="label pull-right bg-yellow"><?php date_default_timezone_set("ASia/Ho_Chi_Minh"); echo date("d/m/Y"); ?></small>

          <small class="label pull-right bg-red"><?php echo date("H:i:s") ?></small>
         
        </span>
      </a>
    </li>
  </ul>
</section>
<!-- /.sidebar -->
</aside>