import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final wtController = TextEditingController();
  final ftController = TextEditingController();
  final inController = TextEditingController();
  var result = "";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(

        child: Scaffold(
          appBar: AppBar(
            title: Center(
              child: Text("YOUR BMI"),
            ),
          ),
          body: Container(
            color: Colors.white,
            child: Padding(
              padding:  EdgeInsets.all(16.0),
              child: Center(
                child: Container(
                  width: 300,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: Text(
                          'CALCULATE YOUR BMI',
                          style: TextStyle(
                            fontSize: 30
                            ,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      TextField(
                        controller: wtController,
                        decoration: const InputDecoration(
                          labelText: ' Weight in Kg',
                          prefixIcon: Icon(Icons.line_weight),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(40)),
                          ),
                        ),
                        keyboardType: TextInputType.number,
                      ),
                      const SizedBox(height: 10),
                      TextField(
                        controller: ftController,
                        decoration: const InputDecoration(
                          labelText: 'Height in Feet',
                          prefixIcon: Icon(Icons.height),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(40)),
                          ),
                        ),
                        keyboardType: TextInputType.number,
                      ),
                      const SizedBox(height: 10),
                      TextField(
                        controller: inController,
                        decoration: const InputDecoration(
                          labelText: 'Height in Meters',
                          prefixIcon: Icon(Icons.height),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(40)),
                          ),
                        ),
                        keyboardType: TextInputType.number,
                      ),
                      SizedBox(height: 10),
                      ElevatedButton(
                        onPressed: () {
                          var wt = wtController.text;
                          var ft = ftController.text;
                          var inch = inController.text;

                          if (wt.isNotEmpty && ft.isNotEmpty && inch.isNotEmpty) {
                            var weight = double.parse(wt);
                            var feet = double.parse(ft);
                            var inches = double.parse(inch);

                            // Convert height to meters
                            var totalInches = (feet * 12) + inches;
                            var totalMeters = totalInches * 0.0254;

                            // Calculate BMI
                            var bmi = weight / (totalMeters * totalMeters);

                            setState(() {
                              result = "Your BMI is ${bmi.toStringAsFixed(2)}";
                            });
                          } else {
                            setState(() {
                              result = "Please fill all the fields";
                            });
                          }
                        },
                        child: Text('Calculate'),
                      ),
                      SizedBox(height: 10),
                      Text(
                        result,
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white54,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
