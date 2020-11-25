import 'package:flutter/material.dart';
import 'package:jmp_module/tools/colors.dart';

class CustomWidget {

  //app通用状态栏
  static AppBar getCommonAppBar(BuildContext context, String title, {double fontSize, List<Widget> actions}) {
     if (title == null) {
         title = "";
     }
     return AppBar(
        backgroundColor: AppColor.color_76fc,
        leading: IconButton(
         // Image.asset("images/back_no.png",height: 20,)
            icon: Image.asset("images/back_no.png",height: 25,),
          //点击返回
          onPressed: () {
           if (context != null) {
              Navigator.pop(context);
            }
          },
        ),
        title: Text(
               title,
               style: TextStyle(
               color: Colors.white,
               fontSize: fontSize == null ? 18.0 : fontSize,
           ),
     ),
     //标题栏居中
     centerTitle: true,
     //右边的action 按钮
     actions: actions == null ? <Widget>[] : actions,
   );
  }


}


