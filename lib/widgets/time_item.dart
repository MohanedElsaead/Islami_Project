import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islami_project/util/app_styles.dart';
import 'package:islami_project/util/appcolors.dart';

class TimeItem extends StatelessWidget {
  const TimeItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      decoration: BoxDecoration(gradient: LinearGradient(
        colors: [
          AppColors.black,
          AppColors.yellow,
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("ASR",style: AppStyles.Bold20White,),
            Text("04:38",style: AppStyles.Bold24White.copyWith(fontSize: 35),),
            Text("PM",style: AppStyles.Bold20White,)
          ],
        ),
      )
    );
  }
}
