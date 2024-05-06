import 'package:flutter/gestures.dart';
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
    List<InlineSpan> allItems = this.getItems(splitedText);
    bool isLargeText = (allItems.length > 40);

    List<InlineSpan> items = (isLargeText && !this.seeMore) 
    ? allItems.take(30).toList() 
    : allItems;

    items.removeLast();

    items.add((this.seeMore) ? TextSpan(text: S.current.whiteSpace) : TextSpan(text: S.current.ellipsis));  
    items.add(TextSpan(text: S.current.whiteSpace));
    items.add((isLargeText) 
      ? TextSpan(
          text: (this.seeMore) ? S.current.seeLess : S.current.seeMore,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
            color: Colors.blue,
          ),
          recognizer: TapGestureRecognizer()..onTap = this.toggleSeeMore
        )
      : TextSpan(text: S.current.whiteSpace)
    );

    return RichText(      
      text: TextSpan(
        style: Theme.of(context).textTheme.bodyMedium,
        children: items,
      ),
    );
  }

  List<InlineSpan> getItems(List<String> splitedText) 
  {
    List<InlineSpan> items = [];

    for (String element in splitedText) 
    { 
      items.add(TextSpan(text: element));
      items.add(TextSpan(text: S.current.whiteSpace));
    }    
    return items;
  }

  void toggleSeeMore()=> setState(()=> this.seeMore = !this.seeMore);
}


