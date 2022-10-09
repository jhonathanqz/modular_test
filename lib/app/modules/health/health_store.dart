import 'package:mobx/mobx.dart';

import 'package:modular_test/app/modules/health/domain/use_cases/health_check_use_case.dart';

part 'health_store.g.dart';

class HealthStore = _HealthStoreBase with _$HealthStore;

abstract class _HealthStoreBase with Store {
  _HealthStoreBase({
    required this.healthCheckUseCase,
  });

  final HealthCheckUseCase healthCheckUseCase;

  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }

  @action
  Future<void> checkServer() async {
    try {
      await healthCheckUseCase.call();
    } catch (e) {
      print('****Erro try: $e');
    }
  }
}
