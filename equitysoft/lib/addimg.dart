import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:path/path.dart' as Path;
import 'package:uuid/uuid.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class AddImage extends StatefulWidget {
  final String useridddds;

  AddImage({Key key, this.useridddds}) : super(key: key);

  @override
  _AddImageState createState() => _AddImageState();
}

class _AddImageState extends State<AddImage> {
  bool uploading = false;
  double val = 0;
  CollectionReference imgRef;
  firebase_storage.Reference ref;
  TextEditingController collection_name=TextEditingController();
  List<File> _image = [];
  final picker = ImagePicker();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text('Add Collection',style:TextStyle(color: Colors.black) ,),
          actions: [
            FlatButton(
                onPressed: () async {
                  setState(() {
                    uploading = true;
                  });



                  List<String>h= await uploadImage(_image);
                  print("outside");
                  print(h);
                  if(h.isNotEmpty)
                    {
                      print("inside");
                      print(h);
                      uploadImage1(h);
                    }
                  else{
                    print("list is null");
                  }

                },
                child: Text(
                  'upload',
                  style: TextStyle(color: Colors.black),
                ))
          ],
        ),
        body: Stack(
          children: [

        Padding(
          padding: const EdgeInsets.all(8.0),
          child: new TextField(
            controller: collection_name,
          decoration: new InputDecoration(
          border: new OutlineInputBorder(
          borderSide: new BorderSide(color: Colors.teal)),
            hintText: 'Collection Name',
            hintStyle: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
            labelText: 'Collection Name',

            ),
            ),
        ),



            Padding(
              padding: const EdgeInsets.only(top:88.0,left: 30),
              child: Text("Add Images",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
            ),

            Container(
              padding: EdgeInsets.only(top:100),
              child: GridView.builder(
                  itemCount: _image.length + 1,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3),
                  itemBuilder: (context, index) {
                    return

           index == 0 ? Center( child: IconButton(icon: Icon(Icons.add),onPressed: () =>!uploading ? chooseImage() : null), )
                        : Container(
                      margin: EdgeInsets.all(3),
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: FileImage(_image[index - 1]),
                              fit: BoxFit.cover)),
                    );
                  }),
            ),
            uploading
                ? Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      child: Text(
                        'uploading...',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    CircularProgressIndicator(
                      value: val,
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
                    )
                  ],
                ))
                : Container(),
          ],
        ));
  }

  chooseImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      _image.add(File(pickedFile?.path));
    });
    if (pickedFile.path == null) retrieveLostData();
  }

  Future<void> retrieveLostData() async {
    final LostData response = await picker.getLostData();
    if (response.isEmpty) {
      return;
    }
    if (response.file != null) {
      setState(() {
        _image.add(File(response.file.path));
      });
    } else {
      print(response.file);
    }
  }

  Future uploadFile() async {
    int i = 1;
    print("img  lengthhhh");
    print("..........................................................................");
    print(_image);
    print("..........................................................................");
    print(_image.length);
    var coll=collection_name.text.toString();
    for (var img in _image)
    {
      print("only imggg");
      print(img);
      setState(() {
        val = i / _image.length;
      });
      ref = firebase_storage.FirebaseStorage.instance.ref().child('images/${Path.basename(img.path)}');

      await ref.putFile(img).whenComplete(() async {
        await ref.getDownloadURL().then((value) {
          print("imgg printttttttttttttttttttt 2222222222222222");
          print(value);
          imgRef.doc(widget.useridddds).
          set({'url': value
          })

          ;
          i++;
        });
      });

    }
  }



  Future<List<String>> uploadImage(List<File> _imageFile) async {
    print("IMGASEEEEE");
    print(_imageFile);
    List<String> _urllist = [];
    await _imageFile.forEach((image) async {
      _urllist.add(image.path);

    });

    print("urtllll listttttttttttt");
    print(_urllist);
    return _urllist;
  }




  Future<List<String>> uploadImage1(List<String> _imageFile) async {
    int g=1;


    Map<String, dynamic> selectedTimes = {
      collection_name.text.toString():_imageFile,
    };





    if(g==1)
      {


        SharedPreferences preferences = await SharedPreferences.getInstance();
        String encodedMap = json.encode(selectedTimes);
        print(encodedMap);
        preferences.setString("yourkey",encodedMap);




        print("ssssssssssssssssssss");
        print(shreddata);


        var u=shreddata.keys.toString();
        var i=shreddata.values.toList();

        List p=shreddata.values;

        print("ioioiiooioii");
        print(i);

        imgRef.doc(widget.useridddds).set({


          "Collection":  shreddata,

          "Collection": {

            collection_name.text.toString():_imageFile

          },


        });



      }
    else{

      imgRef.doc(widget.useridddds).set({

        "Collection":shreddata,
        "Collection": {
          collection_name.text.toString():_imageFile
        }



      });
    }



//    collection(collection_name.text.toString()).doc().set({
//      "Collection" : collection_name.text.toString(),
//      "urll":_imageFile
//    });

  }



  Future<List<String>> uploadFiles(List _images) async {

    print("list of imagesssssssssssssssssssssssssssssssss");
    print(_images);

    imgRef.doc(widget.useridddds).set({
      "urllll": _images.toString()

    });

  }

var shreddata;
  getprfdata()
  async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String encodedMap1 = preferences.getString('yourkey');
    Map<String,dynamic> decodedMap = json.decode(encodedMap1);
    print(decodedMap);


    print("gededdd dataa #######################################");
    print(decodedMap);

    setState(() {
      shreddata=encodedMap1;
    });

  }



  @override
  void initState()  {
    super.initState();
    print("user id in add img page");
    print(widget.useridddds);
   getprfdata();
    imgRef = FirebaseFirestore.instance.collection('kkkk');
  }
}