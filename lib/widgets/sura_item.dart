import 'package:flutter/cupertino.dart';
import 'package:islami_project/util/app_styles.dart';
import 'package:islami_project/util/appcolors.dart';

class SuraItem extends StatelessWidget {
  final String content;
  final int index;

  const SuraItem({super.key,required this.content,required this.index});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: AppColors.yellow,
            width: 2,
          )
        ),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Center(
            child: Text("[${index+1}] $content",style: AppStyles.Bold20Black.copyWith(
              color: AppColors.yellow,
            ),textAlign: TextAlign.center,textDirection: TextDirection.rtl,),
          ),
        ),
      ),
    );
  }
}
