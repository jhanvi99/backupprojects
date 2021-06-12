
import 'package:equitysoft/login.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);


  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}



class _MyHomePageState extends State<MyHomePage> {
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

     body: loginn()
   );
  }
}


