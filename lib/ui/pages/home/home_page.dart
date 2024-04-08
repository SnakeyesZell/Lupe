import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lupe/config/config.dart';
import 'package:lupe/generated/l10n.dart';

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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>
          [
            TextButton(
              child: Text(AppEnviroment.apiUrl),
              onPressed: () => context.pop(),
            ),
            TextButton(
              child: Text(S.of(context).fisrtLabel),
              onPressed: () => context.pop(),
            ),
          ],
        ),
      ),
    );
  }
}
