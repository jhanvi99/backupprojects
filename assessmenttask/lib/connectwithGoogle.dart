
import 'dart:async';
import 'package:assessmenttask/CreateAccountPage.dart';
import 'package:flutter/material.dart';
import 'routes.dart';

class ConnectWithGoogle extends StatefulWidget {
  @override
  _ConnectWithGoogleState createState() => _ConnectWithGoogleState();
}

class _ConnectWithGoogleState extends State<ConnectWithGoogle> {
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
                    Image.asset('assets/Seddow Logo.png'),
                    const Text('Welcome !', style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold)),
                    const Text('Sign in or Sign up With Google', style: TextStyle(fontSize: 22,fontWeight: FontWeight.w400)),
                    const SizedBox(height: 20),
                    GestureDetector(
                        onTap: ()
                        {
                          Navigator.push(context,MaterialPageRoute(builder: (context) => CreateAccont()));
                        },

                        child: Image.asset('assets/Contact with google.png')
                    ),

                    SizedBox(height: MediaQuery.of(context).size.height/15),
                    Image.asset('assets/img.png'),
                  ],
                );
              }),
        ),
      ),
    );
  }

  Future<void> findFlow(BuildContext context) async {
//
//    Timer(const Duration(seconds: 2), () {
//      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> d()));
//    });
  }

}
