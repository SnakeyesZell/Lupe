import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:lupe/config/config.dart';

import 'generated/l10n.dart';

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
      supportedLocales: S.delegate.supportedLocales,
      localizationsDelegates: const <LocalizationsDelegate>
      [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        S.delegate,
      ],
    );
  }
}
