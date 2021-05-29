import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_grid_button/flutter_grid_button.dart';
import 'package:op_tracker/ui/CalcPageProvider.dart';
import 'package:provider/provider.dart';

class CalcPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body:ChangeNotifierProvider(
        create: (_)=>CalcPageProvider(),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Consumer<CalcPageProvider>(builder: (context,calc,child){
               return Padding(padding: EdgeInsets.only(top: 30),
                  child: Text(
                    calc.str,
                    textDirection: TextDirection.ltr,
                    style: TextStyle(
                      fontFamily: "Roboto",
                      fontSize: 26
                    ),


                  )
               );
              },

              ),
              Expanded(child: KeyBoard(),flex: 1,),
            ],
          ),
        ) ,
      )
    );
  }
}
class KeyBoard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var calc = context.watch<CalcPageProvider>();
    return GridButton(
        textStyle: TextStyle(color:Colors.black,fontSize: 24,fontFamily: "RobotoMono" ),
        onPressed: (val){
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
          FocusScope.of(context).unfocus();
          calc.buttonPressed(val);
          if(val == "codeToList"|| val == "listToCode"){
            final sb =  SnackBar(
              content: InkWell(
                child: Text(calc.ans),
                onTap: () {ScaffoldMessenger.of(context).hideCurrentSnackBar();},
              ),
              duration: Duration(seconds: 10),
            );
            ScaffoldMessenger.of(context).showSnackBar(sb);
          }
        },
        items: [
      [
        GridButtonItem(title: "%",),
        GridButtonItem(title: "CE",),
        GridButtonItem(title: "C",),
        GridButtonItem(title: "⌫",),
      ],
      [
        GridButtonItem(title: "1/x",),
        GridButtonItem(title: "^",),
        GridButtonItem(title: "√",),
        GridButtonItem(title: "/",),
      ],
      [
        GridButtonItem(title: "7",color: Colors.white,),
        GridButtonItem(title: "8",color: Colors.white,),
        GridButtonItem(title: "9",color: Colors.white,),
        GridButtonItem(title: "X",),
      ],
      [
        GridButtonItem(title: "4",color: Colors.white,),
        GridButtonItem(title: "5",color: Colors.white,),
        GridButtonItem(title: "6",color: Colors.white,),
        GridButtonItem(title: "-",longPressValue: "listToCode"),
      ],
      [
        GridButtonItem(title: "1",color: Colors.white,),
        GridButtonItem(title: "2",color: Colors.white,),
        GridButtonItem(title: "3",color: Colors.white,),
        GridButtonItem(title: "+",longPressValue: "codeToList"),
      ],
      [
        GridButtonItem(title: "000",color: Colors.white,),
        GridButtonItem(title: "0",color: Colors.white,),
        GridButtonItem(title: ".",color: Colors.white,),
        GridButtonItem(title: "=",color: Colors.blue,textStyle: TextStyle(color: Colors.white, fontSize: 24),
        longPressValue: "codeToOpers"),
      ],

    ]);
  }
}
