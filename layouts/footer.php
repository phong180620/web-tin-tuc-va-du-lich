<footer class="footer-area fixed-bottom">

    <div class="container">
         <div class="row">
                 <div class="col-md-5" style="margin-top:10px;float: left;">
                <h3 style="color: #FFFFFF;font-size: px">LIÊN HỆ</h3>
                <a href="/tintucdulich/index.php">
                     <img style="width:100px;height=100px;" src="/tintucdulich/public/frontend/images/Logo_A.png"  alt="Travel and Life">
                 </a> 
                 <br>
                <img rel="icon" href="/tintucdulich/public/frontend/images/Logo_A.png">
                 <p>ylongnie99@gmail.com <br> phongvan1234567899@gmail.com <br><br><b style="color: #FFFFFF">0868-821-341</b></p> 	
                 <ul class="sm">
                     <li><a class="fb" href="#"></a></li>
                     <li><a class="twitter" href="#"></a></li>
                     <li><a class="dribbble" href="#"></a></li>
                     </ul>
                </div>	

                 <div class="col-md-5" style="margin-top: 10px;float: left;">
                    <h3 style="color: #FFFFFF;font-size: 25px" >TIN TỨC</h3>
                     <ul>
                      <li><a href=/tintucdulich/index.php>TRANG CHỦ</a></li>
                       <li><a href=/tintucdulich/index.php>TIN TỨC MỚI</a></li>
                      <li><a href="#">                           
                     <?php $cates = $db->fetchAll("danh_muc"); ?>
                     <?php foreach ($cates as $item) : ?>
                     <li>
                        <a href="<?= base_url() ?>danh-muc.php?id=<?= $item['id'] ?>"><?= $item['ten_danh_muc'] ?></a>
                     </li>
                     <?php endforeach; ?></a></li>
                  </ul>	
                </div>	

                <div class="" style="margin-top: 10px;float: left;">
                     <h3 style="color: #FFFFFF;font-size: 25px">TRỢ GIÚP</h3>
                     <ul>
                         <li><a href="#">FAQ</a></li>
                         <li><a href="#">Contact Us</a></li>
                         <li><a href="#">Policies</a></li>
                     </ul>	
                </div>	


        </div>
    <br>
        <p style="margin-left:450px;">@ 2020 Travel and Life - Design by TAL<a></a></p>	

    </div>
</footer>
<!-- end footer -->

<!-- Scroll to top jump button end-->
<script src="<?= base_url()  ?>public/frontend/js/vendor/jquery-3.2.0.min.js"></script>
<!-- bootstrap js -->
<script src="<?= base_url()  ?>public/frontend/js/bootstrap.min.js"></script>
<!-- owl.carousel js -->
<script src="<?= base_url()  ?>public/frontend/js/owl.carousel.min.js"></script>
<!-- slick js -->
<script src="{{ asset('frontend/js/slick.min.js')}}"></script>
<!-- meanmenu js -->
<script src="<?= base_url()  ?>public/frontend/js/jquery.meanmenu.min.js"></script>
<!-- jquery-ui js -->
<script src="<?= base_url()  ?>public/frontend/js/jquery-ui.min.js"></script>
<!-- wow js -->
<script src="<?= base_url()  ?>public/frontend/js/wow.min.js"></script>

<!-- main js -->
<script src="<?= base_url()  ?>public/frontend/js/custom.js"></script>
</body>
</html>