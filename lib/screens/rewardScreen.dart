import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:never_again/models/rewardModel.dart';
import 'package:never_again/widgets/neumorphicAppBar.dart';

class RewardScreen extends StatelessWidget {
  final List<RewardModel> rewardList = [
    RewardModel(
        about: 'Welcome Eagle | Welcome Reward For Your Better Life',
        myDuration: Duration(seconds: 10),
        rewardImage: 'asset/rewards/angle.png'),
    RewardModel(
        about: 'Fighter Skull | 1 Day No Masturbation Reward',
        myDuration: Duration(seconds: 10),
        rewardImage: 'asset/rewards/skull.png'),
    RewardModel(
        about: 'Pirates Hat | 2 Days No Masturbation Reward',
        myDuration: Duration(seconds: 10),
        rewardImage: 'asset/rewards/reskull.png'),
    RewardModel(
        about: 'Brave Soul | 3 Days No Masturbation Reward',
        myDuration: Duration(seconds: 10),
        rewardImage: 'asset/rewards/bear.png'),
    RewardModel(
        about: 'Bull Attitude | 4 Days No Masturbation Reward',
        myDuration: Duration(seconds: 10),
        rewardImage: 'asset/rewards/bull.png'),
    RewardModel(
        about: 'Fox Mind | 5 Days No Masturbation Reward',
        myDuration: Duration(seconds: 10),
        rewardImage: 'asset/rewards/fox.png'),
    RewardModel(
        about: 'Soldier Power | 6 Days No Masturbation Reward',
        myDuration: Duration(seconds: 10),
        rewardImage: 'asset/rewards/soilder.png'),
    RewardModel(
        about: 'Snake Personality | 7 Days No Masturbation Reward',
        myDuration: Duration(seconds: 10),
        rewardImage: 'asset/rewards/snake.png'),
    RewardModel(
        about: 'Medusa Power | 8 Days No Masturbation Reward',
        myDuration: Duration(seconds: 10),
        rewardImage: 'asset/rewards/snakegirl.png'),
    RewardModel(
        about: 'Mind Poison | 9 Days No Masturbation Reward',
        myDuration: Duration(seconds: 10),
        rewardImage: 'asset/rewards/poision.png'),
    RewardModel(
        about: 'Thor Limit | 10 Days No Masturbation Reward',
        myDuration: Duration(seconds: 10),
        rewardImage: 'asset/rewards/god.png'),
    RewardModel(
        about: 'Insane Control | 11 Days No Masturbation Reward',
        myDuration: Duration(seconds: 10),
        rewardImage: 'asset/rewards/joker.png'),
    RewardModel(
        about: 'Dark Soul | 12 Days No Masturbation Reward',
        myDuration: Duration(seconds: 10),
        rewardImage: 'asset/rewards/monster.png'),
    RewardModel(
        about: 'Wolf Soul | 13 Days No Masturbation Reward',
        myDuration: Duration(seconds: 10),
        rewardImage: 'asset/rewards/wolf.png'),
    RewardModel(
        about: 'Ninja Warrior | 14 Days No Masturbation Reward',
        myDuration: Duration(seconds: 10),
        rewardImage: 'asset/rewards/ninja.png'),
    RewardModel(
        about: 'Tiger Anger | 15 Days No Masturbation Reward',
        myDuration: Duration(seconds: 10),
        rewardImage: 'asset/rewards/angryTiger.png'),
    RewardModel(
        about: 'Lion King | 16 Days No Masturbation Reward',
        myDuration: Duration(seconds: 10),
        rewardImage: 'asset/rewards/lion.png'),
    RewardModel(
        about: 'Eagle Attitude | 17 Days No Masturbation Reward',
        myDuration: Duration(seconds: 10),
        rewardImage: 'asset/rewards/eagle.png'),
    RewardModel(
        about: 'Dragon Power | 18 Days No Masturbation Reward',
        myDuration: Duration(seconds: 10),
        rewardImage: 'asset/rewards/dragon.png'),
    RewardModel(
        about: 'Demon Attitude | 19 Days No Masturbation Reward',
        myDuration: Duration(seconds: 10),
        rewardImage: 'asset/rewards/demon.png'),
    RewardModel(
        about: 'God Attitude | 21 Days No Masturbation Reward',
        myDuration: Duration(seconds: 10),
        rewardImage: 'asset/rewards/princess.png')
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomNeumorphicAppBar(ctx: context, titleText: 'Rewards'),
      body: ListView.builder(
        itemCount: rewardList.length,
        physics: BouncingScrollPhysics(),
        itemBuilder: (ctx, i) => Neumorphic(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 2),
            margin: const EdgeInsets.symmetric(vertical: 7, horizontal: 8),
            child: Container(
              child: ListTile(
                leading: Image.asset(
                  rewardList[i].rewardImage,
                ),
                title: Text(rewardList[i].about),
              ),
            )),
      ),
    );
  }
}
