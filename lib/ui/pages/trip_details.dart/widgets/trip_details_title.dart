import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:lupe/config/config.dart';

import '../provider/trip_details_page_provider.dart';

class TripDetailsTitle extends StatefulWidget 
{
  const TripDetailsTitle({super.key});

  @override
  State<TripDetailsTitle> createState() => _TripDetailsTitleState();
}

class _TripDetailsTitleState extends State<TripDetailsTitle> 
{
  late FocusNode focusNode;
  late TextEditingController controller;

  @override
  void initState() 
  {
    TripDetailsPageProvider pageProvider = context.read<TripDetailsPageProvider>();
    String title = pageProvider.state.trip.title;

    this.controller = TextEditingController(text: title);    
    this.focusNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() 
  {
    this.focusNode.dispose();  
    super.dispose();
  }

  @override
  Widget build(BuildContext context) 
  {
    return Container(
      margin: const EdgeInsets.only(
        bottom: AppConstrains.textSpacingScroll,
        left: AppConstrains.viewportMargin,
        right: AppConstrains.viewportMargin,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>
        [
          _FormTitl(
            focusNode: this.focusNode,
            controller: this.controller,
          ),
          const SizedBox(width: AppConstrains.textSpacingScroll),
          _EditButton(focusNode: this.focusNode),
        ],
      ),
    );
  }
}

class _FormTitl extends StatelessWidget 
{
  final FocusNode focusNode;
  final TextEditingController controller;

  const _FormTitl(
  {
    required this.focusNode, 
    required this.controller,
  });

  @override
  Widget build(BuildContext context) 
  {
    return Flexible(
      child: IgnorePointer(
        ignoring: !this.focusNode.hasFocus,
        child: IntrinsicWidth(
          child: TextFormField(
            focusNode: this.focusNode,
            onSaved: (String? value){},
            maxLines: null,
            style: Theme.of(context).textTheme.titleSmall,
            controller: this.controller,
            decoration: const InputDecoration(
              border: InputBorder.none,
            ),
          ),
        ),
      ),
    );
  }
}

class _EditButton extends StatefulWidget 
{
  final FocusNode focusNode;

  const _EditButton(
  {
    required this.focusNode,
  });

  @override
  State<_EditButton> createState() => _EditButtonState();
}

class _EditButtonState extends State<_EditButton> 
{
  @override
  void initState() 
  {
    this.widget.focusNode.addListener(()=> setState(()=> {}));
    super.initState();
  }

  @override
  Widget build(BuildContext context) 
  {
    double iconSize = 22;

    return Visibility(
      visible: !this.widget.focusNode.hasFocus,
      child: GestureDetector(
        onTap: ()=> setState(()=> this.widget.focusNode.requestFocus()),
        child: Container(
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Theme.of(context).cardColor,
            boxShadow: <BoxShadow> 
            [
              BoxShadow(
                color: Theme.of(context).shadowColor.withOpacity(0.2),
                blurRadius: 5,
                spreadRadius: -2,
                offset: const Offset(0, 5),
              ),
            ]
          ),
          child: Transform.translate(
            offset: const Offset(0, 0),
            child: Image(
              width: iconSize,
              height: iconSize,
              image: const AssetImage(AppIcons.editAltGreyIcon)
            ),
          ),
        ),
      ),
    );
  }
}

