import 'package:flutter/material.dart';
import 'package:lupe/config/config.dart';

import 'widgets/home_appbar.dart';
import 'widgets/home_galery.dart';

class HomePage extends StatelessWidget 
{
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) 
  {
    return const Scaffold(      
      body: _Body(),
    );
  }
}

class _Body extends StatelessWidget 
{
  const _Body();

  @override
  Widget build(BuildContext context) 
  {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: AppConstrains.viewportMargin),
      child:const  CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: <Widget>
        [
          HomeAppBar(),
          SliverToBoxAdapter(child: SizedBox(height: AppConstrains.spacingScroll)),
          HomeGalery(),
          SliverToBoxAdapter(child: SizedBox(height: kTextTabBarHeight)),
          SliverToBoxAdapter(child: SizedBox(height: kTextTabBarHeight)),
        ],
      ),
    );
  }
}
