
import 'dart:io';

import 'package:equitysoft/addimg.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:transparent_image/transparent_image.dart';

class getdata extends StatefulWidget {
final String useridddds;

  getdata({Key key, this.useridddds}) : super(key: key);

  @override
  _getdataState createState() => _getdataState();
}

class _getdataState extends State<getdata> {
  //final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance.collection('users').doc(widget.useridddds).get();


  Future<DocumentSnapshot> getUserInfo()async{
    var firebaseUser = await FirebaseAuth.instance.currentUser;
    return await FirebaseFirestore.instance.collection("TESTTT").doc(firebaseUser.uid).get();
  }



  var k;
  @override
  void initState() {

    // TODO: implement initState
    super.initState();

    print("user id in home page ");
    print(widget.useridddds);


    User u= FirebaseAuth.instance.currentUser;

    var  doc=  FirebaseFirestore.instance.collection('final Demo').doc(u.uid).snapshots();
    print("....................................");
    print(doc);


  }



  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        body: FutureBuilder<DocumentSnapshot>(
            future: getUserInfo(),
            builder: (context, AsyncSnapshot snapshot) {
              if (!snapshot.hasData) {
                return Center(child: CircularProgressIndicator());
              } else {
                Map<String, dynamic> data = snapshot.data.data();
                print("DSSSSS.......................................................");
                print(data["Collection"]);

                print("DSSSSS.......................................................");

                var j=data['Collection'].keys;
                print("jjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjj");
                //print(j);
                List oi= j.toList();
                print(oi);

                return
                Container(
                    child:

                    ListView.builder(
                        itemCount: oi.length,
                        itemBuilder: (BuildContext context,int index){

                          var m=j.toList()[index];
                          print("mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm");

                          print(m);
                          List ip=data['Collection'][m];
                          print(ip);

                          return
                        Column(
                          children: [

                         ListTile(
                           title: Text(oi[index]),
                           trailing: IconButton(
                             icon: Icon(Icons.delete),
                             onPressed: ()
                             {

                               FirebaseFirestore.instance.collection("TESTTT").doc(widget.useridddds).delete();
                             },
                           ),

                         ),


                          Container(
                          height: 150,
                          width: 300,
                          child:

                          GridView.builder(
                              itemCount: ip.length,
                              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3),
                              //scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index)
                              {
                                return
                                  Container(
                                      height:200 ,
                                      width: 200,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: FileImage(File(ip[index]))
                                          )
                                      )
                                  );

                              }),

                        )

                          ],
                        );
                        }
                    ),


                );
              }
            }),


        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.deepPurple,
          child: Icon(Icons.add,color: Colors.white,),
          onPressed: ()
          {

            Navigator.push(
            context, MaterialPageRoute(builder: (context) => AddImage(useridddds: widget.useridddds,)),
          );


          },
        ),


    );







  }
}
