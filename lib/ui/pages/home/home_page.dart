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
    double bottomSpacing = (kToolbarHeight * 1.5);

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: AppConstrains.viewportMargin),
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: <Widget>
        [
          const HomeAppBar(),
          const SliverToBoxAdapter(child: SizedBox(height: AppConstrains.spacingScroll)),
          const HomeGalery(),
          SliverToBoxAdapter(child: SizedBox(height: bottomSpacing)),
        ],
      ),
    );
  }
}
