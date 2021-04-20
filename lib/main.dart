import 'package:flutter/material.dart';
import 'dart:async';
import 'display.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft])
      .then((_) {
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 4), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Display()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigoAccent,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              child: SpinKitDoubleBounce(
                color: Colors.white,
                size: 80.0,
              ),
            ),
            Container(
              child: Text(
                'Welcome',
                style: TextStyle(
                  color: Colors.redAccent,
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 10,
                ),
              ),
            )
          ],
        ),
      ),
      // body: Stack(
      //   fit: StackFit.expand,
      //   children: <Widget>[
      //     Container(
      //       decoration: BoxDecoration(color: Colors.redAccent),
      //     ),
      //     Column(
      //       mainAxisAlignment: MainAxisAlignment.center,
      //       children: <Widget>[
      //         // Expanded(child: Container(
      //         //   child: Column(
      //         //
      //         //   ),
      //         // ))
      //         Text(
      //           'Welcome',
      //           textAlign: TextAlign.center,
      //           style: TextStyle(fontSize: 40, fontWeight: FontWeight.w900, color: Colors.white),
      //         ),
      //       ],
      //     )
      //   ],
      // ),
    );
  }
}
