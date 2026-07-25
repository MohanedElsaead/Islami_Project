import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MostRecentProvider extends ChangeNotifier{
  List<int>mostRecentList=[];
  void readMostRecent()async{
    var sharedPrefs=await SharedPreferences.getInstance();
    List<String> mostRecentListAsString=sharedPrefs.getStringList('most_recent')??[];
    mostRecentList= mostRecentListAsString.map((element)=>int.parse(element),).toList();
    notifyListeners();
  }
}