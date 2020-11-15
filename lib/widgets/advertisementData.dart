import 'package:firebase_admob/firebase_admob.dart';

class AdvertisementData {
  static const MobileAdTargetingInfo targetingInfo = MobileAdTargetingInfo(
      testDevices: <String>[],
      nonPersonalizedAds: true,
      keywords: <String>[
        'Men',
        'Control',
        'Meditation',
        'education',
        'shoes',
        'control',
        'relax'
      ]);
  BannerAd createBannerAd() {
    return BannerAd(
        adUnitId: 'ca-app-pub-3739926644625425/3290187798',
        size: AdSize.banner,
        targetingInfo: targetingInfo,
        listener: (MobileAdEvent event) {
          print('BannerAd $event');
        });
  }

  InterstitialAd createInterstitialAd() {
    return InterstitialAd(
        adUnitId: 'ca-app-pub-3739926644625425/9061389224',
        targetingInfo: targetingInfo,
        listener: (MobileAdEvent event) {
          print('InterstitialAd $event');
        });
  }
}
