import 'package:flutter/material.dart';

import '../view.dart';
import 'adminprofile_list_tile.dart';
import 'adminprofile_viewmodel.dart';

class AdminProfileBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: SelectorView<AdminProfileViewmodel, int>(
            selector: (_, vm) => vm.dataCount,
            builder: (_, vm, __, ___) {
              return ListView.separated(
                itemCount: vm.dataCount,
                separatorBuilder: (_, __) => Divider(
                  color: Colors.black,
                ),
                itemBuilder: (_, index) => AdminProfileListTile(index),
              );
            }));
  }
}
