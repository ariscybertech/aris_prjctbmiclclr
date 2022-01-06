import 'package:flutter/material.dart';

void main() {
  runApp(RunApp());
}

class RunApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyApp(),
    );
  }
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isMale = true;
  int age = 18;
  int weight = 50;
  int height = 180;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //by default color is white
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Center(
          child: Text(
            'BMI Calculator',
            style: TextStyle(color: Colors.black),
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(20),
                    child: Column(
                      children: [
                        Text(
                          'Age',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 30),
                        ),
                        Text(
                          age.toString(),
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                              color: Colors.grey),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            FloatingActionButton(
                              mini: true,
                              onPressed: () {
                                setState(() {
                                  age++;
                                });
                              },
                              child: Icon(Icons.add),
                            ),
                            FloatingActionButton(
                              mini: true,
                              onPressed: () {
                                setState(() {
                                  age--;
                                });
                              },
                              child: Icon(Icons.remove),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(20),
                    child: Column(
                      children: [
                        Text(
                          'Weight',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 30),
                        ),
                        Text(
                          weight.toString(),
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                              color: Colors.grey),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            FloatingActionButton(
                              mini: true,
                              onPressed: () {
                                setState(() {
                                  weight++;
                                });
                              },
                              child: Icon(Icons.add),
                            ),
                            FloatingActionButton(
                              mini: true,
                              onPressed: () {
                                setState(() {
                                  weight--;
                                });
                              },
                              child: Icon(Icons.remove),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Height',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 30),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              height.toString(),
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30,
                                  color: Colors.grey),
                            ),
                            Column(
                              children: [
                                FloatingActionButton(
                                  onPressed: () {
                                    setState(() {
                                      height++;
                                    });
                                  },
                                  mini: true,
                                  child: Icon(Icons.add),
                                ),
                                FloatingActionButton(
                                  mini: true,
                                  onPressed: () {
                                    setState(() {
                                      height--;
                                    });
                                  },
                                  child: Icon(Icons.remove),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.all(20),
              child: Row(
                children: [
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              if (!isMale) isMale = !isMale;
                            });
                          },
                          child: Text(
                            'Male',
                            style: (isMale)
                                ? TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 30)
                                : TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 30,
                                    color: Colors.grey),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              if (isMale) isMale = !isMale;
                            });
                          },
                          child: Text(
                            'Female',
                            style: (!isMale)
                                ? TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 30)
                                : TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 30,
                                    color: Colors.grey),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(13),
                  child: RaisedButton(
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text(
                        'Check my BMI',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 30),
                      ),
                    ),
                    color: Colors.blue,
                    onPressed: () {
                      double bmi = 0;
                      bmi = 703 * weight / (height * height);
                      showModalBottomSheet(
                          context: context,
                          builder: (ctx) {
                            return Container(
                              height: 350,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    'Your BMI is : '
                                    , style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black, fontSize: 30),
                                  ),
                                  Text(
                                    bmi.toStringAsFixed(1),
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                        fontSize: 30),
                                  ),
                                ],
                              ),
                            );
                          });
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
