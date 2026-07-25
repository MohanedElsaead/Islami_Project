import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_project/model/hadeeth_args.dart';
import 'package:islami_project/model/quran_resources.dart';
import 'package:islami_project/ui/home/hadithText.dart';
import 'package:islami_project/util/app_styles.dart';
import 'package:islami_project/util/appcolors.dart';
import 'package:islami_project/widgets/sura_item.dart';

class HadithDetail1 extends StatefulWidget {
  HadithDetail1({super.key});


  @override
  State<HadithDetail1> createState() => _SuraDetailState();
}

class _SuraDetailState extends State<HadithDetail1> {
  @override
  Widget build(BuildContext context) {
    var args=ModalRoute.of(context)?.settings.arguments as HadeethArgs;

    var width=MediaQuery.of(context).size.width;
    var height=MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: AppBar(
        backgroundColor: AppColors.black,
        iconTheme: IconThemeData(
          color: AppColors.yellow,
        ),
        centerTitle:true,
        title: Text("Hadith ${args.index}",style: AppStyles.Bold24Black.copyWith(
          color: AppColors.yellow
        ),),
      ),
      body: Column(
        spacing: height*0.01,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset("assets/materials/left_corner2.png"),
              Expanded(
                child: Text(args.hadeeth_arg?.title??"",style: AppStyles.Bold24White.copyWith(
                  color: AppColors.yellow,
                ),textAlign: TextAlign.center,),
              ),
              Image.asset("assets/materials/right_corner2.png"),
            ],
          ),
          Expanded(child:
          SingleChildScrollView(
            child: Padding(
              padding:EdgeInsets.all(width*0.02),
              child: Hadithtext(
                  text: args.hadeeth_arg?.Content??"",
                  textStyle: AppStyles.Bold20White.copyWith(color: AppColors.yellow)),
            ),
          )
            ),
          Image.asset("assets/materials/Mosque2.png"),
        ],
      ),
      );
  }
}
