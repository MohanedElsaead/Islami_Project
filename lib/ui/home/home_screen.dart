import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:islami_project/util/app_routes.dart';
import 'package:islami_project/util/appcolors.dart';

class HomeScreen extends StatelessWidget {
  List<PageViewModel>Pages=[
    PageViewModel(
    decoration: PageDecoration(pageColor: Color(0xFF212121)),
  title:"",
  bodyWidget: Container(
    child: Column(
      spacing: 15,
      children: [
        Image.asset("assets/intro_screen/islami_logo.png",height: 150,),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset("assets/intro_screen/welcome.png",height: 400,),
        ),
        Text("Welcome To Islami App",style: TextStyle(color: AppColors.yellow,fontFamily: 'Janna',fontSize: 24),)
      ],
    ),
  )
  ),
    PageViewModel(
        decoration: PageDecoration(pageColor: Color(0xFF212121)),
        title:"",
        bodyWidget: Container(
          child: Column(
            spacing: 15,
            children: [
              Image.asset("assets/intro_screen/islami_logo.png",height: 150,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset("assets/intro_screen/kabba.png",height: 400,),
              ),
              Text("Welcome To Islami",style: TextStyle(color: AppColors.yellow,fontFamily: 'Janna',fontSize: 24,),),
              Text("We Are Very Excited To Have You In Our Community",style: TextStyle(color: AppColors.yellow,fontFamily: 'Janna',fontSize: 18,),textAlign: TextAlign.center,)
            ],
          ),
        )
    ),
    PageViewModel(
        decoration: PageDecoration(pageColor: Color(0xFF212121)),
        title:"",
        bodyWidget: Container(
          child: Column(
            spacing: 15,
            children: [
              Image.asset("assets/intro_screen/islami_logo.png",height: 150,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset("assets/intro_screen/reading.png",height: 400,),
              ),
              Text("Reading The Quran",style: TextStyle(color: AppColors.yellow,fontFamily: 'Janna',fontSize: 24,),),
              Text("Read, and your Lord is the Most Generous",style: TextStyle(color: AppColors.yellow,fontFamily: 'Janna',fontSize: 18,),textAlign: TextAlign.center,)
            ],
          ),
        )
    ),
    PageViewModel(
        decoration: PageDecoration(pageColor: Color(0xFF212121)),
        title:"",
        bodyWidget: Container(
          child: Column(
            spacing: 15,
            children: [
              Image.asset("assets/intro_screen/islami_logo.png",height: 150,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset("assets/intro_screen/bearish.png",height: 400,),
              ),
              Text("Bearish",style: TextStyle(color: AppColors.yellow,fontFamily: 'Janna',fontSize: 24,),),
              Text("Praise the nameof your Lord, the Most High",style: TextStyle(color: AppColors.yellow,fontFamily: 'Janna',fontSize: 18,),textAlign: TextAlign.center,)
            ],
          ),
        )
    ),
    PageViewModel(
        decoration: PageDecoration(pageColor: Color(0xFF212121)),
        title:"",
        bodyWidget: Container(
          child: Column(
            spacing: 15,
            children: [
              Image.asset("assets/intro_screen/islami_logo.png",height: 150,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset("assets/intro_screen/radio.png",height: 400,),
              ),
              Text("Holy Quran Radio",style: TextStyle(color: AppColors.yellow,fontFamily: 'Janna',fontSize: 24,),),
              Text("You can listen to the holy Quran Radio through the application for free and easily",style: TextStyle(color: AppColors.yellow,fontFamily: 'Janna',fontSize: 18,),textAlign: TextAlign.center,)
            ],
          ),
        )
    )
  ];

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
     return IntroductionScreen(
      pages: Pages,
       showBackButton: true,
       back: Text("Back",style: TextStyle(color: AppColors.yellow,fontFamily:'Janna'),),
      next: Text("Next",style: TextStyle(color: AppColors.yellow,fontFamily:'Janna'),),
      done: Text("Finish",style: TextStyle(color: AppColors.yellow,fontFamily:'Janna'),),
       globalBackgroundColor: AppColors.black,
      onDone: () {
      Navigator.pushNamed(context, AppRoutes.dashroutename);
      },
      dotsDecorator: DotsDecorator(
        size: Size.square(10.0),
        activeSize: Size(20.0, 10.0),
        activeColor: AppColors.yellow,
        color: Colors.grey.shade700,
        spacing: EdgeInsets.symmetric(horizontal: 3.0),
        activeShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25.0)
        ),
      ),
    );
  }
}
