import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:modular_test/app/modules/health/data/provider/health_check_provider_impl.dart';
import 'package:modular_test/app/modules/health/domain/repositories/health_check_repository.dart';
import 'package:modular_test/app/modules/health/domain/use_cases/health_check_server_use_case.dart';
import 'package:modular_test/app/modules/health/domain/use_cases/health_check_use_case.dart';
import 'package:modular_test/app/modules/health/health_page.dart';
import 'package:modular_test/app/modules/health/health_store.dart';
import 'package:modular_test/app/modules/health/infrastructure/repositories/contracts/health_check_provider.dart';
import 'package:modular_test/app/modules/health/infrastructure/repositories/health_check_repository_impl.dart';

class HealthModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton<HealthCheckProvider>(
      (i) => HealthCheckProviderImpl(
        client: i<Dio>(),
      ),
      export: true,
    ),
    Bind.lazySingleton<HealthCheckRepository>(
      (i) => HealthCheckRepositoryImpl(
        healthCheckProvider: i<HealthCheckProvider>(),
      ),
      export: true,
    ),
    Bind.lazySingleton<HealthCheckUseCase>(
      (i) => HealthCheckUseCase(
        healthCheckRepository: i<HealthCheckRepository>(),
      ),
      export: true,
    ),
    Bind.lazySingleton<HealthCheckServerUseCase>(
      (i) => HealthCheckServerUseCase(
        healthCheckRepository: i<HealthCheckRepository>(),
      ),
      export: true,
    ),
    Bind.lazySingleton(
      (i) => HealthStore(
        healthCheckUseCase: i<HealthCheckUseCase>(),
      ),
      export: true,
    ),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const HealthPage()),
  ];
}
