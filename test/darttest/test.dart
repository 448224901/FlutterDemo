class Bicycle {
  int cadence;

  //_表示私有变量
  int _speed = 0;
  int gear;

  int get speed => _speed;

  set speed(int value) {
    _speed = value;
  }

  Bicycle(this.cadence, this.gear);

  void applyBrake(int decrement) {
    _speed -= decrement;
  }

  void speedUp(int increment) {
    _speed += increment;
  }

  @override
  String toString() {
    // TODO: implement toString
    return 'Bicycle:$_speed mph';
  }
}

void main() {
  var bicycle = Bicycle(2, 1);
  bicycle.speedUp(3);
  print(bicycle);
  var i = 100/10;
}
