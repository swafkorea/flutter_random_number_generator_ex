import 'dart:math';

import 'package:flutter/material.dart';

import 'package:random_number_generator_ex/constants/colors.dart';
import 'package:random_number_generator_ex/screens/settings.screen.dart';
import 'package:random_number_generator_ex/shared/widgets/pretty-number.widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // @TODO 100. 최초에도 랜덤 넘버 생성
  // @TODO 101. settings에서 max값을 변경하고 home으로 돌아오면 그 설정으로 번호 자동 생성
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
              _Header(updateSettings: onUpdateSetting),
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

  void onUpdateSetting() async {
    final result = await Navigator.of(context).push<int>(
      MaterialPageRoute(
        builder: (context) => SettingsScreen(
          maxNumber: maxNumber,
        ),
      ),
    );

    if (result != null) {
      setState(() {
        maxNumber = result;
      });
    }
  }
}

class _Header extends StatelessWidget {
  final VoidCallback updateSettings;

  const _Header({
    Key? key,
    required this.updateSettings,
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
          onPressed: updateSettings,
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
                child: PrettyNumber(value: e.value),
              ),
            )
            .toList(),
      ),
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
