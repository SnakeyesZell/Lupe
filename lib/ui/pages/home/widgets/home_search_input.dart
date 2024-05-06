import 'package:flutter/material.dart';
import 'package:lupe/config/config.dart';
import 'package:lupe/generated/l10n.dart';

class HomeSearchInput extends StatelessWidget 
{
  const HomeSearchInput({super.key});

  @override
  Widget build(BuildContext context) 
  {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppConstrains.inputPadding,
      ),
      height: kToolbarHeight,
      width: double.infinity,
      decoration: BoxDecoration(
        boxShadow: <BoxShadow> 
        [
          BoxShadow(
            color: Theme.of(context).shadowColor.withOpacity(0.3),
            blurRadius: 20,
            spreadRadius: -15,
            offset: const Offset(0, 20),
          ),
        ],
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(AppConstrains.imageRadius),
      ),
      child: const _Input()
    );
  }
}

class _Input extends StatelessWidget 
{
  const _Input();

  @override
  Widget build(BuildContext context) 
  {
    return TextFormField(
      enabled: false,
      style: Theme.of(context).textTheme.labelSmall!.copyWith(),
      decoration: InputDecoration(
        icon: const Image(
          height: 30,
          image: AssetImage(AppIcons.magnifyingGlass),
        ),
        border: InputBorder.none,
        hintText: S.current.homeSearchInputHing,
        hintStyle: Theme.of(context).textTheme.labelSmall!.copyWith(
          color:  Theme.of(context).hintColor,
        ),
      ),
    );
  }
}

