import 'dart:async';

import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
void main() {
  runApp(const MyCalcy());
}
class splashScreen extends StatefulWidget{
  @override
  State<splashScreen> createState() => _splashScreenState();
}

class _splashScreenState extends State<splashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> MainPage(title: 'Dragon',)));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.redAccent,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 300,
                height: 300,
                child: Image.asset('assets/images/Logo.png'),
              ),
              Text('DRAGON CALCY', style: TextStyle(fontSize: 30, color: Colors.white,fontWeight: FontWeight.w600,fontFamily: 'Paintt'), )
            ],
          )
        ),
      ),
    );
  }
}
class MyCalcy extends StatelessWidget {
  const MyCalcy({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dragon Calcy',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: splashScreen(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key, required this.title});

  final String title;

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  String Equi="0";
  String Ans="0";
  String Expre="";

pressing(String tt){
  setState(() {
    if(tt=="C"){
      Equi="0";
      Ans="0";
    }
    else if(tt=="⌫"){
      if(Equi.length==1){
        Equi="0";
      }
      else {
        Equi = Equi.substring(0, Equi.length - 1);
      }
    }
    else if(tt=="="){
      Expre=Equi;
      try{
        Parser p= Parser();
        Expression Exp= p.parse(Expre);
        ContextModel cm=ContextModel();
        Ans="${Exp.evaluate(EvaluationType.REAL, cm)}";
      }catch(e){
        Ans="Syntax Error";
      }
    }
    else{
      if(Equi=="0"){
        Equi=tt;
      }
      else{
        if(Ans=='0') {
          Equi = Equi + tt;
        }
        else{
          Equi = Ans+tt;
          Ans='0';
        }
      }
    }
  });
}
  Widget addButton(String I,String tt,double buttonHeight, Color buttonColor){
    return InkWell(
      child: Container(
        height: MediaQuery.of(context).size.width*0.2*buttonHeight,
        decoration: BoxDecoration(
            color: buttonColor,
            borderRadius: BorderRadius.circular(0),
            border: Border.all(
                width: 2,
                color: Colors.white
            )
        ),
        padding: EdgeInsets.all(16.0),
        child: Image.asset(I),
      ),
      onTap: (){
        pressing(tt);
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: const Text("Dragon's Calcy"),
      ),
      body: Container(
        color: Colors.indigo.shade50,
        child: Column(
          children: [
            Container(
              alignment: Alignment.centerRight,
              padding: EdgeInsets.fromLTRB(10, 20, 20, 0),
              child: Text(Equi,style: TextStyle(fontSize: 38)),
            ),
            Container(
              alignment: Alignment.centerRight,
              padding: EdgeInsets.fromLTRB(10, 20, 20, 0),
              child: Text(Ans,style: TextStyle(fontSize: 50)),
            ),
            Expanded(child: Divider()),
            Row(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width*0.75,
                  child: Table(
                    children: [
                      TableRow(
                        children: [
                          addButton('assets/images/Clear.png',"C", 1, Colors.redAccent.shade100),
                          addButton('assets/images/Back.png',"⌫", 1, Colors.deepPurple.shade200),
                          addButton('assets/images/Divide.png',"/", 1, Colors.deepPurple.shade200),
                        ]
                      ),
                      TableRow(
                          children: [
                            addButton('assets/images/Num_7.png',"7", 1, Colors.indigo.shade200),
                            addButton('assets/images/Num_8.png',"8", 1, Colors.indigo.shade200),
                            addButton('assets/images/Num_9.png',"9", 1, Colors.indigo.shade200),
                          ]
                      ),
                      TableRow(
                          children: [
                            addButton('assets/images/Num_4.png',"4", 1, Colors.indigo.shade200),
                            addButton('assets/images/Num_5.png',"5", 1, Colors.indigo.shade200),
                            addButton('assets/images/Num_6.png',"6", 1, Colors.indigo.shade200),
                          ]
                      ),
                      TableRow(
                          children: [
                            addButton('assets/images/Num_1.png',"1", 1, Colors.indigo.shade200),
                            addButton('assets/images/Num_2.png',"2", 1, Colors.indigo.shade200),
                            addButton('assets/images/Num_3.png',"3", 1, Colors.indigo.shade200),
                          ]
                      ),
                      TableRow(
                          children: [
                            addButton('assets/images/Dot.png',".", 1, Colors.indigo.shade200),
                            addButton('assets/images/Num_0.png',"0", 1, Colors.indigo.shade200),
                            addButton('assets/images/Num_00.png',"00", 1, Colors.indigo.shade200),
                          ]
                      )
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width*0.25,
                  child: Table(
                    children: [
                      TableRow(
                        children: [
                          addButton('assets/images/Mul.png',"*", 1, Colors.deepPurple.shade200),
                        ]
                      ),
                      TableRow(
                          children: [
                            addButton('assets/images/Plus.png',"+", 1, Colors.deepPurple.shade200),
                          ]
                      ),
                      TableRow(
                          children: [
                            addButton('assets/images/Minus.png',"-", 1, Colors.deepPurple.shade200),
                          ]
                      ),
                      TableRow(
                          children: [
                            addButton('assets/images/Equal.png',"=", 2, Colors.redAccent.shade100),
                          ]
                      ),
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
