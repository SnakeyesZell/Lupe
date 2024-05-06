import 'package:flutter/material.dart';

import 'package:lupe/config/config.dart';

import 'trip_details_galerty.dart';
import 'trip_details_description.dart';

class TripDetailsGaleryTab extends StatelessWidget 
{
  const TripDetailsGaleryTab({super.key});

  @override
  Widget build(BuildContext context) 
  {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: AppConstrains.viewportMargin),
      child: const CustomScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        physics: BouncingScrollPhysics(),
        slivers: <Widget>
        [
          SliverToBoxAdapter(child: TripDetailsDescription()),
          SliverToBoxAdapter(child: SizedBox(height: AppConstrains.spacingScroll)),
          TripDetailsGalery(),
          SliverToBoxAdapter(child: SizedBox(height: kToolbarHeight)),
          SliverToBoxAdapter(child: SizedBox(height: kToolbarHeight)),
        ],
      ),
    );
  }
}

