import 'package:flutter/material.dart';

import 'package:lupe/domain/domain.dart';
import 'package:provider/provider.dart';

import 'provider/trip_details_page_provider.dart';
import 'widgets/trip_details_appbar.dart';

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
      child: const Scaffold(
        body: CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: <Widget>
          [
            TripDetailsAppBar(),
          ],
        ),
      ),
    );
  }
}

