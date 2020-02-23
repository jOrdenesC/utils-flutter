import 'dart:async';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:utils/myUtils.dart';

//Clase para mostrar un splash o pantalla de carga
//Da más libertades que los paquetes ya hechos para un splash
//Se incorpora el texto animado para darle más dinamismo a la pantalla
//Paquete necesario: animated_text_kit: ^2.0.0

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    //Método timer para redirigir a una pantalla después del tiempo
    afterSplash();
  }

  //Widget principal del stateFul widget
  Widget build(BuildContext context) {
    ScreenUtil.init(context,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        allowFontScaling: true);
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.redAccent[100], Colors.redAccent])),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: height * 0.1,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                //Image.asset("assets/logo.png")
              ],
            ),
            SizedBox(
              height: height * 0.2,
            ),
            ScaleAnimatedTextKit(
                totalRepeatCount: 2,
                text: ["Cargando...", "Espere..."],
                textStyle: TextStyle(fontSize: 30.0, color: Colors.white),
                textAlign: TextAlign.start,
                alignment: AlignmentDirectional.topStart),
            SizedBox(
              height: height * 0.3,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TypewriterAnimatedTextKit(
                    totalRepeatCount: 2,
                    text: [
                      "Desarrollado por Michcom Ltda.",
                    ],
                    textStyle: TextStyle(fontSize: 20.0, color: Colors.white),
                    textAlign: TextAlign.start,
                    alignment: AlignmentDirectional.topStart),
              ],
            )
          ],
        ),
      ),
    );
  }

//Método usado para que después de 4 segundos redirija a una pantalla
  afterSplash() async {
    Future.delayed(const Duration(seconds: 4), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => MyUtils()));
    });
  }
}
