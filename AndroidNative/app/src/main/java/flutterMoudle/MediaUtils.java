package flutterMoudle;
import android.util.Log;

import java.util.HashMap;
import java.util.Map;

import com.example.androidnative.BuildConfig;
import com.example.androidnative.MainActivity;
import com.idlefish.flutterboost.FlutterBoost;
public class MediaUtils {
    /**
     * 设置flutter上传默认值
     */
    public static void defaultDataToFlutter(String token, int uid, String avatar, String androidUid) {
        Map<String, Object> map = new HashMap<>();
        Map<String, String> header = new HashMap<>();

        map.put("baseurl","http://www.genitechnology.com/fund_module/");
        header.put("appVersion", "3.3.3");
        header.put("deviceName", "iPhone8,2");
        header.put("nettype", "NW_WIFI" );
        header.put("osversion", "11.4.1");
        header.put("platform", "iOS");
        header.put("source", "jmp");
        header.put("token", "58704ba7-b067-4f6c-a947-1c98f0cb4855");
        header.put("udid", "79C3EF28-F270-4D80-846E-9FFF8F4B3710");
        map.put("header",header);

        Log.d("11111","原生传入flutter基础参数");

//        map.put("token", token);
//        map.put("baseUrl", ComConfig.getBaseUrl());
//        map.put("userId", uid);
//        map.put("userAvatar", avatar);
//        map.put("version", "android." + BuildConfig.VERSION_NAME);
//        map.put("deviceUuid", androidUid);
//        if (ConversationUtils.isInHolidayDuration())
//            map.put("theme", true);
//        else
//            map.put("theme", false);
        FlutterBoost.instance().channel().sendEvent("Flutter_Module_Eventchannel", map);
    }

}
