import 'package:flutter/material.dart';

import 'pages/sell_page.dart';
import 'pages/print_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (_) => SellPage(),
        '/printPage': (_) => PrintPage(),
      },
    );
  }
}
