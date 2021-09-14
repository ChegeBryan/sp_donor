import 'package:flutter/foundation.dart';
import 'package:sp_donor/models/user.dart';

class UserProvider with ChangeNotifier {
  User? _user = User();

  User get user => _user!;

  void setUser(user) {
    _user = user;
  }
}
