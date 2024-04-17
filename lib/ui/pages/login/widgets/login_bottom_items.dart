import 'dart:io';
import 'package:flutter/material.dart';
import 'package:lupe/domain/domain.dart';
import 'package:lupe/generated/l10n.dart';
import 'package:go_router/go_router.dart';

import 'package:provider/provider.dart';
import 'package:lupe/config/config.dart';
import 'package:lupe/ui/shared/shared.dart';
import 'package:lupe/ui/providers/providers.dart';

class LoginBottomItems extends StatelessWidget 
{
  const LoginBottomItems({super.key});

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
        const _Buttons(),
      ],
    );
  }
}

class _Buttons extends StatelessWidget 
{
  const _Buttons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) 
  {
    AuthProvider authProvider = context.watch<AuthProvider>();
    Size size = MediaQuery.of(context).size;
    double withd = (size.width * 0.75);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>
      [
        CustomPrimaryButton(
          withd: withd,
          label: S.of(context).loginGoogleButton, 
          onTap: ()=> this.onTapGetStartedButton(
            context: context, 
            authProvider: authProvider,
            authMethod: AuthMethod.google,
          ),
          traling: const _ButttonIcon(
            imagePath: AppIcons.google,
            size: 28,
          ),
        ),

        const SizedBox(height: 15),

        (Platform.isIOS) 
        ? CustomPrimaryButton(
            withd: withd,
            label: S.of(context).loginAppleButton, 
            onTap: ()=> this.onTapGetStartedButton(
              context: context, 
              authProvider: authProvider,
              authMethod: AuthMethod.apple,
            ),
            traling: const _ButttonIcon(
              imagePath: AppIcons.apple,
              size: 35,
            ),
          )
        : const SizedBox.shrink(),
      ],
    );
  }

  Future<void> onTapGetStartedButton(
  {
    required BuildContext context, 
    required AuthProvider authProvider,
    required AuthMethod authMethod,
  }) async
  {
    await authProvider.signIn(authMethod);
    context.go(AppRoutePaths.home);
  }  
}

class _ButttonIcon extends StatelessWidget 
{
  final String imagePath;
  final double size;

  const _ButttonIcon(
  {
    required this.imagePath, 
    required this.size
  });

  @override
  Widget build(BuildContext context) 
  {
    return Container(
      padding: const EdgeInsets.only(left: 5),
      child: Image(
        height: this.size,
        width: this.size,
        image: AssetImage(this.imagePath),
      ),
    );
  }
}

