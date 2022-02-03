import 'package:flutter/material.dart';
import '../view.dart';
import 'history_list_tile.dart';
import 'history_viewmodel.dart';

class HistoryBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SelectorView<HistoryViewmodel, int>(
        selector: (_, vm) => vm.dataCount,
        builder: (_, vm, __, ___) => Center(
          // child: Padding(
          //   padding:
          //       const EdgeInsets.symmetric(vertical: 24.0, horizontal: 24.0),
          child: Column(
            children: [
              const SizedBox(height: 50.0),
              SizedBox(
                height: 50.0,
                child: Text("History", style: TextStyle(fontSize: 30.0)),
              ),
              const SizedBox(height: 10.0),
              ListView.builder(
                shrinkWrap: true,
                  itemCount: vm.dataCount,
                  itemBuilder: (_, index) => HistoryListTile(index),
                ),
            ],
          ),
        ),
      ),
      //),
    );
  }
}
