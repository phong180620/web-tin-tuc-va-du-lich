<?php 
$slides = $db->fetchAll('slides');
$count_slide = $db->countTable('id', 'slides');

?>
<section class="slider-area-2">
   <div class="rev_slider_wrapper">
      <div id="rev_slider_2" class="rev_slider" >
         <!-- BEGIN SLIDES LIST -->
         <div id="myCarousel" class="carousel slide" data-ride="carousel">
            <!-- Indicators -->
            <ol class="carousel-indicators">
             <?php for ($i = 0; $i < $count_slide; $i++): ?>
               <li data-target="#myCarousel" data-slide-to="<?= $i ?>" class="<?php if ($i == 0) echo 'active'; ?>"></li>
            <?php endfor; ?>
         </ol>
         <!-- Wrapper for slides -->
         <div class="carousel-inner" style="height: 490px">
           <?php $i = 0;  foreach ($slides as $item ): ?>
           <div class="item <?php if ($i ==0 ) echo 'active';?>">
            <img width="100%" height="100%" src="<?php base_url() ?>public/uploads/slides/<?php echo $item['links'] ?>" alt="Chania" class="img-responsive">
         </div>
         <?php $i++; endforeach; ?>
         
      </div>
      <!-- Left and right controls -->
      <a class="left carousel-control" href="#myCarousel" data-slide="prev">
         <span class="sr-only">Previous</span>
      </a>
      <a class="right carousel-control" href="#myCarousel" data-slide="next">
         <span class="sr-only">Next</span>
      </a>
   </div>
</div>
<!-- END SLIDER CONTAINER -->
</div>
<!-- END SLIDER CONTAINER WRAPPER -->
</section>