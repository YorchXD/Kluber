var origenValue;
var destinoValue;
var distanciaValue = -1;
var nombreValue = null;
var apellidoValue = null;
var telefonoValue = null;
var tiempoValue = null;
var fechaValue = null;
var horaValue = null;
var validar = false;
var tiempoInt;
var calculaCosto;
var tiempoString;
var tiempoLlegadaTaxi = 600;
var costoInicial = 0;
var costoMetro = 0;
/*###########################cambio######################################*/
var latOrigen= '';
var lngOrigen= '';
var latDestino= '';
var lngDestino= '';

var idValue; 
var direccionOrigen;
var direccionDestino;
var distanciaValue;
/*#######################################################################*/


google.maps.event.addDomListener(window, "load", function(){
	const ubicacion = new Localizacion(()=>
		{
			const latLng = {lat: ubicacion.latitude, lng: ubicacion.longitude};
			const options = {
				center: latLng,
				zoom: 14
			}

			var map = document.getElementById('map');
			const mapa = new google.maps.Map(map, options);

			/*obtiene las coordenadas*/
			var ds = new google.maps.DirectionsService;
			/*Traduce coordenadas a la ruta visible*/
 			var dr = new google.maps.DirectionsRenderer;
 			dr.setMap (mapa);

 			var service = new google.maps.DistanceMatrixService;

 			

			/*------------------------------------Datos de inicio-----------------------------------*/

			devuelvePrecio(); //Inicializar precios de recorrido

			const marcadorInicio = new google.maps.Marker({position: latLng, map: mapa});
			var informacionInicio = new google.maps.InfoWindow();
			marcadorInicio.addListener('click', function()
				{
					informacionInicio.open(mapa,marcadorInicio);
				});
			informacionInicio.close();
			marcadorInicio.setVisible(false);
			var autocompleteInicio = document.getElementById('autocompleteInicio');
			const searchInicio = new google.maps.places.Autocomplete(autocompleteInicio);
			searchInicio.bindTo("bounds", mapa);
			searchInicio.addListener('place_changed', function()
			{
				informacionInicio.close();
				marcadorInicio.setVisible(false);
				var place = searchInicio.getPlace();

				if (!place.geometry.viewport) 
				{
					window.alert("Error al mostrar el lugar");
					return;
				}
				if (place.geometry.viewport) 
				{
					mapa.fitBounds(place.geometry.viewport);
				}
				else
				{
					mapa.setCenter(place.geometry.location);
					mapa.setZoom(18);
				}

				origenValue = place.geometry.location;
				/*###########################cambio######################################*/
				latOrigen= ''+origenValue.lat();
				lngOrigen= ''+origenValue.lng();
				marcadorInicio.setPosition(place.geometry.location);
				/*#######################################################################*/
				marcadorInicio.setVisible(true);

				var address = "";

				if (place.address_components) 
				{
					address = [
						(place.address_components[0] && place.address_components[0].short_name || ''),
						(place.address_components[1] && place.address_components[1].short_name || ''),
						(place.address_components[2] && place.address_components[2].short_name || '')
					];
				}

				informacionInicio.setContent('<div><strong>'+ place.name + '</strong><br>'+address);
				informacionInicio.open(map,marcadorInicio);
				trazarTrayectoria(dr, ds, service);
			});
			/*--------------------------------------------------------------------------------------*/

			/*------------------------------------Datos de destino----------------------------------*/
			const marcadorDestino = new google.maps.Marker({position: latLng, map: mapa});
			var informacionDestino= new google.maps.InfoWindow();
			marcadorDestino.addListener('click', function()
				{
					informacionDestino.open(mapa,marcadorDestino);
				});
			informacionDestino.close();
			marcadorDestino.setVisible(false);
			var autocompleteDestino = document.getElementById('autocompleteDestino');
			const searchDestino = new google.maps.places.Autocomplete(autocompleteDestino);
			searchDestino.bindTo("bounds", mapa);
			searchDestino.addListener('place_changed', function()
			{
				informacionDestino.close();
				marcadorDestino.setVisible(false);
				var place = searchDestino.getPlace();

				if (!place.geometry.viewport) 
				{
					window.alert("Error al mostrar el lugar");
					return;
				}
				if (place.geometry.viewport) 
				{
					mapa.fitBounds(place.geometry.viewport);
				}
				else
				{
					mapa.setCenter(place.geometry.location);
					mapa.setZoom(18);
				}

				destinoValue = place.geometry.location;
				/*###########################cambio######################################*/
				latDestino= ''+destinoValue.lat();
				lngDestino= ''+destinoValue.lng();
				/*#######################################################################*/
				marcadorDestino.setPosition(place.geometry.location);
				marcadorDestino.setVisible(true);

				var address = "";

				if (place.address_components) 
				{
					address = [
						(place.address_components[0] && place.address_components[0].short_name || ''),
						(place.address_components[1] && place.address_components[1].short_name || ''),
						(place.address_components[2] && place.address_components[2].short_name || '')
					];
				}

				informacionDestino.setContent('<div><strong>'+ place.name + '</strong><br>'+address);
				informacionDestino.open(map,marcadorDestino);
				trazarTrayectoria(dr, ds);
			});
			/*--------------------------------------------------------------------------------------*/



			function trazarTrayectoria(dr, ds)
			{
				if(searchInicio.getPlace()!=null && searchDestino.getPlace()!=null)
				{
					
					var objConfigDS={
						origin: origenValue,
						destination: destinoValue,
						travelMode: google.maps.TravelMode.DRIVING
					}

					ds.route(objConfigDS, fnRutear);

					function fnRutear(resultados, status)
					{
						if (status=='OK') 
						{
							marcadorInicio.setVisible(false);
							marcadorDestino.setVisible(false);
							dr.setDirections(resultados);
							distanciaYtiempo()
						}
						else
						{
							alert('Error'+status);
						}
					}
				}
			}


			function distanciaYtiempo()
			{
				var origin1 = origenValue;
        		var destinationA = destinoValue;

        		var configSevice = {
		          	origins: [origin1],
		          	destinations: [destinationA],
		          	travelMode: 'DRIVING',
		          	unitSystem: google.maps.UnitSystem.METRIC,
		          	avoidHighways: false,
		          	avoidTolls: false
		        	}

				service.getDistanceMatrix(configSevice, calcular);

				function calcular(response, status) 
				{
	          		if (status !== 'OK') 
	          		{
	            		alert('El error fue: ' + status);
	          		} 
	          		else 
	          		{
			            var originList = response.originAddresses;
			            var destinationList = response.destinationAddresses;
			            var distanciaTex = document.getElementById('distancia');
            			var tiempo = document.getElementById('tiempo');
            			var dinero = document.getElementById('dinero');
			            distanciaTex.innerHTML = '';
            			tiempo.innerHTML = '';
            			dinero.innerHTML = '';

			            for (var i = 0; i < originList.length; i++) 
			            {
			              	var results = response.rows[i].elements;
			              	for (var j = 0; j < results.length; j++) 
			              	{
			              		distanciaTex.innerHTML+=results[j].distance.text;
			              		tiempo.innerHTML+=results[j].duration.text;

			                	distanciaValue= results[j].distance.value;
			                    tiempoValue = results[j].duration.text;

			                    tiempoInt = results[j].duration.value;

			              	}
			            }

			            if(distanciaValue>=200)
		                {
		                    var num = distanciaValue/200;
		                    
		                    calculaCosto = costoInicial+(num*costoMetro); //calculo aproximado de recorrido
		                    calculaCosto = parseInt(calculaCosto);
		                    //alert("calculoCosto: "+calculoCosto);
		                }

		                //alert("costo: "+calculoCosto);

		                dinero.innerHTML += "$"+calculaCosto.toString();


		                 tiempoInt += tiempoLlegadaTaxi;

		                //alert("tiempoInt: "+tiempoInt);

		                var hours = Math.floor((tiempoInt % (60 * 60 * 24)) / (60 * 60));
						var minutes = Math.floor((tiempoInt % (60 * 60)) / (60));
						var seconds = Math.floor(tiempoInt % 60);

						if(hours<10){
						    hours='0'+hours;
						} 
						if(minutes<10){
						    minutes='0'+minutes;
						}
						if(seconds<10){
						    seconds='0'+seconds;
						}


						tiempoString =hours+":"+minutes+":"+seconds;
			        }
		        }
			}

		});
});

function obtenerFechaHora() {
	/* Capturamos la Hora, los minutos y los segundos */
	var marcacion = new Date();
	/* Capturamos la Hora */
	var Hora = marcacion.getHours();
	/* Capturamos los Minutos */
	var Minutos = marcacion.getMinutes();
	/* Capturamos los Segundos */
	var Segundos = marcacion.getSeconds();
	
	/* Si la Hora, los Minutos o los Segundos son Menores o igual a 9, le añadimos un 0 */
	if (Hora <= 9) {Hora = "0" + Hora;}
	if (Minutos <= 9) {Minutos = "0" + Minutos;}
	if (Segundos <= 9) {Segundos = "0" + Segundos;}
	/* Termina el Script del Reloj */

	/*Script de la Fecha */
	var today = new Date();
	var dd = today.getDate();
	var mm = today.getMonth()+1; //January is 0!

	var yyyy = today.getFullYear();
	if(dd<10){
	    dd='0'+dd;
	} 
	if(mm<10){
	    mm='0'+mm;
	} 
	fechaValue = yyyy+'-'+mm+'-'+dd;
	/* Termina el script de la Fecha */

	/* Creamos 2 variables para darle formato a nuestro Script */
	horaValue = Hora + ":" + Minutos + ":" + Segundos;
}


function mostrarAlerta2() 
{

	if(distanciaValue!=-1)
	{
		obtenerFechaHora();
		idValue = document.getElementById('NumeroPedido').value;

		nombreValue = document.getElementById('Nombre').value;
		apellidoValue = document.getElementById('Apellido').value;
		telefonoValue = document.getElementById('Telefono').value;

		direccionOrigen= document.getElementById('autocompleteInicio').value;
		direccionDestino= document.getElementById('autocompleteDestino').value;

		var taxista= document.getElementById('comboboxTaxista').value;

		alert("taxista: " +taxista);
	
		if(taxista!="Correo")
		{
	
			if (confirm("¿Seguro que desean enviar la solicitud?")) 
			{


			    $.post("EnvioSolicitudTaxiEditar.php",{idPedido: idValue,nombre: nombreValue, apellido: apellidoValue, 
			    	telefono: telefonoValue, fecha: fechaValue, hora: horaValue, 
			    	latOrigen: latOrigen, lngOrigen: lngOrigen, latDestino: latDestino, lngDestino: lngDestino, 
			    	direccionOrigen: direccionOrigen, direccionDestino: direccionDestino, taxista:taxista, 
			    	distancia:distanciaValue, tiempo:tiempoString, costo:calculaCosto, segundosEstimados:tiempoInt }, validarEnvio);
			    	//location.href='EnvioPedidoTiempoTranscurrido.php?id=idValue';
			    alert("verificando datos...");

			    if(validar)
			    {
			    	return true;
			    }
			    else
			    {
			    	return false;
			    }

			} 
			else 
			{
			    alert("Error, los datos no fueron enviados");
			    return false;
			}
		}
		else
		{
			alert("Seleccione correo taxista valido");
			return false;
		}

	}
	else
	{
		alert("Direccion de origen o destino invalida");
		return false;
	}

}

function validarEnvio(respuesta){			

	//alert(respuesta); //Mostramos un alert del resultado devuelto por el php
	//alert("respuesta: "+respuesta);

	alert("La modificación de la solicitud fue hecha exitosamente");

	validar = true;


}

function devuelvePrecio() 
{
    $.post("consultaPrecioInicial.php",{numer:1},function(respuesta)//costo Inicial
	{
		costoInicial = parseInt(respuesta);
		//alert("costoInicial: "+costoInicial);
	});

	$.post("consultaPrecioInicial.php",{numer:2},function( respuesta)//
	{
		costoMetro = parseInt(respuesta);
		//alert("costoMetro: "+costoMetro);
	});
}



/*###########################cambio######################################*/
function mostrarDatos2(numeroPedido, nombreCliente, apellidoCliente, direccionInicial, direccionDestino, telefono, latitudInicial, longitudInicial, latitudFinal, longitudFinal, tiempoEst, segundosEst, distanciaEst, costoEst, fecha, hora)
{
	idValue = numeroPedido;
	nombreValue = nombreCliente;
	apellidoValue = apellidoCliente;
	telefonoValue = telefono;
	fechaValue = fecha;
	horaValue = hora;
	latOrigen=latitudInicial;
	lngOrigen=longitudInicial;
	latDestino=latitudFinal;
	lngDestino=longitudFinal
	direccionOrigen=direccionInicial;
	direccionDestino=direccionDestino;
	distanciaValue = distanciaEst;
	tiempoString = tiempoEst;
	calculaCosto = costoEst
	tiempoInt = segundosEst;
}






function mostrarDatosMapa()
{

}
/*#######################################################################*/




