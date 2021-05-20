import 'package:covafrik/models/statsModel.dart';
import 'package:covafrik/controllers/statsController.dart';
import 'package:covafrik/views/homePage/src/headClip.dart';
import 'package:covafrik/views/homePage/src/searchAuto.dart';
import 'package:covafrik/views/homePage/src/statistic.dart';
import 'package:covafrik/views/loadingPage/loadingPage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);
  static var routeName = "/homePage";

  @override
  Widget build(BuildContext context) {
    final statsController = context.read<StatsController>();
    context.watch<StatsModel>();

    return statsController.currentData.load
        ? LoadingPage()
        : Scaffold(
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipPath(
                    clipper: HeaderClip(),
                    child: Container(
                      width: double.infinity,
                      height: 350,
                      color: Color(0xfffff0e3),
                      child: Stack(
                        children: [
                          Image.asset(
                            "assets/nurseTeam.jpg",
                            
                            fit: BoxFit.contain,
                          ),
                          Positioned(
                              top: 100,
                              right: 15,
                              
                              child: Text(
                                "Stay Home\nStay Safe !",
                                style: GoogleFonts.quicksand(
                                    fontSize: 22, fontWeight: FontWeight.bold),
                              ))
                        ],
                      ),
                    ),
                  ),
                  SearchAuto(statsController: statsController),
                  Padding(
                    padding: const EdgeInsets.only(left: 15, bottom: 15),
                    child: RichText(
                        text: TextSpan(children: [
                      TextSpan(
                          text: "Daily cases update\n",
                          style: GoogleFonts.quicksand(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 20)),
                      TextSpan(
                          text:
                              "Statistics of ${statsController.currentData.day}",
                          style: GoogleFonts.quicksand(
                              color: Colors.black, fontSize: 13))
                    ])),
                  ),
                  Container(
                    width: double.infinity,
                    margin: EdgeInsets.all(15),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey[200],
                              offset: Offset(0, 2),
                              blurRadius: 20),
                        ]),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Statistic(
                          color: Color(0xfff69b57),
                          number: statsController.currentData.newCases,
                          text: "Infections",
                        ),
                        Statistic(
                          color: Color(0xff01bdbe),
                          number: statsController.currentData.active,
                          text: "Actives",
                        ),
                        Statistic(
                          color: Color(0xfff81b4e),
                          number: statsController.currentData.newDeaths,
                          text: "Deaths",
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15, top: 15),
                    child: RichText(
                        text: TextSpan(children: [
                      TextSpan(
                          text: "Protect yourself\n",
                          style: GoogleFonts.quicksand(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 20)),
                    ])),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 15, bottom: 15),
                    width: 80,
                    height: 4,
                    color: Colors.grey[300],
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Lottie.asset("assets/mask.json", height: 200),
                      ),
                      Expanded(
                        flex: 1,
                        child:
                            Lottie.asset("assets/sanitizer.json", height: 200),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
  }
}
