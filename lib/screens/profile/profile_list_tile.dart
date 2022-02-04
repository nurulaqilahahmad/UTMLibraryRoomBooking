import 'package:flutter/material.dart';
import 'profile_viewmodel.dart';
import '../../models/user.dart';
import '../ui_utils.dart';
import '../view.dart';

class ProfileListTile extends StatelessWidget {
  final int _index;
  const ProfileListTile(this._index);

  @override
  Widget build(BuildContext context) {
    return SelectorView<ProfileViewmodel, User>(
        showProgressIndicator: false,
        selector: (context, vm) => vm.getUser(_index),
        builder: (context, vm, user, __) => Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const SizedBox(height: 50.0),
                Text("Profile", style: TextStyle(fontSize: 30.0)),
                const SizedBox(height: 10.0),
                Icon(
                  Icons.person,
                  size: 50.0,
                ),
                const SizedBox(height: 10.0),
                Card(
                    color: Colors.white,
                    margin:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                    child: ListTile(
                      leading: Icon(Icons.account_circle_outlined, size: 30),
                      title: Text('${user.name}'),
                    )),
                Card(
                    color: Colors.white,
                    margin:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                    child: ListTile(
                      leading: Icon(Icons.person_search_outlined, size: 30),
                      title: Text('${user.uid}'),
                    )),
                Card(
                    color: Colors.white,
                    margin:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                    child: ListTile(
                      leading: Icon(Icons.email, size: 30),
                      title: Text('${user.email}'),
                    )),
              ],
            ));
  }
}
