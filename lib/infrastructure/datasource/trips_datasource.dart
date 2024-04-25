import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:lupe/domain/domain.dart';
import 'package:lupe/infrastructure/infrastructure.dart';

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
    List<Trip> trips = [];
    List<TripDto> tripsDto = [];
    List<LupeUser> lupeUsers = await this._geLupetUsers();

    try 
    {      
      QuerySnapshot query = await this._firestore.collection('trips')
                                                 .where('creatorId', isEqualTo: lupeUserId)
                                                 .get();
      
      for (QueryDocumentSnapshot trip in query.docs) 
      { 
        tripsDto.add(TripDto.fromJson(trip.data() as Map<String, dynamic>));
      }

      return trips;
    } 
    catch (e) 
    {
      throw Exception();
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
        lupeUsers.add(LupeUser.fromJson(user.data() as Map<String, dynamic>));
      }

      return lupeUsers;
    } 
    catch (e) 
    {
      throw Exception();
    }

  }
}