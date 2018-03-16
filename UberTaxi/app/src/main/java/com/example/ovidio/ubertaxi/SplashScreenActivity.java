package com.example.ovidio.ubertaxi;

import java.io.IOException;
import java.io.InputStream;
import java.util.Timer;
import java.util.TimerTask;

import android.app.Activity;
import android.content.Intent;
import android.content.pm.ActivityInfo;
import android.os.Bundle;
import android.os.Handler;
import android.util.Log;
import android.view.Window;

import com.felipecsl.gifimageview.library.GifImageView;

import org.apache.commons.io.IOUtils;

/**
 * Esta clase se encarga de dar inicio a la aplicacion mostrando un gif de un taxi en movimeinto
 */
public class SplashScreenActivity extends Activity {

    private GifImageView gifImageView;
    //Duracion del splash screen, en este caso es de 9 segundos
    private static final long SPLASH_SCREEN_DELAY = 9000;

    /**
     * Se encarga de activar el splash screem, enviando el gif del taxi en movimiento. Luego de 9 segundos procede a activity
     * del login y su clase que lo controla es el MainActivity
     * @param savedInstanceState
     */
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_splash_screen);

        gifImageView = (GifImageView)findViewById(R.id.gifImageView);

        //Establecer el recurso GIFImageView
        try{
            InputStream inputStream = getAssets().open("gifKluber.gif");
            byte[] bytes = IOUtils.toByteArray(inputStream);
            gifImageView.setBytes(bytes);
            gifImageView.startAnimation();
        }
        catch (IOException ex)
        {
            Log.d("Alerta", "Falla en el splash");
        }

        new Handler().postDelayed(new Runnable() {
            @Override
            public void run() {
                SplashScreenActivity.this.startActivity(new Intent(SplashScreenActivity.this,MainActivity.class));
                SplashScreenActivity.this.finish();
            }
        },SPLASH_SCREEN_DELAY);
    }

}
