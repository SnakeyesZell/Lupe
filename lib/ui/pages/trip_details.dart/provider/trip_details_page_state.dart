part of 'trip_details_page_provider.dart';

class TripDetailsPageState 
{
  final Trip trip;

  TripDetailsPageState(
  {
    required this.trip,
  });

  TripDetailsPageState copyWith(
  {
    Trip? trip,
  })=> TripDetailsPageState(
    trip: trip?? this.trip,
  );
}

