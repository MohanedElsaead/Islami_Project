import 'package:flutter/cupertino.dart';
import 'package:islami_project/util/app_styles.dart';

class Hadithtext extends StatelessWidget {
  final String text;
  final TextStyle textStyle;
  const Hadithtext({super.key,required this.text,required this.textStyle});

  @override
  Widget build(BuildContext context) {
    return Text(text,style: textStyle,textAlign: TextAlign.center,);
  }
}
