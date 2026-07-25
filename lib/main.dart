import 'package:flutter/material.dart';
import 'package:islami_project/providers/most_recent_provider.dart';
import 'package:islami_project/ui/home/dashboard.dart';
import 'package:islami_project/ui/home/hadith_detail1.dart';
import 'package:islami_project/ui/home/home_screen.dart';
import 'package:islami_project/ui/home/sura_detail1.dart';
import 'package:islami_project/util/app_routes.dart';
import 'package:islami_project/util/appcolors.dart';
import 'package:provider/provider.dart';

void main(){
  runApp(ChangeNotifierProvider(
    create: (context)=>MostRecentProvider(),
      child: MyApp()));
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.homeroutename,
      routes: {
        AppRoutes.homeroutename:(context)=>HomeScreen(),
        AppRoutes.dashroutename:(context)=>DashBoard(),
        AppRoutes.suradetailname:(context)=>SuraDetail1(),
        AppRoutes.hadithdetailname:(context)=>HadithDetail1(),
      },
    );
  }

}