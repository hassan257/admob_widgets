<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages).
-->
# Admob Widgets

A variety of widgets to use easily ad units of AdMob


## Getting started

### Android

Modify the AndroidManifest.xml adding the next

```xml
<uses-permission android:name="com.google.android.gms.permission.AD_ID"/>
```

In application tag, add the next

```xml
<meta-data
    android:name="com.google.android.gms.ads.APPLICATION_ID"
    android:value="ca-app-pub-{your application ID}"/>
```

Finally in the main add the next code

```dart
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  AdMobWidgets.instance(
    androidBannerAdUnitId: "{Your banner ad unit Id}", 
    androidInterstitialAdUnitId: "Your intertitial ad unit Id"
    );
  await MobileAds.instance.initialize();
  runApp(const MainApp());
}
```

## Usage

### Banner Widget
```dart
// Only call the widget
const BannerWidget();
```

### Instertitial
```dart
// Initialize the the class InterstitialUnit
final interstitialUnit = InterstitialUnit();
// Initialize InterstitialAd
InterstitialAd? _interstitialAd;

@override
  void initState() {
    super.initState();
    // Load the ad
    interstitialUnit.loadAd();
  }

setState(() {
    //Asign the class's intertitial to local interstitial
      _interstitialAd = interstitialUnit.interstitialAd;
      // check interstital is not null
        if(_interstitialAd != null){
            // show the interstitial
          _interstitialAd!.show();
          // reload the interstitial
          interstitialUnit.loadAd();
        }
    });
```