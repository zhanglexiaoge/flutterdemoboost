import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_boost/flutter_boost.dart';
import 'tools/channel_util.dart';
import 'tools/http_util.dart';
import 'package:jmp_module/customWidget/custom_widget.dart';
import 'listPage.dart';

class SetPage extends StatefulWidget {
  @override
  _SetPageState createState() => _SetPageState();
}

class _SetPageState extends State<SetPage> {
  @override
  void initState() {
    super.initState();
    gettestReqestList();
  }

  Future<void> gettestReqestList() async{
    print('走请求方法了');
     HttpUtil.instance.post("fund/fund_follow_list_data.php",params: {"limit": 20 ,"order_seq":"","order_type":"","page":"1"}).then((data){;
       print(data);
       print('1111112334565788');
     },onError: (error){
       print(error);
       print('请求失败22222');
     });

  }

  @override

  Widget build(BuildContext context) {
    return Scaffold(

      appBar: PreferredSize(
          child:CustomWidget.getCommonAppBar(context, '测试哈哈'),
          preferredSize: Size.fromHeight(44)),
      body: bodyView(),
    );
  }

  Widget bodyView(){
    return Column( //上下
      //Y 轴 主轴
      mainAxisAlignment:  MainAxisAlignment.start,
      //x 轴
      crossAxisAlignment:CrossAxisAlignment.center,
      children: <Widget>[
        FlatButton(
          onPressed: () {
            print('open natve page!');

            nativeCallbackMethod();

            // ChannelUtil.communicateFunction(
            //     'native_otherPage', {
            //    "url":'www.baidu.com',
            // });
          },
          child: Text('跳转原生界面'),

        ),
        FlatButton(
          onPressed: () {
            print('open flutter page!');
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ListPage(
                    keyStr: 'keystr',
                  ),
                ));
          },
          child: Text('跳转flutter界面'),

        )
      ],
    );
  }


  //异步执行调用原生方法，如果原生有回调数据需要异步方法
  Future<void> nativeCallbackMethod() async {
    try {
      String result = await  ChannelUtil.communicateFunction(
          'native_otherPage', {
        "url":'www.baidu.com',
      });
      print('result>>>>' + result);
      // setState(() {
      //
      // });
    }catch(e){
      print(e);
    }
  }

}