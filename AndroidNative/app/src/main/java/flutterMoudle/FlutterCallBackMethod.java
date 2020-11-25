package flutterMoudle;
import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.text.TextUtils;
import android.util.Log;
import android.view.View;

import androidx.annotation.NonNull;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.PluginRegistry;


public class FlutterCallBackMethod implements MethodChannel.MethodCallHandler {
    public static String CHANNEL = "Flutter_Module_Methodchannel";

    public static MethodChannel channel;

    private Activity activity;
//    //联系人信息
//    private final HashMap<Integer, ContactsBean> contactMap = new HashMap<>();
//    //群组信息
//    private final HashMap<Integer, GroupBean> groupMap = new HashMap<>();

    FlutterCallBackMethod(Activity activity) {
        this.activity = activity;
        //getData();
    }

    public static void registerWith(PluginRegistry.Registrar registrar) {
//        channel = new MethodChannel(registrar.messenger(), CHANNEL);
//        FlutterCallBackMethod instance = new FlutterCallBackMethod(registrar.activity());
//        //setMethodCallHandler在此通道上接收方法调用的回调
//        channel.setMethodCallHandler(instance);
    }

    @Override
    public void onMethodCall(@NonNull MethodCall methodCall, @NonNull MethodChannel.Result result) {
        Log.d("=====>", "FlutterBoostActivity " + methodCall.arguments + " method " + methodCall.method);

        // 通过methodCall可以获取参数和方法名  执行对应的平台业务逻辑即可
//        try {
//            Object uniqueId = methodCall.argument("uniqueId");
//            if (uniqueId != null && !TextUtils.isEmpty(uniqueId.toString())) {
//                result.notImplemented();
//                return;
//            }
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
        if (methodCall.method.equals("test")) {
            Map<String, Object> params = methodCall.arguments();
            Log.d("=====>", params.toString());
            //跳转那个原生类
            // ActivityUtils.startActivity(bundle, MsgWebViewActivity.class);
            //跳转到那些页面
        } else if (methodCall.method.equals("fluttertinavtie")) {
//           回调原生类方法结果给flutter 比如查询Android本地存储的数据
//            Map<String, Object> params = methodCall.arguments();
//            int fromId = -1;
//            if (params.get("fromId") != null)
//                fromId = (int) Double.parseDouble(params.get("fromId").toString());
//            ContactsBean bean = ContactsDaoManager.MANAGER.INSTANCE.findByUid(fromId);
//            if (bean != null) {
////                ContactsBean contactsBean = contactMap.get(fromId);
//                String labelName = bean.getLabel_name();
//                result.success(labelName);
//            } else {
//                result.success("--");
//                Log.e("FlutterBoostActivity", "empty");
//            }
        } else if (methodCall.method.equals("qConsctInfro")) {
//            if (contactMap == null || contactMap.size() == 0) {
//                ContactsDaoManager.MANAGER.getAll(new DataCallback<List<ContactsBean>>() {
//                    @Override
//                    public void getData(List<ContactsBean> contactsBeans) {
//                        if (contactsBeans != null) {
//                            for (ContactsBean bean : contactsBeans) {
//                                contactMap.put(bean.getUid(), bean);
//                            }
//                            sendToFlutterAllUsers(result);
//                        }
//                    }
//                });
//            } else if (contactMap != null && contactMap.size() > 0) {
            sendToFlutterAllUsers(result);
            //           }
        }
    }
        //查询联系人群组信息
//        private void getData() {
////            ContactsDaoManager.MANAGER.getAll(new DataCallback<List<ContactsBean>>() {
////                @Override
////                public void getData(List<ContactsBean> contactsBeans) {
////                    if (contactsBeans != null) {
////                        for (ContactsBean bean : contactsBeans) {
////                            contactMap.put(bean.getUid(), bean);
////                        }
////                    }
////                }
////            });
////            GroupDaoManager.MANAGER.getAll(new DataCallback<List<GroupBean>>() {
////                @Override
////                public void getData(List<GroupBean> groupBeans) {
////                    if (groupBeans != null) {
////                        for (GroupBean bean : groupBeans) {
////                            groupMap.put(bean.getId(), bean);
////                        }
////                    }
////                }
////            });
//        }


        private void sendToFlutterAllUsers (@NonNull MethodChannel.Result result){
            List<Map> list = new ArrayList<>();
//            List<Map> otherList = new ArrayList<>();
//            for (ContactsBean bean : contactMap.values()) {
//                if (bean.getTeam_name().equals(ComConfig.getStaffBean().getTeam_name())) {//本项目组的先添加
//                    Map map = new HashMap<>();
//                    map.put("avatar", bean.getAvatar());
//                    map.put("name", bean.getFull_name());
//                    map.put("uid", bean.getUid());
//                    list.add(map);
//                } else {
//                    Map map = new HashMap<>();
//                    map.put("avatar", bean.getAvatar());
//                    map.put("name", bean.getFull_name());
//                    map.put("uid", bean.getUid());
//                    otherList.add(map);
//                }
//            }
//            for (Map other : otherList) {//把其余项目组成员添加
//                list.add(other);
//            }
            result.success(list);
        }





}