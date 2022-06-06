<?php include "layouts/head.php" ?>
<body>
    <?php include "layouts/header.php" ?>
    <!-- header area end here -->
    <?php include "layouts/slide.php" ?>
   <?php
    if ($_SERVER['REQUEST_METHOD'] == "POST") {
        $error = array();
        if (postInput('email') == null) {
            $error['email'] = "email không được để trống";
        }
        $is_check = $db->fetchOne("nguoi_dung"," email = '".postInput('email')."' ");
        if ($is_check != NULL) {
            $error['email_isset'] = 'Email đã tồn tại.';
        }
        else {
            $email = postInput('email');
        }

        if (!isset($_POST['tentour']) || $_POST['tentour'] == '') {
            $error['tentour'] = 'Vui lòng chọn danh mục';
        } else {
            $danhmuc = $_POST['tentour'];
            // $danhmuc = postInput("danhmuc");
        }

        if (postInput('fullname') == null) {
            $error['fullname'] = "Họ tên không được để trống";
        } else {
            $fullname = postInput('fullname');
        }

        if (postInput('phone') == null) {
            $error['phone'] = "SDT không được để trống";
        } else {
            $phone = postInput('phone');
        }

        if (postInput('gender') == null) {
            $error['gender'] = " Không được để trống";
        } else {
            $gender = postInput('gender');
        }

        if (postInput('date') == null) {
            $error['date'] = "Không được để trống";
        } else {
            $date = postInput('date');
        }

        if (postInput('country') == null) {
            $error['country'] = "Không được để trống";
        } else {
            $country = postInput('country');
        }
        if (postInput('Adult') == null) {
            $error['Adult'] = " Không được để trống";
        } else {
            $Adult = postInput('Adult');
        }
        if (postInput('request') == null) {
            $error['request'] = "Không được để trống";
        } else {
            $request = postInput('request');
        }
        // echo $email;
        // echo $danhmuc;
        if (empty($error)) {
            $result = $db->query("INSERT INTO  book_tour( ten_danh_muc,ho_ten,gioi_tinh, sdt ,ngay_book,dia_chi,email,Adult, ghi_chu) VALUES('$danhmuc','$fullname','$gender', '$phone', '$date', '$country','$email', '$Adult', '$request')");
            if (isset($result)) {
                echo "<script>alert('Bạn đã book tour thành công');location.href='index.php'</script>";
            }
        }
    }
    ?>


    <section class="offer-package" style="margin-top: 20px">
        <div class="container">
          <form action="" method="post" class="beta-form-checkout">
            <div class="row">
                <div class="col-sm-3"></div>
                <div class="col-sm-6">
                    <h2 class="section-title-version-2-black text-center">BOOKING TOUR</h2>
                    <div class="space20">&nbsp;</div>
                    <div class="form-block">
                        <label for="email">Địa chỉ email*</label>
                        <input type="text" name="email" placeholder="Email address" class="form-control" value="<?= old('email') ?>">
                        <?php
                        if (isset($error['email']))
                            echo "<p class='text-danger'> " . $error['email'];
                        if (isset($error['email_isset']))
                            echo "<p class='text-danger' " . $error['email_isset'];
                        ?>
                    </div>
                    <br>
                    <?php $cates = $db->fetchAll('tour_tn') ?>
                    <div class="form-group">
                        <label for="">Tour Tây Nguyên</label>
                        <select name="tentour" class="form-control">
                            <option value=""> -- Chọn danh mục --</option>
                            <?php foreach ($cates as $item): ?>
                                <option value="<?= $item['ten_tour'] ?>" <?php echo old('tentour') == $item['ten_tour'] ? "selected" : "" ?>><?= $item['ten_tour'] ?></option>
                            <?php endforeach; ?>
                        </select>
                        <?php
                        if (isset($error['tentour'])) echo "<p class='text-danger'>" . $error['tentour'];
                        ?>
                    </div>
                    <div class="form-group">
                        <label >Adult(s)*</label>
                        <div >
                            <select name="Adult" id="Adult" class="form-control "  aria-invalid="false">
                                <option value="1">1</option>
                                <option value="2">2</option>
                                <option value="3">3</option>
                                <option value="4">4</option>
                                <option value="5">5</option>
                                <option value="6">6</option>
                                <option value="7">7</option>
                                <option value="8">8</option>
                                <option value="9">9</option>
                                <option value="10">10</option>
                                <option value="11">11</option>
                                <option value="12">12</option>
                                <option value="13">13</option>
                                <option value="14">14</option>
                                <option value="15">15</option>
                                <option value="16">16</option>
                                <option value="17">17</option>
                                <option value="18">18</option>
                                <option value="19">19</option>
                                <option value="20">20</option>
                            </select>
                        </div>
                    </div>
                    <br>
                    <div class="form-block">
                        <label for="your_last_name">Họ tên*</label>
                        <input type="text" name="fullname"  placeholder="Họ tên" class="form-control" value="<?= old('fullname') ?>">
                        <?php
                        if (isset($error['fullname']))
                            echo "<p class='text-danger'>" . $error['fullname'];
                        ?>
                    </div>
                    <br>
                    <div class="form-block">
                        <label for="phone">Số điện thoại*</label>
                        <input type="phone" name="phone" placeholder="Số điện thoại" class="form-control" value="<?= old('phone') ?>">
                        <?php
                        if (isset($error['phone']))
                            echo "<p class='text-danger' >" . $error['phone'];
                        ?>
                    </div>
                    <br>
                    <br>
                    <div class="form-block">
                        <label for="gender">Giới tính*</label>
                        <input type="gender" name="gender" placeholder="Nam hay Nữ" class="form-control" value="<?= old('gender') ?>">
                        <?php
                        if (isset($error['gender']))
                            echo "<p class='text-danger' >" . $error['gender'];
                        ?>
                    </div>
                    <br>
                    <br>
                    <div class="form-block">
                        <label for="date">Ngày book*</label>
                        <input type="date" name="date" placeholder="dd/mm/yyyy" class="form-control" value="<?= old('date') ?>">
                        <?php
                        if (isset($error['date']))
                            echo "<p class='text-danger' >" . $error['date'];
                        ?>
                    </div>
                    <br>
                    <br>
                    <div class="form-block">
                        <label for="country">Địa chỉ*</label>
                        <input type="country" name="country" placeholder="Địa chỉ" class="form-control" value="<?= old('country') ?>">
                        <?php
                        if (isset($error['country']))
                            echo "<p class='text-danger' >" . $error['country'];
                        ?>
                    </div>
                    <br>
                    <br>
                    <div class="form-block">
                        <label for="request">Ghi chú*</label>
                        <input type="request" name="request" placeholder="Ghi chú" class="form-control" value="<?= old('request') ?>">
                        <?php
                        if (isset($error['request']))
                            echo "<p class='text-danger' >" . $error['request'];
                        ?>
                        <br>
                        <div class="form-block">
                            <button type="submit" class="btn btn-primary ">Book tour</button>
                        </div>
                    </div>
                    
                    </div>
                    <br>

                </div>
                <div class="col-sm-3"></div>
            </div>
        </form>
    </div>
</section>
<br><br>
<?php include "layouts/footer.php" ?>