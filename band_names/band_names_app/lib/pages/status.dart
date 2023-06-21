import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../services/socket_services.dart';

class StatusPage extends StatelessWidget {
  const StatusPage({super.key});

  @override
  Widget build(BuildContext context) {
    final socket = Provider.of<SocketService>(context);

    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text('ServerStatus: ${socket.status}'),
          ],
        ),
      ),
    );
  }
}
