package flutterMoudle;
import android.content.Context;
import android.content.Intent;
import android.os.Parcelable;
import android.text.TextUtils;
import android.util.Log;
import android.app.Activity;
import com.idlefish.flutterboost.containers.BoostFlutterActivity;

//import com.hanmaker.bryan.hc.common.utils.LocalLogUtls;

import java.io.Serializable;
import java.util.HashMap;
import java.util.Map;
public class PageRouter {


    public static void openPageByUrl(Context context, String url, Map params) {
        Log.d("跳转flutterurl", url);
        Log.d(">>参数", params.toString());
        openPageByUrl(context, url, params, 0);
    }

    public static void openPageByUrl(Context context, String url, Map params, int requestCode) {

        String path = url.split("\\?")[0];
        Log.i("openPageByUrl",path);

        try {

                Intent intent = BoostFlutterActivity.withNewEngine().url(path).params(params)
                        .backgroundMode(BoostFlutterActivity.BackgroundMode.opaque).build(context);
                MediaUtils.defaultDataToFlutter("token", 3333, "234567801223", "23456780");
                context.startActivity(intent);
//                if(context instanceof Activity){
//                    Activity activity=(Activity)context;
//                    activity.startActivityForResult(intent,requestCode);
//                }else{
 //                   context.startActivity(intent);
             //   }




        } catch (Throwable t) {
            t.printStackTrace();
        }
//        try {
////            if (pageName.containsKey(path)) {
//            if (params.containsKey("keyboardEnable")) {
//                params.remove("keyboardEnable");
//            }
//            if (!TextUtils.isEmpty(path)) {
//                params.put("type", path);
//            }
//            /**
//             * 更换flutter内部跳转响应方式，便于控制FlutterBoostActivity的生命周期，从而修改
//             * FlutterBoostActivity的标题栏颜色，解决flutter二级页面标题栏空白的问题
//             */
////            Intent intent = FlutterBoostActivity.withNewEngine().url(pageName.get(path)).params(params)
////                    .backgroundMode(NewBoostFlutterActivity.BackgroundMode.opaque).build(context);
//
//            Intent intent = BoostFlutterActivity.withNewEngine().url(path).params(params)
//                    .backgroundMode(BoostFlutterActivity.BackgroundMode.opaque).build(context);
//            MediaUtils.defaultDataToFlutter("token", 3333, "234567801223", "23456780");
//
////            Intent intent = new Intent(context, FlutterBoostActivity.class);
////            intent.putExtra("params", (Serializable) params);
//            //intent.putExtra("type", "123456");
////            context.startActivity(intent);
//
//
//                context.startActivity(intent);
//
//
////            }
//        } catch (Throwable t) {
//            t.printStackTrace();
//        }
    }

}
