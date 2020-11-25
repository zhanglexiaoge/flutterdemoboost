
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boost/flutter_boost.dart';
import 'package:flutter/services.dart';
import 'testpage.dart';
import 'tools/channelall.dart';
import 'tools/app_manage.dart';
import 'listPage.dart';




void main() {
  if (Platform.isAndroid) {
    /*控制状态栏底色*/
    SystemUiOverlayStyle systemUiOverlayStyle =
    SystemUiOverlayStyle(statusBarColor: Colors.transparent);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }
//  debugPaintSizeEnabled = true;
  runApp(JMPModule());
}
/*JMP-Flutter 模块入口*/
class JMPModule extends StatefulWidget {
  @override
  JMPModuleState createState() => new JMPModuleState();
}

class JMPModuleState extends State<JMPModule> {
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      builder: FlutterBoost.init(),
      home: SetPage(),
    );

  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    FlutterBoost.singleton.registerPageBuilders({
      /*设置界面*/
      'set_mouble': (pageName, params, _) {
        print("page收到参数 $params");
        return SetPage();
      },
      /**************以下内部跳转使用**************/
    });

    FlutterBoost.singleton.channel.addEventListener(Channel.EventChannel_name,
        // ignore: missing_return
            (String name, Map arguments) {
          print("flutter收到参数 $arguments");
          AppManage.instance.baseUrl = arguments["baseurl"];
          AppManage.instance.header = arguments["header"];
        });
  }




}

