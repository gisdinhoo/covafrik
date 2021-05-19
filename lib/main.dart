import 'package:covafrik/homePage/homePage.dart';
import 'package:covafrik/provider/countriesProv.dart';
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
      providers: [ChangeNotifierProvider(create: (context) => CountriesProv())],
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
