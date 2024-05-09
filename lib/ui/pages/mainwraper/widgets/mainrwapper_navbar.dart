import 'dart:io';
import 'package:flutter/material.dart';
import 'package:lupe/generated/l10n.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:lupe/config/config.dart';
import 'package:lupe/domain/domain.dart';

class MainRwapperNavbar extends StatelessWidget 
{
  final void Function(int index) onTapItem;
  final int selectedIndex;

  const MainRwapperNavbar(
  {
    super.key, 
    required this.onTapItem, 
    required this.selectedIndex,
  });

  @override
  Widget build(BuildContext context) 
  {     
    double navbarHeight = 64;
    double horizontalMargin = (AppConstrains.viewportMargin + 20);

    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: const BorderRadius.all(Radius.circular(AppConstrains.navbarRadius)),
        boxShadow: <BoxShadow> 
        [
          BoxShadow(
            color: Theme.of(context).shadowColor.withOpacity(0.1),
            blurRadius: 5,
            spreadRadius: 5,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      height: navbarHeight,
      margin: EdgeInsets.symmetric(
        horizontal: horizontalMargin,
        vertical: (Platform.isAndroid) ? 5 : 20,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget> 
        [
          _NavbarSimpleButtos(
            onTap: ()=> this.onTapItem(0), 
            imagePath: AppIcons.home2,
            tabName: S.current.homeTab1Label,
            isActive: (this.selectedIndex == NavBarTabs.home.tabIndex),
          ),
          const _CenterButton(),
          _NavbarSimpleButtos(
            onTap: ()=> this.onTapItem(1), 
            imagePath: AppIcons.user,
            tabName: S.current.homeTab3Label,
            isActive: (this.selectedIndex == NavBarTabs.profile.tabIndex),
          ),
        ],
      ),
    );
  }
}

class _NavbarSimpleButtos extends StatelessWidget 
{
  final VoidCallback onTap;
  final String imagePath;  
  final String? tabName;
  final bool isActive;
  final bool isFilled;

  const _NavbarSimpleButtos(
  {
    required this.onTap, 
    required this.imagePath, 
    required this.isActive, 
    this.isFilled = false, 
    this.tabName, 
  });

  @override
  Widget build(BuildContext context) 
  {
    double iconSize = 35;
    double padding = 5;
    Color activeColor = (this.isActive) 
    ? Theme.of(context).primaryColor 
    : (this.isFilled) 
      ? Colors.white 
      : Theme.of(context).shadowColor;

    return GestureDetector(
      onTap: this.onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: 
        [
          Container(
            padding: EdgeInsets.symmetric(horizontal: padding),
            child: SvgPicture.asset(
              height: iconSize,
              this.imagePath,
              colorFilter: ColorFilter.mode(activeColor, BlendMode.srcIn),
            ),
          ),
          (this.tabName != null) 
          ? Text(
              this.tabName!,
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                fontSize: AppFontSizes.bodyExtraSmall,
                color: activeColor,
              ),
            )
          : const SizedBox.shrink(),
        ],
      ),
    );
  }
}

class _CenterButton extends StatelessWidget 
{
  const _CenterButton();

  @override
  Widget build(BuildContext context) 
  {
    return Container(  
      padding: const EdgeInsets.symmetric(vertical: 5),    
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(15)
      ),
      child: _NavbarSimpleButtos(
        onTap: (){}, 
        imagePath: AppIcons.navigate,
        isActive: false,
        isFilled: true,
      ),
    );
  }
}
