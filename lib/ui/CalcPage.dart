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
            children: <Widget>[
              Consumer<CalcPageProvider>(builder: (context,calc,child){
               return Padding(padding: EdgeInsets.only(top: 30),
                  child: TextField(
                    controller: TextEditingController(text: calc.str),
                    textDirection: TextDirection.rtl,
                    style: TextStyle(
                      fontFamily: "Roboto",
                      fontSize: 26
                    ),
                    inputFormatters: [
                      FilteringTextInputFormatter.deny(RegExp('[a-zA-Zа-яA-Я]'))
                    ],


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
          FocusScope.of(context).unfocus();
          int t = int.tryParse(val);
          if(t == null){
            print(val);
          }
          else{
            calc.numberPressed(val);
            print(val);
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
        GridButtonItem(title: "8",color: Colors.white,),
        GridButtonItem(title: "Х",),
      ],
      [
        GridButtonItem(title: "4",color: Colors.white,),
        GridButtonItem(title: "5",color: Colors.white,),
        GridButtonItem(title: "6",color: Colors.white,),
        GridButtonItem(title: "-"),
      ],
      [
        GridButtonItem(title: "1",color: Colors.white,),
        GridButtonItem(title: "2",color: Colors.white,),
        GridButtonItem(title: "3",color: Colors.white,),
        GridButtonItem(title: "+",),
      ],
      [
        GridButtonItem(title: "000",color: Colors.white,),
        GridButtonItem(title: "0",color: Colors.white,),
        GridButtonItem(title: ".",color: Colors.white,),
        GridButtonItem(title: "=",color: Colors.blue,
        longPressValue: "400"),
      ],

    ]);
  }
}
