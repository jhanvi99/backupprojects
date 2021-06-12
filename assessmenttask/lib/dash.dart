import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
class d extends StatefulWidget {
  @override
  _dState createState() => _dState();
}

class _dState extends State<d> {
  String imgUrl;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            //SizedBox(height: 50,),
            (imgUrl != null)? Image.network(imgUrl):
                Placeholder(fallbackHeight: 200,fallbackWidth: double.infinity,),

            RaisedButton(onPressed: (){
                        uploadimg();
            })

          ],
        ),
      ),
    );
  }

  uploadimg() async
  {
    final _storage= FirebaseStorage.instance;
    final _picker = ImagePicker();
    PickedFile image;
    await Permission.photos.request();

    var permissionStatus = await Permission.photos.status;

    if(permissionStatus.isGranted)
      {
        image= await _picker.getImage(source: ImageSource.gallery);
        var file = File(image.path);

        if(image != null)
          {

              var snapshot = await _storage.ref().child('folderName/imageName').putFile(file);

              var downURL= await snapshot.ref.getDownloadURL();

              setState(() {

                imgUrl=downURL;
              });
          }
        else{

        }
      }

    else
     {
        print("permission not granted");
     }
  }
}
