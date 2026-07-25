import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_project/model/hadeethResource.dart';
import 'package:islami_project/model/hadeeth_args.dart';
import 'package:islami_project/ui/home/hadithText.dart';
import 'package:islami_project/util/app_routes.dart';
import 'package:islami_project/util/app_styles.dart';
import 'package:islami_project/util/appcolors.dart';

class HadethItem extends StatefulWidget {
  final int index;


  HadethItem({super.key,required this.index});

  @override
  State<HadethItem> createState() => _HadethItemState();
}


class _HadethItemState extends State<HadethItem> {
  Hadeeth? hadeeth;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadhadithFile();
  }

  @override
  Widget build(BuildContext context) {
    var width=MediaQuery.of(context).size.width;
    var height=MediaQuery.of(context).size.height;
    return InkWell(
      onTap: (){
        Navigator.of(context).pushNamed(AppRoutes.hadithdetailname,arguments: HadeethArgs(hadeeth_arg: hadeeth, index: widget.index));
      },
      child: Container(
        margin: EdgeInsets.only(bottom:height*0.01,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          color: AppColors.yellow,
        ),
        child: hadeeth==null?Center(child: CircularProgressIndicator(color: AppColors.yellow,),):Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Center(child: Image.asset("assets/materials/HadithCardBackGround.png")),
                Image.asset("assets/materials/Mosque.png",),
              ],
            ),
            Column(
              children: [
                Padding(
                  padding:EdgeInsets.symmetric(horizontal: width*0.02,vertical: height*0.01),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset("assets/materials/left_corner.png",width: width*0.16,),
                      Expanded(child: Hadithtext(text: hadeeth?.title??"",textStyle: AppStyles.Bold24Black,)),
                      Image.asset("assets/materials/right_corner.png",width: width*0.16),
                    ],
                  ),
                ),
                Expanded(child: Padding(
                  padding:EdgeInsets.all(8.0),
                  child: Hadithtext(text: hadeeth?.Content??"",textStyle: AppStyles.Bold16Black,),
                ))
              ],
            )
          ] ,
        ),
      ),
    );
  }

  void loadhadithFile ()async{
    String Hadith= await rootBundle.loadString('assets/Hadeeth/h${widget.index}.txt');
    String title= Hadith.substring(0,Hadith.indexOf("\n"));
    String Content=Hadith.substring(Hadith.indexOf("\n")+1);
    hadeeth=Hadeeth(title: title, Content: Content);
    setState(() {

    });
  }
}
