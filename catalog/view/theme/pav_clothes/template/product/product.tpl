<?php require( DIR_TEMPLATE.$this->config->get('config_template')."/template/common/config.tpl" );

  $themeConfig = (array)$this->config->get('themecontrol');
  $productConfig = array(
      'product_enablezoom'         => 1,
      'product_zoommode'           => 'basic',
      'product_zoomeasing'         => 1,
      'product_zoomlensshape'      => "round",
      'product_zoomlenssize'       => "150",
      'product_zoomgallery'        => 0,
      'enable_product_customtab'   => 0,
      'product_customtab_name'     => '',
      'product_customtab_content'  => '',
      'product_related_column'     => 0,
    'category_pzoom'             => 1,
    'quickview'                  => 0,
    'show_swap_image'            => 0,
  );
  $languageID = $this->config->get('config_language_id');
  $productConfig = array_merge( $productConfig, $themeConfig ); 
  $categoryPzoom      = $productConfig['category_pzoom'];
  $quickview          = $productConfig['quickview'];
  $swapimg            = $productConfig['show_swap_image'];
  $categoryPzoom = isset($themeConfig['category_pzoom']) ? $themeConfig['category_pzoom']:0; 
?>



<head>
  <link href="//cdn.shopify.com/s/files/1/1126/5680/t/5/assets/theme.scss.css?15371127818496078502" rel="stylesheet" type="text/css" media="all" />

 
  <script src="//cdn.shopify.com/s/assets/themes_support/api.jquery-b90ee9a5604bc68b2f4a3af86b4551207834575e264152eac4822d0b60e0c0d5.js" type="text/javascript"></script>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>


</head>

<?php echo $header; ?>



<body id="gu-hydration-drink-tabs" class="template-product" >
          

  <div id="PageContainer" class="page-container is-moved-by-drawer">
  

    <main class="main-content" id="MainContent" role="main">
      <div class="page-width">
        

<div itemscope itemtype="http://schema.org/Product">


  <div class="grid product-single">


    <div class="grid__item medium-up--three-fifths">
      <div class="photos">
        <div class="photos__item photos__item--main">
          <div class="product-single__photo" id="ProductPhoto">
            
            <?php if ($thumb) { ?>
                <?php if( $special )  { ?>
                   <div class="product-label-special label"><?php echo $this->language->get( 'text_sale' ); ?>
                  
                  </div>
                <?php } ?>

                <a href="<?php echo $popup; ?>" title="<?php echo $heading_title; ?>" class="colorbox">
                <img src="<?php echo $thumb; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" id="image"  data-zoom-image="<?php echo $popup; ?>" class="product-image-zoom"/></a>
            
            <?php } ?>

          </div>
        </div>
        
          <div class="photos__item photos__item--thumbs">
            <div class="" id="ProductThumbs">
                
               
               <?php if ($images) { ?>
               <div class="image-additional slide carousel" id="image-additional">
                 <div id="image-additional-carousel" class="carousel-inner">
                   <?php 
                   if( $productConfig['product_zoomgallery'] == 'slider' && $thumb ) {  
                     $eimages = array( 0=> array( 'popup'=>$popup,'thumb'=> $thumb )  ); 
                     $images = array_merge( $eimages, $images );
                   }
                   $icols = 4; $i= 0;
                   foreach ($images as  $image) { ?>
                     <?php if( (++$i)%$icols == 1 ) { ?>
                     <div class="item">
                       <?php } ?>
                           <a href="<?php echo $image['popup']; ?>" title="<?php echo $heading_title; ?>" class="colorbox" data-zoom-image="<?php echo $image['popup']; ?>" data-image="<?php echo $image['popup']; ?>">
                             <img src="<?php echo $image['thumb']; ?>" style="max-width:<?php echo $this->config->get('config_image_additional_width');?>px"  title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" data-zoom-image="<?php echo $image['popup']; ?>" class="product-image-zoom" />
                           </a>
                         <?php if( $i%$icols == 0 || $i==count($images) ) { ?>
                     </div>
                     <?php } ?>
                   <?php } ?>
                 </div>
                 <!--<a class="carousel-control left" href="#image-additional" data-slide="prev"></a>
                 <a class="carousel-control right" href="#image-additional" data-slide="next"></a>-->
               </div>
                 <script type="text/javascript">
                   $('#image-additional .item:first').addClass('active');
                   $('#image-additional').carousel({interval:false})
                 </script>

               <?php } ?>    
 
            </div>
          </div>
      
        
      </div>
    </div>

    <div class="grid__item medium-up--two-fifths" itemprop="offers" itemscope itemtype="http://schema.org/Offer">
      <div class="product-single__info-wrapper">
        <meta itemprop="priceCurrency" content="USD">
        <link itemprop="availability" href="http://schema.org/InStock">

        <div class="product-single__meta small--text-center">
          

          <ul class="product-single__meta-list list--no-bullets list--inline">

            <li id="ProductSaleTag" class="hide">
              <div class="product-tag">
                Sale
              </div>
            </li>

            <li>
              <span id="ProductPrice" class="product-single__price" itemprop="price">
                <?php if ($price) { ?>
                    <?php if (!$special) { ?>
                      <?php echo $price; ?>
                  <?php } else { ?>
                      <?php echo $price; ?>
                  <?php } ?>
                         
                <?php } ?>

              </span>
            </li>

          </ul>

          <h1 itemprop="name" class="product-single__title"><?php echo $heading_title; ?></h1>

        </div>

        <hr>
        </div>
        
           

    </div>

<div itemprop="description">
  <?php if ($attribute_groups) { ?>
    <?php if ($attribute_groups) { ?>
      <?php foreach ($attribute_groups as $attribute_group) { ?>
          <?php foreach ($attribute_group['attribute'] as $attribute) { ?>
            <p style="box-sizing: border-box; margin: 0px 0px 20px; color: rgb(120, 117, 133); font-family: &quot;Gotham A&quot;, &quot;Gotham B&quot;, sans-serif; font-size: 14px;"><?php echo $attribute['text']; ?></p>
            
           <?php } ?>
         <?php } ?>
       <?php } ?>
  <?php } ?>


</div>

<hr />
<div class="product-info ">
  <div class="row ">
    
    
    <div class="product-extra product-form">
      <?php if ($options) { ?>
        <?php foreach ($options as $option) { ?>
          <?php if ($option['type'] == 'select') { ?>
            <div id="option-<?php echo $option['product_option_id']; ?>">

              <div class="product-form__item product-form__item--quantity">
                <?php if ($option['required']) { ?>
                  <span class="required">*</span>
                <?php } ?>

                <label>
                  <?php echo $option['name']; ?>:
                </label>

                <select id="Quantity" name="option[<?php echo $option['product_option_id']; ?>]">
                  <option value="">
                    <?php echo $text_select; ?>  
                  </option>

                  <?php foreach ($option['option_value'] as $option_value) { ?>
                    <option value="<?php echo $option_value['product_option_value_id']; ?>">
                      <?php echo $option_value['name']; ?>
                      <?php if ($option_value['price']) { ?>
                        (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
                      <?php } ?>
                    </option>
                  <?php } ?>
                </select>
              </div>
            </div>
          <?php } ?>  
        <?php } ?>
            
      <?php } ?>


      <div class="product-form__item product-form__item--quantity">
        <label for="Quantity">
          Quantity
        </label> 
        <input class="product-form__input" id="Quantity" min="1" name="quantity" type="number" value="1" />
      </div>

      <div id ="insertarInformacion">
        <?php if ($minimum > 1) { ?>
          <div class="minimum"><?php echo $text_minimum; ?></div>
        <?php } ?>

        <div class="product-form__item product-form__item--submit">
          <input type="hidden" name="product_id" value="<?php echo $product_id; ?>"/>
          &nbsp;

          <span class="cart">
            <input type="button" value="<?php echo $button_cart; ?>" id="button-cart" class="btn btn--full product-form__cart-submit" data-toggle="modal" data-target="#keepBuying"/>
          </span>
        </div>
      </div>       
    </div>

  </div>
</div>


<hr /><!-- parte estàtica -->
<?php echo $description; ?> 

    </div>
  </div>
  </div>
  

    </div>

</div>

      </div>
    </main>

    
  </div>

  <script src="//cdn.shopify.com/s/files/1/1126/5680/t/5/assets/theme.js?15371127818496078502" type="text/javascript"></script>


  <script id="QuantityTemplate" type="text/template">
    
      <div class="js-qty">
        <input type="text" value="{{ value }}" id="{{ id }}" name="{{ name }}" pattern="[0-9]*" data-line="{{ line }}" class="js-qty__input" aria-live="polite">
        <button type="button" class="js-qty__adjust js-qty__adjust--minus" aria-label="Decrease quantity">
          


<svg class="icon icon-minus" aria-hidden="true" focusable="false"><use xlink:href="#icon-minus"></use></svg>

          
        <span class="icon__fallback-text">−</span>
        </button>
        <button type="button" class="js-qty__adjust js-qty__adjust--plus" aria-label="Increase quantity">
          


<svg class="icon icon-plus" aria-hidden="true" focusable="false"><use xlink:href="#icon-plus"></use></svg>

        <span class="icon__fallback-text">+</span>
        </button>
      </div>
    
  </script>


<div class="modal fade" id="keepBuying" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h6 class="modal-title">Elemento agregado al carrito</h6>
        </div>
        <div class="modal-body">
          <p>Se agregó el producto <?php echo $heading_title; ?> al carrito</p>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-dismiss="modal">Seguir comprando</button>
          <a href="index.php?route=checkout/cart"><button type="button" class="btn btn-primary">Ver el carrito</button></a>
        </div>
      </div>
      
    </div>
  </div>
    </div>
</body>








  <?php if( $productConfig['product_enablezoom'] ) { ?>
<script type="text/javascript" src=" catalog/view/javascript/jquery/elevatezoom/elevatezoom-min.js"></script>
<script type="text/javascript">
 <?php if( $productConfig['product_zoomgallery'] == 'slider' ) {  ?>
  $("#image").elevateZoom({gallery:'image-additional-carousel', cursor: 'pointer', galleryActiveClass: 'active'}); 
  <?php } else { ?>
  var zoomCollection = '<?php echo $productConfig["product_zoomgallery"]=="basic"?".product-image-zoom":"#image";?>';
   $( zoomCollection ).elevateZoom({
      <?php if( $productConfig['product_zoommode'] != 'basic' ) { ?>
      zoomType        : "<?php echo $productConfig['product_zoommode'];?>",
      <?php } ?>
      lensShape : "<?php echo $productConfig['product_zoomlensshape'];?>",
      lensSize    : <?php echo (int)$productConfig['product_zoomlenssize'];?>,
  
   });
  <?php } ?> 
</script>
<?php } ?>
<script type="text/javascript"><!--
$(document).ready(function() {
  $('.colorbox').colorbox({
    overlayClose: true,
    opacity: 0.5,
    rel: "colorbox"
  });
});
//--></script> 
 <script type="text/javascript"><!--
$('select[name="profile_id"], input[name="quantity"]').change(function(){
    $.ajax({
    url: 'index.php?route=product/product/getRecurringDescription',
    type: 'post',
    data: $('input[name="product_id"], input[name="quantity"], select[name="profile_id"]'),
    dataType: 'json',
        beforeSend: function() {
            $('#profile-description').html('');
        },
    success: function(json) {
      $('.success, .warning, .attention, information, .error').remove();
            
      if (json['success']) {
                $('#profile-description').html(json['success']);
      } 
    }
  });
});
    
$('#button-cart').bind('click', function() {
  $.ajax({
    url: 'index.php?route=checkout/cart/add',
    type: 'post',
    data: $('.product-info input[type=\'text\'], .product-info input[type=\'hidden\'], .product-info input[type=\'radio\']:checked, .product-info input[type=\'checkbox\']:checked, .product-info select, .product-info textarea'),
    dataType: 'json',
    success: function(json) {
      $('.success, .warning, .attention, information, .error').remove();
      
      if (json['error']) {
        if (json['error']['option']) {
          for (i in json['error']['option']) {
            $('#option-' + i).after('<span class="error">' + json['error']['option'][i] + '</span>');
          }
        }
                
                if (json['error']['profile']) {
                    $('select[name="profile_id"]').after('<span class="error">' + json['error']['profile'] + '</span>');
                }
      } 
      
      if (json['success']) {
        $('#notification').html('<div class="success" style="display: none;">' + json['success'] + '<img src="catalog/view/theme/default/image/close.png" alt="" class="close" /></div>');
          
        $('.success').fadeIn('slow');
          
        $('#cart-total').html(json['total']);
        
        $('html, body').animate({ scrollTop: 0 }, 'slow'); 
      } 
    }
  });
});
//--></script>
<?php if ($options) { ?>
<script type="text/javascript" src="catalog/view/javascript/jquery/ajaxupload.js"></script>
<?php foreach ($options as $option) { ?>
<?php if ($option['type'] == 'file') { ?>
<script type="text/javascript"><!--
new AjaxUpload('#button-option-<?php echo $option['product_option_id']; ?>', {
  action: 'index.php?route=product/product/upload',
  name: 'file',
  autoSubmit: true,
  responseType: 'json',
  onSubmit: function(file, extension) {
    $('#button-option-<?php echo $option['product_option_id']; ?>').after('<img src="catalog/view/theme/default/image/loading.gif" class="loading" style="padding-left: 5px;" />');
    $('#button-option-<?php echo $option['product_option_id']; ?>').attr('disabled', true);
  },
  onComplete: function(file, json) {
    $('#button-option-<?php echo $option['product_option_id']; ?>').attr('disabled', false);
    
    $('.error').remove();
    
    if (json['success']) {
      alert(json['success']);
      
      $('input[name=\'option[<?php echo $option['product_option_id']; ?>]\']').attr('value', json['file']);
    }
    
    if (json['error']) {
      $('#option-<?php echo $option['product_option_id']; ?>').after('<span class="error">' + json['error'] + '</span>');
    }
    
    $('.loading').remove(); 
  }
});
//--></script>
<?php } ?>
<?php } ?>
<?php } ?>
<script type="text/javascript"><!--
$('#review .pagination a').live('click', function() {
  $('#review').fadeOut('slow');
    
  $('#review').load(this.href);
  
  $('#review').fadeIn('slow');
  
  return false;
});     
$('#review').load('index.php?route=product/product/review&product_id=<?php echo $product_id; ?>');
$('#button-review').bind('click', function() {
  $.ajax({
    url: 'index.php?route=product/product/write&product_id=<?php echo $product_id; ?>',
    type: 'post',
    dataType: 'json',
    data: 'name=' + encodeURIComponent($('input[name=\'name\']').val()) + '&text=' + encodeURIComponent($('textarea[name=\'text\']').val()) + '&rating=' + encodeURIComponent($('input[name=\'rating\']:checked').val() ? $('input[name=\'rating\']:checked').val() : '') + '&captcha=' + encodeURIComponent($('input[name=\'captcha\']').val()),
    beforeSend: function() {
      $('.success, .warning').remove();
      $('#button-review').attr('disabled', true);
      $('#review-title').after('<div class="attention"><img src="catalog/view/theme/default/image/loading.gif" alt="" /> <?php echo $text_wait; ?></div>');
    },
    complete: function() {
      $('#button-review').attr('disabled', false);
      $('.attention').remove();
    },
    success: function(data) {
      if (data['error']) {
        $('#review-title').after('<div class="warning">' + data['error'] + '</div>');
      }
      
      if (data['success']) {
        $('#review-title').after('<div class="success">' + data['success'] + '</div>');
                
        $('input[name=\'name\']').val('');
        $('textarea[name=\'text\']').val('');
        $('input[name=\'rating\']:checked').attr('checked', '');
        $('input[name=\'captcha\']').val('');
      }
    }
  });
});
//--></script> 
<script type="text/javascript"><!--
$('#tabs a').tabs();
//--></script> 
<script type="text/javascript" src="catalog/view/javascript/jquery/ui/jquery-ui-timepicker-addon.js"></script> 
<script type="text/javascript"><!--
$(document).ready(function() {
  if ($.browser.msie && $.browser.version == 6) {
    $('.date, .datetime, .time').bgIframe();
  }
  $('.date').datepicker({dateFormat: 'yy-mm-dd'});
  $('.datetime').datetimepicker({
    dateFormat: 'yy-mm-dd',
    timeFormat: 'h:m'
  });
  $('.time').timepicker({timeFormat: 'h:m'});
});
//--></script> 




          <script type="text/javascript" src="//s7.addthis.com/js/250/addthis_widget.js"></script> 
          
<?php echo $footer; ?>