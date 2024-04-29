import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import 'package:lupe/ui/providers/providers.dart';
import 'package:lupe/infrastructure/infrastructure.dart';

abstract class AppProviders 
{
  static List<SingleChildWidget> providers = <SingleChildWidget>
  [
    ChangeNotifierProvider(create: (BuildContext context)=> AuthProvider(AuthRepository(AuthDataSource()))),
    ChangeNotifierProvider(create: (BuildContext context)=> TripsProvider(TripsRepository(TripsDataSource()))),
  ];
}

