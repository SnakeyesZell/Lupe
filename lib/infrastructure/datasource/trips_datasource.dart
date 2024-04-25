import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:lupe/domain/domain.dart';
import 'package:lupe/infrastructure/infrastructure.dart';
import 'package:lupe/infrastructure/mappers/trips_mapper.dart';

class TripsDataSource implements ITripsDataSource 
{
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

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
    List<TripDto> tripsDto = [];
    List<LupeUser> lupeUsers = await this._geLupetUsers();

    try 
    {      
      QuerySnapshot query = await this._firestore.collection('trips')
                                                 .where('creatorId', isEqualTo: lupeUserId)
                                                 .get();
      
      for (QueryDocumentSnapshot trip in query.docs) 
      { 
        Map<String, dynamic> data = (trip.data() as Map<String, dynamic>);
        tripsDto.add(TripDto.fromJson(data));
      }

      return await TripsMapper.getTrips(tripsDto: tripsDto, lupeUsers: lupeUsers);
    } 
    catch (e) 
    {
      throw Exception('Error requesting trips: $e');
    }
  }

  @override
  Future<Trip> updateTrip() 
  {
    // TODO: implement updateTrip
    throw UnimplementedError();
  }
  
  Future<List<LupeUser>> _geLupetUsers() async 
  {
    List<LupeUser> lupeUsers = [];
    CollectionReference lupeUsersReference = FirebaseFirestore.instance.collection("lupeUsers");

    try 
    {
      QuerySnapshot query = await lupeUsersReference.get();
      
      for (QueryDocumentSnapshot user in query.docs) 
      { 
        Map<String, dynamic> data = (user.data() as Map<String, dynamic>);
        lupeUsers.add(LupeUser.fromJson(data));
      }

      return lupeUsers;
    } 
    catch (e) 
    {
      throw Exception('Error requesting users');
    }

  }
}
