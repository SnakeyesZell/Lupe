import 'dart:isolate';

import 'package:lupe/domain/domain.dart';
import 'package:lupe/infrastructure/infrastructure.dart';

abstract class TripsMapper 
{
  Future<List<Trip>> getTrips(
  {
    required List<TripDto> tripsDto, 
    required List<LupeUser> lupeUsers,
  }) async
  {
    List<Trip> trips = [];

    ReceivePort receivePort = ReceivePort();
    Isolate isolate = await Isolate.spawn(
      this._buildIsolateTrips, 
      [
        receivePort.sendPort, 
        tripsDto, 
        lupeUsers,
      ]
    );
    
    receivePort.listen((message) 
    { 
      trips = message;
    });

    isolate.kill();

    return trips;
  }

  void _buildIsolateTrips(List<dynamic> arguments) 
  {    
    SendPort sendPort = arguments[0];
    List<TripDto> tripsDto = arguments[1]; 
    List<LupeUser> lupeUsers = arguments[1];
    List<Trip> trips = [];

    for (TripDto tripDto in tripsDto) 
    { 
      Trip trip = Trip(
        creatorId: tripDto.creatorId, 
        title: tripDto.title, 
        description: tripDto.description, 
        date: tripDto.date, 
        linkedUsers: this._getLinkedUsers(tripDto, lupeUsers), 
        images: tripDto.images,
      );

      trips.add(trip);
    }

    sendPort.send(trips);
  }

  List<LupeUser> _getLinkedUsers(TripDto tripDto, List<LupeUser> lupeUsers) 
  {
    List<LupeUser> linkendUsers = [];

    for (String userEmail in tripDto.linkedUsers) 
    { 
      bool isThereLinkedUser = lupeUsers.any((LupeUser user) => userEmail == user.email);

      if (isThereLinkedUser) 
      {
        LupeUser user = lupeUsers.firstWhere((LupeUser user) => userEmail == user.email);
        linkendUsers.add(user);
      }
    }

    return linkendUsers;
  }
}

