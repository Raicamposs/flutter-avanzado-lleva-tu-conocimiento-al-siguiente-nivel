import 'package:flutter/material.dart';

class AndroidDialog extends StatefulWidget {
  final void Function(String value) onAddBand;

  const AndroidDialog({
    required this.onAddBand,
    Key? key,
  }) : super(key: key);

  @override
  State<AndroidDialog> createState() => _AndroidDialogState();
}

class _AndroidDialogState extends State<AndroidDialog> {
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
    return AlertDialog(
      title: const Text('New band name:'),
      content: TextField(
        controller: textController,
        autofocus: true,
        decoration: const InputDecoration(labelText: 'Band name'),
      ),
      actions: [
        MaterialButton(
          onPressed: () {
            widget.onAddBand(textController.text);
            Navigator.of(context).pop();
          },
          elevation: 5,
          textColor: Colors.blue,
          child: const Text('Add'),
        )
      ],
    );
  }
}
