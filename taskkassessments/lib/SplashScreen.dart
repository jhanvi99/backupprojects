
import 'dart:async';
import 'connectwithGoogle.dart';
import 'package:flutter/material.dart';
import 'routes.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: FutureBuilder<void>(
              future: findFlow(context),
              builder: (context, snapshot) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.asset('assets/Logo.png'),
                    const SizedBox(height: 10),
                    const Text('Chalo Banaye,', style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold)),
                    const Text('Ek Naya Rishta', style: TextStyle(fontSize: 22, fontWeight: FontWeight.w400)),
                     SizedBox(height: MediaQuery.of(context).size.height/8),
                    Image.asset('assets/img.png'),
                  ],
                );
              }),
        ),
      ),
    );
  }

  Future<void> findFlow(BuildContext context) async {
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> ConnectWithGoogle()));
    });
  }
}
