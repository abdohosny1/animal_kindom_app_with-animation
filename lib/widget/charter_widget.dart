import 'package:animal_kindom/cort/model/character.dart';
import 'package:animal_kindom/const/styleguide.dart';
import 'package:animal_kindom/feature/character_derails/view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart ';
import 'package:flutter/material.dart';


class CharterWidget extends StatelessWidget{

  final Charcater? charcater;

  final PageController? pageController;
   final int? currentpage;


  CharterWidget({this.charcater,this.pageController,this.currentpage}) ;

  @override
  Widget build(BuildContext context) {
    final ScreenHiggt=MediaQuery.of(context).size.height;
    final Screenwidtg=MediaQuery.of(context).size.width;


    // TODO: implement build
   return InkWell(
     onTap: (){
       Navigator.push(context, PageRouteBuilder(

         transitionDuration: const Duration(microseconds: 350),
         pageBuilder: (context, _, __) => CharacterDetailsScreen(charcater:charcater),


       ));
     },
     child: AnimatedBuilder(
       animation: pageController!,
       builder: (context,child){

         double value=1;

         if(pageController!.position.haveDimensions){
           value=pageController!.page! - (currentpage!);
           value=(1-(value.abs() *0.6)).clamp(0.0, 1.0);
           if(currentpage==0) print(value);
         }

         return Stack(
           children: [
             Align(
               alignment: Alignment.bottomCenter,
               child: ClipPath(
                 clipper:CharacterBackground() ,
                 child: Hero(
                   tag: "background -${charcater!.name}",
                   child: Container(
                     height: 0.6 *ScreenHiggt,
                     width: 0.9 *Screenwidtg,
                     decoration: BoxDecoration(
                         gradient: LinearGradient(
                           colors: charcater!.colors!,
                           begin: Alignment.topRight,
                           end: Alignment.bottomLeft,
                         )
                     ),
                   ),
                 ),
               ),
             ),
             Align(
               alignment: Alignment(0,-0.5),
               child: Hero(

                 tag: "image -${charcater!.name}",

                 child: Image.asset(
                   charcater!.imagpath!,
                   height: ScreenHiggt *0.55 * value,
                 ),
               ),
             ),
             Padding(
               padding: const EdgeInsets.only(left: 28,right: 16,bottom: 16),
               child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 mainAxisAlignment: MainAxisAlignment.end,
                 children: [
                   Hero(
                     tag: "name -${charcater!.name}",


                     child: Material(
                       color: Colors.transparent,
                       child: Container(
                         child: Text(
                           charcater!.name!,style: APPThem.heading,),
                       ),
                     ),
                   ),
                   Text( "Tap to Read More",style: APPThem.subgeading,),
                 ],
               ),
             )
           ],
         );
       },

     ),
   );
  }

}

class CharacterBackground extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {

    Path path =Path();
    double curvedis=40;

    path.moveTo(0, size.height * 0.4);
    path.lineTo(0, size.height - curvedis);
    path.quadraticBezierTo(1, size.height-1, curvedis,size.height);
    path.lineTo(size.width - curvedis,size.height );
    path.quadraticBezierTo(size.width+1, size.height-1, size.width, size.height-curvedis);
    path.lineTo(size.width, 0+curvedis);
    path.quadraticBezierTo(size.width -1, 0, size.width-curvedis -5,0+curvedis/3);
    path.lineTo(curvedis, size.height *0.29);
    path.quadraticBezierTo(1, (size.height*0.30)+10, 0, size.height *0.4);


   return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
   return true;
  }
  
}