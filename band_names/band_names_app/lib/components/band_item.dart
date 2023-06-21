import 'package:flutter/material.dart';

import '../models/band.dart';

class BandItem extends StatelessWidget {
  final Band band;
  final void Function(String bandId) onDismissed;
  final void Function(String bandId) onTap;

  const BandItem({
    super.key,
    required this.band,
    required this.onDismissed,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(band.id),
      onDismissed: (_) => onDismissed(band.id),
      background: Container(
        padding: const EdgeInsets.only(left: 8.0),
        color: Colors.red,
        child: const Align(
          alignment: Alignment.centerLeft,
          child: Icon(Icons.delete, color: Colors.white),
        ),
      ),
      direction: DismissDirection.startToEnd,
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.blue[100],
          child: Text(
            band.name.substring(0, 2),
            style: const TextStyle(color: Colors.white),
          ),
        ),
        title: Text(band.name),
        trailing: Text(
          band.votes.toString().padLeft(2, '0'),
          style: const TextStyle(fontSize: 20),
        ),
        onTap: () => onTap(band.id),
      ),
    );
  }
}
