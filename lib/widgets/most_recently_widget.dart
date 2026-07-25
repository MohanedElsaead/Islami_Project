import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islami_project/cashe/shared_pref.dart';
import 'package:islami_project/model/quran_resources.dart';
import 'package:islami_project/providers/most_recent_provider.dart';
import 'package:provider/provider.dart';

import '../util/app_routes.dart';
import '../util/app_styles.dart';
import '../util/appcolors.dart';

class MostRecentlyWidget extends StatefulWidget {
   MostRecentlyWidget({super.key});

  @override
  State<MostRecentlyWidget> createState() => _MostRecentlyWidgetState();
}

class _MostRecentlyWidgetState extends State<MostRecentlyWidget> {
  late MostRecentProvider mostRecentProvider;
   @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      mostRecentProvider.readMostRecent();
    },);
   }
  @override
  Widget build(BuildContext context) {
    var width=MediaQuery.of(context).size.width;
    var height=MediaQuery.of(context).size.height;
    mostRecentProvider= Provider.of<MostRecentProvider>(context);
    return Visibility(
      visible: mostRecentProvider.mostRecentList.isNotEmpty,
      child: Column(
        spacing: height*0.01,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text("Most Recently",style: TextStyle(fontFamily: "Janna",color: AppColors.white,fontSize: height*0.02,fontWeight: FontWeight.bold),
            textAlign:TextAlign.start,),
      SizedBox(
      height: height*0.18,
      child: ListView.separated(
      scrollDirection: Axis.horizontal,
      itemBuilder: (context,index){
      return InkWell(
        onTap: (){
          Navigator.of(context).pushNamed(AppRoutes.suradetailname,arguments: mostRecentProvider.mostRecentList[index]);        },
        child: Container(
        decoration: BoxDecoration(
        color: AppColors.yellow,
        borderRadius: BorderRadius.circular(20)
        ),
        child: Padding(
        padding: EdgeInsets.all(16),
        child: Row(
        children: [
        Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 16,
        children: [
        Text(QuranResources.englishQuranSurahs[mostRecentProvider.mostRecentList[index]],style: AppStyles.Bold24Black,),
        Text(QuranResources.arabicAuranSuras[mostRecentProvider.mostRecentList[index]],style: AppStyles.Bold24Black,),
        Text("${QuranResources.AyaNumber[mostRecentProvider.mostRecentList[index]]} Verses",style: AppStyles.Bold16Black,)
        ],
        ),
        Image.asset("assets/intro_screen/mostRecently.png")
        ],
        ),
        ),
        ),
      );
      },
      separatorBuilder: (context,index){
      return SizedBox(
      width: width*0.02,
      );
      },
      itemCount: mostRecentProvider.mostRecentList.length),
      )
        ]),
    );
  }
}
