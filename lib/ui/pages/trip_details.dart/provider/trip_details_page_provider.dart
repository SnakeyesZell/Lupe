import 'package:flutter/material.dart';
import 'package:lupe/domain/domain.dart';

part 'trip_details_page_state.dart';

class TripDetailsPageProvider extends ChangeNotifier 
{
  late TripDetailsPageState _state;

  TripDetailsPageProvider(
  {
    required Trip trip,
  }): this._state = TripDetailsPageState(trip: trip);

  TripDetailsPageState get state => this._state;
}