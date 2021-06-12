import 'package:flutter/material.dart';
import 'package:sms/sms.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
{

  SmsQuery query = new SmsQuery();
  List messages=new List();
  List p=new List();
  List m=new List();
  var buttonvaue;
bool load=false;
  bool load1=false;
  bool load3=false;
  bool load4=false;

  fetchSMS(String val) async
  {
    m.clear();
    buttonvaue='';
    messages = await query.getAllSms;
    for(var i=0; i<messages.length;i++)
      {
        if(messages[i].address=="+919512842670")
          {
            setState(() {
              p.add(messages[i].body);
            });
          }
      }
    print("PRINT PP");
    print(p);
    for(var j=0;j<p.length;j++)
      {
        if(p[j]=="$val pin is OFF" || p[j]=="$val pin is ON")
          {
            print("mmmmmmmmmmmmmmm");
            setState(() {
             m.add(p[j]);
            });
          }
      }


    setState(() {
      if(buttonvaue!=null)
        {
          buttonvaue=m[1];
          if(buttonvaue=="$val pin is OFF")
          {
            setState(() {
              load=false;
            });
          }
          else if(buttonvaue=="$val pin is ON")
          {
            setState(() {
              load=true;
            });
          }
        }
      else if(buttonvaue==null){
        buttonvaue=m[0];
        if(buttonvaue=="$val pin is OFF")
        {
          setState(() {
            load=false;
          });
        }
        else if(buttonvaue=="$val pin is ON")
        {
          setState(() {
            load=true;
          });
        }
      }


    });
    print(buttonvaue);

  }



  fetchSMS4(String val) async
  {

    m.clear();
    messages = await query.getAllSms;
    for(var i=0; i<messages.length;i++)
    {
      if(messages[i].address=="+919512842670")
      {
        setState(() {
          p.add(messages[i].body);
        });
      }
    }
    print("PRINT PP");
    print(p);
    for(var j=0;j<p.length;j++)
    {
      if(p[j]=="Inward pin is OFF" || p[j]=="Inward pin is ON")
      {
        print("mmmmmmmmmmmmmmm");
        setState(() {
          m.add(p[j]);
        });
      }
    }

    setState(() {
      if(buttonvaue!=null)
      {
        buttonvaue=m[1];
        if(buttonvaue=="Inward pin is OFF")
        {
          setState(() {
            load4=false;
          });
        }
        else if(buttonvaue=="Inward pin is ON")
        {
          setState(() {
            load4=true;
          });
        }
      }
      else if(buttonvaue==null){
        buttonvaue=m[0];
        if(buttonvaue=="$val pin is OFF")
        {
          setState(() {
            load4=false;
          });
        }
        else if(buttonvaue=="$val pin is ON")
        {
          setState(() {
            load4=true;
          });
        }
      }


    });
    print(buttonvaue);
  }



  fetchSMS2(String val) async
  {
    m.clear();
    buttonvaue='';
    messages = await query.getAllSms;
    for(var i=0; i<messages.length;i++)
    {
      if(messages[i].address=="+919512842670")
      {
        setState(() {
          p.add(messages[i].body);
        });
      }
    }
    print("PRINT PP");
    print(p);
    for(var j=0;j<p.length;j++)
    {
      if(p[j]=="$val pin is OFF" || p[j]=="$val pin is ON")
      {
        print("mmmmmmmmmmmmmmm");
        setState(() {
          m.add(p[j]);
        });
      }
    }

    setState(() {
      buttonvaue=m[0];
      if(buttonvaue=="$val pin is OFF")
      {
        setState(() {
          load3=false;
        });
      }
      else if(buttonvaue=="$val pin is ON")
      {
        setState(() {
          load3=true;
        });
      }

    });
    print(buttonvaue);

  }




  fetchSMS1(String val) async
  {
    m.clear();
    buttonvaue='';
    messages = await query.getAllSms;
    for(var i=0; i<messages.length;i++)
    {
      if(messages[i].address=="+919512842670")
      {
        setState(() {
          p.add(messages[i].body);
        });
      }
    }
    print("PRINT PP");
    print(p);
    for(var j=0;j<p.length;j++)
    {
      if(p[j]=="$val pin is OFF" || p[j]=="$val pin is ON")
      {
        print("mmmmmmmmmmmmmmm");
        setState(() {
          m.add(p[j]);
        });
      }
    }

    setState(() {
      buttonvaue=m[0];
      if(buttonvaue=="$val pin is OFF")
      {
        setState(() {
          load1=false;
        });
      }
      else if(buttonvaue=="$val pin is ON")
      {
        setState(() {
          load1=true;
        });
      }

    });
    print(buttonvaue);

  }





  Widget StaggTiles() {
    return StaggeredGridView.count(crossAxisCount: 2,
      shrinkWrap: true,
      crossAxisSpacing: 5,
      mainAxisSpacing: 5,
      padding: EdgeInsets.fromLTRB(20, 50, 20, 0),
      children: <Widget>[



        GestureDetector(
          onTap: ()
          {
            _incrementCounter("SATER");
            Future.delayed(Duration(seconds: 9), () {
              fetchSMS2("SATER");
            });

          },

          child: Card(
            elevation: 15,child:
          Center(child:
          Text("SATER",style: TextStyle(
              color:  Color(0xff0b7ede),fontSize: 18
          ),)) ,
            color: load3?Colors.green:Colors.white, shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
            //shadowColor: Colors.white,

          ),
        ) ,



        GestureDetector(
          onTap: ()
          {
            _incrementCounter("Inward");
            Future.delayed(Duration(seconds: 9), () {
              fetchSMS4("Inward");
            });

          },

          child: Card(
            elevation: 15,child:
          Center(child:
          Text("Inward",style: TextStyle(
              color:  Color(0xff0b7ede),fontSize: 18
          ),)) ,
            color: load4?Colors.green:Colors.white, shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
            //shadowColor: Colors.white,

          ),
        ) ,




        GestureDetector(
          onTap: ()
          {
            _incrementCounter("GR");
            Future.delayed(Duration(seconds: 9), () {
              fetchSMS("GR");
            });

          },

          child: Card(
            elevation: 15,child:
          Center(child:
          Text("GR",style: TextStyle(
              color:  Color(0xff0b7ede),fontSize: 18
          ),)) ,
            color: load?Colors.green:Colors.white, shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
            //shadowColor: Colors.white,

          ),
        ) ,



        GestureDetector(
          onTap: ()
          {
            _incrementCounter("GL");
            Future.delayed(Duration(seconds: 9), () {
              fetchSMS1("GL");
            });

          },

          child: Card(
            elevation: 15,child:
          Center(child:Text("GL",
              style: TextStyle(fontSize: 18,color: Color(0xff0b7ede))) ,) ,
            color: load1?Colors.green:Colors.white, shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
            //shadowColor: Colors.white,

          ),
        ) ,



      ],

      staggeredTiles: [
        StaggeredTile.extent(1, 50
        ),
        StaggeredTile.extent(1, 50
        ),
        StaggeredTile.extent(1, 50
        ),
        StaggeredTile.extent(1, 50
        ),

      ]
      ,

    );

  }



  void _showToast(BuildContext context,String val) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content:Text(val),
        action: SnackBarAction(label: 'UNDO', onPressed: scaffold.hideCurrentSnackBar),
      ),
    );
  }
  void _incrementCounter(String type) {
    SmsSender sender = SmsSender();
    String address = "+919512842670";

    SmsMessage message = SmsMessage(address, type);
    message.onStateChanged.listen((state) {
      if (state == SmsMessageState.Sent) {
        print("SMS is sent!");
        _showToast(context,"SMS is sent!");
      } else if (state == SmsMessageState.Delivered) {
        print("SMS is delivered!");
        _showToast(context,"SMS is delivered!");
      }
    });
    sender.sendSms(message);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: const FractionalOffset( 0.0, 0.0 ),
                end: const FractionalOffset( 1.0, 0.0 ),
                stops: [0.0, 1.0,],
                tileMode: TileMode.clamp,
                colors: [
                  Color(0xff2EA0F3),
                  //Color(0xff0b7ede),
                  Color(0xff2EA0F2),
                 // Color(0xff0079E2),
                ],
              ),
            ),




//        child: Column(
//          mainAxisAlignment: MainAxisAlignment.center,
//          children: <Widget>[
//          RaisedButton(
//            color: load?Colors.green:Colors.red,
//             // child: load?Text("ON"):Text("OFF"),
//              child: Text("GL"),
//              onPressed: (){
//            _incrementCounter();
//            Future.delayed(Duration(seconds: 9), () {
//            fetchSMS();
//            });
//          })
//          ],
//        ),
          ),

          Column(
            children: [
              SizedBox(height: 80,),
              Center(child: Text("OFFICE CONTROL",style: TextStyle(color: Colors.white,fontSize: 28,fontWeight: FontWeight.bold))),
              SizedBox(height: 40,),
              StaggTiles()




            ],
          )

        ],
      )

    );
  }
}

