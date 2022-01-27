// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors

import 'dart:async';
import 'dart:math';

import 'package:color_generator/components/ColorPalette.dart';
import 'package:color_generator/models/myColor.dart';
import 'package:flutter/material.dart';

var rnd = Random();
void main() {

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,

    home: Home(),
  ));
}


class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int palettes = 1;
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    Orientation orientation = MediaQuery.of(context).orientation;
    Size screenSize = MediaQuery.of(context).size; 
    return Scaffold(
      appBar: (!isLoading)?AppBar(
        title: Text("Random Color Palette Generator 1.0"),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Color.fromRGBO(rnd.nextInt(255), rnd.nextInt(255), rnd.nextInt(255), 1),
      ):null,
      backgroundColor: Color(0xFFF7F1F1),
      body: RefreshIndicator(
        color:  Color.fromRGBO(rnd.nextInt(255), rnd.nextInt(255), rnd.nextInt(255), 1),
         onRefresh: () async {
              setState(() {
                            isLoading=true;
                          });
                          Timer(Duration(seconds: 4),(){
                              setState(() {
                                isLoading=false;
                              });
                            });
                            
            },
        child: SafeArea(
          child: SingleChildScrollView(
            child: Stack(
              children: [
              Visibility(
                visible: (isLoading)?false:true,
                child: Column(
                           children: [
                  FutureBuilder(
                    future: generate(palettes),
                    builder: (context, AsyncSnapshot colors){
                      if(colors.hasData){
                      return GridView.builder(
                      primary: false,
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: orientation==Orientation.landscape?4:2,
                        mainAxisExtent: 280
                      ),
                      itemCount: colors.data.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Center(
                          child:colorPalette(color: colors.data[index])
                        );
                      },
                    );
                      }else{
                        return Center(child: colorPalette(color: null),);
                      }
                    },
                    
                  ),
                  SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Spacer(),
                      GestureDetector(
                        onTap: (){
                          setState(() {
                            isLoading=true;
                          });
                          Timer(Duration(seconds: 4),(){
                              setState(() {
                                isLoading=false;
                              });
                            });
                            
                          
              
                        },
                        child: Container(
                          width: 250,
                          margin: EdgeInsets.only(right: 15),
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color:Color(0XFFd085e7),
                      
                            ),
                          alignment: Alignment.center,
                          child: Text("Generate",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24
                        )),
                      
                        ),
                      ),
                      GestureDetector(
                        onTap: (){
                          palettes+=1;
                          setState(() {
                            isLoading=true;
                          });
                          Timer(Duration(seconds: 2),(){
                              setState(() {
                                isLoading=false;
                              });
                            });
                            
                          
              
                        },
                        child: Container( 
                          margin: EdgeInsets.only(left:15,),
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color:Color(0XFFc86584),
                      
                            ),
                          alignment: Alignment.center,
                          child: Text("Add more",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24
                        )),
                      
                        ),
                      ),
                      Spacer(),
                    ],
                  ),
                  SizedBox(height: 20,),
                ],
                          ),
              ),
            (isLoading)?Positioned(
                child: Container(
                  height: screenSize.height,
                    width: screenSize.width,
                    color: Colors.black.withOpacity(0.6),
                    child: Center(
                      child: SizedBox(
                        height: 100,
                        width: 100,
                        child: CircularProgressIndicator(
                          color: Color.fromRGBO(rnd.nextInt(255), rnd.nextInt(255), rnd.nextInt(255), 1)
                        ),
                      ),
                    ),
                  ),
                ):Text(""),
              ],
            )
            
          ),
        ),
      ),
      
    );
  }
}

