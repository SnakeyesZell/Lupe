part of 'trips_porovider.dart';

class TripsState 
{
  final List<Trip> trips;
  final bool areTripsLoaded;

  TripsState(
  {
    this.areTripsLoaded = false,
    List<Trip>? trips,
  }) : this.trips = trips ?? [];

  TripsState copyWith(
  {
    bool? areTripsLoaded,
    List<Trip>? trips,
  })=> TripsState(
    areTripsLoaded: areTripsLoaded ?? this.areTripsLoaded,
    trips: trips ?? trips,
  );
}