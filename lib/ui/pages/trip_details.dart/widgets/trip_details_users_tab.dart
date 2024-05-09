import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:lupe/generated/l10n.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:lupe/config/config.dart';
import 'package:lupe/ui/shared/shared.dart';

import '../provider/trip_details_page_provider.dart';

class TripDetailsUsersTab extends StatelessWidget 
{
  const TripDetailsUsersTab({super.key});

  @override
  Widget build(BuildContext context) 
  {    
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: AppConstrains.viewportMargin),
      child: const CustomScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        physics: BouncingScrollPhysics(),
        slivers: <Widget>
        [          
          SliverToBoxAdapter(child: SizedBox(height: AppConstrains.spacingScroll)),
          SliverToBoxAdapter(child: _AddUserTile()),
          _UsersList(),
        ],
      ),
    );
  }
}

class _UsersList extends StatelessWidget 
{
  const _UsersList();

  @override
  Widget build(BuildContext context) 
  {
    TripDetailsPageProvider pageProvider = context.watch<TripDetailsPageProvider>();

    return SliverList.builder(
      
      itemCount: pageProvider.state.trip.linkedUsers.length,
      itemBuilder: (BuildContext context, int index) 
      {
        String email = pageProvider.state.trip.linkedUsers[index].email;
        String userName = pageProvider.state.trip.linkedUsers[index].name;
        String imageUrl = pageProvider.state.trip.linkedUsers[index].imageUrl;
        bool isLast = (index == (pageProvider.state.trip.linkedUsers.length - 1));
        
        return Container(
          padding: const EdgeInsets.symmetric(
            horizontal: AppConstrains.viewportMargin,
          ),
          decoration: BoxDecoration(
            color: Theme.of(context).shadowColor.withOpacity(0.15),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular((isLast) ? AppConstrains.imageRadius : 0),
              bottomRight: Radius.circular((isLast) ? AppConstrains.imageRadius : 0),
            ),
          ),
          child: ListTile(
            contentPadding: EdgeInsets.zero,
            title: Text(
              userName,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              email,
              style: Theme.of(context).textTheme.bodySmall,
            ),
            leading: _LeadingTale(imageUrl: imageUrl),
            trailing: const _TrallingTale(),
          ),
        );
      },
    );
  }
}

class _LeadingTale extends StatelessWidget 
{
  final String imageUrl;

  const _LeadingTale(
  {
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) 
  {
    double size = 40;

    return ClipRRect(
      borderRadius: BorderRadius.circular(100),
      child: CachedNetworkImage(
        width: size,
        height: size,
        fit: BoxFit.cover,
        imageUrl: this.imageUrl,
        placeholder: (BuildContext context, String url)=> const ImagePlaceHolder(),
        errorWidget: (BuildContext context, String url, Object error)=> const ImagePlaceHolder(),
      ),
    );
  }
}

class _TrallingTale extends StatelessWidget 
{
  const _TrallingTale();

  @override
  Widget build(BuildContext context) 
  {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>
      [
        Text(
          S.current.tripDetailsAdmin,
          style: Theme.of(context).textTheme.bodySmall,
        ),
        Icon(
          Icons.chevron_right,
          color: Theme.of(context).shadowColor,
        ),
      ],
    );
  }
}

class _AddUserTile extends StatelessWidget 
{
  const _AddUserTile();

  @override
  Widget build(BuildContext context) 
  {
    return Container(
      padding: const EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
        color: Theme.of(context).shadowColor.withOpacity(0.15),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(AppConstrains.imageRadius),
          topRight: Radius.circular(AppConstrains.imageRadius),
        ),
      ),
      child: ListTile(
        title: Text(
          S.current.tripDetailsAddUser ,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
            fontWeight: FontWeight.bold,
            color: Theme.of(context).primaryColor,
          ),
        ),
        leading: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white.withOpacity(0.5)
          ),
          child: Icon(
            Icons.add,
            color: Theme.of(context).primaryColor,
          ),
        ),
      ),
    );
  }
}


