import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lupe/config/config.dart';

class HomePage extends StatelessWidget 
{
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) 
  {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Center(
        child: TextButton(
          child: Text(AppEnviroment.apiUrl),
          onPressed: () => context.pop(),
        ),
      ),
    );
  }
}
