<?php require( DIR_TEMPLATE.$this->config->get('config_template')."/template/common/config.tpl" ); ?>
<?php echo $header; ?>


<section class="col-lg-<?php echo $SPAN[1];?> col-sm-<?php echo $SPAN[1];?> col-xs-12">
  <?php if ($attention) { ?>
<div class="attention"><?php echo $attention; ?><img src="catalog/view/theme/default/image/close.png" alt="" class="close" /></div>
<?php } ?>
<?php if ($success) { ?>
<div class="success"><?php echo $success; ?><img src="catalog/view/theme/default/image/close.png" alt="" class="close" /></div>
<?php } ?>
<?php if ($error_warning) { ?>
<div class="warning"><?php echo $error_warning; ?><img src="catalog/view/theme/default/image/close.png" alt="" class="close" /></div>
<?php } ?>
 <?php require( DIR_TEMPLATE.$this->config->get('config_template')."/template/common/breadcrumb.tpl" );  ?>  
 
<div id="content" style="padding: 80px 0;">

  <div class="cart-header" style="float:left; margin-top : 15px; width : 100%;">

    <a href="<?php echo $continue; ?>">
      <span class="btn btn--secondary" style="float:right;"> 
        <?php echo $button_shopping; ?> 
      </span>
    </a>
      <h1 class="small--text-center" style="float:left;">Carrito de compras</h1>

    <div class="clear"></div>
  </div>


  <div >
  
  <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
    <style type="text/css">
      .note{
        padding: 6px 12px 6px 40px;
        text-align: center;
        margin-bottom : 20px;
        text-align : center;
      }
      .retail-promo-text{
        padding: 12px ;
        display: none;
        background-color: #00c4da;
        border-color: #058593;
        font-size: 1.1rem;
        color: #fff;
        text-transform : uppercase;
      }
      .retail-promo-text a {
        color: #fff;
        text-decoration: underline;
      }
      .added-modal .retail-promo-text{
        margin: 20px 0px;
        padding: 15px;
      }
    </style>


    <div class="cart-info">
      <table class="table table-hover">
        
        <tbody>
          <?php foreach ($products as $product) { ?>
            <tr>
              <td class="col-md-2" style="padding-left: 100px;">
                <a href="<?php echo $product['href']; ?>" class="cart__image">
                  <img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>">
                </a>
              </td>

              <td class="col-md-4">
                <a href="<?php echo $product['href']; ?>" class="h5">
                  <?php echo $product['name']; ?>
                </a>
                <?php foreach ($product['option'] as $option) { ?>
                  <p><?php echo $option['name']; ?> / <?php echo $option['value']; ?></p><br />
                <?php } ?>          
              </td>

              <td class="col-md-1">
                <label for="Updates_12137376449" class="cart__quantity-label medium-up--hide">
                  
                </label>

                <input type="number" name="quantity[<?php echo $product['key']; ?>]" id="Updates_12137376449" class="cart__quantity" value="<?php echo $product['quantity']; ?>" min="0" data-line="1" style="width: 50px">
              </td>

              <td class="col-md-2">
                <input type="image" src="catalog/view/theme/default/image/update.png" alt="<?php echo $button_update; ?>" title="<?php echo $button_update; ?>" />
              &nbsp;
                <a href="<?php echo $product['remove']; ?>"><img src="catalog/view/theme/default/image/remove.png" alt="<?php echo $button_remove; ?>" title="<?php echo $button_remove; ?>" /></a>
              </td>


              <td class="col-md-1">
                <span class="cart__item-total">
                  <?php echo $product['total']; ?>
                </span>
              </td>
              
            </tr>

          <?php } ?>
          
        </tbody>
      </table>
    </div>
  </form>

  <div class="grid cart__row">
      
    <div class="grid__item cart__buttons text-right small--text-center">
      <?php foreach ($totals as $total) { ?>
        <p class="h3 cart__subtotal" id="CartSubtotal">
          <?php echo $total['title']; ?>:<?php echo $total['text']; ?>  
        </p>
      
      <?php } ?>
      
      <p class="cart__taxes">Shipping &amp; taxes calculated at checkout</p>


      <p class="cart__taxes" style="max-width : 600px; float: right;"><strong>Estimated Shipping Date : <?php echo strftime("%b/%d/%Y"); ?><span id="js-ship-date"></span></strong><br />All orders require 48 hours for processing. <br /> Transit times are determined by shipping method. If your order is time sensitive, please contact our Customer Service team at (1-800-400-1995, option 4)</p>
      <div class="clear"></div>
      
      <a href="<?php echo $checkout; ?>">
        <input type="submit" name="checkout" class="btn" value="<?php echo $button_checkout; ?>">
      </a>
    </div>
  </div>
  

   
  </div>
  </div>
<script type="text/javascript"><!--
$('input[name=\'next\']').bind('change', function() {
  $('.cart-module > div').hide();
  
  $('#' + this.value).show();
});
//--></script>
<?php if ($shipping_status) { ?>
<script type="text/javascript"><!--
$('#button-quote').live('click', function() {
  $.ajax({
    url: 'index.php?route=checkout/cart/quote',
    type: 'post',
    data: 'country_id=' + $('select[name=\'country_id\']').val() + '&zone_id=' + $('select[name=\'zone_id\']').val() + '&postcode=' + encodeURIComponent($('input[name=\'postcode\']').val()),
    dataType: 'json',   
    beforeSend: function() {
      $('#button-quote').attr('disabled', true);
      $('#button-quote').after('<span class="wait">&nbsp;<img src="catalog/view/theme/default/image/loading.gif" alt="" /></span>');
    },
    complete: function() {
      $('#button-quote').attr('disabled', false);
      $('.wait').remove();
    },    
    success: function(json) {
      $('.success, .warning, .attention, .error').remove();     
            
      if (json['error']) {
        if (json['error']['warning']) {
          $('#notification').html('<div class="warning" style="display: none;">' + json['error']['warning'] + '<img src="catalog/view/theme/default/image/close.png" alt="" class="close" /></div>');
          
          $('.warning').fadeIn('slow');
          
          $('html, body').animate({ scrollTop: 0 }, 'slow'); 
        } 
              
        if (json['error']['country']) {
          $('select[name=\'country_id\']').after('<span class="error">' + json['error']['country'] + '</span>');
        } 
        
        if (json['error']['zone']) {
          $('select[name=\'zone_id\']').after('<span class="error">' + json['error']['zone'] + '</span>');
        }
        
        if (json['error']['postcode']) {
          $('input[name=\'postcode\']').after('<span class="error">' + json['error']['postcode'] + '</span>');
        }         
      }
      
      if (json['shipping_method']) {
        html  = '<h2><?php echo $text_shipping_method; ?></h2>';
        html += '<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">';
        html += '  <table class="radio">';
        
        for (i in json['shipping_method']) {
          html += '<tr>';
          html += '  <td colspan="3"><b>' + json['shipping_method'][i]['title'] + '</b></td>';
          html += '</tr>';
        
          if (!json['shipping_method'][i]['error']) {
            for (j in json['shipping_method'][i]['quote']) {
              html += '<tr class="highlight">';
              
              if (json['shipping_method'][i]['quote'][j]['code'] == '<?php echo $shipping_method; ?>') {
                html += '<td><input type="radio" name="shipping_method" value="' + json['shipping_method'][i]['quote'][j]['code'] + '" id="' + json['shipping_method'][i]['quote'][j]['code'] + '" checked="checked" /></td>';
              } else {
                html += '<td><input type="radio" name="shipping_method" value="' + json['shipping_method'][i]['quote'][j]['code'] + '" id="' + json['shipping_method'][i]['quote'][j]['code'] + '" /></td>';
              }
                
              html += '  <td><label for="' + json['shipping_method'][i]['quote'][j]['code'] + '">' + json['shipping_method'][i]['quote'][j]['title'] + '</label></td>';
              html += '  <td style="text-align: right;"><label for="' + json['shipping_method'][i]['quote'][j]['code'] + '">' + json['shipping_method'][i]['quote'][j]['text'] + '</label></td>';
              html += '</tr>';
            }   
          } else {
            html += '<tr>';
            html += '  <td colspan="3"><div class="error">' + json['shipping_method'][i]['error'] + '</div></td>';
            html += '</tr>';            
          }
        }
        
        html += '  </table>';
        html += '  <br />';
        html += '  <input type="hidden" name="next" value="shipping" />';
        
        <?php if ($shipping_method) { ?>
        html += '  <input type="submit" value="<?php echo $button_shipping; ?>" id="button-shipping" class="button" />';  
        <?php } else { ?>
        html += '  <input type="submit" value="<?php echo $button_shipping; ?>" id="button-shipping" class="button" disabled="disabled" />';  
        <?php } ?>
              
        html += '</form>';
        
        $.colorbox({
          overlayClose: true,
          opacity: 0.5,
          width: '600px',
          height: '400px',
          href: false,
          html: html
        });
        
        $('input[name=\'shipping_method\']').bind('change', function() {
          $('#button-shipping').attr('disabled', false);
        });
      }
    }
  });
});
//--></script> 
<script type="text/javascript"><!--
$('select[name=\'country_id\']').bind('change', function() {
  $.ajax({
    url: 'index.php?route=checkout/cart/country&country_id=' + this.value,
    dataType: 'json',
    beforeSend: function() {
      $('select[name=\'country_id\']').after('<span class="wait">&nbsp;<img src="catalog/view/theme/default/image/loading.gif" alt="" /></span>');
    },
    complete: function() {
      $('.wait').remove();
    },      
    success: function(json) {
      if (json['postcode_required'] == '1') {
        $('#postcode-required').show();
      } else {
        $('#postcode-required').hide();
      }
      
      html = '<option value=""><?php echo $text_select; ?></option>';
      
      if (json['zone'] != '') {
        for (i = 0; i < json['zone'].length; i++) {
              html += '<option value="' + json['zone'][i]['zone_id'] + '"';
            
          if (json['zone'][i]['zone_id'] == '<?php echo $zone_id; ?>') {
                html += ' selected="selected"';
            }
  
            html += '>' + json['zone'][i]['name'] + '</option>';
        }
      } else {
        html += '<option value="0" selected="selected"><?php echo $text_none; ?></option>';
      }
      
      $('select[name=\'zone_id\']').html(html);
    },
    error: function(xhr, ajaxOptions, thrownError) {
      alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
    }
  });
});

$('select[name=\'country_id\']').trigger('change');
//--></script>
<?php } ?>
</section> 

<?php echo $footer; ?>