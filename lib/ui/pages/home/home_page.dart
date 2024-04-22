import 'package:flutter/material.dart';
import 'package:lupe/config/config.dart';
import 'package:lupe/generated/l10n.dart';

import 'widgets/home_appbar.dart';
import 'widgets/home_search_input.dart';

class HomePage extends StatelessWidget 
{
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) 
  {
    return const Scaffold(
      appBar: HomeAppBar(),
      body: _Body(),
    );
  }
}

class _Body extends StatelessWidget 
{
  const _Body({
    super.key,
  });

  @override
  Widget build(BuildContext context) 
  {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: AppConstrains.viewportMargin),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
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
      ),
    );
  }
}
