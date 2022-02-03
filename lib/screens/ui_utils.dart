import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// Try running a callback. When error happened,
/// it will open an error snackbar
///
Future<void> showSnackBarWhenError(
    BuildContext context, AsyncCallback callback) async {
  try {
    await callback();
  } on Exception catch (e) {
    final snackbar = SnackBar(
      content: Text(e.toString()),
      backgroundColor: Colors.red,
    );

    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }
}
