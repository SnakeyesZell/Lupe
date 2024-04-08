import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MainWraper extends StatefulWidget 
{
  final StatefulNavigationShell navigationShell;
  
  const MainWraper(
  {
    Key? key, 
    required this.navigationShell,
  }) : super(key: key);

  @override
  State<MainWraper> createState() => _MainWraperState();
}

class _MainWraperState extends State<MainWraper> 
{
  late int selectedIndex;

  @override
  void initState() 
  {  
    this.selectedIndex = 0;
    super.initState();
  }

  void goToBranch(int index) 
  {
    this.widget.navigationShell.goBranch(
      index,
      initialLocation: (index == this.widget.navigationShell.currentIndex),
    );
  }

  @override
  Widget build(BuildContext context) 
  {
    return Scaffold(
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: this.widget.navigationShell,
      ),
    );
  }
}

