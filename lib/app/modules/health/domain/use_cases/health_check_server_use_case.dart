import 'package:modular_test/app/modules/health/domain/repositories/health_check_repository.dart';

class HealthCheckServerUseCase {
  HealthCheckRepository healthCheckRepository;

  HealthCheckServerUseCase({
    required this.healthCheckRepository,
  });

  Future<bool> call() async {
    try {
      return await healthCheckRepository.healthCheckServer();
    } catch (_) {
      rethrow;
    }
  }
}
