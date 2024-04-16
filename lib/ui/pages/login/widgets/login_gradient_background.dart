import 'package:flutter/material.dart';

class LoginGradientBackground extends StatelessWidget 
{
  const LoginGradientBackground({super.key});

  @override
  Widget build(BuildContext context) 
  {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: const <double>
          [
            0.4,
            0.5,
            0.9,
          ],
          colors: <Color> 
          [
            Colors.black.withOpacity(0.1),
            Colors.black.withOpacity(0.3),
            Colors.black.withOpacity(0.9), 
          ]
        ),
      ),
    );
  }
}
