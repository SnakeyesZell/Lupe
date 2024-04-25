import 'package:lupe/domain/domain.dart';

class TripsRepository implements ITripsRepository 
{
  final ITripsDataSource dataSource;

  TripsRepository(this.dataSource);

  @override
  Future<Trip> createTrip() 
  {
    // TODO: implement createTrip
    throw UnimplementedError();
  }

  @override
  Future<void> deleteTrip() 
  {
    // TODO: implement deleteTrip
    throw UnimplementedError();
  }

  @override
  Future<List<Trip>> getTrips(String lupeUserId) async
  {
    return await this.dataSource.getTrips(lupeUserId);
  }

  @override
  Future<Trip> updateTrip() 
  {
    // TODO: implement updateTrip
    throw UnimplementedError();
  }
  
}