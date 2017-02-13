<?php require( DIR_TEMPLATE.$this->config->get('config_template')."/template/common/config.tpl" ); ?>
<?php echo $header; ?>

<style>
	html, body {
		height: 100%;
		margin: 0;
		padding: 0;
	}
	#map {
		height: 100%;
	}
</style>

<div class="pagehero">
	<div class="hero-bg js-doc-nav-wrapper" style="background-image: url('https://1iy0q03l0o0o497fr42dtsex-wpengine.netdna-ssl.com/wp-content/themes/guenergy-17/public/images/default-hero.jpg')">
		
	</div>

	<div class="copy">
		<h1 itemprop="headline" class="entry-title">
			SUCURSALES
		</h1>
		
		<p itemprop="sub-title" class="sub-title">

			<span style="font-weight: 400;"> 
				CONOCE LA TIENDA MÁS CERCA DE TÍ
			</span>
		</p>

	</div>

</div>
	<br>
	<br>
	<div class="col-sm-5"></div>
	<div class="col-sm-6">
        <div class="input-group">
            <input id="address" type="textbox" placeholder="Selecciona un lugar" value="" class="form-control" autocomplete="on" >
            <span class="input-group-btn">
                <button class="btn btn-success " id="submit"><i class="fa fa-search" value="Geocode"></i></button>
            </span>
        </div>
    </div>

	<br>
	<br>
    <br>

    
    <div class="col-sm-4">
    	<table class="table table-bordered">
    		<tbody id="distribuidores_table">
    			
    		</tbody>
    	</table>
    </div>

    <div id="map" class="col-sm-8">
    	
    </div>
    

   


<?php echo $footer; ?>


<script>


	var sucursales =
	[
		{"Nombre":"Guadalajara", "Direccion": "Patria", "Telefono": 324234, "Website": "patria@asjdfkl", "Latitud":20.653995,"Longitud":-103.366288},
		{"Nombre":"Monterrey", "Direccion": "Cruz del sur", "Telefono": 123434, "Website": "cruz@asjdfkl", "Latitud":25.686141,"Longitud":-100.316802},
		
	];

	var map = null;

	function initMap() {
	  var myLatLng = {lat: 20.653995, lng:  -103.366288};

	  map = new google.maps.Map(document.getElementById('map'), {
	    zoom: 15,
	    center: myLatLng
	  });

	  for(var i = 0; i<sucursales.length;i++)
	  {
		  var marker = new google.maps.Marker({
		    position: {lat: sucursales[i]['Latitud'], lng:  sucursales[i]['Longitud']},
		    map: map,
		    title: 'Gu Energy sucursal ' + sucursales[i]['Nombre'],
		  });

		   document.getElementById("distribuidores_table").innerHTML += "<tr><td>" + "<h3 onclick='cambiarMapa("+sucursales[i]['Latitud']+","+sucursales[i]['Longitud']+""+")'>"+sucursales[i]['Nombre']+"</h3>" +"<h6>"+sucursales[i]['Direccion']+"</h6>" +"<h6>"+sucursales[i]['Telefono']+"</h6>" +"<h6>"+sucursales[i]['Website']+"</h6></tr></td>"; 
	  }


	  var geocoder = new google.maps.Geocoder();

	  document.getElementById('submit').addEventListener('click', function() {
	    geocodeAddress(geocoder, map);
	  });

	}


	function geocodeAddress(geocoder, resultsMap) {
	  	var address = document.getElementById('address').value;
	 	geocoder.geocode({'address': address}, function(results, status) {
		    if (status === google.maps.GeocoderStatus.OK) {

		       map.setCenter(results[0].geometry.location);
		       map.setZoom(15);
		        /*var marker = new google.maps.Marker({
		        map: resultsMap,
		        position: results[0].geometry.location
		      });*/
		    } else {
		      alert('Geocode was not successful for the following reason: ' + status);
		    }
  		});
	}

	

	function cambiarMapa(lat,lng)
	{
		var myLatLng = {lat: lat, lng: lng};

		map.setCenter(myLatLng);
		map.setZoom(15);

	 	var contentString = '<div id="content">'+
     	'<div id="siteNotice">'+
      	'</div>'+
      	'<h1 id="firstHeading" class="firstHeading">GUENERY</h1>'+
      	'<div id="bodyContent">'+
      	
      	'</div>'+
      	'</div>';

 		var infowindow = new google.maps.InfoWindow({
    		content: contentString
  		});


	 	var marker = new google.maps.Marker({
	    	position: myLatLng,
	    	map: map,
	    	title:'Gu Energy sucursal ' ,

	  	});

	 	marker.addListener('click', function() {
    		infowindow.open(map, marker);
 		});

	}
</script>
<script async defer
        src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCyY-eBOYa2m2Uu_9Lcu-Wcd3uWVifCR74&callback=initMap">
</script>





