import 'package:flutter/material.dart';
import 'package:setup_mvvm/screens/home/home_viewmodel.dart';

import 'home_appbar.dart';
import 'home_body.dart';
import 'home_drawer.dart';
import 'home_endDrawer.dart';

class HomeScreenLoggedIn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: HomeDrawer(),
      appBar: HomeAppbar(),
      body: HomeBody(),
      endDrawer: HomeEndDrawer(),
    );
  }
}
// class HomeScreenLoggedIn extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: 4,
//       initialIndex: 1,
//       child: Scaffold(
//         appBar: AppBar(
//           elevation: 0.0,
//           title: Text('UTM Library'),
//           actions: [
//             Builder(
//               builder: (context) {
//                 return IconButton(
//                   icon: Icon(Icons.person),
//                   onPressed: () {
//                     Scaffold.of(context).openEndDrawer();
//                   },
//                 );
//               },
//             )
//           ],
//           backgroundColor: Colors.red[900],
//           bottom: TabBar(tabs: [
//             Tab(text: 'HOME', icon: Icon(Icons.home)),
//             Tab(text: 'BOOKING', icon: Icon(Icons.bookmark_add)),
//             Tab(text: 'HISTORY', icon: Icon(Icons.history)),
//             Tab(text: 'PROFILE', icon: Icon(Icons.person)),
//           ]),
//         ),
//         body: HomeBody(),
//       ),
//     );
//   }
// }

