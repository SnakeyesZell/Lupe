import 'dart:isolate';

import 'package:lupe/domain/domain.dart';
import 'package:lupe/infrastructure/infrastructure.dart';

abstract class TripsMapper 
{
  static Future<List<Trip>> getTrips(
  {
    required List<TripDto> tripsDto, 
    required List<LupeUser> lupeUsers,
  }) async
  {
    ReceivePort receibePort = ReceivePort();

    try 
    {
      await Isolate.spawn(
        _buildIsolateTrips, 
        IsolatesArguments(
          sendPort: receibePort.sendPort,
          arguments: <dynamic>
          [
            tripsDto, 
            lupeUsers,
          ]
        ),
      );
      
      await for (final cosa in receibePort)
      {
        return cosa;
      }
      
      return [];
    } 
    catch (e) 
    {
      throw Exception('Error when mapping users: $e');
    }
  }

  static void _buildIsolateTrips(IsolatesArguments arguments) 
  { 
    SendPort sendPort = arguments.sendPort;
    List<TripDto> tripsDto = arguments.arguments[0]; 
    List<LupeUser> lupeUsers = arguments.arguments[1];
    List<Trip> trips = [];

    for (TripDto tripDto in tripsDto) 
    { 
      Trip trip = Trip(
        creatorId: tripDto.creatorId, 
        title: tripDto.title, 
        description: tripDto.description, 
        date: tripDto.date, 
        linkedUsers: _getLinkedUsers(tripDto, lupeUsers), 
        images: tripDto.images,
      );

      trips.add(trip);
    }

    sendPort.send(trips);
  }

  static List<LupeUser> _getLinkedUsers(TripDto tripDto, List<LupeUser> lupeUsers) 
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
