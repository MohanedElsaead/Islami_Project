import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islami_project/widgets/hadeth_item.dart';

class Hadith extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    // TODO: implement build
    var width=MediaQuery.of(context).size.width;
    var height=MediaQuery.of(context).size.height;
    return CarouselSlider(
      options: CarouselOptions(height: height*0.66,enlargeCenterPage: true,),
      items:   List.generate(50, (index)=>index+1).map(
        (index) {
          return HadethItem(index: index,);
        },
      ).toList(),
    );
  }

}