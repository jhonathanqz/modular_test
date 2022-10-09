import 'package:flutter_modular/flutter_modular.dart';

import 'package:modular_test/app/modules/core/core_module.dart';
import 'package:modular_test/app/modules/health/health_module.dart';

import 'modules/home/home_module.dart';

class AppModule extends Module {
  @override
  List<Module> get imports => [
        CoreModule(),
        HealthModule(),
      ];

  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute('/', module: HomeModule()),
    ModuleRoute('/health', module: HealthModule()),
  ];
}
