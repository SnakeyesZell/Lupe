
import 'package:flutter_dotenv/flutter_dotenv.dart';
export 'package:flutter_dotenv/flutter_dotenv.dart';

abstract class AppEnviroment 
{
  static const String fileName = '.env';

  static String apiUrl = dotenv.get('API_URL', fallback: '');
}

