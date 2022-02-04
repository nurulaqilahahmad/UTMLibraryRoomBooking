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
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('LOG IN AS',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black, fontSize: 26.0)),
            const SizedBox(height: 30.0),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 170,
                  height: 170,
                  // alignment: Alignment.center,
                  child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      color: Colors.red[900],
                      child: ListTile(
                        title: Icon(
                          Icons.menu_book,
                          color: Colors.white,
                          size: 100.0,
                        ),
                        subtitle: Text('STUDENT',
                            textAlign: TextAlign.center,
                            style:
                                TextStyle(color: Colors.white, fontSize: 30.0)),
                        onTap: () => _openHomeView(context),
                      )),
                ),
                Container(
                  width: 170,
                  height: 170,
                  // alignment: Alignment.center,
                  child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      color: Colors.red[900],
                      child: ListTile(
                        title: Icon(
                          Icons.admin_panel_settings,
                          color: Colors.white,
                          size: 100.0,
                        ),
                        subtitle: Text('ADMIN',
                            textAlign: TextAlign.center,
                            style:
                                TextStyle(color: Colors.white, fontSize: 30.0)),
                        onTap: () => _openAdminHomeView(context),
                      )),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// Column(
//         mainAxisSize: MainAxisSize.max,
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: <Widget>[
//           Container(
//             width: 300,
//             height: 200,
//             alignment: Alignment.center,
//             child: Card(
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(10.0),
//               ),
//               color: Colors.red[900],
//               child: room.status == true
//                   ? ListTile(
//                       title: Image(
//                           image: AssetImage('${room.image}'),
//                           width: 149.0,
//                           height: 149.0),

//                       subtitle: Text(
//                         '${room.name}\nCapacity: ${room.capacity}',
//                         textAlign: TextAlign.center,
//                         style: TextStyle(color: Colors.white),
//                       ),
//                     )
//                   : ListTile(
//                       title: Image(
//                           image: AssetImage('assets/notavailable.jpg'),
//                           width: 149.0,
//                           height: 149.0),
//                       subtitle: Text(
//                         '${room.name}\nCapacity: ${room.capacity}',
//                         textAlign: TextAlign.center,
//                         style: TextStyle(color: Colors.white),
//                       ),
//                     ),
//             ),
//           ),
//         ],
//       ),
//     );