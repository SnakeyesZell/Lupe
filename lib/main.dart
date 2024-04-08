import 'package:flutter/material.dart';
import 'package:lupe/config/config.dart';

void main() async
{
  await dotenv.load(fileName: AppEnviroment.fileName);
  runApp(MyApp());
}

class MyApp extends StatelessWidget 
{
  @override
  Widget build(BuildContext context) 
  {
    return MaterialApp.router(
      routerConfig: AppRouter.router,
      debugShowCheckedModeBanner: false,
    );
  }
}
