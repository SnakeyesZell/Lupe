import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:lupe/ui/shared/shared.dart';

import 'package:lupe/config/config.dart';

import 'package:lupe/ui/providers/providers.dart';

import 'home_galery_item.dart';

class HomeGalery extends StatelessWidget 
{
  const HomeGalery({super.key});

  @override
  Widget build(BuildContext context) 
  {
    AuthProvider authProvider = context.watch<AuthProvider>();
    bool isLupeUserNotNull = authProvider.state.lupeUser != null;

    return (isLupeUserNotNull) 
    ? const _Galery()
    : const SliverToBoxAdapter(child: CircularProgressIndicator());
  }
}

class _Galery extends StatefulWidget 
{
  const _Galery();

  @override
  State<_Galery> createState() => _GaleryState();
}

class _GaleryState extends State<_Galery> 
{
  @override
  void initState() 
  {
    this.getTrips();
    super.initState();
  }

  @override
  Widget build(BuildContext context) 
  {
    double spacing = 5;
    TripsProvider tripsProvider = context.watch<TripsProvider>();
    bool isTripsLoaded = tripsProvider.state.areTripsLoaded;

    return SliverGrid.builder(
      itemCount: (!isTripsLoaded) 
      ? 10
      : tripsProvider.state.trips.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.7,
        mainAxisSpacing: spacing,
        crossAxisSpacing: spacing,          
      ), 
      itemBuilder: (BuildContext context, int index)
      {
        return (isTripsLoaded) 
        ? HomeGaleryItem(trip: tripsProvider.state.trips[index])
        : ClipRRect(
            borderRadius: BorderRadius.circular(AppConstrains.imageRadius),
            child: const ImagePlaceHolder()
          );
      },
    );

    //TODO: Create an empty Widget 
  }

  Future<void> getTrips() async
  {    
    String lupeUserId = context.read<AuthProvider>().state.lupeUser!.id;
    await context.read<TripsProvider>().getTrips(lupeUserId);    
  }
}

