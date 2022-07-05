import 'dart:math';

import 'package:flutter/material.dart';

import 'package:random_number_generator_ex/constants/colors.dart';
import 'package:random_number_generator_ex/screens/settings.screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // @TODO 100. 최초에도 랜덤 넘버 생성
  List<int> randomNumbers = [
    83242,
    42342,
    66983,
  ];
  int maxNumber = 1000;

  @override
  Widget build(BuildContext context) {
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
      final number = rand.nextInt(maxNumber);
      newNumbers.add(number);
    }

    setState(() {
      randomNumbers = newNumbers.toList();
    });
  }

  // void onUpdateSetting() async {
  //   final result = await Navigator.of(context).push<int>(
  //     MaterialPageRoute(
  //       builder: (context) => const SettingsScreen(),
  //     ),
  //   );

  //   if (result != null) {
  //     setState(() {
  //       maxNumber = result;
  //     });
  //   }
  // }
}

class _Header extends StatelessWidget {
  // final VoidCallback updateSettings;
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
          onPressed: () async {
            // @TODO 1. settingsScreen 이동
            // @TODO 4. 수정된 값 사용
            // @TODO 5. setState를 하기위해 부모로 이동
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const SettingsScreen(),
              ),
            );
            // final result = await Navigator.of(context).push<int>(
            //   MaterialPageRoute(
            //     builder: (context) => const SettingsScreen(),
            //   ),
            // );
          },
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
