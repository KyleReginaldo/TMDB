import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomOswaldText extends StatelessWidget {
  const CustomOswaldText({
    Key? key,
    required this.text,
    this.fontSize,
    required this.color,
    this.weight,
    this.maxlines,
    this.overflow,
    this.softWrap,
    this.bgColor,
  }) : super(key: key);
  final String text;
  final double? fontSize;
  final Color color;
  final FontWeight? weight;
  final int? maxlines;
  final TextOverflow? overflow;
  final bool? softWrap;
  final Color? bgColor;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.oswald(
        color: color,
        fontSize: fontSize,
        fontWeight: weight,
        backgroundColor: bgColor,
      ),
      maxLines: maxlines,
      overflow: overflow,
      softWrap: softWrap,
    );
  }
}
