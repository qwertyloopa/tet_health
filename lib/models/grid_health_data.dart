import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:health/health.dart';

var pulse;
var steps;
var sleep;
var weight;



class GridDashboard extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    //List<Grid> GridList = [_heartRate, _sleep, _steps, _weight];
    List<HealthDataPoint> _healthDataList = [];
    Future fetchData() async {
      // get everything from midnight until now
      DateTime startDate = DateTime.now();
      DateTime endDate = DateTime.now();

      HealthFactory health = HealthFactory();

      // define the types to get
      List<HealthDataType> types = [
        HealthDataType.STEPS,
        HealthDataType.WEIGHT,
        HealthDataType.HEART_RATE,
        HealthDataType.BLOOD_GLUCOSE,
        HealthDataType.DISTANCE_WALKING_RUNNING,
      ];


      // you MUST request access to the data types before reading them
      bool accessWasGranted = await health.requestAuthorization(types);

      int steps = 0;

      if (accessWasGranted) {
        try {
          // fetch new data
          List<HealthDataPoint> healthData =
          await health.getHealthDataFromTypes(startDate, endDate, types);

          // save all the new data points
          _healthDataList.addAll(healthData);
        } catch (e) {
          print("Caught exception in getHealthDataFromTypes: $e");
        }

        // filter out duplicates
        _healthDataList = HealthFactory.removeDuplicates(_healthDataList);

        // print the results
        _healthDataList.forEach((x) {
          print("Data point: $x");
          steps += x.value.round();
        });

        print("Steps: $steps");
      }
      await fetchData();
      return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
        ),
        itemCount: types.length,
        itemBuilder: (BuildContext context, index) {
          HealthDataPoint p = _healthDataList[index];
          return Container(
            color: Theme.of(context).primaryColor,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/icons/${p.type}.png', height: 50, width: 50,),
                Text("${p.typeString}", style: GoogleFonts.montserrat(fontWeight: FontWeight.bold, fontSize: 16),),
                Text("${p.value} ${p.unit}", style: GoogleFonts.montserrat(fontWeight: FontWeight.normal, fontSize: 10))
           ],

            ),
          );
        },
      );
    }
  }


}

class Grid {
  String title;
  var value;
  String icon;

  Grid({this.title, this.value, this.icon});
}
