import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:lupe/config/config.dart';
import 'package:lupe/generated/l10n.dart';
import 'package:lupe/ui/providers/providers.dart';

import 'home_search_input.dart';

class HomeAppBar extends StatelessWidget
{
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) 
  {
    AuthProvider authProvider = context.watch<AuthProvider>();
    bool isThereLuperUser = (authProvider.state.lupeUser != null);

    return (isThereLuperUser) 
    ? SliverAppBar(
        title: const _NameLabel(),
        titleSpacing: 0,
        actions: const <Widget> [ _UserProfileImage() ],
        bottom: _AppBarBottom(),
      )
    : const SliverToBoxAdapter(child: SizedBox.shrink());
  }
}

class _NameLabel extends StatelessWidget 
{
  const _NameLabel();

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
                text: S.current.homeAppbarTitle,
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
  const _UserProfileImage();

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

class _AppBarBottom extends StatelessWidget implements PreferredSizeWidget
{
  @override
  Widget build(BuildContext context) 
  {
    return PreferredSize(
      preferredSize: preferredSize, 
      child: Column(
        children: <Widget>
        [
          const SizedBox(height: 10),
          Text(
            S.current.homeTitle,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 20),
          const HomeSearchInput(),              
        ],
      ),
    );
  }
  
  @override
  Size get preferredSize => const Size(double.infinity, 170);  
}
