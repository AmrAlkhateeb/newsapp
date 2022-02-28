import 'package:flutter/material.dart';
import 'package:news_app/constants.dart';
import 'package:news_app/view/screenes/catageoryscreen.dart';

class CatrgroyButton extends StatelessWidget {

   Color buttoncolor ;
   String textcategroy ;

  CatrgroyButton({required this.buttoncolor , required this.textcategroy});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 2.5 ,horizontal: 2.5),
      child:   RaisedButton(onPressed: ()
      {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) =>  CatageroyScreen(textcategroy)));
      },
        shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        color: buttoncolor,
        child: Text("$textcategroy",style:
        TextStyle(fontSize: fontlarge,fontWeight: FontWeight.bold,color: textColor),

        ),
      ),
    );
  }
}
