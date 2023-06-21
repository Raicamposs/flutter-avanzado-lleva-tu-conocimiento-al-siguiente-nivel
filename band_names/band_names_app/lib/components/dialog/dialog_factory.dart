import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'android_dialog.dart';
import 'cupertino_dialog.dart';

class DialogFactory {
  static build(BuildContext context, void Function(String value) onAddBand) {
    if (Theme.of(context).platform == TargetPlatform.iOS) {
      showCupertinoDialog(
        context: context,
        builder: (_) => CupertinoDialog(onAddBand: onAddBand),
      );
    } else {
      showDialog(
        context: context,
        builder: (_) => AndroidDialog(onAddBand: onAddBand),
      );
    }
  }
}
