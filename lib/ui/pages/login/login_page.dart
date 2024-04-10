import 'package:flutter/material.dart';

import 'widgets/login_bottom_items.dart';
import 'widgets/login_image_background.dart';
import 'widgets/login_gradient_background.dart';

class LoginPage extends StatelessWidget 
{
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) 
  {
    return const Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>
        [
          LoginImageBackground(),
          LoginGradientBackground(),
          Align(
            alignment: Alignment(0, 0.9),
            child: LoginBotrtomItems(),
          )
        ],
      ), 
    );
  }
}

