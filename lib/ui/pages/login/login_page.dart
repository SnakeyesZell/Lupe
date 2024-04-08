import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lupe/config/config.dart';

class LoginPage extends StatelessWidget 
{
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) 
  {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Center(
        child: TextButton(
          child: const Text('Navigate to Home'),
          onPressed: () => context.go(AppRoutePaths.home),
        ),
      ),
    );
  }
}
