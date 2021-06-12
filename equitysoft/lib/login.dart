import 'package:equitysoft/addddata.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class loginn extends StatefulWidget
{
  @override
  _loginnState createState() => _loginnState();
}

class _loginnState extends State<loginn>
{

  var userID;

  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseFirestore firestore= FirebaseFirestore.instance;

  CollectionReference users=FirebaseFirestore.instance.collection('users');

  Future<void> signInWithGoogle() async {
    final googleSignIn = GoogleSignIn();
    final googleUser = await googleSignIn.signIn();
    if (googleUser != null) {
      final googleAuth = await googleUser.authentication;
      if (googleAuth.idToken != null) {

        final userCredential = await _auth.signInWithCredential(
          GoogleAuthProvider.credential( idToken: googleAuth.idToken, accessToken: googleAuth.accessToken),
        );
        setState(() {
          userID=userCredential.user.uid;
        });
        return userCredential.user;
      }
    } else {
      throw FirebaseAuthException(
        message: "Sign in aborded by user",
        code: "ERROR_ABORDER_BY_USER",
      );
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
          children: [

            SizedBox(
              height: 350,
            ),


            GestureDetector(
                onTap: ()
                {
                  signInWithGoogle().whenComplete((){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => getdata(useridddds: userID,)),
                    );
                  });
                },
                child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                        height: 50,
                        width: 350,
                        color: Colors.transparent,
                        child: Container(
                          child: Row(
                            children: [
                              SizedBox(width: 75,),
                              Center(child: Text("Signup with Google")),
                              SizedBox(width: 10,),
                              //Image.asset('assets/g.png',width: 25,height: 25,)
                            ],
                          ),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                              color: Colors.white,
                              border: Border.all(
                                color: Colors.black,
                                width: 1,
                              )),
                        )
                    )
                )
            )
          ]
      ),
    );
  }
}
