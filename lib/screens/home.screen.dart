import 'dart:math';

import 'package:flutter/material.dart';
import 'package:random_number_generator_ex/constants/colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // @TODO 4. randomNumbers 변수사용
  // List<int> randomNumbers = [
  //   83242,
  //   42342,
  //   66983,
  // ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        // @TODO 0. padding :
        // padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // @TODO 10.1. _Header 추출
            Row(
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
            ),
            // @TODO 10.2. _Body 추출
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                // @TODO 2. 숫자 출력 로직 분리 (Row -> method)
                //       (e) => _displayNumber(e),
                // [ 83242,42342,66983,]

                // @TODO 3. 줄간격 조정 (조건부 top padding : 16)
                // .asMap()
                // .entries
                children: [
                  Row(
                    children: 4311
                        .toString()
                        .split('')
                        .map(
                          (e) => Text(
                            '/$e',
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        )
                        .toList(),
                  ),
                  // @TODO 1. 안전하게 이미지 표시 :
                  //         (e) => Flexible(
                  //           child: Image.asset(
                  //             'assets/images/$e.png',
                  //             height: 70,
                  //             width: 50,
                  //           ),
                  // ),
                ],
              ),
            ),
            // @TODO 10.3. _Footer 추출
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: primaryColor,
                ),
                // @TODO 5. 랜덤 숫자 생성
                onPressed: () {},
                child: const Text('Generate!'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // void onGenerateNumbers() {
  //   final rand = Random();
  //   final List<int> newNumbers = [];
  //   // final newNumbers = <int>[];

  //   for (var i = 0; i < 3; i++) {
  //     final number = rand.nextInt(1000);
  //     newNumbers.add(number);

  //     // newNumbers.add(rand.nextInt(1000));
  //   }

  //   setState(() {
  //     randomNumbers = newNumbers;
  //   });
  // }

  // @TODO 5.1. 중복 숫자 방지
  // void onGenerateDistinctNumbers() {
  //   final rand = Random();
  //   final Set<int> newNumbers = {};
  //   // final newNumbers = <int>{};

  //   while (newNumbers.length < 3) {
  //     final number = rand.nextInt(10);
  //     newNumbers.add(number);

  //     print('new number => $number');
  //   }

  //   setState(() {
  //     randomNumbers = newNumbers.toList();
  //   });
  // }

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
