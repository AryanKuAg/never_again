import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

import 'package:never_again/provider/rewardsList.dart';
import 'package:never_again/widgets/advertisementData.dart';

import 'package:never_again/widgets/neumorphicAppBar.dart';

class RewardScreen extends StatefulWidget {
  @override
  _RewardScreenState createState() => _RewardScreenState();
}

class _RewardScreenState extends State<RewardScreen> {
  BannerAd _bannerAd;
  @override
  void initState() {
    FirebaseAdMob.instance
        .initialize(appId: 'ca-app-pub-3739926644625425~6646484032');

    _bannerAd = AdvertisementData().createBannerAd()
      ..load().then((value) {
        if (value && this.mounted) {
          _bannerAd..show(anchorType: AnchorType.top, anchorOffset: 105.0);
        }
      });
    super.initState();
  }

  @override
  void dispose() {
    _bannerAd?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomNeumorphicAppBar(ctx: context, titleText: 'Rewards'),
      body: Container(
        margin: const EdgeInsets.only(top: 50),
        child: ListView.builder(
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
      ),
    );
  }
}
