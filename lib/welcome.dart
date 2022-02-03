import 'package:flutter/material.dart';
import 'screens/adminhome/adminhome_view.dart';
import 'screens/home/home_view.dart';
import 'screens/widgets/registerLogin_appbar.dart';

class Welcome extends StatelessWidget {
  static Route route() => MaterialPageRoute(builder: (_) => Welcome());

  void _openHomeView(context) async {
    final result = await Navigator.push(context, HomeView.route());
    if (result != null) {}
  }

  void _openAdminHomeView(context) async {
    final result = await Navigator.push(context, AdminHomeView.route());
    if (result != null) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: RegisterLoginAppbar(),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Image(image: AssetImage('assets/utm-library-logo.png')),
            const SizedBox(height: 30),
            SizedBox(
              height: 30,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      onSurface: Colors.transparent,
                      primary: Colors.red[900],
                    ),
                    child: Text('STUDENT'),
                    onPressed: () => _openHomeView(context),
                  ),
                  const SizedBox(width: 10.0),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      onSurface: Colors.transparent,
                      primary: Colors.red[900],
                    ),
                    child: Text('ADMIN'),
                    onPressed: () => _openAdminHomeView(context),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
