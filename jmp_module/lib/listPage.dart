import 'package:flutter/material.dart';
class ListPage extends StatefulWidget {

   final  String keyStr ;
   const ListPage({Key key, this.keyStr}) : super(key: key);

  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {

  List arrayList = [];
  @override
  void initState() {
    super.initState();
    print('keyStr==='+ widget.keyStr);
    getListData();
  }

  Future getListData()async {

    //延时300毫秒执行
    Future.delayed(const Duration(milliseconds: 300), () {
      for (int i = 0; i < 100; i++) {
        arrayList.add("Row $i");
      }
      setState(() {

      });

    });



  }



  //基础
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ListView"),
      ),
      body: newView(),
    );
  }

  Widget newView(){
    return ListView.builder(
          itemBuilder:_item,
        itemCount: arrayList.length,
      );
  }

  Widget _item (BuildContext context, int index){
    print('index ++' + index.toString());
    return InkWell(
     onTap: (){
      print('点击item');
     },
      child:  Container(
        //内边距属性
        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
        child: Column(

          children: <Widget>[
            Container(
              padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
              child: Row(
                //X 轴
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //Y 轴
                  crossAxisAlignment:CrossAxisAlignment.center,
                children: <Widget>[
                  Row(
                    //X 轴
                    mainAxisAlignment:MainAxisAlignment.start,
                    //Y 轴
                    crossAxisAlignment:CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        width: 60,
                        height: 60,
                        color:Colors.blueGrey,
                      ),
                      // Container(
                      //   width: 100,
                      //   height: 30,
                      //   color:Colors.blueAccent,
                      // ),
                      Column( //上下
                      //Y 轴 主轴
                      mainAxisAlignment:  MainAxisAlignment.start,
                      //x 轴
                      crossAxisAlignment:CrossAxisAlignment.start,
                        children: <Widget>[

                          // Container(
                          //   // width: 75,
                          //   height: 30,
                          //   color:Colors.red,
                          // ),
                          Text('111111111111111111111111111111',maxLines: 1),
                          Container(
                            width: 100,
                            height: 30,
                            color:Colors.blueAccent,
                          ),
                        ],
                      ),



                    ],
                  ),
                  Container(
                    width: 75,
                    height: 30,
                    color:Color(0xFFFFAF45),
                  )
                ],
              ),

            ),

            Container(
              //外边距属性
              margin: EdgeInsets.fromLTRB(15, 0, 15, 0),
              height: 0.5,
              color:Color(0xFFDDDDDD),
            )
          ],
        ),
      ),
    );
  }

  Widget bodyView(){
    return ListView(children: _getListData());
  }
  _getListData() {
    List<Widget> widgets = [];
    for (int i = 0; i < 100; i++) {
      widgets.add(Padding(padding: EdgeInsets.all(10.0), child: Text("Row $i")));
    }
    return widgets;
  }
}
