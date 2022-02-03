import 'package:flutter/foundation.dart';

abstract class Repository extends ChangeNotifier {
  bool _busy = false;
  get busy => _busy;

  @override
  Future<void> notifyListeners({AsyncCallback onNotify}) async {
    _busy = true;
    if (onNotify != null) await onNotify();
    _busy = false;
    super.notifyListeners();
  }
}