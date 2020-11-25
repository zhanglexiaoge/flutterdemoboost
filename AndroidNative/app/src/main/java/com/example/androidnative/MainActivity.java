package com.example.androidnative;

import android.os.Bundle;
import android.view.View;
import androidx.appcompat.app.AppCompatActivity;
import flutterMoudle.PageRouter;

import android.widget.Button;

import java.util.HashMap;



public class MainActivity extends AppCompatActivity implements View.OnClickListener {

    private Button btnGotoFlutter;
    private Button btnGotoNaFlutter;

    @Override
    protected void onCreate( Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        setContentView(R.layout.activity_main);

        initView();
    }

    private void initView() {
        btnGotoFlutter = findViewById(R.id.btn_goto_flutter);
        btnGotoNaFlutter = findViewById(R.id.btn_goto_na_flutter);
        btnGotoFlutter.setOnClickListener(this);
        btnGotoNaFlutter.setOnClickListener(this);
    }

    @Override
    public void onClick(View v) {
        switch (v.getId()) {
            case R.id.btn_goto_flutter:
                HashMap<String, String> params = new HashMap<>();
                params.put("setMoublekey", "我是参数->A");
                //FlutterBoostActivity.makeIntent(MainActivity.this,null);
                PageRouter.openPageByUrl(this, "set_mouble", params);
                break;
            case R.id.btn_goto_na_flutter:
//                startActivity(new Intent(MainActivity.this, NativeAndFlutterActivity.class));
                break;
        }
    }
}