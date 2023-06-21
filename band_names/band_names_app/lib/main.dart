import 'package:band_names_app/pages/home.dart';
import 'package:band_names_app/pages/status.dart';
import 'package:band_names_app/services/socket_services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => SocketService())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
          useMaterial3: true,
        ),
        initialRoute: 'home',
        routes: {
          'home': (context) => const HomePage(),
          'status': (context) => const StatusPage(),
        },
      ),
    );
  }
}
