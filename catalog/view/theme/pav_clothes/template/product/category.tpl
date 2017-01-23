<?php require( DIR_TEMPLATE.$this->config->get('config_template')."/template/common/config.tpl" ); 
  $themeConfig = (array)$this->config->get('themecontrol');
  $categoryConfig = array(
    'listing_products_columns'           => 0,
    'listing_products_columns_small'     => 2,
    'listing_products_columns_minismall' => 1,
    'cateogry_display_mode'              => 'grid',
    'category_pzoom'                     => 1,
    'quickview'                          => 0,
    'show_swap_image'                    => 0,
  );
  $categoryConfig     = array_merge($categoryConfig, $themeConfig );
  $DISPLAY_MODE       = $categoryConfig['cateogry_display_mode'];
  $MAX_ITEM_ROW       = $themeConfig['listing_products_columns']?$themeConfig['listing_products_columns']:3; 
  $MAX_ITEM_ROW_SMALL = $categoryConfig['listing_products_columns_small']?$categoryConfig['listing_products_columns_small']:2;
  $MAX_ITEM_ROW_MINI  = $categoryConfig['listing_products_columns_minismall']?$categoryConfig['listing_products_columns_minismall']:1; 
  $categoryPzoom      = $categoryConfig['category_pzoom'];
  $quickview          = $categoryConfig['quickview'];
  $swapimg            = $categoryConfig['show_swap_image'];
?>

<?php echo $header; ?>

<body class="archive tax-activity term-cycling term-155 tribe-no-js" itemscope="itemscope" itemtype="http://schema.org/WebPage">


  <div id="preloader">
	<div class="spinner"></div>
</div>
<!-- #preloader -->
  

 <div class="body"> <!-- .body has opacity 0 for fade in effect on load -->

<?php if ($description) { ?>
    <?php echo $description; ?>
<?php } ?>

<main id="main" class="" role="main">
	<div class="container-fluid nopad">
		<div class="row">
			<div class="col-sm-12">
				<?php foreach ($products as $i => $product) { ?>
	 
				<div class="product-row -parent-prod -type-wafel -collection-energy">
					<div class="col-xs-12 col-sm-12 col-md-5">
						<div class="title-area">
							<i class="product-icon tmbricons tmbricons-wafel"></i>
							<h3 class="title" ><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></h3>
						  	<p class="copy" ></p>
							<a class="btn -clear" href="https://shop.guenergy.com/products/energy-stroopwafel-mixed-box">MORE INFO  &nbsp; <i class="tmbricons tmbricons-arrow-right"></i></a>
						</div><!-- end title area -->
					</div>

					<div class="col-xs-12 col-sm-12 col-md-7">
						<div class="list-product-slider">

								
							<div class="product">
							  	<div class="product--image--wrapper">
							  		<a href="<?php echo $product['href']; ?>">
							  			<div class="prod-img-bg" style="background-image : url('<?php echo $product['thumb']; ?>');"></div>
							  		</a>
							  	</div>
							  	<h5 class="title"><?php echo $product['name']; ?></h5>
							  	<h6 class="subtitle">Wafel</h6>

							    <span class="btn shop--hover">
							      <a href="<?php echo $product['href']; ?>" class="more-info-link">More Info</a>
							      <span class="buy-now-link js-shop-modal" data-flavor="" data-handle="https://shop.guenergy.com/products/energy-stroopwafel-mixed-box">BUY</span>
							    </span>

							</div>
						</div> 
					</div> 

					<div class="clear"></div>
				</div>
				<?php } ?>
			</div>
		</div>
	</div>


</main>
</div>
</body>

<script type="text/javascript"><!--
function display(view) {
  if (view == 'list') {
    $('.product-grid').attr('class', 'product-list');
    
    $('.products-block  .product-block').each(function(index, element) {
 
       $(element).parent().addClass("col-fullwidth");
    });   
    
    $('.display').html('<span style="float: left;"><?php echo $text_display; ?></span><a class="list active"><em><?php echo $text_list; ?></em></a><a class="grid"  onclick="display(\'grid\');"><em><?php echo $text_grid; ?></em></a>');
  
    $.totalStorage('display', 'list'); 
  } else {
    $('.product-list').attr('class', 'product-grid');
    
    $('.products-block  .product-block').each(function(index, element) {
       $(element).parent().removeClass("col-fullwidth");  
    }); 
          
    $('.display').html('<span style="float: left;"><?php echo $text_display; ?></span><a class="list" onclick="display(\'list\');"><em><?php echo $text_list; ?></em></a><a class="grid active"><em><?php echo $text_grid; ?></em></a>');
  
    $.totalStorage('display', 'grid');
  }
}

view = $.totalStorage('display');

if (view) {
  display(view);
} else {
  display('<?php echo $DISPLAY_MODE;?>');
}
//--></script> 
<?php if( $categoryPzoom ) {  ?>
<script type="text/javascript"><!--
$(document).ready(function() {
  $('.colorbox').colorbox({
    overlayClose: true,
    opacity: 0.5,
    rel: false,
    onLoad:function(){
      $("#cboxNext").remove(0);
      $("#cboxPrevious").remove(0);
      $("#cboxCurrent").remove(0);
    }
  });
   
});
//--></script>
<?php } ?>
</section> 


<?php echo $footer; ?>

