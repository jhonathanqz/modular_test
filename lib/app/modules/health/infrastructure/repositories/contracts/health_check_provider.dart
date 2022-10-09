import 'package:modular_test/app/modules/health/domain/entities/health_check.dart';

abstract class HealthCheckProvider {
  Future<HealthCheck> healthCheck();
  Future<bool> healthCheckServer();
}
