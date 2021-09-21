import 'dart:io';

class AdHelper{
  static String get bannerAdUnitId{
    if(Platform.isAndroid) {
      return "ca-app-pub-8165719959159108/7154726200";

    }else if(Platform.isIOS){
      return "ca-app-pub-8165719959159108/7382504997";
    }else{
      throw new UnsupportedError('Unsupported platform');
    }

  }
}