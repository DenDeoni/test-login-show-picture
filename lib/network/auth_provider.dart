import 'dart:convert';
import 'package:app/models/auth_model.dart';
import 'package:app/models/response_model.dart';
import 'package:app/utils/check_connect.dart';
import 'package:app/utils/constants.dart';
import 'package:http/http.dart' as http;

class AuthProvider {
  Future<ResponseModel> auth({required AuthModel authParams}) async {
    if (await isInetConnect() == false) {
      return _dataError(reason: checkConnection);
    }
    try {
      final response = await http.post(
        Uri.parse(loginEndPoint),
        headers: {
          'Content-type': 'application/x-www-form-urlencoded',
          'Authorization': authParams.password,
          'Host': 'mobility.cleverlance.com'
        },
        body: 'username=${authParams.login}',
      );
      if (response.statusCode == 200) {
        ResponseModel data = ResponseModel.fromJson(jsonDecode(response.body));
        return data;
      } else {
        return _dataError(reason: response.reasonPhrase!);
      }
    } catch (e) {
      return _dataError(reason: '$e');
    }
  }

  ResponseModel _dataError({required String reason}) {
    return ResponseModel(
      data: '',
      success: false,
      reason: reason,
    );
  }
}
