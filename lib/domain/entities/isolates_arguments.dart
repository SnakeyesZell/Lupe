import 'dart:isolate';

class IsolatesArguments 
{
  final SendPort sendPort;
  final List<dynamic> arguments;

  IsolatesArguments(
  {
    required this.sendPort, 
    List<dynamic>? arguments,
  }) : this.arguments = arguments ?? [];
}

