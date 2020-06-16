//  接口请求封装
import 'dart:io';

import 'package:dio/dio.dart';

class HttpService {
  var httpClient = new HttpClient();

  /// 获取欢迎页图片
  /// @method get
  static getWelcomeImage() async {
    String url = 'http://www.wsrtv.com.cn/services/app_ad_cover.json';
    try {
      Dio dio = new Dio();
      //var request = await httpClient.getUrl(Uri.parse(url));
      //request.headers.add("user-agent", "test");
      return  await dio.get(url);
    } catch (exception) {
      return null;
    }
  }

  /// 获取服务列表
  /// @method get
  static getPlatformService() async {
    String url = 'http://gysapptrain.crecgec.cn/getServerJson?jsonName=platformServices';
    try {
//      var httpClient = new HttpClient();
//      var request = await httpClient.getUrl(Uri.parse(url));
//      request.headers.add("user-agent", "test");
//      var response = await request.close();
//      return await response.transform(new Utf8Codec().decoder).join();
      Dio dio = new Dio();
      return  await dio.get(url);
    } catch (exception) {
      return null;
    }
  }

  /// 获取正式库企业信息
  /// @method post
  static getAppManage() async {
    String url = 'http://dataapp.crecgec.com/datasrvplatform/appManage/getAppManageView';
    try {
      Dio dio = new Dio();
      var paramObj = {
        'appCheckDateBegin': '',
        'appCheckDateEnd': '',
        'appLastDateBegin': '',
        'appLastDateEnd': '',
        'appRegDateBeginQuery': '',
        'appRegDateEndQuery': '',
        'Page': 1,
        'Rows': 10
      };
      return await dio.post(
        url,
        data: paramObj,
        options: new Options(
          contentType: Headers.jsonContentType,
          headers: {
            "Authorization":"bearer eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJwaG9uZSI6bnVsbCwidXNlcl9uYW1lIjoiY2htIiwic2NvcGUiOlsiYWxsIl0sImlzQWRtaW4iOmZhbHNlLCJleHAiOjE1NTIyOTk2NDAsInVzZXJOYW1lIjpudWxsLCJ1c2VySWQiOm51bGwsImF1dGhvcml0aWVzIjpbIlJPTEVfVVNFUiJdLCJqdGkiOiJkMjc3Y2FlNS0wNmQ0LTQ2OTUtODkzMC03ZWM2YTdiYTliNDAiLCJ1c2VyQ29kZSI6ImNobSIsImVtYWlsIjpudWxsLCJjbGllbnRfaWQiOiIxMDIwMTAyMDEwIn0.AIQBs1fzV4Jo-9IahJYj47JQgWe-6hGGzqfNKvylfJLQDWJrqumgnIt89qslYD7krZcLKVrlGVqPMsXCW4xFQhVTP7rW0SAqhFWEyaNIexGTqTKQXbGXmd0QAK-FB9Be2X3_DE5qz47RZLIn-6gOFHKdzDf3ZpFaRNFj9AimIRoc7Fw_fXyZ5wHKXiprWtdKEuZ13ffIf_z6oDSGxGxk7iYvpRjK0DjFf4eEjAl-qLP1hj02AbfZdmjdYS4aS1bg1WjBrfvP4qC56hWQODK8KFMYfkUlaOeb4LPs-csvm4fk6mYEiTFS9YALltM2GluKcZ55djCgcZFArxOdGb0Qpg",
            "Content-Type":"application/json; charset=UTF-8"
          }
        ));
    } catch (exception) {
      return null;
    }
  }
}
