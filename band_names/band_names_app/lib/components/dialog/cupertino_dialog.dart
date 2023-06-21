import 'package:flutter/cupertino.dart';

class CupertinoDialog extends StatefulWidget {
  final void Function(String value) onAddBand;

  const CupertinoDialog({
    required this.onAddBand,
    Key? key,
  }) : super(key: key);

  @override
  State<CupertinoDialog> createState() => _CupertinoDialogState();
}

class _CupertinoDialogState extends State<CupertinoDialog> {
  late TextEditingController textController;

  @override
  void initState() {
    textController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      title: const Text('New band name:'),
      content: CupertinoTextField(
        controller: textController,
        autofocus: true,
      ),
      actions: [
        CupertinoDialogAction(
          isDefaultAction: true,
          onPressed: () {
            widget.onAddBand(textController.text);
            Navigator.of(context).pop();
          },
          child: const Text('Add'),
        ),
        CupertinoDialogAction(
          isDefaultAction: true,
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Dismiss'),
        ),
      ],
    );
  }
}
