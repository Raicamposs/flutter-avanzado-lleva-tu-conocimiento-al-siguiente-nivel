import 'package:flutter/material.dart';

import '../services/socket_services.dart';

class ConnectionStatus extends StatelessWidget {
  final ServerStatus status;
  const ConnectionStatus({
    Key? key,
    required this.status,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (status == ServerStatus.connecting) {
      return const Padding(
        padding: EdgeInsets.only(right: 10.0),
        child: Icon(Icons.warning_outlined, color: Colors.amber),
      );
    }

    if (status == ServerStatus.offline) {
      return const Padding(
        padding: EdgeInsets.only(right: 10.0),
        child: Icon(Icons.offline_bolt, color: Colors.red),
      );
    }

    return const Padding(
      padding: EdgeInsets.only(right: 10.0),
      child: Icon(Icons.online_prediction, color: Colors.blue),
    );
  }
}
