import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lupe/config/config.dart';
import 'package:lupe/generated/l10n.dart';

import 'package:lupe/ui/shared/shared.dart';
import 'widgets/login_image_background.dart';
import 'widgets/login_gradient_background.dart';

class LoginPage extends StatelessWidget 
{
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) 
  {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>
        [
          const LoginImageBackground(),
          const LoginGradientBackground(),
          Align(
            alignment: const Alignment(0, 0.6),
            child: CustomPrimaryButton(
              label: S.of(context).loginBottomButton, 
              onTap: ()=> this.onTapGetStartedButton(context),
            ),
          )
        ],
      ), 
    );
  }

  void onTapGetStartedButton(BuildContext context) 
  {
    context.go(AppRoutePaths.home);
  }
}
