import 'dart:math' as math;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islami_project/util/app_styles.dart';

class Sebha extends StatefulWidget {
  @override
  State<Sebha> createState() => _SebhaState();
}
double angle = 0;
int counter = 0;
List<String> tasbih=["سبحان الله","الحمد لله","لا اله الا الله","الله اكبر"];
int tasbihIndex=0;

class _SebhaState extends State<Sebha> {
  @override
  Widget build(BuildContext context) {

    var width=MediaQuery.of(context).size.width;
    var height=MediaQuery.of(context).size.height;


// TODO: implement build
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Text("سَبِّحِ اسْمَ رَبِّكَ الأعلى",style: AppStyles.Bold24White.copyWith(fontSize: 32),),
          Stack(
            alignment: Alignment.center,
            children: [
              InkWell(
                onTap: (){
                setState(() {
                  counter++;
                  angle = (counter % 33) * (2 * math.pi / 33);
                  if (counter == 33) {
                    counter = 0;
                    angle = 0;
                    if(tasbihIndex==3){
                      tasbihIndex=0;
                    }
                    else{
                      tasbihIndex=tasbihIndex+1;
                    }
                  }
                });
                },
                child: Transform.rotate(
                  angle: angle,
                  alignment: Alignment.center,
                  child: Image.asset("assets/sebha/SebhaBody.png"),
                ),
                  ),
              Column(
                children: [
                  SizedBox(
                    height: height*0.08,
                  ),
                  Text(tasbih[tasbihIndex],style: AppStyles.Bold24White.copyWith(fontSize: 32),),
                  SizedBox(
                    height: height*0.04,
                  ),
                  Text("$counter",style: AppStyles.Bold24White.copyWith(fontSize: 32),)
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}