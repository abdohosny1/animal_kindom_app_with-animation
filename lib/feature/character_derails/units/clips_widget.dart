import 'package:animal_kindom/feature/character_derails/units/roundcontainer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class  Clipswidget extends StatelessWidget {
  const Clipswidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Column(
            children: [
              roundcontainer(Colors.redAccent),
              SizedBox(height: 20,),
              roundcontainer(Colors.greenAccent),

            ],
          ),
          SizedBox(width: 16,),
          Column(
            children: [
              roundcontainer(Colors.orangeAccent),
              SizedBox(height: 20,),
              roundcontainer(Colors.purple),

            ],
          ),
          SizedBox(width: 16,),
          Column(
            children: [
              roundcontainer(Colors.grey),
              SizedBox(height: 20,),
              roundcontainer(Colors.blueGrey),

            ],
          ),
          SizedBox(width: 16,),
          Column(
            children: [
              roundcontainer(Colors.lightGreenAccent),
              SizedBox(height: 20,),
              roundcontainer(Colors.pinkAccent),

            ],
          ),
          SizedBox(width: 16,),
          Column(
            children: [
              roundcontainer(Colors.deepOrange),
              SizedBox(height: 20,),
              roundcontainer(Colors.lightBlueAccent),

            ],
          ),

        ],
      ),


    );
  }
}
