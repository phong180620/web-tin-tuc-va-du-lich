<?php
$open = "slide";
include  "../../autoload/autoload.php"
?>
<?php
$id               = getInput('id');
$slide_info       = $db->fetchsql("SELECT * FROM slides WHERE id = $id");
$image_slide_info = "../../../public/uploads/slides/" . $slide_info['links'];
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
       $error['name'] = 'Tên slide không được trống';
     } else {
      $name= postInput("name") ;
    }

    if (!empty($_FILES['image']['name'])) {
      $image      = $_FILES['image']['name'];
      $image_name = time() . '.' . $image;
      if (file_exists($image_slide_info)) {
        unlink($image_slide_info);
      }
    } else {
      $image_name = $image_slide_info;
    }

    if ($name == $slide_info['ten'] && empty($_FILES['image']['name'])) {
      $_SESSION['success'] = "Dữ liệu không thay đổi";
      redirectAdmin("slide");
    }


    if (empty($error)) {

      move_uploaded_file($_FILES['image']['tmp_name'], '../../../public/uploads/slides/' . $image_name);
        //         $result = $slide->insert('slides', $data);
      $result = $db->query("UPDATE slides SET ten = '$name', links = '$image_name' WHERE id = $id");
      if (isset($result)) {
        $_SESSION['success'] = "Sửa  thành công";
        redirectAdmin("slide");
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
        Slide
        <small>sửa</small>
      </h1>

    </section>

    <!-- Main content -->
    <section class="content">

      <!-- Default box -->
      <div class="box">

        <div class="box-body">
          <div class="col-xs-7 col-sm-7 col-md-7 col-lg-7">
            <?php require_once '../../../partials/notification.php'; ?>

            <form action="" method="post" role="form" enctype="multipart/form-data">

              <div class="form-group">
                <label for="">Tên slide</label>
                <input type="text" class="form-control" name="name" id="" placeholder="Tên slide " value="<?php echo $slide_info['ten']?>">
                <?php
                if (isset($error['name'])) echo "<p class='text-danger'>" . $error['name'];
                ?>
              </div>

              <div class="form-group">
                <label for="">HÌnh ảnh</label><br>
                <img src="../../../public/uploads/slides/<?= $slide_info['links'] ?>" alt="" style="height:200px;width:350px" class="img-responsive"><br>

                <input type="file" name="image">
                <?php if (isset($error['image'])) {
                  echo "<p class='text-danger'>$error[image].</p>";
                } ?>
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