import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:islami_project/ui/home/hadith.dart';
import 'package:islami_project/ui/home/quran.dart';
import 'package:islami_project/ui/home/radio.dart';
import 'package:islami_project/ui/home/sebha.dart';
import 'package:islami_project/ui/home/time.dart';
import 'package:islami_project/util/appcolors.dart';

class DashBoard extends StatefulWidget {
  const DashBoard ({super.key});

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  int selectedIndex = 0;
  List<Widget> tabs=[Quran(),Hadith(),Sebha(),Islami_Radio(),Time()];
  List<String> tabsBG=["quranBG","hadithBG","sebhaBG","radioBG","timeBG"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: false,
          currentIndex: selectedIndex,
          onTap: (index) {
            setState(() {
              selectedIndex = index;
            });
          },
        type: BottomNavigationBarType.fixed,
          selectedItemColor: AppColors.white,
          unselectedItemColor: AppColors.black,
          backgroundColor: AppColors.yellow,
          items: [
            IconButton("quran",0,"Quran"),
            IconButton("hadith",1,"Hadith"),
            IconButton("sebha",2,"Sebha"),
            IconButton("radio",3,"Radio"),
            IconButton("time",4,"Time"),
          ] ),
      body:Stack(children: [
        Image.asset("assets/tabs/${tabsBG[selectedIndex]}.png",width: double.infinity,height: double.infinity,fit: BoxFit.cover,),
        SafeArea(
          child: Column(
            children: [
              Image.asset("assets/intro_screen/islami_logo.png",width: 250,),
              Expanded(child: tabs[selectedIndex]),
            ],
          ),
        ),
      ],),
      );
  }
  BottomNavigationBarItem IconButton(String icon,int index,String label){
    return BottomNavigationBarItem(icon: Container(
      decoration: BoxDecoration(
        color: (selectedIndex==index)?Color(0x60202020):Color(0x00202020),
            borderRadius: BorderRadius.circular(60),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 6,
        ),
        child: SvgPicture.asset("assets/icons/$icon.svg",
          colorFilter:ColorFilter.mode(selectedIndex == index ? AppColors.white : AppColors.black, BlendMode.srcIn,),),
      ),
    ),
      label: label
    );
  }
}
