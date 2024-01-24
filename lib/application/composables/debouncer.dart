

import 'dart:async';

import 'package:flutter/material.dart';

class AppDebouncer {
  final int milliseconds;
  VoidCallback? action;
  Timer? _timer;

  AppDebouncer({required this.milliseconds});

  run(VoidCallback action) {
    if (_timer != null) {
      _timer!.cancel();
    }
    _timer = Timer(Duration(milliseconds: milliseconds), action);
  }
}
