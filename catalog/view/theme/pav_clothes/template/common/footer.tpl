<?php 
    /******************************************************
     * @package Pav Megamenu module for Opencart 1.5.x
     * @version 1.1
     * @author http://www.pavothemes.com
     * @copyright   Copyright (C) Feb 2013 PavoThemes.com <@emai:pavothemes@gmail.com>.All rights reserved.
     * @license     GNU General Public License version 2
    *******************************************************/

    require_once( DIR_TEMPLATE.$this->config->get('config_template')."/development/libs/framework.php" );
    $themeConfig = (array)$this->config->get('themecontrol');
    $themeName =  $this->config->get('config_template');
    $helper = ThemeControlHelper::getInstance( $this->registry, $themeName );
    $LANGUAGE_ID = $this->config->get( 'config_language_id' );  
?>
</div></div></section>

<?php
/**
 * Promotion modules
 * $ospans allow overrides width of columns base on thiers indexs. format array( column-index=>span number ), example array( 1=> 3 )[value from 1->12]
 */
$modules = $helper->getModulesByPosition( 'showcase' ); 
$ospans = array();

if( count($modules) ){
$cols = isset($config['block_showcase'])&& $config['block_showcase']?(int)$config['block_showcase']:count($modules);    
$class = $helper->calculateSpans( $ospans, $cols );
?>
<section class="pav-showcase" id="pavo-showcase">
    <div class="container">
    <?php $j=1;foreach ($modules as $i =>  $module) {  ?>
            <?php if(  $i++%$cols == 0 || count($modules)==1  ){  $j=1;?><div class="row"><?php } ?>    
            <div class="<?php echo $class[$j];?>"><?php echo $module; ?></div>
            <?php if( $i%$cols == 0 || $i==count($modules) ){ ?></div><?php } ?>    
    <?php  $j++;  } ?>  
    </div>
</section>
<?php } ?>
<?php
/**
 * Promotion modules
 * $ospans allow overrides width of columns base on thiers indexs. format array( 1=> 3 )[value from 1->12]
 */
$modules = $helper->getModulesByPosition( 'promotion' ); 
$ospans = array();

if( count($modules) ){
$cols = isset($config['block_promotion'])&& $config['block_promotion']?(int)$config['block_promotion']:count($modules); 
$class = $helper->calculateSpans( $ospans, $cols );
?>
<section class="pav-promotion" id="pav-promotion">
    <div class="container">
    <?php $j=1;foreach ($modules as $i =>  $module) {  ?>
            <?php if( $i++%$cols == 0 || count($modules)==1 ){  $j=1;?><div class="row"><?php } ?>  
            <div class="<?php echo $class[$j];?>"><?php echo $module; ?></div>
            <?php if( $i%$cols == 0 || $i==count($modules) ){ ?></div><?php } ?>    
    <?php  $j++;  } ?>  
    </div>
</section>
<?php } ?>


<div class="explorarTodo">
   <a href="/blog/"> Explore All <i class="tmbricons tmbricons-arrow-right"></i></a> 
</div>


<div class="social-blocks">
    <a href="https://www.facebook.com/GUEnergyLabs" target="_blank">
        <div class="block block--yellow"><i class="fa fa-facebook fa-lg" aria-hidden="true"></i></div>
    </a>

    <a href="https://www.youtube.com/channel/UCTXca3fR4KqaT2HCjiypzLg" target="_blank">
        <div class="block block--orange"><i class="fa fa-youtube-play fa-lg" aria-hidden="true"></i></div>
    </a>

    <a href="https://twitter.com/guenergylabs" target="_blank">
        <div class="block block--blue "><i class="fa fa-twitter fa-lg" aria-hidden="true"></i></div>
    </a>

    <a href="https://www.instagram.com/guenergylabs/" target="_blank">
        <div class="block block--purple"><i class="fa fa-instagram fa-lg" aria-hidden="true"></i></div>
    </a>
    <div class="clear"></div>
</div>


<div class="container">
    <div class="row">
        <div class="col-sm-3 col-xs-6">
            <h2 class="list-title">Customer Service</h2>
            <ul class="menu">
                <li><a href="/contact-us/">Contact</a></li>
                <li><a href="/shipping-policy/">Shipping &amp; Returns</a></li>
                <li><a href="/privacy-policy/">Privacy Policy</a></li>
                <li><a href="/international-dealers/">International</a></li>
            </ul>
        </div><!-- /col -->

        <div class="col-sm-3 col-xs-6">
            <h2 class="list-title">GU Rewards</h2>
            <ul class="menu">
                <li><a href="https://shop.guenergy.com/account/login">Login</a></li>
                <li><a href="https://shop.guenergy.com/account/register">Join</a></li>
                <li><a href="/gu-rewards/">About GU Rewards</a></li>
            </ul>
        </div><!-- /col -->

        <div class="col-sm-3 col-xs-6">
            <h2 class="list-title">Resources</h2>
            <ul class="menu">
                <li><a href="/careers/">Careers</a></li>
                <li><a href="/marketing-assets/">Marketing Assets</a></li>
                <!-- <li><a href="/dealers/">Dealer Locator</a></li> -->
            </ul>
        </div><!-- /col -->
        
        <div class="col-sm-3 col-xs-6">
            <h2 class="list-title">Be In The Know</h2>
            <p> Sign up for the latest news, offers, and deals</p>
            <form action="//guenergy.us1.list-manage.com/subscribe/post?u=79de68ec067b344df3ec71ac7&amp;id=dee15c813a" method="post" id="mc-embedded-subscribe-form" name="mc-embedded-subscribe-form" target="_blank" class="form-vertical">
              <div class="input-group">
                <input class="form-control email input-inverse" onblur="javascript:if(this.value=='')this.value='Your email address';" onfocus="javascript:if(this.value=='Your email address')this.value='';" value="Your email address" size="18" name="email" type="text">
                <div class="input-group__btn">
                <button type="submit" name="submitNewsletter" class="btn btn-info">Subscribe</button>
                </div>
              </div>
            </form>
        </div>

    </div><!-- / row -->
</div><!-- / container -->
    

<footer id="footer">
    <div id="powered">
        <div class="container">
            <div class="inner">
                
                <div class="copyright">
                <p>Copyright © 2017 GU Energy Labs. Site by  <a href="https://wearetmbr.com" title="Gu Energy" target="_blank">TMBR</a></p>
                
                </div>  

            </div>
        </div>
    </div>
</footer>

<?php  ?>

</body></html>
