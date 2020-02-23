import 'dart:async';

//Clase para iniciar un timer periódico, donde realizará una acción cada 30 segundos
//Consta con un método para realizar una acción una vez tras cumplir el tiempo indicado

class TimerMethod {
  final Duration time;
  TimerMethod({this.time});

  initPeriodic() async {
    print("inicio timer");
    Timer.periodic(time, (Timer t) async {
      print("Acción a realizar cada 30 segundos");
    });
  }

  oneTime() async {
    Future.delayed(time, () {
      print("Acción a realizar sólo una vez después de 30 segundos");
    });
  }
}
