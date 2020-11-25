import 'package:flutter/material.dart';
import 'package:jmp_module/tools/colors.dart';
class NavTabBarLine extends StatefulWidget implements PreferredSizeWidget {
  final TabBar tabbar;
  const NavTabBarLine({Key key, this.tabbar}): super(key: key);
  @override
  _NavTabBarLineState createState() => _NavTabBarLineState();
  @override
  Size get preferredSize {
    new Size.fromHeight(45);
  }
}

class _NavTabBarLineState extends State<NavTabBarLine> {
  @override
  Widget build(BuildContext context) {
    return new Container(
      child: Column(
        children: <Widget>[
          Container(
            height: 1,
            color: AppColor.color_f9f9,
          ),
          Container(
              height: 44,
              child:widget.tabbar
          ),
        ],
      ),
    );
  }
}