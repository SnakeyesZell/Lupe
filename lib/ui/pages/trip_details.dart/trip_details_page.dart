import 'package:flutter/material.dart';
import 'package:lupe/config/config.dart';

import 'package:lupe/domain/domain.dart';
import 'package:lupe/ui/pages/trip_details.dart/widgets/trip_details_title.dart';
import 'package:provider/provider.dart';

import 'widgets/trip_details_appbar.dart';
import 'widgets/trip_details_galerty.dart';
import 'widgets/trip_details_description.dart';
import 'provider/trip_details_page_provider.dart';

class TripDetailsPage extends StatelessWidget 
{
  final Trip trip;

  TripDetailsPage(
  {
    super.key, 
    required this.trip,
  }): assert(trip.runtimeType == Trip);

  @override
  Widget build(BuildContext context) 
  {
    return ChangeNotifierProvider(
      create: (BuildContext context)=> TripDetailsPageProvider(trip: this.trip),
      child: Scaffold(
        body: Container(
          margin: const EdgeInsets.symmetric(horizontal: AppConstrains.viewportMargin),
          child: const CustomScrollView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            physics: BouncingScrollPhysics(),
            slivers: <Widget>
            [
              TripDetailsAppBar(),
              SliverToBoxAdapter(child: SizedBox(height: AppConstrains.spacingScroll)),
              SliverToBoxAdapter(child: TripDetailsTitle()),
              SliverToBoxAdapter(child: TripDetailsDescription()),
              SliverToBoxAdapter(child: SizedBox(height: AppConstrains.spacingScroll)),
              TripDetailsGalery(),
              SliverToBoxAdapter(child: SizedBox(height: kToolbarHeight)),
              SliverToBoxAdapter(child: SizedBox(height: kToolbarHeight)),
            ],
          ),
        ),
      ),
    );
  }
}

