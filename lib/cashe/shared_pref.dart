
import 'package:shared_preferences/shared_preferences.dart';

Future <void> saveLastSuraIndex(int newSuraIndex)async{
  var sharedPrefs=await SharedPreferences.getInstance();
  List<String> mostRecentList=sharedPrefs.getStringList('most_recent')??[];
  if(mostRecentList.contains('$newSuraIndex')){
    mostRecentList.remove("$newSuraIndex");
    mostRecentList.insert(0,'$newSuraIndex');

  }else{
    mostRecentList.insert(0,'$newSuraIndex');
  }
  if(mostRecentList.length>5){
    mostRecentList.removeLast();
  }
  sharedPrefs.setStringList("most_recent", mostRecentList);
}
Future <List<int>> readMostRecent()async{
  var sharedPrefs=await SharedPreferences.getInstance();
  List<String> mostRecentListAsString=sharedPrefs.getStringList('most_recent')??[];
  List<int> mostRecentListAsInt= mostRecentListAsString.map((element)=>int.parse(element),).toList();
  return mostRecentListAsInt.toList();
}