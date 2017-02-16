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
	<div class="hero-bg fondoDistribuidor" >
		
	</div>

	<div class="copy">
		<h1 itemprop="headline" class="entry-title">
			DISTRIBUIDORES
		</h1>
		
		<p itemprop="sub-title" class="sub-title">

			<span class="ditribuidorTittle" > 
				CONOCE EL DISTRIBUIDOR MÁS CERCANO A TI
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

    
    <div class="col-sm-3 scrollTable" >
    	<table class="table table-bordered" border="1">
    		<tbody id="distribuidores_table">
    			
    		</tbody>
    	</table>
    </div>

    <div id="map" class="col-sm-9">
    	
    </div>
    

   


<?php echo $footer; ?>


<script>


	var sucursales =
	[
		{"Nombre":"Gu Energy Guadalajara", "Direccion": "Patria", "Telefono": "324234", "Website": "patria@asjdfkl", "Latitud":20.653995,"Longitud":-103.366288,"Linea":"Si"},
		{"Nombre":"Gu Energy Monterrey", "Direccion": "Cruz del sur", "Telefono": "123434", "Website": "cruz@asjdfkl", "Latitud":25.686141,"Longitud":-100.316802,"Linea":"No"},
		{"Nombre":"Gu Energy Guadalajara", "Direccion": "Patria", "Telefono": "324234", "Website": "patria@asjdfkl", "Latitud":20.653995,"Longitud":-103.366288,"Linea":"Si"},
		{"Nombre":"Gu Energy Guadalajara", "Direccion": "Patria", "Telefono": "324234", "Website": "patria@asjdfkl", "Latitud":20.653995,"Longitud":-103.366288,"Linea":"Si"},
		{"Nombre":"Gu Energy Guadalajara", "Direccion": "Patria", "Telefono": "324234", "Website": "patria@asjdfkl", "Latitud":20.653995,"Longitud":-103.366288,"Linea":"Si"},
		
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
		  cambiarMapa(i);

		  var $tr = $('<tr><td><h6></h6><hr><h7></h7><br><h7></h7><br><h7></h7><br><h7></h7><br></td></tr>');
		  $tr.attr('id',i);
		  $tr.find('h6').text(sucursales[i]['Nombre']);
		  $tr.find('h7').eq(0).text(sucursales[i]['Direccion']);
		  $tr.find('h7').eq(1).text(sucursales[i]['Telefono']);
		  $tr.find('h7').eq(2).text(sucursales[i]['Website']);
		  $tr.find('h7').eq(3).text(sucursales[i]['Linea']);
		
		  var lat = sucursales[i]['Latitud'];
		  var long = sucursales[i]['Longitud'];
		  var nombre = sucursales[i]['Nombre'];
		  var dir = sucursales[i]['Direccion'];
		  var tel = sucursales[i]['Telefono'];
		  var web = sucursales[i]['Website'];
		  var linea = sucursales[i]['Linea'];
		  

		  $('#distribuidores_table').append($tr);
		   
	  }
	  $('#distribuidores_table tr').on('click',function(){
	  	var indice = $(this).attr('id');
	  	cambiarMapa(indice);
	  });

	  navigator.geolocation.getCurrentPosition(getUserPosition, gestionarErrores); 


	  var geocoder = new google.maps.Geocoder();

	  document.getElementById('submit').addEventListener('click', function() {
	    geocodeAddress(geocoder, map);
	  });

	}
 	
 	function getUserPosition(posicion){
		myLatLng = {lat: posicion.coords.latitude, lng:  posicion.coords.longitude};
		map.setCenter(myLatLng);
		map.setZoom(15);

		var contentString = '<div id="content">'+
     	'<div id="siteNotice"><h7>Aquí te encuentras</h7>'+
      	'</div>'+
      	
      	'</div>';

 		var infowindow = new google.maps.InfoWindow({
    		content: contentString
  		});

	 	var marker = new google.maps.Marker({
	    	position: myLatLng,
	    	icon: 'http://maps.google.com/mapfiles/ms/icons/green-dot.png',
	    	map: map,
	    	title:'Gu Energy sucursal ' ,

	  	});

	  	marker.addListener('click', function() {
    		infowindow.open(map, marker);
 		});

	 	
	}
		 
	function gestionarErrores(error){
		alert('Error: '+error.code+' '+error.message+ '\n\nPor favor compruebe que está conectado '+
		'a internet y habilite la opción permitir compartir ubicación física');
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

	

	function cambiarMapa(indice)
	{
		var myLatLng = {lat: sucursales[indice]['Latitud'], lng: sucursales[indice]['Longitud']};

		map.setCenter(myLatLng);
		map.setZoom(15);

	 	var contentString = '<div id="content">'+
     	'<div id="siteNotice">'+
      	'</div>'+
      	'<h6 id="firstHeading" class="firstHeading">'+sucursales[indice]['Nombre']+'</h6><hr>'+
      	'<div id="bodyContent">'+
      	'<h7>'+sucursales[indice]['Direccion']+'</h7><br>'+
      	'<h7>'+sucursales[indice]['Telefono']+'</h7><br>'+
      	'<h7>'+sucursales[indice]['Website']+'</h7><br>'+
      	'<h7>'+sucursales[indice]['Linea']+'</h7><br>'+
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





