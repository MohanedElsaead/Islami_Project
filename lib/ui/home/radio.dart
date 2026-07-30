import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islami_project/util/app_styles.dart';
import 'package:islami_project/util/appcolors.dart';
import 'package:islami_project/widgets/radio_item.dart';

class Islami_Radio extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    var width=MediaQuery.of(context).size.width;
    var height=MediaQuery.of(context).size.height;
    return Center(
        child: Column(
          spacing: height*0.02,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: width*0.02,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: AppColors.yellow
                  ),
                  child: Padding(
                    padding: EdgeInsetsGeometry.symmetric(horizontal: 71,vertical: 5),
                    child: Text("Radio",style: AppStyles.Bold16Black,),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Color.from(alpha: 0.4, red: 0, green: 0, blue: 0)
                  ),
                  child: Padding(
                    padding: EdgeInsetsGeometry.symmetric(horizontal: 71,vertical: 5),
                    child: Text("Reciters",style: AppStyles.Bold16White.copyWith(fontFamily: "",fontWeight: FontWeight.normal),),
                  ),
                )
              ],
            ),
            Expanded(
              child: ListView.separated(itemBuilder: (context,index){
                return RadioItem();
              },
                  separatorBuilder: (context,index){
                   return SizedBox(
                     height: height*0.01,
                   );
                  },
                  itemCount: 10),
            )
          ],
        ),
    );
  }

}