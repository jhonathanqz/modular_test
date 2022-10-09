import 'package:modular_test/app/modules/health/domain/entities/health_check.dart';
import 'package:modular_test/app/modules/health/domain/repositories/health_check_repository.dart';
import 'package:modular_test/app/modules/health/infrastructure/repositories/contracts/health_check_provider.dart';

class HealthCheckRepositoryImpl implements HealthCheckRepository {
  HealthCheckProvider healthCheckProvider;

  HealthCheckRepositoryImpl({
    required this.healthCheckProvider,
  });

  @override
  Future<HealthCheck> healthCheck() async {
    try {
      return await healthCheckProvider.healthCheck();
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<bool> healthCheckServer() async {
    try {
      return await healthCheckProvider.healthCheckServer();
    } catch (_) {
      rethrow;
    }
  }
}
