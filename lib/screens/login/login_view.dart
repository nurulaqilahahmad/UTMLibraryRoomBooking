import '../../screens/login/login_body.dart';
import 'package:flutter/material.dart';
import 'login_viewmodel.dart';
import '../widgets/registerLogin_appbar.dart';

// ignore: use_key_in_widget_constructors
class LoginView extends StatefulWidget {
  static Route route() => MaterialPageRoute(builder: (_) => LoginView());

  @override
  LoginViewState createState() => LoginViewState();
}

class LoginViewState extends State<LoginView> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool _showPassword = false;
  get showPassword => _showPassword;
  set showPassword(value) => setState(() => _showPassword = value);

  String get email => emailController.text;
  String get password => passwordController.text;

  void onLogin(LoginViewmodel viewmodel) async {
    await viewmodel.login(email: email, password: password);
    final _user = viewmodel.user;
    if (_user != null) Navigator.pop(context, _user);
  }

  void onCancel() => Navigator.pop(context, null);

  void onClear(LoginViewmodel viewmodel) {
    emailController.clear();
    passwordController.clear();
    viewmodel.errorMessage = null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: RegisterLoginAppbar(),
      body: LoginBody(this),
    );
  }
}
