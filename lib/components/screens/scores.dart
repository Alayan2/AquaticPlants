import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:pie_chart/pie_chart.dart';

import '../../firebase_options.dart';

class ScoreSheet extends StatelessWidget {
  // const FirstRoute({super.key});

  Future<void> adsfa()  async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }

  final database = FirebaseDatabase.instance.ref();

  Map<String, double> dataMap = {
    "Emergent": 5,
    "Submersed": 3,
    "Floaters": 2,
    "Woody": 2,
  };

  final colorList = <Color>[
    Colors.greenAccent,
    Colors.blueGrey,
    Colors.blueAccent,
    Colors.cyanAccent
  ];

  // Future<String> avgScore() async {
  //
  //   final grade = database.child('userStats/');
  //
  //   final snapshot = await grade.child('userStats/passingCount').get();
  //   final snapshot2 = await grade.child('userStats/totalCount').get();
  //
  // //   String a = database.child('totalCount');
  // //   if (snapshot.exists) {
  // //     (snapshot.value || 0)  + snapshot2.value;
  // //     return(snapshot.value);
  // //   } else {
  // //     return('0%');
  // //   }
  // // }

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return MaterialApp(
          home: Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              //horizontal bar displayed at the top
              title: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Text(
                  'Aquatic Plant Study Guide',
                  style: TextStyle(color: Colors.blueGrey.shade700), //<-- SEE HERE
                )
              ]),
              backgroundColor: Colors.white,
            ),
        body: Center(
          child: SizedBox(
            height: 80.h,
            width: 80.w,
            child: ListView(//listview to allow for scrolling
                children: [
              const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
              ElevatedButton(
                  child: const Text('Average Score'),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        side: const BorderSide(color: Colors.blueAccent)),
                    primary: Colors.white,
                    onPrimary: Colors.blueGrey,
                    shadowColor: Colors.cyan,
                    elevation: 5,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                  ),
                  onPressed: () {}),
              const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
              Center(
                  child: Card(
                      elevation: 20,
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: SizedBox(
                        width: 90.h,
                        height: 20.h,
                        child: const Center(
                            child: Text('90%',
                                style: TextStyle(
                                    fontSize: 50, color: Colors.blueGrey))),
                      ))),
              const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
              ElevatedButton(
                  child: const Text('Target Study Areas'),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        side: BorderSide(color: Colors.blueAccent)),
                    primary: Colors.white,
                    onPrimary: Colors.blueGrey,
                    shadowColor: Colors.cyan,
                    elevation: 5,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                  ),
                  onPressed: () {
                    // Navigate to second route when tapped.
                  }),
              const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
              Center(
                child: PieChart(
                  dataMap: dataMap,
                  chartType: ChartType.ring,
                  baseChartColor: Colors.grey[300]!,
                  colorList: colorList,
                ),
              ),
            ]),
          ),
        ),
      ));
    });
  }
}
