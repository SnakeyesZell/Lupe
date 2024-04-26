import 'package:flutter/material.dart';
import 'package:lupe/domain/domain.dart';

part 'trips_state.dart';

class TripsProvider extends ChangeNotifier 
{
  late ITripsRepository repository;
  late TripsState _state;

  TripsProvider(this.repository) : this._state = TripsState();

  TripsState get state => this._state;

  Future<void> getTrips(String lupeUserId) async 
  {
    List<Trip> trips = await this.repository.getTrips(lupeUserId);

    this._state = this.state.copyWith(
      trips: trips,
      areTripsLoaded: true,
    );

    notifyListeners();
  }
}

