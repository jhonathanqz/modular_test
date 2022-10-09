import 'package:modular_test/app/modules/health/domain/entities/health_check.dart';
import 'package:modular_test/app/modules/health/domain/repositories/health_check_repository.dart';

class HealthCheckUseCase {
  HealthCheckRepository healthCheckRepository;

  HealthCheckUseCase({
    required this.healthCheckRepository,
  });

  Future<HealthCheck> call() async {
    try {
      return await healthCheckRepository.healthCheck();
    } catch (_) {
      rethrow;
    }
  }
}
