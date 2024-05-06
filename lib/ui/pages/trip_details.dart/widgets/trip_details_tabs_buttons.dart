import 'package:flutter/material.dart';
import 'package:lupe/config/config.dart';

class TripDetailsTabButtons extends StatelessWidget 
{
  final TabController tabController;

  const TripDetailsTabButtons(
  {
    super.key, 
    required this.tabController,
  });

  @override
  Widget build(BuildContext context) 
  {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: AppConstrains.viewportMargin),
      child: const Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>
        [
          _ButtonTab(label: 'Galery'),
          SizedBox(width: AppConstrains.spacingScroll),
          _ButtonTab(label: 'Map'),
        ],
      ),
    );
  }
}

class _ButtonTab extends StatelessWidget 
{
  final String label;

  const _ButtonTab(
    {
      required this.label,
    });

  @override
  Widget build(BuildContext context) 
  {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: Theme.of(context).shadowColor.withOpacity(0.15),
        borderRadius: BorderRadius.circular(AppConstrains.imageRadius),
      ),
      child: Text(this.label),
    );
  }
}


