<?php require( DIR_TEMPLATE.$this->config->get('config_template')."/template/common/config.tpl" ); ?>
<?php echo $header; ?>


<main class="main-content" id="MainContent" role="main">
    <div class="page-width">
        
  		<div class="page-empty text-center" style="padding: 250px 0;">
    		<h1>
    			Carrito de compras
    		</h1>

    		<p>
    			Tú carrito de compras está vacío
    		</p>
    		<hr width="90%">

   			<p>
      			<a href="<?php echo $continue; ?>" class="btn">
      				<?php echo $button_continue; ?>
      			</a>
    		</p>
  		</div>
  	</div>
</main>


<?php echo $footer; ?>