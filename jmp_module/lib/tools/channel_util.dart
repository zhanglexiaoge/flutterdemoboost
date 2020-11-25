import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
export 'channelall.dart';

class ChannelUtil {
  //交互的通道名称，flutter和native是通过这个标识符进行相互间的通信
  static const communicateChannel = MethodChannel('Flutter_Module_Methodchannel');
  
  static Future<T> communicateFunction<T>(String type, parameter) async {
    return communicateChannel.invokeMethod(type, parameter);
  }
}