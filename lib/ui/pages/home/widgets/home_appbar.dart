import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:lupe/config/config.dart';
import 'package:lupe/generated/l10n.dart';
import 'package:lupe/ui/providers/providers.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget
{
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) 
  {
    return PreferredSize(
      preferredSize: this.preferredSize,
      child: Padding(
        padding: const EdgeInsets.only(top: AppConstrains.viewportMargin),
        child: AppBar(
          title: const _NameLabel(),
          titleSpacing: AppConstrains.viewportMargin,
          actions: const <Widget>
          [
            _UserProfileImage(),
            SizedBox(width: AppConstrains.viewportMargin)
          ],
        ),
      ),
    );
  }
  
  @override
  Size get preferredSize => const Size(double.infinity, 80);
}

class _NameLabel extends StatelessWidget 
{
  const _NameLabel({super.key});

  @override
  Widget build(BuildContext context) 
  {
    AuthProvider authProvider = context.watch<AuthProvider>();

    return Row(
      children: <Widget>
      [
        RichText(
          text: TextSpan(
            children: <InlineSpan> 
            [
              TextSpan(
                text: S.of(context).homeAppbarTitle,
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  fontFamily: AppFonts.quicksandRegular,
                ),
              ), 
              TextSpan(
                text: authProvider.getUserName(),
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  fontFamily: AppFonts.quicksandBold,
                ),
              ),
            ]
          ),
        )
      ],
    );
  }
}

class _UserProfileImage extends StatelessWidget 
{
  const _UserProfileImage({super.key});

  @override
  Widget build(BuildContext context) 
  {
    AuthProvider authProvider = context.watch<AuthProvider>();

    return CachedNetworkImage(
      imageUrl: authProvider.state.lupeUser!.imageUrl,
      imageBuilder: (BuildContext context, ImageProvider imageProvider) 
      {
        return Container(
          margin: const EdgeInsets.symmetric(vertical: 2),
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppConstrains.imageRadius),
            color: Theme.of(context).cardColor,
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image(
              image: imageProvider,
              fit: BoxFit.cover,
            ),
          ),
        );
      },
      errorWidget: (BuildContext context, String url, Object error) => const SizedBox.shrink(),
    );
  }
}

