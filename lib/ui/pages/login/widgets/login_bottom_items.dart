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
          S.current.loginTitle,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 20),
        Text(
          S.current.loginSubtitle,
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
  const _Buttons();

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
        (Platform.isIOS) 
        ? CustomPrimaryButton(
            withd: withd,
            label: S.current.loginAppleButton,
            color: Colors.black,
            onTap: ()=> this.onTapGetStartedButton(
              context: context, 
              authProvider: authProvider,
              authMethod: AuthMethod.apple,
            ),
            leading: const _ButttonIcon(imagePath: AppIcons.appleWhite),
          )
        : const SizedBox.shrink(),

        const SizedBox(height: 15),

        CustomPrimaryButton(
          withd: withd,
          label: S.current.loginGoogleButton, 
          onTap: ()=> this.onTapGetStartedButton(
            context: context, 
            authProvider: authProvider,
            authMethod: AuthMethod.google,
          ),
          leading: const _ButttonIcon(imagePath: AppIcons.google),
        ),
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
    if(context.mounted) context.go(AppRoutePaths.home);
  }  
}

class _ButttonIcon extends StatelessWidget 
{
  final String imagePath;

  const _ButttonIcon(
  {
    required this.imagePath, 
  });

  @override
  Widget build(BuildContext context) 
  {
    double size = (Platform.isAndroid) ? 24 : 31;

    return Container(
      padding: EdgeInsets.all((Platform.isAndroid) ? 4 : 0),
      margin: EdgeInsets.only(right: (Platform.isAndroid) ? 10 : 5),
      decoration: BoxDecoration(
        color: (Platform.isAndroid) ? Colors.white : null,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Transform.translate(
        offset: Offset(0, (Platform.isAndroid) ? 0 : -2),
        child: Image(
          height: size,
          width: size,
          image: AssetImage(this.imagePath),
        ),
      ),
    );
  }
}

