import 'package:lupe/domain/domain.dart';

abstract class ITripsDataSource 
{
  Future<List<Trip>> getTrips(String lupeUserId);
  Future<Trip> createTrip();
  Future<void> deleteTrip();
  Future<Trip> updateTrip();
}