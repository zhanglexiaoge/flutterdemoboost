class AppManage {
  factory AppManage() => _sharedInstance();

  static AppManage get instance => _sharedInstance();
  static AppManage _instance;

  AppManage._() {
    //单例模式
  }

  static AppManage _sharedInstance() {
    if (_instance == null) {
      _instance = AppManage._();
    }
    return _instance;
  }

  /*BaseUrl*/
  String baseUrl;
  /* reqest header 请求头*/
  Map<dynamic,dynamic> header;
}