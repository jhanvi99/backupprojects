import 'package:flutter/material.dart';

class CreateAccont extends StatefulWidget {
  @override
  _CreateAccontState createState() => _CreateAccontState();
}

class _CreateAccontState extends State<CreateAccont> {

  var _currencies = [
    "Food",
    "Transport",
    "Personal",
    "Shopping",
    "Medical",
    "Rent",
    "Movie",
    "Salary"
  ];

  var _currentSelectedValue;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                Row(children: [
                  const SizedBox(width: 20),
                  Image.asset('assets/Back.png',width: 50,height: 50,),
                  const SizedBox(width: 20),
                  Text("Create Account",style: TextStyle(fontSize: 20),),
                ]),
                const SizedBox(height: 20),
                Row(
                  children: [
                    const SizedBox(width: 20),
                    Text("Personal details",style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold)),
                    SizedBox(width: 40),
                  ],
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: new Row(
                    children: <Widget>[
                      new Flexible(
                        child: Padding(
                          padding: const EdgeInsets.only(left:8.0),
                          child: TextField(
                            decoration: InputDecoration(
                              focusedBorder:OutlineInputBorder(
                                borderSide:  BorderSide(color: Colors.grey.withOpacity(0.5), width: 2.0),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              contentPadding: EdgeInsets.symmetric(vertical: 20,horizontal: 10),
                              border: OutlineInputBorder(

                                borderRadius:  BorderRadius.all(

                                   Radius.circular(10.0),
                              )),
                              labelText: 'First Name',
                              labelStyle: TextStyle(
                                color: Colors.grey
                              ),
                              hintText: 'First Name',
                              hintStyle:  TextStyle(
                                  color: Colors.grey
                              )
                            ),
                            autofocus: false,
                          ),
                        )
                      ),

                      SizedBox(width: 20,),
                      new Flexible(
                          child:    Padding(
                            padding: const EdgeInsets.only(left:8.0),
                            child: TextField(
                              decoration: InputDecoration(
                                  focusedBorder:OutlineInputBorder(
                                    borderSide:  BorderSide(color: Colors.grey.withOpacity(0.5), width: 2.0),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                contentPadding: EdgeInsets.symmetric(vertical: 20,horizontal: 10),
                                border: OutlineInputBorder(
                                  borderRadius: const BorderRadius.all(
                                    const Radius.circular(10.0))
                                ),
                                labelText: 'Last Name ',
                                labelStyle: TextStyle(
                                    color: Colors.grey
                                ),
                                hintText: 'Last Name ',
                                hintStyle:  TextStyle(
                                    color: Colors.grey
                                )
                              ),
                              autofocus: false,
                            ),
                          )
                      ),

                    ],
                  ),
                ),


                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: new Row(
                    children: <Widget>[
                      new Flexible(
                          child: Padding(
                            padding: const EdgeInsets.only(left:8.0),
                            child: TextField(
                              decoration: InputDecoration(
                                prefixText: ' +91 ',
                                  focusedBorder:OutlineInputBorder(
                                    borderSide:  BorderSide(color: Colors.grey.withOpacity(0.5), width: 2.0),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  contentPadding: EdgeInsets.symmetric(vertical: 20,horizontal: 10),
                                  border: OutlineInputBorder(borderRadius:BorderRadius.all(Radius.circular(10.0))),
                                  labelText: 'Phone Number',
                                  labelStyle: TextStyle(
                                      color: Colors.grey
                                  ),
                                  hintText: 'Phone Number',
                                  hintStyle:  TextStyle(
                                      color: Colors.grey
                                  )
                              ),
                              autofocus: false,
                            ),
                          )
                      ),
                    ],
                  ),
                ),



                Row(
                  children: [
                    const SizedBox(width: 20),
                    Text("Date of birth",style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold)),
                    SizedBox(width: 40),
                  ],
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: new Row(
                    children: <Widget>[

                       Flexible(
                          child: Padding(
                            padding: const EdgeInsets.only(left:8.0),
                            child: TextField(
                              decoration: InputDecoration(
                                  focusedBorder:OutlineInputBorder(
                                    borderSide:  BorderSide(color: Colors.grey.withOpacity(0.5), width: 2.0),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  contentPadding: EdgeInsets.symmetric(vertical: 20,horizontal: 10),
                                  border: OutlineInputBorder(borderRadius:BorderRadius.all(Radius.circular(10.0))),
                                  labelText: 'Month',
                                  labelStyle: TextStyle(
                                      color: Colors.grey
                                  ),
                                  hintText: 'Month',
                                  hintStyle:  TextStyle(
                                      color: Colors.grey
                                  )
                              ),
                              autofocus: false,
                            ),
                          )
                      ),



                      Flexible(
                          child: Padding(
                            padding: const EdgeInsets.only(left:8.0),
                            child: TextField(
                              decoration: InputDecoration(
                                  focusedBorder:OutlineInputBorder(
                                    borderSide:  BorderSide(color: Colors.grey.withOpacity(0.5), width: 2.0),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  contentPadding: EdgeInsets.symmetric(vertical: 20,horizontal: 10),
                                  border: OutlineInputBorder(borderRadius:BorderRadius.all(Radius.circular(10.0))),
                                  labelText: 'Day',
                                  labelStyle: TextStyle(
                                      color: Colors.grey
                                  ),
                                  hintText: 'Day',
                                  hintStyle:  TextStyle(
                                      color: Colors.grey
                                  )
                              ),
                              autofocus: false,
                            ),
                          )
                      ),


                      Flexible(
                          child: Padding(
                            padding: const EdgeInsets.only(left:8.0),
                            child: FormField<String>(
                              builder: (FormFieldState<String> state) {
                                return InputDecorator(

                                  decoration: InputDecoration(
                                      contentPadding: EdgeInsets.symmetric(vertical: 20,horizontal: 10),
                                        labelStyle: TextStyle(
                                      color: Colors.grey
                                  ),
                                      errorStyle: TextStyle(color: Colors.redAccent, fontSize: 16.0),
                                      hintText: 'Year',
                                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0))),
                                 // isEmpty: _currentSelectedValue == '',
                                  child: DropdownButtonHideUnderline(
                                    child: DropdownButton<String>(
                                      value: _currentSelectedValue,
                                      isDense: true,
                                      onChanged: (String newValue) {
                                        setState(() {
                                          _currentSelectedValue = newValue;
                                          state.didChange(newValue);
                                        });
                                      },
                                      items: _currencies.map((String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(value),
                                        );
                                      }).toList(),
                                    ),
                                  ),
                                );
                              },
                            )

                          )
                      ),


                    ],
                  ),
                ),






                Row(
                  children: [
                    const SizedBox(width: 20),
                    Text("Religion",style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold)),
                    SizedBox(width: 40),
                  ],
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: new Row(
                    children: <Widget>[


                      Flexible(
                          child: Padding(
                              padding: const EdgeInsets.only(left:8.0),
                              child: FormField<String>(
                                builder: (FormFieldState<String> state) {
                                  return InputDecorator(

                                    decoration: InputDecoration(
                                        contentPadding: EdgeInsets.symmetric(vertical: 20,horizontal: 10),
                                        labelStyle: TextStyle(
                                            color: Colors.grey
                                        ),
                                        errorStyle: TextStyle(color: Colors.redAccent, fontSize: 16.0),
                                        hintText: 'Select your religion',
                                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0))),
                                    // isEmpty: _currentSelectedValue == '',
                                    child: DropdownButtonHideUnderline(
                                      child: DropdownButton<String>(
                                        value: _currentSelectedValue,
                                        isDense: true,
                                        onChanged: (String newValue) {
                                          setState(() {
                                            _currentSelectedValue = newValue;
                                            state.didChange(newValue);
                                          });
                                        },
                                        items: _currencies.map((String value) {
                                          return DropdownMenuItem<String>(
                                            value: value,
                                            child: Text(value),
                                          );
                                        }).toList(),
                                      ),
                                    ),
                                  );
                                }
                              )
                          )
                      )
                    ]
                  )
                ),


                Row(
                  children: [
                    const SizedBox(width: 20),
                    Text("Income",style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold)),
                    SizedBox(width: 40),
                  ],
                ),

                Row(
                  children: [
                    const SizedBox(width: 20),
                    Text("Enter your yearly income",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w400)),
                    SizedBox(width: 40),
                  ],
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: new Row(
                    children: <Widget>[
                      new Flexible(
                          child: Padding(
                            padding: const EdgeInsets.only(left:8.0),
                            child: TextField(
                              decoration: InputDecoration(
                                  focusedBorder:OutlineInputBorder(
                                    borderSide:  BorderSide(color: Colors.grey.withOpacity(0.5), width: 2.0),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  contentPadding: EdgeInsets.symmetric(vertical: 20,horizontal: 10),
                                  border: OutlineInputBorder(borderRadius:BorderRadius.all(Radius.circular(10.0))),
                                  labelStyle: TextStyle(
                                      color: Colors.grey
                                  ),
                                  hintText: 'eg. 250,000',
                                  hintStyle:  TextStyle(
                                      color: Colors.grey
                                  )
                              ),
                              autofocus: false,
                            ),
                          )
                      ),

                    ],
                  ),
                ),

              ],
            ),
          ),
        ),
      )
    );
  }
}
