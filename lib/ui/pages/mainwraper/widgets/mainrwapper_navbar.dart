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

    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: const BorderRadius.all(Radius.circular(AppConstrains.navbarRadius))
      ),
      height: navbarHeight,
      margin: const EdgeInsets.symmetric(
        horizontal: AppConstrains.viewportMargin,
        vertical: 5,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.min,        
        children: <Widget> 
        [
          _NavbarSimpleButtos(
            onTap: ()=> this.onTapItem(0), 
            imagePath: (isHomePage) ? AppIcons.homeActive : AppIcons.home,
          ),
          const _CenterButton(),
          _NavbarSimpleButtos(
            onTap: ()=> this.onTapItem(1), 
            imagePath: (isUserPage) ? AppIcons.userActive : AppIcons.user,
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
  final double? size;

  const _NavbarSimpleButtos(
  {
    required this.onTap, 
    required this.imagePath, 
    this.size = 35, 
  });

  @override
  Widget build(BuildContext context) 
  {
    double padding = 5; 

    return GestureDetector(
      onTap: this.onTap,
      child: Container(
        padding: EdgeInsets.all(padding),
        child: Image(
          height: this.size,
          image: AssetImage(this.imagePath),
        ),
      ),
    );
  }
}

class _CenterButton extends StatelessWidget 
{
  const _CenterButton({super.key});

  @override
  Widget build(BuildContext context) 
  {
    return Container(      
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
