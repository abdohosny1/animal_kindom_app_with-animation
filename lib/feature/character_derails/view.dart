import 'package:after_layout/after_layout.dart';
import 'package:animal_kindom/const/styleguide.dart';
import 'package:animal_kindom/cort/model/character.dart';
import 'package:animal_kindom/feature/character_derails/units/clips_widget.dart';
import 'package:animal_kindom/feature/character_derails/units/roundcontainer.dart';
import 'package:flutter/material.dart';


class CharacterDetailsScreen extends StatefulWidget{

  final Charcater? charcater;

  final double _expandedBottom=0;
  final double _collpsedBottom=-250;
  final double _fullcollpsedBottom=-330;


    CharacterDetailsScreen({this.charcater}) ;

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _CharacterDetailsScreen();
  }

}

class _CharacterDetailsScreen extends State<CharacterDetailsScreen> with AfterLayoutMixin <CharacterDetailsScreen>{
  double _currentBottomSgeet=-330;
  bool isCallpsed =false;

  @override
  Widget build(BuildContext context) {
    final ScreenHight=MediaQuery.of(context).size.height;
    // TODO: implement build
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Hero(
            tag: "background -${widget.charcater!.name}",
            child: DecoratedBox(
                decoration:BoxDecoration(

                    gradient: LinearGradient(
                      colors: widget.charcater!.colors!,
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,


                    )

                )
            ),
          ),
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 40,),
                Padding(padding: const EdgeInsets.only(top: 8,left: 16),
                  child:  IconButton(
                    icon:Icon( Icons.close),
                    iconSize: 40,
                    color: Colors.white.withOpacity(0.9),
                    onPressed: (){
                      Future.delayed(const Duration(microseconds: 250), ( ){
                        setState(() {

                          _currentBottomSgeet=widget._fullcollpsedBottom;
                        });

                      });

                      Navigator.pop(context);

                    },
                  ),


                ),
                Align(
                    alignment: Alignment.topRight,
                    child: Hero(
                        tag: "image -${widget.charcater!.name}",

                        child: Image.asset(widget.charcater!.imagpath!,height:ScreenHight * 0.45,))
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32 ,vertical: 8),
                  child: Hero(
                    tag: "name -${widget.charcater!.name}",

                    child: Material(
                      color: Colors.transparent,
                      child: Container(
                        child: Text(
                          widget.charcater!.name!,style: APPThem.heading,),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(32, 0,8,16),
                  child: Text(widget.charcater!.descriparion!,style: APPThem.subgeading,),
                ),

              ],
            ),
          ),
          AnimatedPositioned(
              duration: const Duration(microseconds: 500),
              curve: Curves.decelerate,
              bottom: _currentBottomSgeet,
              left: 0,
              right: 0,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(40),topRight: Radius.circular(40)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: _ontap ,
                      child: Container(
                        alignment: Alignment.centerLeft ,
                        padding:  const EdgeInsets.symmetric(horizontal: 32),
                        height: 80,
                        child: Text("Clips",style:APPThem.subgeading.copyWith(color: Colors.black)),
                      ),
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Clipswidget(),
                    )
                  ],
                ),
              )
          ),

        ],

      ),
    );
  }

  @override
  void afterFirstLayout(BuildContext context) {
    Future.delayed(const Duration(microseconds: 500),(){
      setState(() {
        isCallpsed=true;
        _currentBottomSgeet=widget._collpsedBottom;
      });

    });


  }



  _ontap(){
    setState(() {
      _currentBottomSgeet =isCallpsed ? widget._expandedBottom :widget._collpsedBottom;
      isCallpsed= !isCallpsed;
    });
  }
}

