import 'age_calculator.dart';
import 'package:flutter/material.dart';
class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState(){
    super.initState();
    debugPrint(" Inside initstate");
    Future.delayed(Duration(seconds: 3),(){
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context)=>AgeCalculatorPage(),));
    });



  }@override
  void dispose(){
    debugPrint(" Inside dispose");
    super.dispose();



  }
  @override
  void deactivate(){
    debugPrint(" Inside deactivate");
    super.deactivate();



  }

  @override
  void didChangeDependencies(){
    debugPrint(" Inside didChangeDependencies");
    super.didChangeDependencies();



  }
  Widget build(BuildContext context){
    return Scaffold(
      body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(child: Icon(Icons.calendar_month_outlined,size: 200.0,color: Colors.blueGrey)),
            ],
          )),
    );
  }
}