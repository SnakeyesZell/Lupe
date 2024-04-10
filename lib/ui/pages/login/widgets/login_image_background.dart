import 'package:flutter/material.dart';
import 'package:lupe/config/config.dart';

class LoginImageBackground extends StatelessWidget 
{
  const LoginImageBackground({super.key});

  @override
  Widget build(BuildContext context) 
  {
    return const SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: Image(
        fit: BoxFit.cover,
        image: AssetImage(AppImages.loginBackground)
      ),
    );
  }
}

