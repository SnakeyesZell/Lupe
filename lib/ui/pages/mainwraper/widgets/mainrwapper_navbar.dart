import 'dart:io';
import 'package:flutter/material.dart';
import 'package:lupe/config/config.dart';

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
    bool isHomePage = (this.selectedIndex == 0);
    bool isUserPage = (this.selectedIndex == 1);
    double navbarHeight = 64;
    double horizontalMargin = (AppConstrains.viewportMargin + 20);

    return SafeArea(
      child: Container(
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
          vertical: (Platform.isAndroid) ? 5 : 0,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget> 
          [
            _NavbarSimpleButtos(
              onTap: ()=> this.onTapItem(0), 
              imagePath: (isHomePage) ? AppIcons.homeActive : AppIcons.home,
              tabName: 'Home',
            ),
            const _CenterButton(),
            _NavbarSimpleButtos(
              onTap: ()=> this.onTapItem(1), 
              imagePath: (isUserPage) ? AppIcons.userActive : AppIcons.user,
              tabName: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}

class _NavbarSimpleButtos extends StatelessWidget 
{
  final VoidCallback onTap;
  final String imagePath;
  final double? size;
  final String? tabName;

  const _NavbarSimpleButtos(
  {
    required this.onTap, 
    required this.imagePath, 
    this.tabName, 
    this.size = 35, 
  });

  @override
  Widget build(BuildContext context) 
  {
    double padding = 5; 

    return GestureDetector(
      onTap: this.onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: 
        [
          Container(
            padding: EdgeInsets.symmetric(horizontal: padding),
            child: Image(
              height: this.size,
              image: AssetImage(this.imagePath),
            ),
          ),
          (this.tabName != null) 
          ? Text(
              this.tabName!,
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                fontSize: AppFontSizes.bodyExtraSmall,
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
        size: 38,
        imagePath: AppIcons.navigate,
      ),
    );
  }
}
