import 'dart:convert';
import 'package:mcg_office/src/model/userinfo.dart';
import 'package:http/http.dart' as http;

class UserInfoRepository {
  Future<List<UserInfo>?> login(String id, String password) async {
    try {
      var response = await http.post(
          Uri.parse("http://192.168.10.82:5000/user"), // IP주소 바꾸기
          headers: {
            "Accept": "application/json",
            "content-type": "application/json",
          },
          body: jsonEncode({"uid": id, "password": password}));
      //var body = jsonDecode(response.body);
      // body = jsonEncode(body[0]);
      // Map<String, dynamic> jsondata = jsonDecode(body);
      // print(jsondata['uid']);
      if (response.body.length > 2) {
        var jsonresponse = jsonDecode(response.body) as List;
        return jsonresponse.map((item) => UserInfo.fromJson(item)).toList();
      }
      return null;
    } catch (Exc) {
      print(Exc);
      rethrow;
    }
  }
}
