import 'package:covafrik/provider/statsProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Loading extends StatelessWidget {
  const Loading({Key key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final statsProvider = Provider.of<StatsProvider>(context);
    statsProvider.getStats(statsProvider.currentData.country);//getting data
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 250),
        child: Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.white.withOpacity(0.3),
          child: Column(
            children: [
              SpinKitFoldingCube(
                color: Color(0xfface6fa),
                size: 100,
              ),
              SizedBox(
                height: 30,
              ),
              Text("Loading...",
                  style: GoogleFonts.quicksand(
                      fontSize: 22, fontWeight: FontWeight.bold))
            ],
          ),
        ),
      ),
    );
  }
}
