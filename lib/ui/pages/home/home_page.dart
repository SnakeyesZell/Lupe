import 'package:flutter/material.dart';

import 'package:lupe/config/config.dart';
import 'package:lupe/generated/l10n.dart';

import 'widgets/home_appbar.dart';

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
              S.of(context).homeTitle,
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ],
        ),
      ),
    );
  }
}
