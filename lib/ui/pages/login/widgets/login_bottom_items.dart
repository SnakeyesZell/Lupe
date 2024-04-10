import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lupe/generated/l10n.dart';

import 'package:lupe/config/config.dart';
import 'package:lupe/ui/shared/shared.dart';

class LoginBotrtomItems extends StatelessWidget 
{
  const LoginBotrtomItems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) 
  {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>
      [
        Text(
          S.of(context).loginTitle,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 20),
        Text(
          S.of(context).loginSubtitle,
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
            color: Colors.white,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 50),
        CustomPrimaryButton(
          label: S.of(context).loginBottomButton, 
          onTap: ()=> this.onTapGetStartedButton(context),
        ),
      ],
    );
  }
  
  void onTapGetStartedButton(BuildContext context) 
  {
    context.go(AppRoutePaths.home);
  }
}
