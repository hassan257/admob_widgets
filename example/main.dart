import 'package:admob_widgets/admob_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  AdMobWidgets.instance(
    // test's id
    androidBannerAdUnitId: "ca-app-pub-3940256099942544/6300978111", 
    androidInterstitialAdUnitId: "ca-app-pub-3940256099942544/1033173712"
  );
  await MobileAds.instance.initialize();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final interstitialUnit = InterstitialUnit();
  InterstitialAd? _interstitialAd;
  @override
  void initState() {
    interstitialUnit.loadAd();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        body: Column(
          children: [
            Expanded(child: Center(
              child: MaterialButton(
                onPressed: () {
                  _interstitialAd = interstitialUnit.interstitialAd;
                  if(_interstitialAd != null){
                    _interstitialAd!.show();
                    interstitialUnit.loadAd();
                  }
                },
                child: const Text('Launch interstitial'),
              ),
            )),
            const BannerWidget(),
          ],
        ),
      ),
    );
  }
}