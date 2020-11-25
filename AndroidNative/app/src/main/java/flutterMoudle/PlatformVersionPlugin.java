package flutterMoudle;
import com.idlefish.flutterboost.FlutterBoost;

import io.flutter.plugin.common.MethodChannel;

public class PlatformVersionPlugin {
    private static final String PLUGIN_NAME = "platformVersionPlugin";

    public static String CHANNEL = "Flutter_Module_Methodchannel";

    public void register() {
        MethodChannel methodChannel = new MethodChannel(FlutterBoost.instance().engineProvider().getDartExecutor(), CHANNEL);
        FlutterCallBackMethod callBackMethod = new FlutterCallBackMethod(FlutterBoost.instance().currentActivity());
        methodChannel.setMethodCallHandler(callBackMethod);
    }


}
