import 'package:flutter/material.dart';

class PrettyNumber extends StatelessWidget {
  const PrettyNumber({
    Key? key,
    required this.value,
  }) : super(key: key);

  final int value;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: value
          .toString()
          .split('')
          .map(
            (e) => Flexible(
              child: Image.asset(
                'assets/images/$e.png',
                height: 70,
                width: 50,
              ),
            ),
          )
          .toList(),
    );
  }
}
