package flutterMoudle;

import android.app.Application;
import android.content.Context;

//import com.blankj.utilcode.util.DeviceUtils;
//import com.hanmaker.bryan.hc.common.config.ComConfig;
//import com.hanmaker.bryan.hc.common.utils.LocalLogUtls;
//import com.hanmaker.bryan.hc.utils.MediaUtils;
import com.idlefish.flutterboost.FlutterBoost;
import com.idlefish.flutterboost.Platform;
import com.idlefish.flutterboost.interfaces.INativeRouter;

import java.util.Map;

import io.flutter.embedding.android.FlutterView;

public class FlutterMediator {
    public static void init(final Application app) {

        INativeRouter router = new INativeRouter() {
            @Override
            public void openContainer(Context context, String url, Map<String, Object> urlParams, int requestCode, Map<String, Object> exts) {
//                String  assembleUrl= Utils.assembleUrl(url,urlParams);
                PageRouter.openPageByUrl(context, url, urlParams);
            }
        };

        FlutterBoost.BoostLifecycleListener lifecycleListener = new FlutterBoost.BoostLifecycleListener() {
            @Override
            public void beforeCreateEngine() {

            }

            @Override
            public void onEngineCreated() {
               // LocalLogUtls.i("onEngineCreated()--------------------->");
                new PlatformVersionPlugin().register();
            }

            @Override
            public void onPluginsRegistered() {
//                MethodChannel mMethodChannel = new MethodChannel(FlutterBoost.instance().engineProvider().getDartExecutor(), "methodChannel");
//                FlutterCallBackMethod.registerWith(FlutterBoost.instance().channel().registrarFor("FlutterCallBackMethod"));
//                TextPlatformViewPlugin.register(FlutterBoost.instance().getPluginRegistry().registrarFor("TextPlatformViewPlugin"));

                //MediaUtils.defaultDataToFlutter(ComConfig.getToken(), ComConfig.getUid(), ComConfig.getAvatar(), DeviceUtils.getAndroidID());
                MediaUtils.defaultDataToFlutter("token", 3333, "234567801223", "23456780");
            }

            @Override
            public void onEngineDestroy() {

            }
        };

        Platform platform = new FlutterBoost
                .ConfigBuilder(app, router)
                .isDebug(true)
                .whenEngineStart(FlutterBoost.ConfigBuilder.ANY_ACTIVITY_CREATED)
                .renderMode(FlutterView.RenderMode.texture)
                .lifecycleListener(lifecycleListener)
                .build();

        FlutterBoost.instance().init(platform);
    }
}
