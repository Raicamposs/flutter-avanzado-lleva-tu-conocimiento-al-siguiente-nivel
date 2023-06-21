import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

enum ServerStatus { online, offline, connecting }

class SocketService with ChangeNotifier {
  ServerStatus _status = ServerStatus.connecting;
  late IO.Socket _socket;

  SocketService() {
    _initConfig();
  }

  ServerStatus get status => _status;

  void connect(Function(List) callback) {
    _socket.on('active-bands', (payload) => callback(List.from(payload)));
  }

  void disconnect() {
    _socket.off('active-bands');
  }

  void delete(String id) {
    _socket.emit('delete-band', {'id': id});
  }

  void vote(String id) {
    _socket.emit('vote-band', {'id': id});
  }

  void create(String name) {
    _socket.emit('add-band', {'name': name});
  }

  void _initConfig() {
    Map<String, dynamic> options = IO.OptionBuilder()
        .setTransports(['websocket'])
        .enableAutoConnect()
        .build();

    _socket = IO.io('http://192.168.15.13:3000', options);

    _socket.onConnect((_) {
      print('connect');
      _status = ServerStatus.online;
      notifyListeners();
    });

    _socket.onDisconnect((_) {
      print('disconnect');
      _status = ServerStatus.offline;
      notifyListeners();
    });
  }
}
