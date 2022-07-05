import 'dart:math';

import 'package:flutter/material.dart';

import 'package:random_number_generator_ex/constants/colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<int> randomNumbers = [
    83242,
    42342,
    66983,
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const _Header(),
              _Body(randomNumbers: randomNumbers),
              _Footer(generate: onGenerateDistinctNumbers),
            ],
          ),
        ),
      ),
    );
  }

  void onGenerateDistinctNumbers() {
    final rand = Random();
    final Set<int> newNumbers = {};
    // final newNumbers = <int>{};

    while (newNumbers.length < 3) {
      final number = rand.nextInt(10);
      newNumbers.add(number);
    }

    setState(() {
      randomNumbers = newNumbers.toList();
    });
  }
}

class _Header extends StatelessWidget {
  const _Header({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Flexible(
          child: Text(
            'Random number generator',
            style: TextStyle(
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
              color: foregroundColor,
            ),
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.settings,
            color: primaryColor,
          ),
        ),
      ],
    );
  }
}

class _Body extends StatelessWidget {
  final List<int> randomNumbers;

  const _Body({
    Key? key,
    required this.randomNumbers,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: randomNumbers
            .asMap()
            .entries
            .map(
              (e) => Padding(
                padding: EdgeInsets.only(top: e.key == 0 ? 0 : 16.0),
                child: _displayNumber(e.value),
              ),
            )
            .toList(),
      ),
    );
  }

  Widget _displayNumber(int value) {
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

class _Footer extends StatelessWidget {
  final VoidCallback generate;

  const _Footer({
    Key? key,
    required this.generate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: primaryColor,
        ),
        onPressed: generate,
        child: const Text('Generate!'),
      ),
    );
  }
}
