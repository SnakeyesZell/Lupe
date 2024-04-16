import 'package:flutter/material.dart';
import 'package:lupe/generated/l10n.dart';
import 'package:go_router/go_router.dart';

import 'package:provider/provider.dart';
import 'package:lupe/config/config.dart';
import 'package:lupe/ui/shared/shared.dart';
import 'package:lupe/ui/providers/providers.dart';

class LoginBotrtomItems extends StatelessWidget 
{
  const LoginBotrtomItems({super.key});

  @override
  Widget build(BuildContext context) 
  {
    AuthProvider authProvider = context.watch<AuthProvider>();

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
          onTap: ()=> this.onTapGetStartedButton(
            context: context, 
            authProvider: authProvider,
          ),
        ),
      ],
    );
  }
  
  Future<void> onTapGetStartedButton(
  {
    required  BuildContext context, 
    required  AuthProvider authProvider,
  }) async
  {
    await authProvider.signIn();
    context.go(AppRoutePaths.home);
  }
}
