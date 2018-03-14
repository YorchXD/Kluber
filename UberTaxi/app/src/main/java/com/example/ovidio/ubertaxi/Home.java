package com.example.ovidio.ubertaxi;

import android.Manifest;
import android.annotation.SuppressLint;
import android.content.Context;
import android.content.DialogInterface;
import android.content.pm.PackageManager;
import android.graphics.Color;
import android.location.Address;
import android.location.Geocoder;
import android.location.Location;
import android.location.LocationManager;
import android.os.AsyncTask;
import android.os.Bundle;
import android.support.annotation.NonNull;
import android.support.v4.app.ActivityCompat;
import android.support.v7.app.AlertDialog;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.support.design.widget.NavigationView;
import android.support.v4.view.GravityCompat;
import android.support.v4.widget.DrawerLayout;
import android.support.v7.app.ActionBarDrawerToggle;
import android.support.v7.app.AppCompatActivity;
import android.support.v7.widget.Toolbar;
import android.view.Menu;
import android.view.MenuItem;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Spinner;
import android.widget.TextView;
import android.widget.Toast;

import com.android.volley.RequestQueue;
import com.android.volley.Response;
import com.android.volley.toolbox.Volley;
import com.google.android.gms.common.api.Status;
import com.google.android.gms.location.places.Place;
import com.google.android.gms.location.places.ui.PlaceAutocompleteFragment;
import com.google.android.gms.location.places.ui.PlaceSelectionListener;
import com.google.android.gms.maps.CameraUpdate;
import com.google.android.gms.maps.CameraUpdateFactory;
import com.google.android.gms.maps.GoogleMap;
import com.google.android.gms.maps.OnMapReadyCallback;
import com.google.android.gms.maps.SupportMapFragment;
import com.google.android.gms.maps.model.BitmapDescriptorFactory;
import com.google.android.gms.maps.model.LatLng;
import com.google.android.gms.maps.model.LatLngBounds;
import com.google.android.gms.maps.model.MarkerOptions;
import com.google.android.gms.maps.model.PolylineOptions;

import org.json.JSONException;
import org.json.JSONObject;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;

/**
 * Esta clase es la controladora de la pagina principal. Desde aqui se tiene el control del mapa y la obtencion de solicitudes tanto para
 * el usuario como para otras personas que el usuario desee realizar.
 */
public class Home extends AppCompatActivity implements NavigationView.OnNavigationItemSelectedListener, OnMapReadyCallback
{
    private GoogleMap mMap;
    private static final int LOCATION_REQUEST = 500;
    private boolean sePidioTaxi, seMarcoDestino;
    private PlaceAutocompleteFragment inicio, fin;
    private Button btnFindPath, btnPedirTaxi;
    private String direccionOrigen, direccionDestino, persona, miNombre, miApellido, miTelefono; //la variale persona es donde se guarda la opcion si es "yo" u "otra persona" (opcion del responsabel)
    private int calculoCosto, metros, costoFijoMertos, tiempoEstimado;
    private int llegadaTaxi = 600;
    private int distanciaEstimada = -1;
    LatLng coordenadasInicio, coordenadasFin;

    /**
     * Se encarga de inicializar la varibles, el mapa y acciones de botones
     * @param savedInstanceState
     */
    @Override
    protected void onCreate(Bundle savedInstanceState)
    {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_home);
        Toolbar toolbar = (Toolbar) findViewById(R.id.toolbar);
        setSupportActionBar(toolbar);
        sePidioTaxi = false;
        seMarcoDestino = false;
        direccionOrigen = "";
        direccionDestino = "";
        DrawerLayout drawer = (DrawerLayout) findViewById(R.id.drawer_layout);
        ActionBarDrawerToggle toggle = new ActionBarDrawerToggle(
                this, drawer, toolbar, R.string.navigation_drawer_open, R.string.navigation_drawer_close);
        drawer.addDrawerListener(toggle);
        toggle.syncState();
        NavigationView navigationView = (NavigationView) findViewById(R.id.nav_view);
        navigationView.setNavigationItemSelectedListener(this);

        // Obtain the SupportMapFragment and get notified when the map is ready to be used.
        SupportMapFragment mapFragment = (SupportMapFragment) getSupportFragmentManager()
                .findFragmentById(R.id.map);
        mapFragment.getMapAsync(this);

        botonHacerRuta();
        origen();
        destino();
        botonPedirTaxi();
    }

    /**
     * Inicializacion del autocompletado origen y se logran obtener los datos de algun lugar que el
     * usuario desea. Desde aqui se guardan ademas las coordenadas del origen y se obtiene la direccion
     * a la cual el usuario quiere que sea el punto de encuentro con el taxista
     */
    public void origen()
    {
        inicio = (PlaceAutocompleteFragment) getFragmentManager().findFragmentById(R.id.ftInicio);
        inicio.getView().setBackgroundColor(Color.WHITE);
        inicio.setOnPlaceSelectedListener(new PlaceSelectionListener()
        {
            @Override
            public void onPlaceSelected(Place place)
            {
                //Guarda el punto de origen seleccionado
                coordenadasInicio = place.getLatLng();
                direccionOrigen = conversorDireccion(coordenadasInicio.latitude, coordenadasInicio.longitude);
                pintarCoordenadas();
            }

            @Override
            public void onError(Status status)
            {
                // TODO: Handle the error.
                Toast.makeText(Home.this, "" + status.toString(), Toast.LENGTH_SHORT).show();

            }
        });
    }

    /**
     * Inicializacion del autocompletado de destino y se logran obtener los datos de algun lugar que el
     * usuario desea. Desde aqui se guardan ademas las coordenadas del destino y se obtiene la direccion
     * a la cual el usuario quiere que sea el punto de destino que el taxista lo deje
     */
    public void destino()
    {
        fin = (PlaceAutocompleteFragment) getFragmentManager().findFragmentById(R.id.ftFin);
        fin.getView().setBackgroundColor(Color.WHITE);
        fin.setOnPlaceSelectedListener(new PlaceSelectionListener()
        {
            @Override
            public void onPlaceSelected(Place place)
            {
                //Guarda el punto de destino del recorrido
                coordenadasFin = place.getLatLng();
                direccionDestino = conversorDireccion(coordenadasFin.latitude, coordenadasFin.longitude);
                pintarCoordenadas();
            }

            @Override
            public void onError(Status status)
            {
                // TODO: Handle the error.
                Toast.makeText(Home.this, "" + status.toString(), Toast.LENGTH_SHORT).show();
            }
        });
    }

    /**
     * Inicializacion del boton pedir taxi
     */
    public void botonPedirTaxi()
    {
        btnPedirTaxi = (Button) findViewById(R.id.btn_pedir_taxi);
        btnPedirTaxi.setOnClickListener(new View.OnClickListener()
        {
            @Override
            public void onClick(View v)
            {
                if (seMarcoDestino == false)
                {
                    CommandNames.alerta(Home.this, "Error Registro", "Debe seleccionar oringen y destino");
                }

                if (sePidioTaxi == false && distanciaEstimada != -1 && seMarcoDestino)
                {
                    confirmarTrayectoria("Confirmar envios de datos", "¿Seguro que las ubicaciones de destino y fin estan correctas");
                }
            }
        });
    }

    /**
     * Inicializacion del boton hacer ruta
     */
    public void botonHacerRuta()
    {
        btnFindPath = (Button) findViewById(R.id.btnFindPath);
        btnFindPath.setOnClickListener(new View.OnClickListener()
        {
            @Override
            public void onClick(View v)
            {
                sendRequest();
            }
        });
    }

    /*-----------------------------opciones del menu las cuales no se realizaron-----------------------------*/
    /*De momento este menu esta por defecto*/
    @Override
    public void onBackPressed()
    {
        DrawerLayout drawer = (DrawerLayout) findViewById(R.id.drawer_layout);
        if (drawer.isDrawerOpen(GravityCompat.START))
        {
            drawer.closeDrawer(GravityCompat.START);
        }
        else
        {
            super.onBackPressed();
        }
    }

    @Override
    public boolean onCreateOptionsMenu(Menu menu)
    {
        // Inflate the menu; this adds items to the action bar if it is present.
        getMenuInflater().inflate(R.menu.home, menu);
        return true;
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item)
    {
        // Handle action bar item clicks here. The action bar will
        // automatically handle clicks on the Home/Up button, so long
        // as you specify a parent activity in AndroidManifest.xml.
        int id = item.getItemId();

        //noinspection SimplifiableIfStatement
        if (id == R.id.action_settings)
        {
            return true;
        }
        return super.onOptionsItemSelected(item);
    }

    @SuppressWarnings("StatementWithEmptyBody")
    @Override
    public boolean onNavigationItemSelected(MenuItem item)
    {
        // Handle navigation view item clicks here.
        int id = item.getItemId();

        if (id == R.id.nav_camera)
        {
            // Handle the camera action
        }
        else if (id == R.id.nav_gallery)
        {

        }
        else if (id == R.id.nav_slideshow)
        {

        }
        else if (id == R.id.nav_manage)
        {

        }
        else if (id == R.id.nav_share)
        {

        }
        else if (id == R.id.nav_send)
        {

        }

        DrawerLayout drawer = (DrawerLayout) findViewById(R.id.drawer_layout);
        drawer.closeDrawer(GravityCompat.START);
        return true;
    }
    /*-----------------------------------------fin opciones del menu-----------------------------------------*/

    /**
     * Manipula el mapa una vez que se encuentre disponible.
     * Esta devolución de llamada se activa cuando el mapa está listo para ser utilizado.
     * Aquí es donde podemos agregar marcadores o líneas, agregar oyentes o mover la cámara.
     */
    @Override
    public void onMapReady(GoogleMap googleMap)
    {
        mMap = googleMap;
        if (ActivityCompat.checkSelfPermission(this, Manifest.permission.ACCESS_FINE_LOCATION) != PackageManager.PERMISSION_GRANTED && ActivityCompat.checkSelfPermission(this, Manifest.permission.ACCESS_COARSE_LOCATION) != PackageManager.PERMISSION_GRANTED)
        {
            ActivityCompat.requestPermissions(this, new String[]{Manifest.permission.ACCESS_FINE_LOCATION}, LOCATION_REQUEST);
            return;
        }

        LocationManager locman = (LocationManager) getSystemService(Context.LOCATION_SERVICE);
        mMap.getUiSettings().setZoomControlsEnabled(true);

        double latitud;
        double longitud;
        LocationManager mlocManager = (LocationManager) getSystemService(Context.LOCATION_SERVICE);
        final boolean gpsEnabled = mlocManager.isProviderEnabled(LocationManager.GPS_PROVIDER);
        Location location;

        if (!gpsEnabled)
        {
            location = locman.getLastKnownLocation(LocationManager.GPS_PROVIDER);
            latitud = location.getLatitude();
            longitud = location.getLongitude();
        }
        else
        {
            location = locman.getLastKnownLocation(LocationManager.NETWORK_PROVIDER);
            latitud = location.getLatitude();
            longitud = location.getLongitude();
        }

        LatLng hcmus = new LatLng(latitud, longitud);
        mMap.animateCamera(CameraUpdateFactory.newLatLngZoom(hcmus, 18));
        mMap.setMyLocationEnabled(true);
        setOnListenerMap();
    }

    /**
     * Se encarga de modificar las puntos de origen o destino en caso de que se haga click en el mapa
     */
    public void setOnListenerMap()
    {
        mMap.setOnMapClickListener(new GoogleMap.OnMapClickListener()
        {
            @Override
            public void onMapClick(LatLng latLng)
            {
                //Resetea los marcadores cuando ya existen 2 en el mapa
                if (coordenadasInicio != null && coordenadasFin != null)
                {
                    mMap.clear();
                    coordenadasInicio = null;
                    coordenadasFin = null;
                    seMarcoDestino = false;
                }

                if (coordenadasInicio == null)
                {
                    coordenadasInicio = latLng;
                    direccionOrigen = conversorDireccion(coordenadasInicio.latitude, coordenadasInicio.longitude);
                    inicio.setText(direccionOrigen);
                    pintarCoordenadas();
                }
                else
                {
                    coordenadasFin = latLng;
                    direccionDestino = conversorDireccion(coordenadasFin.latitude, coordenadasFin.longitude);
                    fin.setText(direccionDestino);
                    pintarCoordenadas();
                    trazarRecorrido();
                }
            }
        });
    }


    /**
     * Se encarga de obtener la url de google api que tiene los resultados de la trayectoria
     * @param origin
     * @param dest
     * @return url
     */
    private String getRequestUrl(LatLng origin, LatLng dest)
    {
        String str_org = "origin=" + origin.latitude + "," + origin.longitude;
        String str_dest = "destination=" + dest.latitude + "," + dest.longitude;
        String sensor = "sensor=false";
        String mode = "mode=driving";
        String param = str_org + "&" + str_dest + "&" + sensor + "&" + mode;
        String output = "json";
        String url = "https://maps.googleapis.com/maps/api/directions/" + output + "?" + param;
        return url;
    }

    /**
     * A traves de la URL generada, se obtiene los datos generados de la solicitud
     * @param reqUrl
     * @return devuelve los todos los datos de la solicitud pero en un solo string
     * @throws IOException
     */
    private String requestDirection(String reqUrl) throws IOException
    {
        String responseString = "";
        InputStream inputStream = null;
        HttpURLConnection httpURLConnection = null;
        try
        {
            URL url = new URL(reqUrl);
            httpURLConnection = (HttpURLConnection) url.openConnection();
            httpURLConnection.connect();

            //Get the response result
            inputStream = httpURLConnection.getInputStream();
            InputStreamReader inputStreamReader = new InputStreamReader(inputStream);
            BufferedReader bufferedReader = new BufferedReader(inputStreamReader);

            StringBuffer stringBuffer = new StringBuffer();
            String line = "";
            while ((line = bufferedReader.readLine()) != null)
            {
                stringBuffer.append(line);
            }
            responseString = stringBuffer.toString();
            bufferedReader.close();
            inputStreamReader.close();
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
        finally
        {
            if (inputStream != null)
            {
                inputStream.close();
            }
            httpURLConnection.disconnect();
        }

        //Log.d ("solicitud", responseString);
        return responseString;
    }




    /**
     * Clase que se encarga de decodificar los datos obtenidos desde un archivo json que proporciona una URL desde el googleMap
     */
    public class TaskRequestDirections extends AsyncTask<String, Void, String>
    {
        @Override
        protected String doInBackground(String... strings)
        {
            String responseString = "";
            try
            {
                responseString = requestDirection(strings[0]);
            }
            catch (IOException e)
            {
                e.printStackTrace();
            }
            return responseString;
        }

        @Override
        protected void onPostExecute(String s)
        {
            super.onPostExecute(s);
            //Parse json here
            TaskParser taskParser = new TaskParser();
            taskParser.execute(s);
        }
    }

    /**
     * Esta clase se encarga de obtener un json dados los puntos de origen y destino, para asi obtener
     * el tiempo estimado, la distancia estimada, calcualar el costo aproximado de la trayectoria y por ultimo
     * pintar la posible trayectoria que podria seguir el taxista
     */
    public class TaskParser extends AsyncTask<String, Void, List<List<HashMap<String, String>>>>
    {
        /**
         * Obtiene una lista de puntos de la trayectoria. Estos son obtenido de un archivo json
         * @param strings
         * @return
         */
        @Override
        protected List<List<HashMap<String, String>>> doInBackground(String... strings)
        {
            JSONObject jsonObject = null;
            List<List<HashMap<String, String>>> routes = null;
            try
            {
                jsonObject = new JSONObject(strings[0]);
                DirectionsParser directionsParser = new DirectionsParser();
                routes = directionsParser.parse(jsonObject);
            }
            catch (JSONException e)
            {
                e.printStackTrace();
            }
            return routes;
        }

        /**
         * Primero se extraen los datos de la trayectoria como lo son el tiempo y la distancia
         * para asi obtener solo obtener los puntos de la trayectoria y asi pintarla en el mapa
         * @param lists
         */
        @Override
        protected void onPostExecute(List<List<HashMap<String, String>>> lists)
        {
            lists = extraerDatos(lists); //obtiene solo los puntos de la trayectoria

            //Obtiene la ruta de la lista y la muestra en el mapa
            ArrayList points = null;
            PolylineOptions polylineOptions = null;

            for (List<HashMap<String, String>> path : lists)
            {
                points = new ArrayList();
                polylineOptions = new PolylineOptions();

                for (HashMap<String, String> point : path)
                {
                    double lat = Double.parseDouble(point.get("lat"));
                    double lon = Double.parseDouble(point.get("lon"));
                    points.add(new LatLng(lat, lon));
                }

                polylineOptions.addAll(points);
                polylineOptions.width(15);
                polylineOptions.color(Color.BLUE);
                polylineOptions.geodesic(true);
            }

            if (polylineOptions != null)
            {
                mMap.addPolyline(polylineOptions);
            }
            else
            {
                Toast.makeText(getApplicationContext(), "Direcccion no encontrada!", Toast.LENGTH_SHORT).show();
                distanciaEstimada =-1;
            }
        }
    }

    /**
     * Extrae los datos que se encuentran en la lista y que fueron obtenidos desde le json. Estos datos son las distancia, el tiempo
     * y ademas se calcula el costo aproximado de lo que saldria la solicitud
     * @param lists
     * @return
     */
    public List<List<HashMap<String, String>>> extraerDatos(List<List<HashMap<String, String>>> lists)
    {
        if (lists.size() > 0)
        {
            List<HashMap<String, String>> path1 = lists.get(lists.size() - 1);
            HashMap<String, String> datos = path1.get(0);

            String distanciaString = datos.get("distanciaString");
            String tiempoString = datos.get("tiempoString");
            distanciaEstimada = Integer.parseInt(datos.get("distanciaValue"));
            tiempoEstimado = Integer.parseInt(datos.get("tiempoValue"));

            ((TextView) findViewById(R.id.tvDuration)).setText(tiempoString);
            ((TextView) findViewById(R.id.tvDistance)).setText(distanciaString);


            if (distanciaEstimada >= metros)
            {
                int num = distanciaEstimada / metros;
                calculoCosto = calculoCosto + (num * costoFijoMertos); //calculo aproximado de recorrido
            }

            String stgCosto = String.valueOf(calculoCosto);
            ((TextView) findViewById(R.id.tvCosto)).setText(stgCosto);
            lists.remove(lists.size() - 1);
        }
        return lists;
    }

    /**
     * Muestra los marcadores de origen y destino en el mapa de la aplicacion
     * En caso de que los marcadores se realicen al tocar el mapa, si al existir los marcadores
     * de inicio y destino, y nuevamente se vuelve a tocar el mapa, se borra la trayectoria realizada
     * junto con los marcadores y se vuelve a colocr el marcador de origen de la solicitud
     */
    public void pintarCoordenadas()
    {
        mMap.clear();
        if (coordenadasInicio != null)
        {
            MarkerOptions markerOptionsInicio = new MarkerOptions();
            markerOptionsInicio.position(coordenadasInicio);
            //Add first marker to the map
            markerOptionsInicio.icon(BitmapDescriptorFactory.defaultMarker(BitmapDescriptorFactory.HUE_GREEN));
            markerOptionsInicio.title(direccionOrigen);
            mMap.addMarker(markerOptionsInicio);
            zoomMapa();
        }

        if (coordenadasFin != null)
        {
            MarkerOptions markerOptionsFin = new MarkerOptions();
            markerOptionsFin.position(coordenadasFin);
            markerOptionsFin.icon(BitmapDescriptorFactory.defaultMarker(BitmapDescriptorFactory.HUE_RED));
            markerOptionsFin.title(direccionDestino);
            mMap.addMarker(markerOptionsFin);
            zoomMapa();
        }
    }

    /**
     * Realiza el posible trayecto que un taxista deberia realizar. Esto se puede visualizar en el mapa de la aplicacion
     */
    public void trazarRecorrido()
    {
        obtenerPrecios(); //obtiene los precios desde la base de datos para dar una estimacion de cuanto saldra el recorrido
        String url = getRequestUrl(coordenadasInicio, coordenadasFin); //Crea la URL para obtener los datos de un archivo json a traves de los marcadores de otrigen y destino
        TaskRequestDirections taskRequestDirections = new TaskRequestDirections();
        taskRequestDirections.execute(url);
        seMarcoDestino = true;
        zoomMapa();
    }

    /**
     * Hace que el mapa se mueva hacia los marcadores de origen o destino, y le da un pequeño zoom al mapa centrandolos
     */
    public void zoomMapa()
    {
        LatLngBounds.Builder builder = new LatLngBounds.Builder();
        int padding = 300;// offset from edges of the map in pixels

        if (coordenadasInicio != null && coordenadasFin == null)
        {
            CameraUpdate cu = CameraUpdateFactory.newLatLng(coordenadasInicio);
            mMap.animateCamera(cu);
            return;
        }

        if (coordenadasFin != null && coordenadasInicio == null)
        {

            CameraUpdate cu = CameraUpdateFactory.newLatLng(coordenadasFin);
            mMap.animateCamera(cu);
            return;
        }

        builder.include(coordenadasInicio);
        builder.include(coordenadasFin);
        LatLngBounds bounds = builder.build();
        CameraUpdate cu = CameraUpdateFactory.newLatLngBounds(bounds, padding);
        mMap.animateCamera(cu);
    }

    /**
     * Conversion de coordenadas en direccion
     * @param latitud
     * @param longitud
     * @return direccion
     */
    public String conversorDireccion(double latitud, double longitud)
    {
        String direccion = "";
        if (latitud != 0.0 && longitud != 0.0)
        {
            try
            {
                Geocoder geocoder = new Geocoder(this, Locale.getDefault());
                List<Address> list = geocoder.getFromLocation(latitud, longitud, 5);

                if (!list.isEmpty())
                {
                    Address DirCalle = list.get(0);
                    direccion = String.valueOf(DirCalle.getAddressLine(0));
                }
            }
            catch (IOException e)
            {
                e.printStackTrace();
            }
        }
        return direccion;
    }

    /**
     * Se encarga de verificar que se haya ingresado el lugar de origen y destino en los autocomplete
     * Esta funcion se activa cuando se presiona el boton llamado Ruta
     */
    private void sendRequest()
    {
        if (coordenadasInicio != null && coordenadasFin != null)
        {
            trazarRecorrido();
            seMarcoDestino = true;
        }
        else
        {
            Toast.makeText(getApplicationContext(), "No se han ingresado las 2 direcciones", Toast.LENGTH_SHORT).show();
        }
    }

    /**
     * Dialogo que sirve para confirmar si los puntos de origen y destino de la solicitud es correcto y asi
     * pasar a la etapa de seleccionar el responsabole de la solicitud
     * @param titulo
     * @param msj
     */
    public void confirmarTrayectoria(String titulo, String msj)
    {
        AlertDialog.Builder dialogo1 = new AlertDialog.Builder(this);
        dialogo1.setTitle(titulo);
        dialogo1.setMessage(msj);
        dialogo1.setCancelable(false);
        dialogo1.setPositiveButton("Aceptar", new DialogInterface.OnClickListener()
        {
            public void onClick(DialogInterface dialogo1, int id)
            {
                dialogo1.dismiss();
                seleccionPersona();
            }
        });
        dialogo1.setNegativeButton("Cancelar", new DialogInterface.OnClickListener()
        {
            public void onClick(DialogInterface dialogo1, int id)
            {
                finish();

            }
        });
        dialogo1.show();
    }

    /**
     * Dialogo que sirve para seleccionar quien sera el responsable de la solicitud
     */
    public void seleccionPersona()
    {
        LayoutInflater inflater = getLayoutInflater();
        final View dialoglayout = inflater.inflate(R.layout.seleccion_persona, null);
        final AlertDialog.Builder builder = new AlertDialog.Builder(Home.this);
        builder.setView(dialoglayout);

        final Spinner opcionesPersona;
        opcionesPersona = (Spinner) dialoglayout.findViewById(R.id.selectPerson);
        ArrayAdapter<CharSequence> adapter = ArrayAdapter.createFromResource(this, R.array.opciones, android.R.layout.simple_spinner_item);
        opcionesPersona.setAdapter(adapter);

        Button btnEnviar = (Button) dialoglayout.findViewById(R.id.btnEnviar);
        final AlertDialog dialog = builder.create();

        btnEnviar.setOnClickListener(new View.OnClickListener()
        {
            @Override
            public void onClick(View view)
            {
                persona = opcionesPersona.getSelectedItem().toString();
                if (persona.equals("Yo") || persona.equals("Otra persona"))
                {
                    dialog.dismiss();
                    crearSolicitud(persona);
                }
                else
                {
                    CommandNames.alerta(Home.this, "ALERTA", "Opción mal ingresada, por favor seleccione una de las opciones");
                }
            }
        });
        dialog.show();
    }

    /**
     * Obtiene los datos del usuario registrado para realizar el pedido
     */
    public void misDatos()
    {
        final String idYo = getIntent().getStringExtra("correo");
        Response.Listener<String> responseListener = new Response.Listener<String>()
        {

            @Override
            public void onResponse(String response)
            {
                try
                {
                    JSONObject jsonResponse = new JSONObject(response);
                    boolean success = jsonResponse.getBoolean("success");
                    if (success)
                    {
                        miNombre = jsonResponse.getString("nombre");
                        miApellido = jsonResponse.getString("apPaterno");
                        miTelefono = jsonResponse.getString("telefono");
                        iniciarProceso();
                    }
                    else
                    {
                        CommandNames.alerta(Home.this, "ALERTA", "No se encontro a la persona");
                    }
                }
                catch (JSONException e)
                {
                    e.printStackTrace();
                }
            }
        };

        ConsultarMisDatosRequest consultarMisDatosRequest = new ConsultarMisDatosRequest(idYo, responseListener);
        RequestQueue queue = Volley.newRequestQueue(Home.this);
        queue.add(consultarMisDatosRequest);
    }

    /**
     * Se obtiene los datos de la persona responsable del pedido
     * en caso de que el usario realice un pedido para otra persona.
     * Estos datos se obtienen a traves de un dialog personalizado
     * el cual es un layout llamado otra_persona.xml
     */
    public void otraPersona()
    {
        LayoutInflater inflater = getLayoutInflater();
        final View dialoglayout = inflater.inflate(R.layout.otra_persona, null);
        final AlertDialog.Builder builder = new AlertDialog.Builder(Home.this);
        builder.setView(dialoglayout);

        Button btnEnviar = (Button) dialoglayout.findViewById(R.id.Btn_Solicitar);
        final AlertDialog dialog = builder.create();

        btnEnviar.setOnClickListener(new View.OnClickListener()
        {
            @Override
            public void onClick(View view)
            {

                final EditText nombre = (EditText) dialoglayout.findViewById(R.id.editT_Nombre);
                final EditText apellido = (EditText) dialoglayout.findViewById(R.id.editT_Apellido);
                final EditText telefono = (EditText) dialoglayout.findViewById(R.id.editT_Telefono);

                String nombreValue = nombre.getText().toString();
                String apellidoValue = apellido.getText().toString();
                String telefonoValue = telefono.getText().toString();

                if (nombreValue == "" || apellidoValue == "" || telefonoValue == "")
                {
                    CommandNames.alerta(Home.this, "ALERTA", "No se a podido completar la solicitud debido a existen campos vacios. Favor de verificar estos");
                }
                else
                {
                    miNombre = nombreValue;
                    miApellido = apellidoValue;
                    miTelefono = telefonoValue;
                    dialog.dismiss();
                    iniciarProceso();
                }

            }
        });
        dialog.show();
    }

    /**
     * Reune todos los datos que requiere un recorrido para crear una instancia de recorrido
     * en la cual guarda temporalmente los datos para luego los datos ser enviados a la base de datos
     * @return recorrido
     */
    public Recorrido obtenerRecorrido()
    {
        final Date Fecha = new Date();
        SimpleDateFormat hourFormat = new SimpleDateFormat("HH:mm:ss");
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd");
        final String fecha = dateFormat.format(Fecha);
        final String hora = hourFormat.format(Fecha);
        final String inicio = direccionOrigen;
        final String destino = direccionDestino;
        final String latitudOrig = String.valueOf(coordenadasInicio.latitude);
        final String longitudOrig = String.valueOf(coordenadasInicio.longitude);
        final String latitudDes = String.valueOf(coordenadasFin.latitude);
        final String longitudDes = String.valueOf(coordenadasFin.longitude);

        return new Recorrido(fecha, hora, inicio, destino, latitudOrig, longitudOrig, latitudDes, longitudDes);
    }

    /**
     * Sirve para crear una instancia de pedido. Estos datos seran mostrado en la página del ejecutivo
     * @param persona
     * @param recorrido
     * @return pedido
     */
    public Pedido pedido(Persona persona, Recorrido recorrido)
    {
        String nombre = persona.getNombre();
        String apellido = persona.getApellido();
        String telefono = persona.getTelefono();
        String inicio = recorrido.getInicio();
        String fin = recorrido.getDestino();
        String fecha = recorrido.getFecha();
        String hora = recorrido.getHora();
        String latitudInicial = recorrido.getLatitudOrig();
        String longitudInicial = recorrido.getLongitudOrig();
        String latitudFinal = recorrido.getLatitudDes();
        String longitudFinal = recorrido.getLongitudDes();
        String distancia = String.valueOf(distanciaEstimada);
        String tiempoEstimadoTotal = calculoTiempoEstimado();
        int segundosEstimadoTotal = tiempoEstimado+llegadaTaxi;
        String costoEstimado  = String.valueOf(calculoCosto) ;
        return new Pedido(nombre, apellido, inicio, fin, telefono, fecha, hora, latitudInicial, longitudInicial, latitudFinal, longitudFinal, distancia, tiempoEstimadoTotal, segundosEstimadoTotal, costoEstimado);
    }

    /**
     * Sirve para convertir los segundos en un formato de hh:mm:ss (horas:minutos:segundos)
     * @return hh:mm:ss
     */
    public String calculoTiempoEstimado()
    {
        int tiempoEstimadoTotal = tiempoEstimado + llegadaTaxi;
        int hour = Math.round((tiempoEstimadoTotal % (60 * 60 * 24)) / (60 * 60));
        int minute = Math.round((tiempoEstimadoTotal % (60 * 60)) / (60));
        int second = Math.round(tiempoEstimadoTotal % 60);

        String hours = String.valueOf(hour);
        String minutes = String.valueOf(minute);
        String seconds = String.valueOf(second);

        if(hour<10){
            hours="0"+hours;
        }
        if(minute<10){
            minutes="0"+minutes;
        }
        if(second<10){
            seconds="0"+seconds;
        }
        return hours+":"+minutes+":"+seconds;
    }

    /**
     * Una vez que que se obtenga la trayectoria y se escoja al responsable
     * este metodo accionara los metodos que obtienen los datos de la persona
     * para realizar un pedido
     * @param responsable
     */
    public void crearSolicitud(String responsable)
    {
        if(responsable.equals("Yo"))
        {
            misDatos();
        }
        else
        {
            otraPersona();
        }
    }

    /**
     * Sirve para reunir los datos necesarios para realizar la solicitud.
     * En este punto los datos ya fueron solicitados, este solo se encarga
     * de ordenar lo que existe para comenzar el proceso de subirlo a la
     * base de datos
     */
    public void iniciarProceso()
    {
        Persona persona = new Persona(miNombre, miApellido ,miTelefono);
        Recorrido recorrido = obtenerRecorrido();
        Pedido pedido = pedido(persona, recorrido);
        ingresarPedido(pedido, recorrido);
    }

    /**
     * Registra el pedido en la base de datos y se obtiene su id en caso de que los
     * datos sean guardados exitosamente. Si sucede la situacion anterior, se llama a la funcion
     * ingresar recorrido enviando el id del pedido.
     * @param pedido
     * @param recorrido
     */
    public void ingresarPedido(Pedido pedido, final Recorrido recorrido)
    {
        Response.Listener<String> responseListener = new Response.Listener<String>()
        {
            @Override
            public void onResponse(String response)
            {
                try
                {
                    JSONObject jsonResponse = new JSONObject(response);
                    boolean success = jsonResponse.getBoolean("success");

                    if (success)
                    {
                        String idPedido = jsonResponse.getString("id");
                        //Log.d("pasos","1. paso por ingresar pedido y su id es " + jsonResponse.getString("id"));
                        ingresarRecorrido(idPedido, recorrido);

                    }
                    else
                    {
                        CommandNames.alerta(Home.this, "Error Registro", "Intente nuevamente");

                    }
                }
                catch (JSONException e)
                {
                    //Log.d("burrada", "entro al catch" );
                    e.printStackTrace();
                }
            }
        };

        PedidoRequest pedidoRequest = new PedidoRequest(pedido, responseListener);
        RequestQueue queue = Volley.newRequestQueue(Home.this);
        queue.add(pedidoRequest);
    }

    /**
     * En caso de que el pedido sea registrado correctamente, se procede a guardar en la base de datos, los puntos
     * donde el taxista debe recoger al cliente y el lugar de destino donde debe llevar a este. Ademas se registran
     * otros datos que conlleva un recorrido.
     * @param idPedido
     * @param recorrido
     */
    public void ingresarRecorrido(String idPedido, Recorrido recorrido)
    {
        Response.Listener<String> responseListener = new Response.Listener<String>()
        {

            @Override
            public void onResponse(String response)
            {
                try
                {
                    JSONObject jsonResponse = new JSONObject(response);
                    boolean success = jsonResponse.getBoolean("success");

                    if (success)
                    {
                        String idRecorrido = jsonResponse.getString("id");
                        //Log.d("pasos","2. paso por ingresar recorrido");
                        ingresarPersonaRecorrido(idRecorrido);
                    }
                    else
                    {
                        CommandNames.alerta(Home.this, "Error Registro", "Intente nuevamente");
                    }
                }
                catch (JSONException e)
                {
                    e.printStackTrace();
                }
            }
        };

        RecorridoRequest recorridoRequest = new RecorridoRequest(recorrido, idPedido, responseListener);
        RequestQueue queue = Volley.newRequestQueue(Home.this);
        queue.add(recorridoRequest);
    }

    /**
     * Sirve para unir el id del recorrido con el id del usuario registrado. Estos datos quedan registrado
     * en la base de datos, en la tabla personaRecorrido
     * @param idRecorrido
     */
    public void ingresarPersonaRecorrido(String idRecorrido)
    {
        final String refRecorrido = idRecorrido;
        final String refPersona = getIntent().getStringExtra("correo"); //capta el dato correo del activity MainActivity

        Response.Listener<String> responseListener = new Response.Listener<String>()
        {

            @Override
            public void onResponse(String response)
            {
                try
                {
                    JSONObject jsonResponse = new JSONObject(response);
                    boolean success = jsonResponse.getBoolean("success");

                    if (success)
                    {
                        CommandNames.alerta(Home.this, "PEDIDO TAXI EXITOSO", "Se ha pedido taxi a operadora, espere un momento");
                    }
                    else
                    {
                        CommandNames.alerta(Home.this, "Error Registro", "Intente nuevamente");
                    }
                }
                catch (JSONException e)
                {
                    e.printStackTrace();
                }
            }
        };

        PersonaRecorridoRequest personaRecorridoRequest = new PersonaRecorridoRequest(refRecorrido, refPersona, responseListener);
        RequestQueue queue = Volley.newRequestQueue(Home.this);
        queue.add(personaRecorridoRequest);
    }

    /**
     * Captura el precio del costo inicial del taxi y el costo por metro
     * esto datos se obtienen para hacer la estimacion de del costo total
     * de una solicitud
     */
    public void obtenerPrecios()
    {
        Response.Listener<String> responseListener = new Response.Listener<String>()
        {

            @Override
            public void onResponse(String response)
            {
                try
                {
                    JSONObject jsonResponse = new JSONObject(response);
                    boolean success = jsonResponse.getBoolean("success");

                    if (success)
                    {
                        metros = 200;
                        calculoCosto = jsonResponse.getInt("costoInicial");;
                        costoFijoMertos = jsonResponse.getInt("costoMetro");
                    }
                    else
                    {
                        CommandNames.alerta(Home.this, "Error Registro", "Intente nuevamente");
                    }
                }
                catch (JSONException e)
                {
                    e.printStackTrace();
                }
            }
        };

        ConsultarPreciosRequest consultarPreciosRequest = new ConsultarPreciosRequest(responseListener);
        RequestQueue queue = Volley.newRequestQueue(Home.this);
        queue.add(consultarPreciosRequest);
    }
}
