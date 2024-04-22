import 'dart:convert';


import 'package:shared_preferences/shared_preferences.dart';

import 'istorage.dart';



class SharedPreferenceImpl implements CacheStorage {
  Future<SharedPreferences> getPrefs() {
    return SharedPreferences.getInstance();
  }

  @override
  Future<String?> getDownloads() async {
    return getPrefs().then((value) => value.getString('downloads'));
  }

  @override
  Future saveDownloads(String downloads) async {

    return getPrefs().then(
      (value) {
        return value.setString('downloads', downloads);
      },
    );
  }

  @override
  Future removeFavorite(String symbol) async {
  //   print('in remove');
  // //  String? favorites = await getFavorites();

  //   List<dynamic> myFavorites = favorites == null ? [] : jsonDecode(favorites);
  //   if (myFavorites.contains(symbol)) {
  //     myFavorites.remove(symbol);
  //   }
  //   return getPrefs().then(
  //     (value) {
  //       return value.setString('favorites', jsonEncode(myFavorites));
  //     },
  //   );
  }
  
  @override
  Future<bool?> getOnboarding() async{
       return getPrefs().then((value) => value.getBool('onboarding'));
 
  }
  
  @override
  Future saveOnboarding(bool status) {
      return getPrefs().then(
      (value) {
        return value.setBool('onboarding', status);
      },
    );
  }
}
