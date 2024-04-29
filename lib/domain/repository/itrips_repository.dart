import 'package:lupe/domain/domain.dart';

abstract class ITripsRepository 
{
  Future<List<Trip>> getTrips(String lupeUserId);
  Future<Trip> createTrip();
  Future<void> deleteTrip();
  Future<Trip> updateTrip();
}
