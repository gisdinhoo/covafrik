import 'package:covafrik/controllers/baseController.dart';
import 'package:covafrik/controllers/statsController.dart';
import 'package:covafrik/models/countryModel.dart';
import 'package:covafrik/models/statsModel.dart';
import 'package:covafrik/services/statsService.dart';
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
        providers: [
          ChangeNotifierProvider(create: (context) => StatsController()),
          ChangeNotifierProvider(create: (context) => BaseController()),
          ChangeNotifierProvider(create: (context) => StatsModel()),
          ChangeNotifierProvider(create: (context) => StatsService()),
          ChangeNotifierProvider(create: (context) => CountryModel())
        ],
        child: Builder(builder: (context) {
          //BuildContext from which Controller will  get data
          BaseController.init(context);
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: HomePage(),
          );
        }));
  }
}
