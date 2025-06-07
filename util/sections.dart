import 'package:flutter/material.dart';

class sections extends StatelessWidget {
  String text;
  bool check;
  sections({
    super.key,
    required this.text,
    required this.check,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(width: 18),
        Container(
          width: 100,
          height: 45,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: check
                  ? Theme.of(context).colorScheme.primary
                  : Theme.of(context).colorScheme.secondary),
          child: Center(
              child: Text(
            text,
            style: TextStyle(
                color: check
                    ? Theme.of(context).colorScheme.surface
                    : Theme.of(context).colorScheme.tertiary,
                fontWeight: FontWeight.w600),
          )),
        ),
      ],
    );
  }
}
