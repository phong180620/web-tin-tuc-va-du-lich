<header class="index-2">
    <!-- header top start -->
    <div class="header-top-area ">
        <div class="container">
            <div class="row">
                <div class="header-top-left">
                    <div class="col-md-12 col-sm-12 col-xs-12">
                        <marquee scrolldelay="200">
                            <span style="font-size:14px;"><span style="color:#fff"><b>CHÀO MỪNG BẠN ĐẾN VỚI WEBSITE TRAVEL AND LIFE</b></span></span>
                        </marquee>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- header top end -->
    <div class="header-bottom-area" id="stick-header">
    
        <a class=""><a href="<?= base_url() ?>"><img></a>
        </a>
        <div class="container">
            <div class="row">
                <a href="/tintucdulich/index.php">
                    <img style="margin-left: 470px;" src="/tintucdulich/public/frontend/logo/logo.png"  alt="Travel and Life">
                </a>  
                <!-- main menu start here -->
                <div class="col-md-12">
                    <nav>
                        <ul class="main-menu">
                            <div ></div>
                            <li class=""><a href="<?= base_url() ?>">Trang chủ</a>
                            </li>
                            <?php $cates = $db->fetchAll("danh_muc"); ?>
                            <?php foreach ($cates as $item) : ?>
                                <li>
                                    <a href="<?= base_url() ?>danh-muc.php?id=<?= $item['id'] ?>"><?= $item['ten_danh_muc'] ?></a>
                                </li>
                            <?php endforeach; ?>

                            <li>

                                <form action="<?= base_url() ?>tim-kiem.php" method="post">
                                    <input type="text" style="height: 33px" name="s">
                                    <button type="submit" class="btn btn-primary">
                                        Tìm kiếm
                                    </button>
                                </form>
                            </li>
                            <?php if (!isset($_SESSION['ten_nguoi_dung'])): ?>
                            <li class=""><a href="<?= base_url() ?>dang-nhap.php">Đăng nhập</a>

                            <li class=""><a href="<?= base_url() ?>dang-ki.php">Đăng kí</a>
                                <?php else: ?>
                            <li class=""><a href="<?= base_url() ?>dang-bai.php">Đăng bài</a>
                            <li class=""><a href="<?= base_url() ?>dang-xuat.php">Đăng xuất</a>

                                <?php endif; ?>
                        </ul>
                    </nav>
                </div>
                <!-- main menu end here -->
            </div>
        </div>
    </div>
    <!-- header-bottom area end here -->
</header>