import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'dart:async';
import 'package:task3/patients_page.dart';

int play1 = 1;
int play2 = 1;
int play3 = 1;
int time = 3;
String sensor_title = "";

double d = 0.0;
var responsebody = [];

late List<LiveData> sensor1_data;
late List<LiveData> sensor1_live_data;
late List<LiveData> sensor2_data;
late List<LiveData> sensor2_live_data;
late List<LiveData> sensor3_data;
late List<LiveData> sensor3_live_data;

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late ChartSeriesController _chartSeriesController1;
  late ChartSeriesController _chartSeriesController2;
  late ChartSeriesController _chartSeriesController3;

  @override
  void initState() {
    sensor1_data = getChartData();
    sensor2_data = getChartData();
    sensor3_data = getChartData();
    sensor1_live_data = getChartData();
    sensor2_live_data = getChartData();
    sensor3_live_data = getChartData();
    Timer.periodic(const Duration(seconds: 2), updateData);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        scrollDirection: Axis.vertical,
        padding: EdgeInsets.only(top: 50),
        children: [
          Row(
            children: [
              Expanded(
                  child: ElevatedButton(
                      style:
                          ElevatedButton.styleFrom(primary: Colors.deepOrange),
                      onPressed: () {
                        sensor_title = "Line Follower";
                        play1 = 1;

                        setState(() {});
                      },
                      child: const Text(
                        "play",
                        style: TextStyle(fontSize: 15.0),
                      ))),
              Expanded(
                  child: ElevatedButton(
                      onPressed: () {
                        sensor_title = "Temperature";
                        play1 = 0;
                        setState(() {});
                      },
                      child: const Text(
                        "stop",
                        style: TextStyle(fontSize: 15.0),
                      ))),
              Expanded(
                  child: ElevatedButton(
                      style:
                          ElevatedButton.styleFrom(primary: Colors.deepOrange),
                      onPressed: () {
                        toggle();
                        setState(() {});
                      },
                      child: const Text(
                        "Toggle",
                        style: TextStyle(fontSize: 15.0),
                      ))),
            ],
          ),
          Expanded(
            child: Container(
              height: 700,
              padding: const EdgeInsets.all(20.0),
              child: SfCartesianChart(
                zoomPanBehavior: ZoomPanBehavior(
                  maximumZoomLevel: 1,
                  enablePanning: true,
                  zoomMode: ZoomMode.xy,
                ),
                series: <LineSeries<LiveData, int>>[
                  LineSeries<LiveData, int>(
                      onRendererCreated: (ChartSeriesController controller1) {
                        _chartSeriesController1 = controller1;
                      },
                      dataSource: sensor1_data,
                      name: "Temperature",
                      color: const Color.fromRGBO(192, 108, 132, 1),
                      xValueMapper: (LiveData data1, _) => data1.time,
                      yValueMapper: (LiveData data1, _) => data1.sensor_output,
                      emptyPointSettings:
                          EmptyPointSettings(mode: EmptyPointMode.average))
                ],
                enableSideBySideSeriesPlacement: true,
                primaryXAxis: NumericAxis(
                    autoScrollingDelta: 10,
                    majorGridLines: const MajorGridLines(width: 1),
                    interval: 1,
                    title: AxisTitle(text: 'Time (seconds)')),
                primaryYAxis: NumericAxis(
                  autoScrollingDelta: 10,
                  majorGridLines: const MajorGridLines(width: 1),
                  interval: 1,
                  title: AxisTitle(text: "$sensor_title"),
                ),
              ),
            ),
          ),
          Row(
            children: [
              Expanded(
                  child: ElevatedButton(
                      style:
                          ElevatedButton.styleFrom(primary: Colors.deepOrange),
                      onPressed: () {
                        sensor_title = "Line Follower";
                        play2 = 1;
                        setState(() {});
                      },
                      child: const Text(
                        "Line Follower",
                        style: TextStyle(fontSize: 15.0),
                      ))),
              Expanded(
                  child: ElevatedButton(
                      onPressed: () {
                        sensor_title = "Temperature";
                        play2 = 0;
                        setState(() {});
                      },
                      child: const Text(
                        "Temperature",
                        style: TextStyle(fontSize: 15.0),
                      ))),
              Expanded(
                  child: ElevatedButton(
                      style:
                          ElevatedButton.styleFrom(primary: Colors.deepOrange),
                      onPressed: () {
                        toggle();
                        setState(() {});
                      },
                      child: const Text(
                        "Toggle",
                        style: TextStyle(fontSize: 15.0),
                      ))),
            ],
          ),
          Expanded(
            child: Container(
              height: 700,
              padding: const EdgeInsets.all(20.0),
              child: SfCartesianChart(
                zoomPanBehavior: ZoomPanBehavior(
                  enablePanning: true,
                  zoomMode: ZoomMode.xy,
                ),
                series: <LineSeries<LiveData, int>>[
                  LineSeries<LiveData, int>(
                      onRendererCreated: (ChartSeriesController controller2) {
                        _chartSeriesController2 = controller2;
                      },
                      dataSource: sensor2_data,
                      name: "Temperature",
                      color: const Color.fromRGBO(192, 108, 132, 1),
                      xValueMapper: (LiveData data2, _) => data2.time,
                      yValueMapper: (LiveData data2, _) => data2.sensor_output,
                      emptyPointSettings:
                          EmptyPointSettings(mode: EmptyPointMode.average))
                ],
                enableSideBySideSeriesPlacement: true,
                primaryXAxis: NumericAxis(
                    autoScrollingDelta: 10,
                    majorGridLines: const MajorGridLines(width: 1),
                    interval: 1,
                    title: AxisTitle(text: 'Time (seconds)')),
                primaryYAxis: NumericAxis(
                  autoScrollingDelta: 10,
                  majorGridLines: const MajorGridLines(width: 1),
                  interval: 1,
                  title: AxisTitle(text: "$sensor_title"),
                ),
              ),
            ),
          ),
          Row(
            children: [
              Expanded(
                  child: ElevatedButton(
                      style:
                          ElevatedButton.styleFrom(primary: Colors.deepOrange),
                      onPressed: () {
                        sensor_title = "Line Follower";
                        play3 = 1;
                        setState(() {});
                      },
                      child: const Text(
                        "Line Follower",
                        style: TextStyle(fontSize: 15.0),
                      ))),
              Expanded(
                  child: ElevatedButton(
                      onPressed: () {
                        sensor_title = "Temperature";
                        play3 = 0;
                        setState(() {});
                      },
                      child: const Text(
                        "Temperature",
                        style: TextStyle(fontSize: 15.0),
                      ))),
              Expanded(
                  child: ElevatedButton(
                      style:
                          ElevatedButton.styleFrom(primary: Colors.deepOrange),
                      onPressed: () {
                        toggle();
                        setState(() {});
                      },
                      child: const Text(
                        "Toggle",
                        style: TextStyle(fontSize: 15.0),
                      ))),
            ],
          ),
          Expanded(
            child: Container(
              height: 700,
              padding: const EdgeInsets.all(20.0),
              child: SfCartesianChart(
                zoomPanBehavior: ZoomPanBehavior(
                  enablePanning: true,
                  zoomMode: ZoomMode.xy,
                ),
                series: <LineSeries<LiveData, int>>[
                  LineSeries<LiveData, int>(
                      onRendererCreated: (ChartSeriesController controller3) {
                        _chartSeriesController3 = controller3;
                      },
                      dataSource: sensor3_data,
                      name: "Temperature",
                      color: const Color.fromRGBO(192, 108, 132, 1),
                      xValueMapper: (LiveData data3, _) => data3.time,
                      yValueMapper: (LiveData data3, _) => data3.sensor_output,
                      emptyPointSettings:
                          EmptyPointSettings(mode: EmptyPointMode.average))
                ],
                enableSideBySideSeriesPlacement: true,
                primaryXAxis: NumericAxis(
                    autoScrollingDelta: 10,
                    majorGridLines: const MajorGridLines(width: 1),
                    interval: 1,
                    title: AxisTitle(text: 'Time (seconds)')),
                primaryYAxis: NumericAxis(
                  autoScrollingDelta: 10,
                  majorGridLines: const MajorGridLines(width: 1),
                  interval: 1,
                  title: AxisTitle(text: "$sensor_title"),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void updateData(Timer timer) {
    getData(time);

    if (play1 == 1) {
      sensor1_data = sensor1_live_data.toList();
    }
    if (play2 == 1) {
      sensor2_data = sensor2_live_data.toList();
    }
    if (play3 == 1) {
      sensor3_data = sensor3_live_data.toList();
      // _chartSeriesController3.updateDataSource(
      //   addedDataIndex: sensor3_data.length,
      // );

    }
    if ((play1 == 1) && (play2 == 1) && (play3 == 1)) {
      setState(() {});
    }
  }

  List<LiveData> getChartData() {
    return <LiveData>[
      LiveData(0, 0),
      LiveData(1, 0),
      LiveData(2, 0),
    ];
  }
}

class LiveData {
  LiveData(this.time, this.sensor_output);
  final int time;
  final num sensor_output;
}

Future getData(int m) async {
  time = time + 1;
  sensor1_live_data.add(LiveData(time, time));
  sensor2_live_data.add(LiveData(time, time));
  sensor3_live_data.add(LiveData(time, time));
  var url1 = "https://farook2022.pythonanywhere.com/retrieve-local-db";
  // http.Response response = await http.get(Uri.parse(url1));
  // responsebody = response.body.split('\n')[m].split(',');
  // print(responsebody);
  // return responsebody;
}

Future toggle() async {
  // i = 3;
  // var url2 = "https://farook2022.pythonanywhere.com/set-mobile-order";
  // http.Response response = await http.get(Uri.parse(url2));
  // return responsebody;
}
