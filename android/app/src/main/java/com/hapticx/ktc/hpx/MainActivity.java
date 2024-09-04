package com.hapticx.ktc.hpx;

import android.annotation.SuppressLint;
import android.app.Activity;
import android.content.Context;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.view.View;
import android.view.Window;
import android.view.WindowManager;
import android.webkit.WebChromeClient;
import android.webkit.WebSettings;
import android.webkit.WebView;
import android.webkit.WebViewClient;

public class MainActivity extends Activity {
    private WebView w;
    private boolean paused = false;

    @SuppressLint("SetJavaScriptEnabled")
    @Override
    protected void onCreate(Bundle s) {
        super.onCreate(s);
        setContentView(R.layout.activity_main);
        getActionBar().hide();
        w = findViewById(R.id.webView);

        if (!paused) {
            new Thread(() -> Native.start(this)).start();

            Native n = new Native(this);
            new Thread(n::uiLoop).start();
        }
        setupWebView();
    }

    public void setAppColor(int color) {
        final Window window = this.getWindow();
        window.setStatusBarColor(color);
        window.setNavigationBarColor(color);
    }

    public void setAppColor(int color, boolean isLight) {
        final Window window = this.getWindow();
        window.setStatusBarColor(color);
        window.setNavigationBarColor(color);
        if (isLight) {
            window.getDecorView().setSystemUiVisibility(View.SYSTEM_UI_FLAG_LIGHT_STATUS_BAR);
        } else {
            int flags = window.getDecorView().getSystemUiVisibility();
            flags &= ~View.SYSTEM_UI_FLAG_LIGHT_STATUS_BAR;
            window.getDecorView().setSystemUiVisibility(flags);
        }
    }

    @SuppressLint("SetJavaScriptEnabled")
    protected void setupWebView() {
        w.setWebChromeClient(new WebChromeClient());
        w.setWebViewClient(new WebViewClient() {
            @Override
            public void onPageFinished(WebView v, String u) {
                setTitle(v.getTitle());
                super.onPageFinished(v, u);
            }
        });

        WebSettings ws = w.getSettings();
        ws.setJavaScriptEnabled(true);
        ws.setDomStorageEnabled(true);
        ws.setBuiltInZoomControls(true);
        ws.setDisplayZoomControls(false);
        ws.setSupportZoom(false);
        ws.setDefaultTextEncodingName("utf-8");

        w.loadUrl("http://localhost:5234/");
    }

    @Override
    protected void onDestroy() {
        super.onDestroy();
        System.exit(0);
    }

    @Override
    protected void onPause() {
        super.onPause();
        paused = true;
    }
}
