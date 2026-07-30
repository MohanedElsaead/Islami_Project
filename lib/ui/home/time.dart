import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islami_project/util/app_styles.dart';
import 'package:islami_project/util/appcolors.dart';
import 'package:islami_project/widgets/time_item.dart';

class Time extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var width=MediaQuery.of(context).size.width;
    var height=MediaQuery.of(context).size.height;
    // TODO: implement build
    return Center(
        child: Column(
          spacing: height*0.01,
          children: [
            Container(
              decoration: BoxDecoration(color: Colors.yellow,borderRadius: BorderRadius.circular(40),image:DecorationImage(image: AssetImage("assets/time/container.png",),
              )),
              width: 390,
              height: 301,
              child: Column(
                children: [
                  Padding(
                    padding:EdgeInsets.symmetric(vertical: height*0.01),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            Text("16 Jul,",style: AppStyles.Bold16White,),
                            Text("2024",style: AppStyles.Bold16White,)
                          ],
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        Column(
                          children: [
                            Text("Pray Time",style: AppStyles.Bold20Black,),
                            Text("Tuesday",style: AppStyles.Bold20Black,)
                          ],
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        Column(
                          children: [
                            Text("09 Muh,",style: AppStyles.Bold16White,),
                            Text("1446",style: AppStyles.Bold16White,)
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: height*0.015),
                    child: CarouselSlider(
                    options: CarouselOptions(height: height*0.16,enlargeCenterPage: true,viewportFraction: 0.30,),
                    items:   List.generate(10, (index)=>index).map(
                    (index) {
                    return TimeItem();
                     },
                     ).toList(),
                      ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        width: 30,
                      ),
                      Text("Next Pray - 02:32",style: AppStyles.Bold16Black,),
                      IconButton(onPressed: (){}, icon: Icon(Icons.volume_off),color: AppColors.black,)
                    ],
                  ),
                ],
              ),
              ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("Azkar",style: AppStyles.Bold16White),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  decoration: BoxDecoration(border: Border.all(color: AppColors.yellow),
                      color: Color.from(alpha: 0.4, red: 0, green: 0, blue: 0),borderRadius: BorderRadius.circular(20)),
                  child: Padding(
                    padding:EdgeInsets.all(5.0),
                    child: Column(
                      children: [
                        Image.asset("assets/time/bell-icon 1.png"),
                        Text("Evening Azkar",style: AppStyles.Bold24White,)
                      ],
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(border: Border.all(color: AppColors.yellow),
                      color: Color.from(alpha: 0.4, red: 0, green: 0, blue: 0),borderRadius: BorderRadius.circular(20)),
                  child: Padding(
                    padding:EdgeInsets.all(5.0),
                    child: Column(
                      children: [
                        Image.asset("assets/time/bell-icon 2.png"),
                        Text("Morning Azkar",style: AppStyles.Bold24White,)
                      ],
                    ),
                  ),
                )
              ],
            )
          ]
              ),
            );
  }

}