import 'package:lupe/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';

import 'generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:lupe/config/config.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() async
{
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(fileName: AppEnviroment.fileName);
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget 
{
  const MyApp({super.key});

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
