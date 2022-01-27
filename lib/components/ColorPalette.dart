// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors, file_names, camel_case_types, non_constant_identifier_names
import 'package:flutter/material.dart';
import 'package:color_generator/models/myColor.dart';

class colorPalette extends StatelessWidget {
  final dynamic color;
  const colorPalette({
    required this.color,
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
    margin: EdgeInsets.only(top: 15,left: 10,right: 10),
    padding: EdgeInsets.only(top: 15,bottom: 15),
    width: 190,
     decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
          
        ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        color==null?CircularProgressIndicator():Container(
        height: 200,
        width: 150,
        decoration: BoxDecoration(
          color: Color.fromRGBO(color.r, color.g, color.b, 1),
          borderRadius: BorderRadius.circular(18),
          
        ),
        ),
        color!=null?Container(
          margin: EdgeInsets.only(top:5),
          height: 30,
          width: 100,
          decoration: BoxDecoration(
          color: Color(0XFF001D4A).withOpacity(0.7),
          borderRadius: BorderRadius.circular(18),
          
        ),
          alignment: Alignment.center,
          child: SelectableText(
            color.hex.toString(),
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold
            ),
          ),
        ):Text("")
      ],
    ),

                    );
  }
}

