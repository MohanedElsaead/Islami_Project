import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islami_project/util/app_styles.dart';
import 'package:islami_project/util/appcolors.dart';

class RadioItem extends StatelessWidget {
  const RadioItem({super.key});

  @override
  Widget build(BuildContext context) {
    var width=MediaQuery.of(context).size.width;
    var height=MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12),
      child: Container(
        height: height*0.145,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: AppColors.yellow,
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Image.asset("assets/materials/Mosque.png",width: double.infinity,fit: BoxFit.cover,),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Radio Ibrahim Al-Akdar",style: AppStyles.Bold20Black,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(onPressed: (){

                    },
                    icon: Icon(Icons.play_arrow,color: AppColors.black,size: 60,)),
                    IconButton(onPressed: (){

                    },
                        icon: Icon(Icons.volume_up,color: AppColors.black,size: 35,))
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
