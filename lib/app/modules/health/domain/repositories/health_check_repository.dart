import 'package:modular_test/app/modules/health/domain/entities/health_check.dart';

abstract class HealthCheckRepository {
  Future<HealthCheck> healthCheck();
  Future<bool> healthCheckServer();
}
