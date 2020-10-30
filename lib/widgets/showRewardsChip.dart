import 'package:flutter/material.dart';

class ShowRewardsChip extends StatefulWidget {
  @override
  _ShowRewardsChipState createState() => _ShowRewardsChipState();
}

class _ShowRewardsChipState extends State<ShowRewardsChip> {
  List _listOfRewards = [];
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15),
      child: Chip(
        label: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              Text(
                  'kasjmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmfffffffffffffffffffffffffffffffffffffffffffffffffas'),
              Text(
                  'kasjmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmfffffffffffffffffffffffffffffffffffffffffffffffffas'),
            ],
          ),
        ),
      ),
    );
  }
}
