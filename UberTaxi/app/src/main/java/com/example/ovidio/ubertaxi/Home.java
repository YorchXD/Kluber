package com.example.ovidio.ubertaxi;

import android.Manifest;
import android.annotation.SuppressLint;
import android.content.Context;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.graphics.Color;
import android.location.Address;
import android.location.Geocoder;
import android.location.Location;
import android.location.LocationManager;
import android.os.AsyncTask;
import android.os.Bundle;
import android.support.annotation.NonNull;
import android.support.design.widget.FloatingActionButton;
import android.support.design.widget.Snackbar;
import android.support.v4.app.ActivityCompat;
import android.support.v7.app.AlertDialog;
import android.util.Log;
import android.view.View;
import android.support.design.widget.NavigationView;
import android.support.v4.view.GravityCompat;
import android.support.v4.widget.DrawerLayout;
import android.support.v7.app.ActionBarDrawerToggle;
import android.support.v7.app.AppCompatActivity;
import android.support.v7.widget.Toolbar;
import android.view.Menu;
import android.view.MenuItem;
import android.widget.Button;
import android.widget.TextView;
import android.widget.Toast;

import com.android.volley.RequestQueue;
import com.android.volley.Response;
import com.android.volley.toolbox.Volley;
import com.google.android.gms.common.api.Status;
import com.google.android.gms.location.places.Place;
import com.google.android.gms.location.places.ui.PlaceAutocompleteFragment;
import com.google.android.gms.location.places.ui.PlaceSelectionListener;
import com.google.android.gms.maps.CameraUpdateFactory;
import com.google.android.gms.maps.GoogleMap;
import com.google.android.gms.maps.OnMapReadyCallback;
import com.google.android.gms.maps.SupportMapFragment;
import com.google.android.gms.maps.model.BitmapDescriptorFactory;
import com.google.android.gms.maps.model.LatLng;
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

public class Home extends AppCompatActivity
        implements NavigationView.OnNavigationItemSelectedListener, OnMapReadyCallback {

    private GoogleMap mMap;
    /*recorrido automatico*/
    private static final int LOCATION_REQUEST = 500;
    /*recorrido manual*/
    LatLng coordenadasInicio;
    LatLng coordenadasFin;

    private boolean sePidioTaxi, seMarcoDestino;

    private PlaceAutocompleteFragment inicio;
    private PlaceAutocompleteFragment fin;

    private Button btnFindPath, btnPedirTaxi;

    private String IdRecorrido, Fecha, Hora, LugarInicio, LugarDestino;

    private String Direccion, direccionOrigen, direccionDestino;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_home);
        Toolbar toolbar = (Toolbar) findViewById(R.id.toolbar);
        setSupportActionBar(toolbar);

        sePidioTaxi=false;
        seMarcoDestino = false;

        IdRecorrido = "";
        Fecha="";
        Hora = "";
        LugarInicio="";
        LugarDestino="";

        Direccion = "";
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

        btnFindPath = (Button) findViewById(R.id.btnFindPath);
        btnFindPath.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                sendRequest();
            }
        });

        inicio = (PlaceAutocompleteFragment)getFragmentManager().findFragmentById(R.id.ftInicio);

        inicio.getView().setBackgroundColor(Color.WHITE);


        inicio.setOnPlaceSelectedListener(new PlaceSelectionListener() {


            @Override
            public void onPlaceSelected(Place place) {

                //Save first point select
                coordenadasInicio=place.getLatLng();

                conversorDireccion(coordenadasInicio.latitude,coordenadasInicio.longitude);
                direccionOrigen = Direccion;

                Log.d("CoordenadasInicio", "lat "+coordenadasInicio.latitude + " lng: " + coordenadasInicio.longitude );
                pintarCoordenadas();

            }

            @Override
            public void onError(Status status) {
                // TODO: Handle the error.
                Toast.makeText(Home.this,""+status.toString(), Toast.LENGTH_SHORT).show();

            }
        });

        fin = (PlaceAutocompleteFragment)getFragmentManager().findFragmentById(R.id.ftFin);

        fin.getView().setBackgroundColor(Color.WHITE);

        fin.setOnPlaceSelectedListener(new PlaceSelectionListener() {


            @Override
            public void onPlaceSelected(Place place) {


                //Save first point select
                coordenadasFin=place.getLatLng();

                conversorDireccion(coordenadasFin.latitude,coordenadasFin.longitude);

                direccionDestino = Direccion;

                Log.d("CoordenadasInicio", "lat "+coordenadasFin.latitude + " lng: " + coordenadasFin.longitude );
                pintarCoordenadas();

            }

            @Override
            public void onError(Status status) {
                // TODO: Handle the error.
                Toast.makeText(Home.this,""+status.toString(), Toast.LENGTH_SHORT).show();

            }
        });


        btnPedirTaxi = (Button) findViewById(R.id.btn_pedir_taxi);
        btnPedirTaxi.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {

                if(seMarcoDestino == false)
                {
                    AlertDialog.Builder builder = new AlertDialog.Builder(Home.this);
                    builder.setMessage("Error Registro1")
                            .setNegativeButton("Debe seleccionar oringen y destino", null)
                            .create().show();
                }

                if(sePidioTaxi==false && seMarcoDestino== true)
                {

                    ingresarDatosRecorrido();

                }

            }
        });

    }


    public void ingresarDatosRecorrido()
    {
        final Date Fecha = new Date();

        SimpleDateFormat hourFormat = new SimpleDateFormat("HH:mm:ss");

        Log.d("Fecha","Hora: "+hourFormat.format(Fecha));

        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd");


        final String fecha= dateFormat.format(Fecha);
        final String hora= hourFormat.format(Fecha);
        final String inicio= direccionOrigen;
        final String destino= direccionDestino;
        final String latitudOrig= String.valueOf(coordenadasInicio.latitude);
        final String longitudOrig= String.valueOf(coordenadasInicio.longitude);
        final String latitudDes= String.valueOf(coordenadasFin.latitude);
        final String longitudDes= String.valueOf(coordenadasFin.longitude);

        Log.d("latitudOrig",latitudOrig);


        Log.d("direccionOrigen",direccionOrigen);

        if(inicio =="" || destino =="")
        {
            AlertDialog.Builder builder = new AlertDialog.Builder(Home.this);
            builder.setMessage("Error Registro2")
                    .setNegativeButton("Debe ingresar dirección inicio y destino", null)
                    .create().show();
        }
        else
        {


            Log.d("Cualquier cosa1", "cosa");
            Response.Listener<String> responseListener = new Response.Listener<String>() {

                @Override
                public void onResponse(String response) {
                    try {
                        JSONObject jsonResponse = new JSONObject(response);
                        boolean success = jsonResponse.getBoolean("success");

                        if (success) {

                            Log.d("success", "" + success);

                            Log.d("fecha", fecha);

                            consultaRecorrido(fecha, hora, inicio, destino);

                        } else {
                            AlertDialog.Builder builder = new AlertDialog.Builder(Home.this);
                            builder.setMessage("Error Registro")
                                    .setNegativeButton("Intente nuevamente", null)
                                    .create().show();
                        }

                    } catch (JSONException e) {
                        Log.d("Cualquier cosa2", "cosa");
                        e.printStackTrace();
                    }
                }
            };

            RecorridoRequest recorridoRequest = new RecorridoRequest(fecha, hora, inicio, destino,
                    latitudOrig, longitudOrig, latitudDes, longitudDes,responseListener);

            RequestQueue queue = Volley.newRequestQueue(Home.this);
            queue.add(recorridoRequest);
        }
    }


    public void consultaRecorrido(String fecha1, String hora1, String lugarInicio1, String lugarDestino1)
    {

        final String fecha= fecha1;
        final String hora= hora1;
        final String lugarInicio= lugarInicio1;
        final String lugarDestino= lugarDestino1;

        Log.d("Cualquier cosaaaaa","cosa");
        Response.Listener<String> responseListener = new Response.Listener<String>(){

            @Override
            public void onResponse(String response) {
                try {
                    JSONObject jsonResponse = new JSONObject(response);
                    boolean success = jsonResponse.getBoolean("success");

                    Log.d("Cualquier cosa","cosa");

                    if(success)
                    {

                        Log.d("successsss",""+success);

                        String id =jsonResponse.getString("id");
                        Log.d("idddd",""+ id);

                        ingresarDatosPersonaRecorrido(id);

                        IdRecorrido = id;

                        sePidioTaxi=true;


                        AlertDialog.Builder builder = new AlertDialog.Builder(Home.this);
                        builder.setMessage("PEDIDO TAXI EXITOSO")
                                .setNegativeButton("Se ha pedido taxi a operadora, espere un momento", null)
                                .create().show();

                    }
                    else
                    {
                        AlertDialog.Builder builder = new AlertDialog.Builder(Home.this);
                        builder.setMessage("Error de pedido")
                                .setNegativeButton("Intentelo nuevamente", null)
                                .create().show();
                    }

                } catch (JSONException e) {
                    Log.d("Cualquier cosa2","cosa");
                    e.printStackTrace();
                }
            }
        };

        ConsultaRecorridoRequest consultaRecorridoRequest = new ConsultaRecorridoRequest(fecha, hora, lugarInicio, lugarDestino, responseListener);



        RequestQueue queue = Volley.newRequestQueue(Home.this);
        queue.add(consultaRecorridoRequest);
    }


    public void ingresarDatosPersonaRecorrido(String idRecorrido)
    {
        Bundle extras = getIntent().getExtras();
        final String recorrido = idRecorrido;
        final String persona=getIntent().getStringExtra("correo"); //capta el dato correo del activity MainActivity

        Response.Listener<String> responseListener = new Response.Listener<String>(){

            @Override
            public void onResponse(String response) {
                try {
                    JSONObject jsonResponse = new JSONObject(response);
                    boolean success = jsonResponse.getBoolean("success");

                    if(success)
                    {
                        Log.d("success","");
                        String refRecorrido = jsonResponse.getString("refRecorrido");

                        Log.d("refRecorrido",""+refRecorrido);
                    }
                    else
                    {
                        AlertDialog.Builder builder = new AlertDialog.Builder(Home.this);
                        builder.setMessage("Error Registro")
                                .setNegativeButton("Intente nuevamente", null)
                                .create().show();
                    }

                } catch (JSONException e) {
                    e.printStackTrace();
                }
            }
        };

        PersonaRecorridoRequest personaRecorridoRequest = new PersonaRecorridoRequest(recorrido,persona,responseListener);

        RequestQueue queue = Volley.newRequestQueue(Home.this);

        queue.add(personaRecorridoRequest);
    }

    @Override
    public void onBackPressed() {
        DrawerLayout drawer = (DrawerLayout) findViewById(R.id.drawer_layout);
        if (drawer.isDrawerOpen(GravityCompat.START)) {
            drawer.closeDrawer(GravityCompat.START);
        } else {
            super.onBackPressed();
        }
    }

    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        // Inflate the menu; this adds items to the action bar if it is present.
        getMenuInflater().inflate(R.menu.home, menu);
        return true;
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        // Handle action bar item clicks here. The action bar will
        // automatically handle clicks on the Home/Up button, so long
        // as you specify a parent activity in AndroidManifest.xml.
        int id = item.getItemId();

        //noinspection SimplifiableIfStatement
        if (id == R.id.action_settings) {
            return true;
        }

        return super.onOptionsItemSelected(item);
    }

    @SuppressWarnings("StatementWithEmptyBody")
    @Override
    public boolean onNavigationItemSelected(MenuItem item) {
        // Handle navigation view item clicks here.
        int id = item.getItemId();

        if (id == R.id.nav_camera) {
            // Handle the camera action
        } else if (id == R.id.nav_gallery) {

        } else if (id == R.id.nav_slideshow) {

        } else if (id == R.id.nav_manage) {

        } else if (id == R.id.nav_share) {

        } else if (id == R.id.nav_send) {

        }

        DrawerLayout drawer = (DrawerLayout) findViewById(R.id.drawer_layout);
        drawer.closeDrawer(GravityCompat.START);
        return true;
    }

    /**
     * Manipulates the map once available.
     * This callback is triggered when the map is ready to be used.
     * This is where we can add markers or lines, add listeners or move the camera. In this case,
     * we just add a marker near Sydney, Australia.
     * If Google Play services is not installed on the device, the user will be prompted to install
     * it inside the SupportMapFragment. This method will only be triggered once the user has
     * installed Google Play services and returned to the app.
     */
    @Override
    public void onMapReady(GoogleMap googleMap) {
        mMap = googleMap;


        if (ActivityCompat.checkSelfPermission(this, Manifest.permission.ACCESS_FINE_LOCATION) != PackageManager.PERMISSION_GRANTED && ActivityCompat.checkSelfPermission(this, Manifest.permission.ACCESS_COARSE_LOCATION) != PackageManager.PERMISSION_GRANTED) {

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
        if(!gpsEnabled)
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

        //mlocManager.requestLocationUpdates(LocationManager.NETWORK_PROVIDER, 0, 0, (LocationListener) location);
        //mlocManager.requestLocationUpdates(LocationManager.GPS_PROVIDER, 0, 0, (LocationListener) location);
        //Location location = locman.getLastKnownLocation(LocationManager.GPS_PROVIDER);


        Log.d("coordenadas", "latitud: " + latitud + " longitud: " + longitud);

        LatLng hcmus = new LatLng(latitud, longitud);
        mMap.moveCamera(CameraUpdateFactory.newLatLngZoom(hcmus, 18));


        mMap.getUiSettings().setZoomControlsEnabled(true);
        if (ActivityCompat.checkSelfPermission(this, Manifest.permission.ACCESS_FINE_LOCATION) != PackageManager.PERMISSION_GRANTED && ActivityCompat.checkSelfPermission(this, Manifest.permission.ACCESS_COARSE_LOCATION) != PackageManager.PERMISSION_GRANTED) {
            ActivityCompat.requestPermissions(this, new String[]{Manifest.permission.ACCESS_FINE_LOCATION}, LOCATION_REQUEST);
            return;
        }


        mMap.setMyLocationEnabled(true);
        mMap.setOnMapClickListener(new GoogleMap.OnMapClickListener() {
            @Override
            public void onMapClick(LatLng latLng)
            {
                //Reset marker when already 2
                if (coordenadasInicio!=null && coordenadasFin!=null) {
                    mMap.clear();
                    coordenadasInicio=null;
                    coordenadasFin=null;
                }

                if(coordenadasInicio==null)
                {
                    coordenadasInicio=latLng;
                    inicio.setText(conversorDireccion(coordenadasInicio.latitude, coordenadasInicio.longitude));
                    direccionOrigen = Direccion;
                    pintarCoordenadas();
                }
                else
                {
                    coordenadasFin=latLng;
                    fin.setText(conversorDireccion(coordenadasFin.latitude, coordenadasFin.longitude));
                    direccionDestino = Direccion;
                    pintarCoordenadas();
                    trazarRecorrido();
                }

            }
        });
    }

    private String getRequestUrl(LatLng origin, LatLng dest) {
        //Value of origin
        String str_org = "origin=" + origin.latitude +","+origin.longitude;
        //Value of destination
        String str_dest = "destination=" + dest.latitude+","+dest.longitude;
        //Set value enable the sensor
        String sensor = "sensor=false";
        //Mode for find direction
        String mode = "mode=driving";
        //Build the full param
        String param = str_org +"&" + str_dest + "&" +sensor+"&" +mode;
        //Output format
        String output = "json";
        //Create url to request
        String url = "https://maps.googleapis.com/maps/api/directions/" + output + "?" + param;
        return url;
    }

    private String requestDirection(String reqUrl) throws IOException {
        String responseString = "";
        InputStream inputStream = null;
        HttpURLConnection httpURLConnection = null;
        try{
            URL url = new URL(reqUrl);
            httpURLConnection = (HttpURLConnection) url.openConnection();
            httpURLConnection.connect();

            //Get the response result
            inputStream = httpURLConnection.getInputStream();
            InputStreamReader inputStreamReader = new InputStreamReader(inputStream);
            BufferedReader bufferedReader = new BufferedReader(inputStreamReader);

            StringBuffer stringBuffer = new StringBuffer();
            String line = "";
            while ((line = bufferedReader.readLine()) != null) {
                stringBuffer.append(line);
            }

            responseString = stringBuffer.toString();
            bufferedReader.close();
            inputStreamReader.close();

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (inputStream != null) {
                inputStream.close();
            }
            httpURLConnection.disconnect();
        }
        return responseString;
    }


    @SuppressLint("MissingPermission")
    @Override
    public void onRequestPermissionsResult(int requestCode, @NonNull String[] permissions, @NonNull int[] grantResults) {
        switch (requestCode){
            case LOCATION_REQUEST:
                if (grantResults.length > 0 && grantResults[0] == PackageManager.PERMISSION_GRANTED) {
                    mMap.setMyLocationEnabled(true);
                }
                break;
        }
    }

    public class TaskRequestDirections extends AsyncTask<String, Void, String> {

        @Override
        protected String doInBackground(String... strings) {
            String responseString = "";
            try {
                responseString = requestDirection(strings[0]);
            } catch (IOException e) {
                e.printStackTrace();
            }
            return  responseString;
        }

        @Override
        protected void onPostExecute(String s) {
            super.onPostExecute(s);
            //Parse json here
            TaskParser taskParser = new TaskParser();
            taskParser.execute(s);
        }


    }

    public class TaskParser extends AsyncTask<String, Void, List<List<HashMap<String, String>>> > {
        @Override
        protected List<List<HashMap<String, String>>> doInBackground(String... strings) {
            JSONObject jsonObject = null;
            List<List<HashMap<String, String>>> routes = null;
            try {
                jsonObject = new JSONObject(strings[0]);
                DirectionsParser directionsParser = new DirectionsParser();
                routes = directionsParser.parse(jsonObject);

            } catch (JSONException e) {
                e.printStackTrace();
            }
            return routes;
        }




        @Override
        protected void onPostExecute(List<List<HashMap<String, String>>> lists) {
            for (List<HashMap<String, String>> path : lists) {
                for (HashMap<String, String> point : path) {
                    Log.d("impresion", point.toString());
                }
            }

            if(lists.size()>0)
            {
                List<HashMap<String, String>> path1 = lists.get(lists.size()-1);
                HashMap<String, String> datos = path1.get(0);
                String distanciaString = datos.get("distanciaString");
                String tiempoString = datos.get("tiempoString");
                int distanciaInt = Integer.parseInt(datos.get("distanciaValue"));
                Log.d("datos", "distanciaString: " + distanciaString+ " distanciaInt: " +distanciaInt + " tiempoString: " + tiempoString);
                ((TextView) findViewById(R.id.tvDuration)).setText(tiempoString);
                ((TextView) findViewById(R.id.tvDistance)).setText(distanciaString);

                int calculoCosto=500;

                if(distanciaInt>=200)
                {
                    int num = distanciaInt/200;
                    calculoCosto = calculoCosto+(num*120); //calculo aproximado de recorrido
                }

                String stgCosto= String.valueOf(calculoCosto);


                ((TextView) findViewById(R.id.tvCosto)).setText(stgCosto);



                lists.remove(lists.size()-1);
            }

            //Get list route and display it into the map

            ArrayList points = null;

            PolylineOptions polylineOptions = null;

            for (List<HashMap<String, String>> path : lists) {
                points = new ArrayList();
                polylineOptions = new PolylineOptions();

                for (HashMap<String, String> point : path) {
                    double lat = Double.parseDouble(point.get("lat"));
                    double lon = Double.parseDouble(point.get("lon"));

                    points.add(new LatLng(lat,lon));
                }

                polylineOptions.addAll(points);
                polylineOptions.width(15);
                polylineOptions.color(Color.BLUE);
                polylineOptions.geodesic(true);


            }

            if (polylineOptions!=null) {
                mMap.addPolyline(polylineOptions);

            } else {
                Toast.makeText(getApplicationContext(), "Direcccion no encontrada!", Toast.LENGTH_SHORT).show();
            }

        }
    }

    public void pintarCoordenadas()
    {
        mMap.clear();
        if(coordenadasInicio!=null)
        {
            MarkerOptions markerOptionsInicio = new MarkerOptions();
            markerOptionsInicio.position(coordenadasInicio);
            //Add first marker to the map
            markerOptionsInicio.icon(BitmapDescriptorFactory.defaultMarker(BitmapDescriptorFactory.HUE_GREEN));
            markerOptionsInicio.title(direccionOrigen);
            mMap.addMarker(markerOptionsInicio);
            seMarcoDestino=false;
        }

        if(coordenadasFin!=null)
        {
            MarkerOptions markerOptionsFin = new MarkerOptions();
            markerOptionsFin.position(coordenadasFin);
            markerOptionsFin.icon(BitmapDescriptorFactory.defaultMarker(BitmapDescriptorFactory.HUE_RED));
            markerOptionsFin.title(direccionDestino);
            mMap.addMarker(markerOptionsFin);
            seMarcoDestino=true;
        }

    }

    public void trazarRecorrido()
    {
        //Create the URL to get request from first marker to second marker
        String url = getRequestUrl(coordenadasInicio, coordenadasFin);
        TaskRequestDirections taskRequestDirections = new TaskRequestDirections();
        taskRequestDirections.execute(url);
    }

    /*Conversion de coordenadas en direccion*/
    public String conversorDireccion(double latitud, double longitud)
    {
        String direccion="";
        if (latitud != 0.0 && longitud != 0.0) {
            try {
                Log.d("DIRECCION","LATITUD: "+latitud + " LONGITUD: "+longitud );
                Geocoder geocoder = new Geocoder(this, Locale.getDefault());
                List<Address> list = geocoder.getFromLocation(
                        latitud, longitud, 5);

                if (!list.isEmpty()) {
                    Address DirCalle = list.get(0);
                    direccion= String.valueOf(DirCalle.getAddressLine(0));
                    Log.d("Mi direccion es:",""+ DirCalle.getAddressLine(0));
                }

            } catch (IOException e) {
                e.printStackTrace();
            }
        }

        Direccion = direccion;
        return direccion;
    }

    private void sendRequest() {

        if(coordenadasInicio!=null && coordenadasFin!=null)
        {
            trazarRecorrido();
            seMarcoDestino = true;
            Log.d("seMarcoDestinoSend",String.valueOf(seMarcoDestino));
        }
        else
        {
            Toast.makeText(getApplicationContext(), "No se han ingresado las 2 direcciones", Toast.LENGTH_SHORT).show();
        }

    }

}
