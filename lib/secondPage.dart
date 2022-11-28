import 'dart:isolate';
import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  var progress = 0;
  var value = '';

  int computationallyExpensiveTask1(int value) {
    var sum = 0;
    for (var i = 0; i <= value; i++) {
      sum += i;
      print(i);
    }
    print('finished task');
    return sum;
  }

  // this function should be either top level(outside class) or static method
  void computationallyExpensiveTask(SendPort sendPort) {
    print('heavy work started');
    var sum = 0;
    for (var i = 0; i <= 1000000000; i++) {
      // print(i);
      // progress = (1000000000 / (i + 1)) as int;
      // print(progress);
      sum += i;
    }
    print('heavy work finished');
    //Remember there is no return, we are sending sum to listener defined defore.
    sendPort.send(sum);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            ...List.generate(
              10000,
              (i) => Container(
                height: 10,
                width: 10,
                color: Colors.red,
              ),
            ),
            // Wrap(
            //   children: List.generate(
            //       1000,
            //       (index) => Container(
            //             color: Colors.red,
            //           )
            //       //  CustomPaint(
            //       //       size: Size(2, 2),
            //       //       painter: OpenPainter(),
            //       //     ),
            //       ),
            // )
          ],
        ),
      ),
      // body: Center(
      //   child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      //     CircularProgressIndicator(
      //         // value: progress.toDouble(),
      //         ),
      //     ElevatedButton(
      //       child: Text('start'),
      //       onPressed: () async {
      //         // var value =
      //         //     await compute(computationallyExpensiveTask1, (10000000000));

      //         // print(value);
      //         //ReceivePort is to listen for the isolate to finish job
      //         final receivePort = ReceivePort();
      //         // // here we are passing method name and sendPort instance from ReceivePort as listener
      //         await Isolate.spawn(
      //             computationallyExpensiveTask, receivePort.sendPort);

      //         // //It will listen for isolate function to finish
      //         receivePort.listen((sum) {
      //           print(sum);
      //         });
      //       },
      //     )
      //   ]),
      // ),
    );
  }
}

class OpenPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint1 = Paint()
      ..color = Color(Random().nextInt(1000))
      // ..color = Color(0xff995588)
      ..style = PaintingStyle.fill;
    canvas.drawRect(Offset(100, 100) & Size(size.height, size.width), paint1);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
