import 'package:flutter/foundation.dart';

import '../../models/user.dart';
import '../../app/service_locator.dart';
import '../viewmodel.dart';
import '../../services/user/user_repository.dart';

class LoginViewmodel extends Viewmodel {
  final UserRepository _userRepository = locator();

  LoginViewmodel() {
    _userRepository.addListener(() {
      notifyListeners();
    });
  }

  User get user => _userRepository.user;
  String _errorMessage;
  String get errorMessage => _errorMessage;
  set errorMessage(value) => update(() => _errorMessage = value);

  Future<void> login(
      {@required String email, @required String password}) async {
        if(email.endsWith('@graduate.utm.my') == true) {
          await _userRepository.signIn(email: email, password: password);
          if (_userRepository.user != null) {
            _errorMessage = null;
          } 
          else {
            _errorMessage = "ERROR! Try again.";
          }
        }
  }
}
