import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islami_project/cashe/shared_pref.dart';
import 'package:islami_project/model/quran_resources.dart';
import 'package:islami_project/ui/home/sura_detail1.dart';
import 'package:islami_project/util/app_routes.dart';
import 'package:islami_project/util/app_styles.dart';
import 'package:islami_project/util/appcolors.dart';
import 'package:islami_project/widgets/most_recently_widget.dart';
import 'package:islami_project/widgets/sura_widget.dart';

class Quran extends StatefulWidget {
  @override
  State<Quran> createState() => _QuranState();
}

class _QuranState extends State<Quran> {
  //width=430
  List<int> filterlist= List.generate(114, (index)=>index);

  @override
  Widget build(BuildContext context) {
    var width=MediaQuery.of(context).size.width;
    var height=MediaQuery.of(context).size.height;
    // TODO: implement build
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width*0.02),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: height*0.02,
          children: [
            TextField(
              style: TextStyle(
                fontFamily: "Janna",
                color: AppColors.yellow,
                fontWeight: FontWeight.bold
              ),
              onChanged: (text){
                searchbysuraname(text);
              },
              cursorColor: AppColors.yellow,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(
                    color: AppColors.yellow,
                    width: 2
                  )
                ),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(
                        color: AppColors.yellow,
                        width: 2
                    )
                ),
                prefixIcon: Image.asset("assets/icons/search.png"),
                hintText: 'Sura Name',
                hintStyle: TextStyle(
                  fontFamily: "Janna",
                  color: AppColors.yellow,
                  fontWeight: FontWeight.bold
                )
              ),
            ),
            MostRecentlyWidget(),
            Text("Suras List",style: TextStyle(fontFamily: "Janna",color: AppColors.white,fontSize: height*0.02,fontWeight: FontWeight.bold),
              textAlign: TextAlign.start,),
            filterlist.isEmpty?
                Center(child: Text("No Sura Found",style: AppStyles.Bold24White,),)
                :ListView.separated(
              shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context,index){
                  return InkWell(
                    onTap: ()async{
                      await saveLastSuraIndex(filterlist[index]);
                      await Navigator.of(context).pushNamed(AppRoutes.suradetailname,arguments: filterlist[index]);
                      setState(() {

                      });
                    },
                      child: SuraWidget(num: filterlist[index],));
                },
                separatorBuilder: (context,index){
                  return Column(
                    children: [
                      SizedBox(height: height*0.01,),
                      Divider(thickness: height*0.002,endIndent: width*0.1,indent: width*0.1,)

                    ],
                  );
                },
                itemCount: filterlist.length)
          ],
        ),
      ),
    );
  }

void searchbysuraname(String text){
List<int> searchResultList=[];
for(int i=0;i<QuranResources.englishQuranSurahs.length;i++){
  if(QuranResources.englishQuranSurahs[i].toLowerCase().contains(text.toLowerCase())){
    searchResultList.add(i);
  }
  if(QuranResources.arabicAuranSuras[i].toLowerCase().contains(text.toLowerCase())){
    searchResultList.add(i);
  }
}
filterlist=searchResultList;
setState(() {

});
}
}