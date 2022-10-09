import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CoreModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.singleton((i) => Dio(), export: true),
    //Bind.singleton((i) => LocalStorage(), export: true),
  ];

  @override
  final List<ModularRoute> routes = [];
}
