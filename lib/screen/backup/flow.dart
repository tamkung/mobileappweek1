import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

/// Represents MyHomePage class
class MyHomePage extends StatefulWidget {
  /// Creates the instance of MyHomePage
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final dbfirebase = FirebaseDatabase.instance.reference().child('Control');

  final dbRef = FirebaseDatabase.instance.reference();
  dynamic ledStatus, graph;
  bool isLoading = false;
  getStatus() async {
    await dbRef.child('Control').once().then((DataSnapshot snapshot) {
      ledStatus = double.parse(snapshot.value['led'].toString());
      graph = double.parse(snapshot.value['temp'].toString());
      print(ledStatus);
      print(graph);
    });
  }

  Widget _getGauge(val, str, {bool isRadialGauge = true}) {
    if (isRadialGauge) {
      return _getRadialGauge(val, str);
    } else {
      return _getLinearGauge();
    }
  }

  Widget _getRadialGauge(val, str) {
    return SfRadialGauge(
        title: GaugeTitle(
            text: str,
            textStyle:
                const TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
        axes: <RadialAxis>[
          RadialAxis(minimum: 0, maximum: 150, ranges: <GaugeRange>[
            GaugeRange(
                startValue: 0,
                endValue: 50,
                color: Colors.green,
                startWidth: 10,
                endWidth: 10),
            GaugeRange(
                startValue: 50,
                endValue: 100,
                color: Colors.orange,
                startWidth: 10,
                endWidth: 10),
            GaugeRange(
                startValue: 100,
                endValue: 150,
                color: Colors.red,
                startWidth: 10,
                endWidth: 10)
          ], pointers: <GaugePointer>[
            NeedlePointer(value: val),
          ], annotations: <GaugeAnnotation>[
            GaugeAnnotation(
                widget: Container(
                    child: Text('${val}',
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold))),
                angle: 90,
                positionFactor: 0.5)
          ])
        ]);
  }

  Widget _getLinearGauge() {
    return Container(
      child: SfLinearGauge(
          minimum: 0.0,
          maximum: 100.0,
          orientation: LinearGaugeOrientation.horizontal,
          majorTickStyle: LinearTickStyle(length: 20),
          axisLabelStyle: TextStyle(fontSize: 12.0, color: Colors.black),
          axisTrackStyle: LinearAxisTrackStyle(
              color: Colors.cyan,
              edgeStyle: LinearEdgeStyle.bothFlat,
              thickness: 15.0,
              borderColor: Colors.grey)),
      margin: EdgeInsets.all(10),
    );
  }

  @override
  Widget build(BuildContext context) {
    var data;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Syncfusion Flutter Gauge'),
      ),
      body: Container(
        child: FirebaseAnimatedList(
          query: dbfirebase, //orderByKey().equalTo('temp'),
          itemBuilder: (context, snapshot, animation, index) {
            data = snapshot.value.toString();
            return Column(
              children: [
                Container(
                  //color: Colors.amber,
                  height: 300,
                  margin: EdgeInsets.fromLTRB(30, 0, 30, 0),
                  child: _getGauge(
                      double.parse(
                        snapshot.value['temp'].toString(),
                      ),
                      'Temperature'),
                ),
                Container(
                  //color: Colors.amber,
                  height: 300,
                  margin: EdgeInsets.fromLTRB(30, 0, 30, 0),
                  child: _getGauge(
                      double.parse(
                        snapshot.value['humid'].toString(),
                      ),
                      'Humidity'),
                ),
              ],
            );
          },
        ),
      ),
      floatingActionButton: IconButton(
        icon: Icon(Icons.ac_unit),
        onPressed: () {
          print(data);
        },
      ),
    );
  }
}
