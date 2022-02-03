import 'package:flutter/material.dart';
import '../../models/user.dart';
import '../../screens/profile/profile_viewmodel.dart';
import '../../screens/view.dart';
import 'profile_list_tile.dart';

class ProfileBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: SelectorView<ProfileViewmodel, int>(
            selector: (_, vm) => vm.dataCount,
            builder: (_, vm, __, ___) {
              return ListView.separated(
                itemCount: vm.dataCount,
                separatorBuilder: (_, __) => Divider(
                  color: Colors.black,
                ),
                itemBuilder: (_, index) => ProfileListTile(index),
              );
            }));
  }
}

// class _ProfileBodyState extends State<ProfileBody> {
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Padding(
//           padding: EdgeInsets.symmetric(vertical: 50.0, horizontal: 24.0),
//           child: ListView(
//             children: [
//               Column(
//                 children: [
//                   Text(
//                     "Profile",
//                     style: TextStyle(
//                       color: Colors.black,
//                       fontSize: 26.0,
//                     ),
//                   ),
//                   SizedBox(
//                     height: 30.0,
//                   ),
//                   _profile("Name", "NURUL AQILAH BINTI AHMAD"),
//                   _profile("Email", "nurulaqilah.a@graduate.utm.my"),
//                   _profile("Staff / Matrics No", "A19EC0203"),
//                   _profile("Telephone No", "0104595607"),
//                   SizedBox(
//                     height: 20.0,
//                   ),
//                   ElevatedButton(
//                     style: ElevatedButton.styleFrom(
//                       onSurface: Colors.transparent,
//                       primary: Colors.red[900],
//                     ),
//                     onPressed: () {},
//                     // Navigator.pushReplacementNamed(context, '/home'),
//                     child: Text("UPDATE"),
//                   ),
//                   SizedBox(
//                     height: 30.0,
//                   ),
//                 ],
//               ),
//             ],
//           )),
//     );
//   }
// }

// Widget _profile(String title, String data) {
//   return Column(
//     mainAxisAlignment: MainAxisAlignment.start,
//     crossAxisAlignment: CrossAxisAlignment.start,
//     children: [
//       Text(
//         title,
//         textAlign: TextAlign.start,
//         style: TextStyle(
//           color: Colors.black,
//           fontSize: 20.0,
//           height: 3.0,
//         ),
//       ),
//       TextField(
//         textAlign: TextAlign.start,
//         decoration: InputDecoration(
//           hintText: "$data",
//         ),
//       ),
//       SizedBox(
//         height: 10.0,
//       ),
//     ],
//   );
// }
