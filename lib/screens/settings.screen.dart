import 'package:flutter/material.dart';

import 'package:random_number_generator_ex/constants/colors.dart';
import 'package:random_number_generator_ex/shared/widgets/pretty-number.widget.dart';

class SettingsScreen extends StatefulWidget {
  final int maxNumber;

  const SettingsScreen({
    Key? key,
    required this.maxNumber,
  }) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  double maxNumber = 10000;

  @override
  void initState() {
    super.initState();
    maxNumber = widget.maxNumber.toDouble();
  }

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
              _Body(maxNumber: maxNumber),
              _Footer(maxNumber: maxNumber, changeMax: onUpdateMax),
            ],
          ),
        ),
      ),
    );
  }

  void onUpdateMax(double value) {
    setState(() {
      maxNumber = value;
    });
  }
}

class _Body extends StatelessWidget {
  const _Body({
    Key? key,
    required this.maxNumber,
  }) : super(key: key);

  final double maxNumber;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          PrettyNumber(value: maxNumber.toInt()),
        ],
      ),
    );
  }
}

class _Footer extends StatelessWidget {
  final double maxNumber;
  final ValueChanged<double> changeMax;

  const _Footer({
    Key? key,
    required this.maxNumber,
    required this.changeMax,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Slider(
          value: maxNumber,
          min: 100,
          max: 10000,
          onChanged: changeMax,
        ),
        const SizedBox(height: 30),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(primary: primaryColor),
            onPressed: () {
              Navigator.of(context).pop(maxNumber.toInt());
            },
            child: const Text('Save'),
          ),
        )
      ],
    );
  }
}
