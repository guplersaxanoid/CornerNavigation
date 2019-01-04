import 'package:flutter/material.dart';
import 'dart:math';
import 'package:flutter/animation.dart';

void main() => runApp(MyApp());



class MyApp extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyAppState();
  }
}

class MyAppState extends State {
  List<Widget> pages =[
    Center(child: CircleAvatar(backgroundColor: Color.fromRGBO(55, 246, 255, 1.0),radius:30.0,child: CircleAvatar(backgroundColor: Color.fromRGBO(28, 50, 78, 1.0),radius: 28.0,child: Text("1")),),),
    Center(child: CircleAvatar(backgroundColor: Color.fromRGBO(55, 246, 255, 1.0),radius:30.0,child: CircleAvatar(backgroundColor: Color.fromRGBO(28, 50, 78, 1.0),radius: 28.0,child: Text("2")),),),
    Center(child: CircleAvatar(backgroundColor: Color.fromRGBO(55, 246, 255, 1.0),radius:30.0,child: CircleAvatar(backgroundColor: Color.fromRGBO(28, 50, 78, 1.0),radius: 28.0,child: Text("3")),),),
    Center(child: CircleAvatar(backgroundColor: Color.fromRGBO(55, 246, 255, 1.0),radius:30.0,child: CircleAvatar(backgroundColor: Color.fromRGBO(28, 50, 78, 1.0),radius: 28.0,child: Text("4")),),),
    Center(child: CircleAvatar(backgroundColor: Color.fromRGBO(55, 246, 255, 1.0),radius:30.0,child: CircleAvatar(backgroundColor: Color.fromRGBO(28, 50, 78, 1.0),radius: 28.0,child: Text("5")),),),
    Center(child: CircleAvatar(backgroundColor: Color.fromRGBO(55, 246, 255, 1.0),radius:30.0,child: CircleAvatar(backgroundColor: Color.fromRGBO(28, 50, 78, 1.0),radius: 28.0,child: Text("6")),),),
    Center(child: CircleAvatar(backgroundColor: Color.fromRGBO(55, 246, 255, 1.0),radius:30.0,child: CircleAvatar(backgroundColor: Color.fromRGBO(28, 50, 78, 1.0),radius: 28.0,child: Text("7")),),),
    Center(child: CircleAvatar(backgroundColor: Color.fromRGBO(55, 246, 255, 1.0),radius:30.0,child: CircleAvatar(backgroundColor: Color.fromRGBO(28, 50, 78, 1.0),radius: 28.0,child: Text("8")),),),
    Center(child: CircleAvatar(backgroundColor: Color.fromRGBO(55, 246, 255, 1.0),radius:30.0,child: CircleAvatar(backgroundColor: Color.fromRGBO(28, 50, 78, 1.0),radius: 28.0,child: Text("9")),),),

  ];
  List<Icon> iconItem = [
    Icon(Icons.home,color: Colors.white,),
    Icon(Icons.motorcycle,color: Colors.white,),
    Icon(Icons.local_hotel,color:Colors.white),
    Icon(Icons.palette,color: Colors.white),
    Icon(Icons.book,color: Colors.white),
    Icon(Icons.mail_outline,color: Colors.white),
    Icon(Icons.verified_user,color: Colors.white),
    Icon(Icons.business_center,color: Colors.white),
    Icon(Icons.watch_later,color: Colors.white),
  ];
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Color.fromRGBO(28, 50, 78, 0.5),
      ),
      home: Navigation(pages,iconItem,Color.fromRGBO(28, 50, 78, 1.0),Color.fromRGBO(28, 50, 78, 0.5)),
    );
  }
}


AnimationController controller;
Tween<double> radiusTween;
Animation<double> animation;
int index = 0;

class Navigation extends StatefulWidget {
  List<Widget> pages ;
  List<Icon> icon ;
  Color holderColor;
  Color backColor;

  Navigation(List<Widget> p,List<Icon> i,this.holderColor,this.backColor){
    pages = new List<Widget>.from(p);
    icon = new List<Icon>.from(i);
  }
  @override
  NavigationState createState() => NavigationState(pages,icon,holderColor,backColor);
}

class NavigationState extends State<Navigation> with SingleTickerProviderStateMixin{
  int c;
  List<Widget> pages;
  List<Icon> icon ;
  Color holderColor;
  Color backColor;

  NavigationState(List<Widget> p,List<Icon> i,this.holderColor,this.backColor){
    pages = new List<Widget>.from(p);
    icon = new List<Icon>.from(i);
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    index = 0;
    c = 0;
    radiusTween = Tween(begin: 0.0, end: 1.0);
    animation = radiusTween.animate(controller)..addListener((){setState(() {

    });});
  }

  void changeData(){
   if(c == 0){
     setState(() {
       c = 1;
     });
     controller.forward();
   }
   else{
     setState(() {
       c = 0;
       controller.reverse();
     });
   }
  }

  @override
  void dispose(){
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final w = MediaQuery.of(context).size.width*0.8;
    
    return Scaffold(
      body: Align(
        alignment: FractionalOffset(1.0, 1.0),
        child: Stack(
          children: <Widget>[
            pages[index],
            CustomPaint(
            child: Container(
              height: animation!=null?animation.value*w:0.0,
              width: animation!=null?animation.value*w:0.0,
              child: Stack(
                fit: StackFit.expand,
                children: <Widget>[
                  GestureDetector(onTap: (){setState(() {
                    index = 0;
                  });},
                      child: NavigationItem(w,  icon[0]??Icon(Icons.motorcycle),holderColor, 1)),
                  GestureDetector(onTap: (){setState(() {
                    index = 1;
                  });},
                      child: NavigationItem(w,  icon[1], holderColor,2)),
                  GestureDetector(onTap: (){setState(() {
                    index = 2;
                  });},
                      child: NavigationItem(w,  icon[2],holderColor,3)),
                  GestureDetector(onTap: (){setState(() {
                    index = 3;
                  });},
                      child: NavigationItem(w,  icon[3],holderColor,4)),
                  GestureDetector(onTap: (){setState(() {
                    index = 4;
                  });},
                      child: NavigationItem(w, icon[4], holderColor,5)),
                  GestureDetector(onTap: (){setState(() {
                    index = 5;
                  });},
                      child: NavigationItem(w,  icon[5], holderColor,6)),
                  GestureDetector(onTap: (){setState(() {
                    index = 6;
                  });},
                      child: NavigationItem(w,  icon[6]??Icon(Icons.pages), holderColor,7)),
                  GestureDetector(onTap: (){setState(() {
                    index = 7;
                  });},
                      child: NavigationItem(w,  icon[7], holderColor,8)),
                  GestureDetector(onTap: (){setState(() {
                    index = 8;
                  });},
                      child: NavigationItem(w,  icon[8], holderColor,9)),
                ],

              ),
            ),
            painter: NavigationPainter(animation,backColor),
          ),
            Align(
              alignment: FractionalOffset(0.9, 0.95),
              child: GestureDetector(
                onTap: (){
                  changeData();
                },
                child: CircleAvatar(
                  child: CircleAvatar(
                    child: animation!=null?(animation.value == 0.0?Icon(Icons.menu):Icon(Icons.close)):Icon(Icons.menu),
                    backgroundColor: Theme.of(context).scaffoldBackgroundColor.withOpacity(1.0),
                    radius: MediaQuery.of(context).size.width*0.07,
                  ),
                  radius: MediaQuery.of(context).size.width*0.07 + 2.0,
                  backgroundColor: animation!=null?(animation.value == 0.0?Colors.green:Colors.red):Colors.green,
                ),
              ),
            ),
        ],
          alignment: AlignmentDirectional.bottomEnd,
        )
      ),
    );
  }


}

class NavigationItem extends StatefulWidget{
  final double w;
  final Widget child;
  final Color holderColor;
  final int n;
  NavigationItem(this.w,this.child,this.holderColor,this.n);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return NavigationItemState(w,child,holderColor,n);
  }
}

class NavigationItemState extends State{
  final double w;
  final Widget child;
  final Color holderColor;
  final int n;

  NavigationItemState(this.w,this.child,this.holderColor,this.n);
  @override
  Widget build(BuildContext context) {
    var canvasWidth = animation!=null?animation.value*w:0.0;
    // TODO: implement build
    return Align(
      child: CustomPaint(child: child,
          painter: NavigationPlaceHolder(holderColor),
      ),
      alignment: (n%2==1)?FractionalOffset(1.02 - canvasWidth*0.9*cos(n*3.141/20)/(w), 1.02 - canvasWidth*0.9*sin(n*3.141/20)/(w)):FractionalOffset(1 - canvasWidth*0.9*cos(n*3.141/20)/(w*1.4), 1 - canvasWidth*0.9*sin(n*3.141/20)/(w*1.4)));

  }
}


class NavigationPainter extends CustomPainter{
  final Animation animation;
  final Color backgroundColor;
  NavigationPainter(this.animation,this.backgroundColor): super(repaint: animation);
  @override
  void paint(Canvas canvas, Size size){
    canvas.drawCircle(Offset(size.width, size.height), animation!=null?size.width:0.0, Paint()..color = backgroundColor);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return false;
  }
}

class NavigationPlaceHolder extends CustomPainter{
  final Color holderColor;
  NavigationPlaceHolder(this.holderColor);
  @override
  void paint(Canvas canvas, Size size){
            canvas.drawCircle(
            Offset(size.width/2,size.width/2),
            size.width, Paint()
          ..color = holderColor);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return false;
  }
}