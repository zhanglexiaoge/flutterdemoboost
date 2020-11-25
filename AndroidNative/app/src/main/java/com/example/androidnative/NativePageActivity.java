package com.example.androidnative;

import android.os.Bundle;

import android.widget.TextView;
import androidx.appcompat.app.AppCompatActivity;

/**
 * 安卓原生页面
 */
public class NativePageActivity extends AppCompatActivity {
    @Override
    protected void onCreate( Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_native_page);

        init();
    }

    private void init() {
        Bundle extras = getIntent().getExtras();
        if (extras == null) return;
        String str = extras.getString("native");
        TextView textView = findViewById(R.id.tv_text);
        textView.setText(str);
    }
}
