
import 'package:animal_kindom/const/styleguide.dart';
import 'package:animal_kindom/cort/model/character.dart';
import 'package:animal_kindom/widget/charter_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CharacterListView extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _CharacterListView();
  }
}

class _CharacterListView extends State<CharacterListView>
{

late  PageController _pageController;
  int currentpage=0;


  @override
  void initState() {
    super.initState();
    _pageController =PageController(
      viewportFraction: 1.0,
      initialPage: currentpage,
      keepPage: false,
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Icon(Icons.arrow_back_ios,color: Colors.black,),
        actions: [
          Padding(padding: const EdgeInsets.only(right: 16),child: Icon(Icons.search,color: Colors.black,),)
        ],
      ),
      body: SafeArea(

        child: Padding(
          padding: const EdgeInsets.only(right: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 32,top: 8),
                child: RichText(
                    text: TextSpan(
                        children: [
                          TextSpan(text: "Animals Kingdom", style: APPThem.display1),
                          TextSpan(text: "\n"),
                          TextSpan(text: "Characters", style: APPThem.display2),
                        ]

                    )
                ),
              ),
              Expanded(


                  child: PageView(
                    physics: ClampingScrollPhysics(),
                    controller: _pageController,
                    children: [
                      for(var i=0; i<Charcaters.length;i++ )
                        CharterWidget(charcater: Charcaters[i],pageController :_pageController,currentpage :i),
                    ],

                  )
              ),

            ],
          ),
        ),
      ),
    );
  }

}