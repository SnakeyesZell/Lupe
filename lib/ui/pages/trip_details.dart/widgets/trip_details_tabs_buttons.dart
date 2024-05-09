import 'package:flutter/material.dart';
import 'package:lupe/config/config.dart';
import 'package:lupe/domain/domain.dart';
import 'package:lupe/generated/l10n.dart';

class TripDetailsTabButtons extends StatefulWidget 
{
  final TabController tabController;

  const TripDetailsTabButtons(
  {
    super.key, 
    required this.tabController,
  });

  @override
  State<TripDetailsTabButtons> createState() => _TripDetailsTabButtonsState();
}

class _TripDetailsTabButtonsState extends State<TripDetailsTabButtons> 
{
  @override
  void initState() 
  {
    this.widget.tabController.addListener(()=> setState(()=> {}));
    super.initState();
  }

  @override
  Widget build(BuildContext context) 
  {
    int tabIndex =  this.widget.tabController.index;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: AppConstrains.viewportMargin),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>
        [
          _ButtonTab(
            onTap: ()=> this.onTap(TripDetailsTabs.galery),
            isActive: (tabIndex == TripDetailsTabs.galery.tabIndex),
            label: this.getTabName(TripDetailsTabs.galery),
          ),
          const SizedBox(width: AppConstrains.spacingScroll),
          _ButtonTab(
            onTap: ()=> this.onTap(TripDetailsTabs.users),
            isActive: (tabIndex == TripDetailsTabs.users.tabIndex),
            label: this.getTabName(TripDetailsTabs.users),
          ),
          const SizedBox(width: AppConstrains.spacingScroll),
          _ButtonTab(
            onTap: ()=> this.onTap(TripDetailsTabs.map),
            isActive: (tabIndex == TripDetailsTabs.map.tabIndex),
            label: this.getTabName(TripDetailsTabs.map),
          ),
        ],
      ),
    );
  }

  String getTabName(TripDetailsTabs tab) 
  {
    switch (tab) 
    {
      case TripDetailsTabs.galery: return S.current.tripDetailsTab1Label;
      case TripDetailsTabs.users: return S.current.tripDetailsTab2Label;
      case TripDetailsTabs.map: return S.current.tripDetailsTab3Label;
      default: return S.current.whiteSpace;
    }
  }

  void onTap(TripDetailsTabs tab) 
  {
    this.widget.tabController.animateTo(
      tab.tabIndex, 
      duration: const Duration(milliseconds: 800),
      curve: Curves.easeInOutQuart,
    );
  }
}

class _ButtonTab extends StatelessWidget 
{
  final bool isActive;
  final String label;
  final VoidCallback onTap;

  const _ButtonTab(
  {
    required this.isActive, 
    required this.label, 
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) 
  {
    return Flexible(
      fit: FlexFit.tight,
      child: GestureDetector(
        onTap: this.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          padding: const EdgeInsets.symmetric(vertical: 5),
          decoration: BoxDecoration(
            color: (this.isActive) 
            ? Theme.of(context).primaryColor.withOpacity(0.15)
            : null,
            borderRadius: BorderRadius.circular(AppConstrains.tagsRadious),
          ),
          child: Text(
            this.label,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              color: (this.isActive) 
              ? Theme.of(context).primaryColor
              : Theme.of(context).shadowColor,
              fontFamily: AppFonts.quicksandBold,
            ),
          ),
        ),
      ),
    );
  }
}


