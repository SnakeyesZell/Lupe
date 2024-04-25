import 'package:flutter/material.dart';
import 'package:lupe/domain/domain.dart';

class TripsProvider extends ChangeNotifier 
{
  final ITripsRepository repository;

  TripsProvider(this.repository);

  Future<void> getTrips() async 
  {
    await this.repository.getTrips('a50ikKDqPqVZGPNogt9WKqZAWTh2');
  }
}

