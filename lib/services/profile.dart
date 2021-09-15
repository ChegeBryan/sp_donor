import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'package:sp_donor/services/backend.dart';

class ProfileProvider with ChangeNotifier {
  Future<Map<String, dynamic>> getProfile(int id) async {
    var result;

    final Map<String, String> data = {
      'id': id.toString(),
    };

    Response res = await post(Uri.parse(BackendUrl.getProfile), body: data);

    final Map<String, dynamic> responseData = jsonDecode(res.body);

    print(responseData);

    if (!responseData['error']) {
      result = {'status': true, 'data': responseData['data']};
    } else {
      result = {'status': false, 'message': responseData['message']};
    }
    return result;
  }
}
