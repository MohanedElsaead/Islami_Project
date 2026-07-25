import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islami_project/model/quran_resources.dart';
import 'package:islami_project/util/app_styles.dart';

class SuraWidget extends StatelessWidget{
  int num;

  SuraWidget({required this.num});
  @override
  Widget build(BuildContext context) {
    var width=MediaQuery.of(context).size.width;
    var height=MediaQuery.of(context).size.height;
    // TODO: implement build
    return ListTile(
      leading: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset("assets/icons/vector.png"),
          Text("${num+1}",style: AppStyles.Bold16White,),
        ],
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: height*0.008,
        children: [
          Text(QuranResources.englishQuranSurahs[num],style: AppStyles.Bold20White,),
          Text("${QuranResources.AyaNumber[num]} Verses",style: AppStyles.Bold16White,)
        ],
      ),
      trailing: Text(QuranResources.arabicAuranSuras[num],style: AppStyles.Bold24White,),
    );
  }

}