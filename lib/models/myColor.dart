// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors, file_names, camel_case_types, unnecessary_new

import 'dart:math';

import 'package:flutter/material.dart';

//List<MyColor> myColors =[generate(),generate()];

class MyColor {

String hex;
int r,g,b;

MyColor({
  required this.hex,
  required this.r,
  required this.g,
  required this.b
});
}



Future<List<MyColor>> generate(int times) async{
   List<MyColor> colorsList = [];
  for(int i=0;i<times;i++){
   var rndm = Random();
  int r = rndm.nextInt(255);
  int g = rndm.nextInt(255);
  int b = rndm.nextInt(255);
  String hexStr = "${r.toRadixString(16)}${g.toRadixString(16)}${b.toRadixString(16)}".toUpperCase();
  String hex = int.parse(hexStr,radix: 16).toRadixString(16).toUpperCase();
  if(hex.length != 6){
    await generate(1);
  }
  colorsList.add(
  MyColor(hex: "#"+hex,
  r:r,
  g:g,
  b:b)
  );
  
  }
 
  return colorsList;
  }
