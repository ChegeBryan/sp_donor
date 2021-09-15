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

  Future<Map<String, dynamic>> createProfile({
    int? userId,
    int? spermBank,
    String? name,
    String? height,
    String? weight,
    String? birthdate,
    String? ethnicity,
    String? eyeColor,
    String? hairColor,
    String? complexion,
    String? education,
    String? bloodtype,
    String? interests,
    String? hobbies,
  }) async {
    var result;

    final Map<String, String> data = {
      'donor_id': userId.toString(),
      'sperm_bank_id': spermBank!.toString(),
      'name': name!,
      'height': height!,
      'birth_date': birthdate!,
      'weight': weight!,
      'ethnicity': ethnicity!,
      'eye_color': eyeColor!,
      'hair_color': hairColor!,
      'complexion': complexion!,
      'education': education!,
      'blood_type': bloodtype!,
      'interests': interests!,
      'hobbies': hobbies!,
    };

    Response res = await post(Uri.parse(BackendUrl.createProfile), body: data);

    final Map<String, dynamic> responseData = jsonDecode(res.body);

    if (!responseData['error']) {
      result = {'status': true, 'message': responseData['message']};
    } else {
      result = {'status': false, 'message': responseData['message']};
    }
    return result;
  }

  Future<Map<String, dynamic>> updateProfile({
    int? userId,
    int? spermBank,
    String? name,
    String? height,
    String? weight,
    String? birthdate,
    String? ethnicity,
    String? eyeColor,
    String? hairColor,
    String? complexion,
    String? education,
    String? bloodtype,
    String? interests,
    String? hobbies,
  }) async {
    var result;

    final Map<String, String> data = {
      'donor_id': userId.toString(),
      'sperm_bank_id': spermBank!.toString(),
      'name': name!,
      'height': height!,
      'birth_date': birthdate!,
      'weight': weight!,
      'ethnicity': ethnicity!,
      'eye_color': eyeColor!,
      'hair_color': hairColor!,
      'complexion': complexion!,
      'education': education!,
      'blood_type': bloodtype!,
      'interests': interests!,
      'hobbies': hobbies!,
    };

    Response res = await post(Uri.parse(BackendUrl.updateProfile), body: data);

    final Map<String, dynamic> responseData = jsonDecode(res.body);

    if (!responseData['error']) {
      result = {'status': true, 'message': responseData['message']};
    } else {
      result = {'status': false, 'message': responseData['message']};
    }
    return result;
  }

  Future<Map<String, dynamic>> deleteProfile(int id) async {
    var result;

    final Map<String, dynamic> data = {'id': id.toString()};

    Response res = await post(Uri.parse(BackendUrl.deleteProfile), body: data);

    final Map<String, dynamic> responseData = jsonDecode(res.body);

    if (!responseData['error']) {
      result = {'status': true, 'message': 'Delete successful'};
    } else {
      result = {'status': false, 'message': 'Delete failed.'};
    }
    return result;
  }
}
