import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget roundcontainer(Color color){

  return InkWell(

    onTap: ()=>print('$color'),
    child: Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.all(Radius.circular(20)),

      ),
    ),
  );
}