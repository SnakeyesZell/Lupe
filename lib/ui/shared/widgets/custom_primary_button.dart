import 'package:flutter/material.dart';

class CustomPrimaryButton extends StatelessWidget 
{
  final String label;
  final VoidCallback onTap;

  const CustomPrimaryButton(
  {
    super.key, 
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) 
  {
    return GestureDetector(
      onTap: this.onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: const BorderRadius.all(Radius.circular(20)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(22),
          child: Text(
            this.label,
            style: Theme.of(context).textTheme.labelMedium,
          ),
        ),
      ),
    );
  }
}
