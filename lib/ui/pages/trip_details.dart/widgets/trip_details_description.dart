import 'package:flutter/material.dart';
import 'package:lupe/generated/l10n.dart';

import 'package:provider/provider.dart';
import '../provider/trip_details_page_provider.dart';

class TripDetailsDescription extends StatefulWidget 
{
  const TripDetailsDescription({super.key});

  @override
  State<TripDetailsDescription> createState() => _TripDetailsDescriptionState();
}

class _TripDetailsDescriptionState extends State<TripDetailsDescription> 
{
  late bool seeMore;

  @override
  void initState() 
  {
    this.seeMore = false;  
    super.initState();
  }

  @override
  Widget build(BuildContext context) 
  {
    TripDetailsPageProvider pageProvider = context.watch<TripDetailsPageProvider>();
    String text = pageProvider.state.trip.description;
    List<String> splitedText = text.split(S.current.whiteSpace);
    List<Widget> allItems = this.getItems(splitedText);
    bool isLargeText = (allItems.length > 40);

    List<Widget> items = (isLargeText && !this.seeMore) 
    ? allItems.take(30).toList() 
    : allItems;

    items.removeLast();

    items.add((this.seeMore) ? const SizedBox.shrink() : Text(S.current.ellipsis));  
    items.add(Text(S.current.whiteSpace));
    items.add((isLargeText) 
      ? _ExpanTextButton(
          onTap: this.toggleSeeMore,
          seeMore: this.seeMore,
        )  
      : const SizedBox.shrink()
    );

    return Wrap(children: items);
  }

  List<Widget> getItems(List<String> splitedText) 
  {
    List<Widget> items = [];

    for (String element in splitedText) 
    { 
      items.add(Text(element));
      items.add(Text(S.current.whiteSpace));
    }    
    return items;
  }

  void toggleSeeMore()=> setState(()=> this.seeMore = !this.seeMore);
}

class _ExpanTextButton extends StatelessWidget 
{
  final bool seeMore;
  final VoidCallback onTap;

  const _ExpanTextButton(
  {
    required this.onTap, 
    required this.seeMore,
  });

  @override
  Widget build(BuildContext context) 
  {
    return GestureDetector(
      onTap: this.onTap,
      child: Text(
        (this.seeMore) ? S.current.seeLess : S.current.seeMore,
        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
          color: Colors.blue,
        ),
      ),
    );
  }
}
