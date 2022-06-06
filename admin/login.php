<?php
require "autoload/autoload.php";
$user = new Database();
$data = [
	"email" => postInput("email"),
	"password" =>postInput("password"),
];
    if ($_SERVER['REQUEST_METHOD'] == "POST") {
        $error = array();
        if (postInput('email') == null) {
            $error['email'] = "email không được để trống";
        }
        else {
            $email = postInput('email');
        }

        if (postInput('password') == null) {
            $error['password'] = "Mật khẩu không được để trống";
        } else {
            $password = postInput('password');
        }

        if (empty($error)) {

            $is_check = mysqli_fetch_assoc($db->query("SELECT * FROM admin WHERE email = '$email' AND mat_khau = '$password'"));
            if (isset($is_check) != NULL) {
                $_SESSION['ten_admin'] = $is_check['ho_ten'];
                $_SESSION['id_admin'] = $is_check['id'];
                $_SESSION['admin_email'] = $is_check['email'];
                echo "<script>alert('Đăng nhập thành công');location.href='index.php'</script>";

            } else {
                $_SESSION['error_login'] = "Tài khoản hoặc mật khẩu không chính xác";

            }
        }
    }
    ?>

<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>Đăng nhập hệ thống</title>
	<!-- Tell the browser to be responsive to screen width -->
	<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
	<!-- Bootstrap 3.3.7 -->
	<link rel="stylesheet" href="<?php echo base_url() ?>public/admin/bower_components/bootstrap/dist/css/bootstrap.min.css">
	<!-- Font Awesome -->
	<link rel="stylesheet" href="<?php echo base_url() ?>public/admin/bower_components/font-awesome/css/font-awesome.min.css">
	<!-- Ionicons -->
	<link rel="stylesheet" href="<?php echo base_url() ?>public/admin/bower_components/Ionicons/css/ionicons.min.css">
	<!-- Theme style -->
	<link rel="stylesheet" href="<?php echo base_url() ?>public/admin/dist/css/AdminLTE.min.css">
	<!-- iCheck -->


</head>


<body class="hold-transition login-page">
	<div class="login-box">

		<!-- /.login-logo -->
		<div class="login-box-body">
			<h3 class="login-box-msg">Đăng nhập hệ thống</h3>
			<?php if (isset($_SESSION['error_login'])):?>
				<div class="text text-danger">
					<?php echo $_SESSION['error_login']; session_unset();?>
				</div>
			<?php endif ?>
			<form action="" method="post">
				<div class="form-group has-feedback">
					<input type="text" class="form-control" placeholder="Email" name="email"  value="<?= old('email') ?>">
					<?php if (isset($error['email'])) {
						echo "<p class='text-danger'>$error[email].</p>";
					} ?>
				</div>
				<div class="form-group has-feedback">
					<input type="password" class="form-control" placeholder="Password" name="password" value="<?= old('password')?>">
					<?php if (isset($error['password'])) {
						echo "<p class='text-danger'>$error[password].</p>";
					} ?>
				</div>
				<div class="row">

					<div class="col-xs-4">
						<button type="submit" class="btn btn-primary btn-block btn-flat">Đăng nhập</button>
					</div>
					<!-- /.col -->
				</div>
			</form>

		</div>
		<!-- /.login-box-body -->
	</div>
	<!-- /.login-box -->

	<!-- jQuery 3 -->
	<script src="<?php echo base_url() ?>public/admin/bower_components/jquery/dist/jquery.min.js"></script>
	<!-- Bootstrap 3.3.7 -->
	<script src="<?php echo base_url() ?>public/admin/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
	<!-- iCheck -->

</body>
</html>
