import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import 'package:lupe/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/single_child_widget.dart';

import 'generated/l10n.dart';
import 'ui/providers/providers.dart';
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

class MyApp extends StatefulWidget 
{
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> 
{
  late GoRouter router;
  late List<SingleChildWidget> providers;

  @override
  void initState() 
  {
    this.router = AppRouter.router;
    this.providers = AppProviders.providers;

    super.initState();
  }

  @override
  Widget build(BuildContext context) 
  {
    return MultiProvider(
      providers: AppProviders.providers,
      child: MaterialApp.router(
        theme: AppTheme.lightTheme,
        routerConfig: this.router,
        debugShowCheckedModeBanner: false,
        supportedLocales: S.delegate.supportedLocales,
        localizationsDelegates: const <LocalizationsDelegate>
        [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          S.delegate,
        ],
      ),
    );
  }
}
