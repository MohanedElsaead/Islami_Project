import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_project/model/quran_resources.dart';
import 'package:islami_project/util/app_styles.dart';
import 'package:islami_project/util/appcolors.dart';
import 'package:islami_project/widgets/sura_item.dart';
import 'package:provider/provider.dart';

import '../../providers/most_recent_provider.dart';

class SuraDetail1 extends StatefulWidget {
  SuraDetail1({super.key});


  @override
  State<SuraDetail1> createState() => _SuraDetailState();
}

class _SuraDetailState extends State<SuraDetail1> {

  List<String> verses=[];
  String allverses='';
  bool isString=true;
  late MostRecentProvider mostRecentProvider;

  @override
  Widget build(BuildContext context) {
    int index=ModalRoute.of(context)?.settings.arguments as int;
    mostRecentProvider= Provider.of<MostRecentProvider>(context);
    var width=MediaQuery.of(context).size.width;
    var height=MediaQuery.of(context).size.height;
    if(verses.isEmpty)
    {
      loadSuraFile(index);
    }
    if(allverses.isEmpty){
      loadSuraFile2(index);
    }
    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: AppBar(
        backgroundColor: AppColors.black,
        iconTheme: IconThemeData(
          color: AppColors.yellow,
        ),
        centerTitle:true,
        title: Text(QuranResources.englishQuranSurahs[index],style: AppStyles.Bold24Black.copyWith(
          color: AppColors.yellow
        ),),
        actions: [
          IconButton(onPressed: (){
            isString=!isString;
            setState(() {

            });
          }, icon: isString?Icon(Icons.library_books_outlined,color: AppColors.yellow,size: 30,):Icon(Icons.library_books,color: AppColors.yellow,size: 30,))
        ],
      ),
      body: Column(
        spacing: height*0.01,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset("assets/materials/left_corner2.png"),
              Text(QuranResources.arabicAuranSuras[index],style: AppStyles.Bold24White.copyWith(
                color: AppColors.yellow,
              ),),
              Image.asset("assets/materials/right_corner2.png"),
            ],
          ),
          Expanded(child: verses.isEmpty?
              Center(child: CircularProgressIndicator(
                color: AppColors.yellow,
              ),)
              :(isString?
          SingleChildScrollView(child:
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(allverses,style: AppStyles.Bold20White.copyWith(color: AppColors.yellow),
              textDirection:TextDirection.rtl,textAlign: TextAlign.center,),
          )):
          ListView.separated(
              itemBuilder:(context,index){
                return SuraItem(content:verses[index],index: index,);
              },
              separatorBuilder: (context,index){
                return SizedBox(
                  height: height*0.01,
                );
              },
              itemCount: verses.length))
            ),
          Image.asset("assets/materials/Mosque2.png"),
        ],
      ),
      );
  }

  void loadSuraFile(int index)async{
    String fileContent = await rootBundle.loadString("assets/quran/${index+1}.txt");
    List<String> lines=fileContent.split("\n");
    verses=lines;
    setState(() {

    });
  }
  void loadSuraFile2(int index)async{
    String fileContent= await rootBundle.loadString('assets/quran/${index+1}.txt');
    List<String> lines = fileContent.split("\n");
    for(int i=0;i<lines.length;i++){
      lines[i]+="[${i+1}]";
    }
    allverses=lines.join(' ');

  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    mostRecentProvider.readMostRecent();
  }
}
