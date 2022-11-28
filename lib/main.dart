import 'package:computelargesum/secondPage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: HomePage(),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var value = '';
  var progress = 0;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          InkWell(
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) => SecondScreen()));
            },
            child: Text("Next Page"),
          ),
          // CircularProgressIndicator(),
          // ElevatedButton(
          //   child: Text('start'),
          //   onPressed: () async {
          //     progress = 0;
          //     final sum =
          //         await compute(computationallyExpensiveTask, 1000000000);
          //     print(sum);

          //     value = sum as String;
          //     setState(() {});
          //   },
          // ),
          Text(value)
        ],
      ),
    );
  }
}

int computationallyExpensiveTask(int value) {
  var sum = 0;
  for (var i = 0; i <= value; i++) {
    sum += i;
  }
  print('finished task');
  return sum;
}
