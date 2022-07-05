import 'package:flutter/material.dart';

import 'package:random_number_generator_ex/constants/colors.dart';

class SettingsScreen extends StatefulWidget {
  // @TODO 9. maxNumber 전달 받기
  // final int maxNumber;
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  double maxNumber = 10000;
  // @TODO 10. widget의 maxNumber 가져오기

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // @TODO 6. _Body로 추출
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // @TODO 2. pretty number 위젯 구현
                    Text(
                      maxNumber.toInt().toString(),
                      style: const TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
              // @TODO 7. _Footer로 추출하기 위해 Column으로 묶음
              // @TODO 8. _Footer로 추출
              Slider(
                value: maxNumber,
                min: 100,
                max: 10000,
                onChanged: (value) {
                  setState(() {
                    maxNumber = value;
                  });
                },
              ),
              const SizedBox(height: 30),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: primaryColor),
                  onPressed: () {
                    // @TODO 3. 이전 페이지로 값 전달
                    Navigator.of(context).pop();
                  },
                  child: const Text('Save'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  // void onUpdateMax(double value) {
  //   setState(() {
  //     maxNumber = value;
  //   });
  // }
}
