
import 'package:covafrik/provider/statsProvider.dart';
import 'package:covafrik/views/homePage/homePage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.grey,
      ),
      title: 'Flutter Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => StatsProvider())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePage(),
        // routes: {
        //   HomePage.routeName: (context) => HomePage(),
        //   Loading.routeName: (context) => Loading(),
        // }
      ),
    );
  }
}
