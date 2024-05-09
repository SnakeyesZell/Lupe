import 'package:flutter/material.dart';
import 'package:lupe/config/config.dart';

import 'package:lupe/domain/domain.dart';
import 'package:provider/provider.dart';

import 'provider/trip_details_page_provider.dart';

import 'widgets/trip_details_title.dart';
import 'widgets/trip_details_appbar.dart';
import 'widgets/trip_details_users_tab.dart';
import 'widgets/trip_details_galery_tab.dart';
import 'widgets/trip_details_tabs_buttons.dart';

class TripDetailsPage extends StatefulWidget 
{
  final Trip trip;

  TripDetailsPage(
  {
    super.key, 
    required this.trip,
  }): assert(trip.runtimeType == Trip);

  @override
  State<TripDetailsPage> createState() => _TripDetailsPageState();
}

class _TripDetailsPageState extends State<TripDetailsPage> with SingleTickerProviderStateMixin
{
  late TabController tabController;

  @override
  void initState() 
  {
		this.tabController = TabController(
			length: 3,
			initialIndex: 0, 
			vsync: this,
		);
    super.initState();
  }

	@override void dispose() 
	{
		this.tabController.dispose();
		super.dispose();
	}	  

  @override
  Widget build(BuildContext context) 
  {
    return ChangeNotifierProvider(
      create: (BuildContext context)=> TripDetailsPageProvider(trip: this.widget.trip),
      child: Scaffold(
        body: NestedScrollView(
          physics: const BouncingScrollPhysics(),
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) 
          {
            return <Widget>
            [
              const TripDetailsAppBar(),
              const SliverToBoxAdapter(child: SizedBox(height: AppConstrains.spacingScroll)),
              const SliverToBoxAdapter(child: TripDetailsTitle()),
              SliverToBoxAdapter(child: TripDetailsTabButtons(tabController: this.tabController)),
              const SliverToBoxAdapter(child: SizedBox(height: AppConstrains.spacingScroll)),
            ];
          },
          body: TabBarView(		
            controller: this.tabController,						
            physics: const NeverScrollableScrollPhysics(),
            children: const <Widget>
            [
              TripDetailsGaleryTab(),
              TripDetailsUsersTab(),
              TripDetailsUsersTab(),
            ]
          ),
        ),
      ),
    );
  }
}

