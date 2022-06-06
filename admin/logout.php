<?php
session_start();
unset($_SESSION['ten_admin']);
header('Location: http://localhost:8080/tintucdulich/admin/login.php');
?>