import 'package:flutter/material.dart';

class RegisterLoginAppbar extends StatelessWidget
    implements PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(50.0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0.0,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'UTM Library',
          ),
        ],
      ),
      backgroundColor: Colors.red[900],
    );
  }
}
