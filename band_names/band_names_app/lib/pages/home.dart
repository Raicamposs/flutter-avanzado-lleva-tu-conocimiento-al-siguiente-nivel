import 'package:band_names_app/components/dialog/dialog_factory.dart';
import 'package:band_names_app/models/band.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/band_item.dart';
import '../components/connection_status.dart';
import '../components/graph.dart';
import '../services/socket_services.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Band> bands = [];
  late SocketService service;

  @override
  void initState() {
    super.initState();

    service = Provider.of<SocketService>(context, listen: false);

    service.connect((payload) {
      bands = payload.map((item) => Band.fromMap(item)).toList();
      setState(() {});
    });
  }

  @override
  void dispose() {
    service.disconnect();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BandNames', style: TextStyle(color: Colors.black87)),
        backgroundColor: Colors.white,
        elevation: 1,
        actions: [ConnectionStatus(status: service.status)],
      ),
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Graph(bands: bands),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(8),
                itemCount: bands.length,
                primary: true,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (_, index) => BandItem(
                  band: bands[index],
                  onDismissed: removeBand,
                  onTap: voteBand,
                ),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 1,
        onPressed: addNewBand,
        child: const Icon(Icons.add),
      ),
    );
  }

  void voteBand(String id) {
    service.vote(id);
  }

  void addNewBand() {
    DialogFactory.build(context, saveBand);
  }

  void saveBand(String name) {
    RegExp exp = RegExp(r'(\w{1,})');

    if (!exp.hasMatch(name)) return;

    service.create(name);
  }

  void removeBand(String id) {
    service.delete(id);
  }
}
