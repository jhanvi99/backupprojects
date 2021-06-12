
import 'package:assessmenttask/CreateAccountPage.dart';
import 'package:flutter/material.dart';
import 'package:assessmenttask/connectwithGoogle.dart';

class Routes
{

  static const String connectWithGogle = 'ConnectWithGoogle';
  static const String d = 'd';

}

Map<String, Widget Function(BuildContext)> routes =

{
  Routes.connectWithGogle: (_) => ConnectWithGoogle(),
 // Routes.d: (_) => d(),

};
