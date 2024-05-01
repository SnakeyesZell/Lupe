import 'package:flutter/material.dart';

import 'package:lupe/domain/domain.dart';
import 'package:provider/provider.dart';

import 'widgets/trip_details_appbar.dart';
import 'widgets/trip_details_galerty.dart';
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
          margin: const EdgeInsets.symmetric(horizontal: 10),
          child: const CustomScrollView(
            physics: BouncingScrollPhysics(),
            slivers: <Widget>
            [
              TripDetailsAppBar(),
              SliverToBoxAdapter(child: SizedBox(height: kToolbarHeight)),
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

