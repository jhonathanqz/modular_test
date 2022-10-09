import 'package:dio/dio.dart';

import 'package:modular_test/app/modules/health/data/models/health_check_model.dart';
import 'package:modular_test/app/modules/health/domain/entities/health_check.dart';
import 'package:modular_test/app/modules/health/domain/exceptions/health_check_exceptions.dart';
import 'package:modular_test/app/modules/health/infrastructure/repositories/contracts/health_check_provider.dart';

class HealthCheckProviderImpl implements HealthCheckProvider {
  final Dio client;

  HealthCheckProviderImpl({
    required this.client,
  });

  @override
  Future<HealthCheck> healthCheck() async {
    try {
      final response = await client.get(
        '/health-check',
      );
      final healthResponse = HealthCheckModel.fromJson(response.data);

      print('****Response: ${response.data}');

      return HealthCheck(
        status: healthResponse.status ?? '',
      );
    } on DioError catch (e) {
      if (e.type == DioErrorType.connectTimeout ||
          e.type == DioErrorType.receiveTimeout) {
        throw HealthCheckTimeOutException('Strings.connectTimeout');
      }
      if (e.response?.statusCode != 200) {
        switch (e.response?.statusCode) {
          case 500:
            throw HealthCheckNotFound('Strings.healthCheckNotFound');
          default:
            throw HealthCheckApiException('Strings.genericException');
        }
      }
    } catch (e) {
      throw HealthCheckApiException('Strings.genericException');
    }
    throw HealthCheckApiException('Strings.genericException');
  }

  @override
  Future<bool> healthCheckServer() async {
    try {
      var aux = false;
      final response = await client.get(
        '/health-check',
      );
      final healthResponse = HealthCheckModel.fromJson(response.data);
      if (healthResponse.status != '') {
        healthResponse.status!.toLowerCase() == 'ok' ? aux = true : aux = false;
      }
      return aux;
    } on DioError catch (e) {
      if (e.type == DioErrorType.connectTimeout ||
          e.type == DioErrorType.receiveTimeout) {
        throw HealthCheckTimeOutException('Strings.connectTimeout');
      }
      if (e.response?.statusCode != 200) {
        switch (e.response?.statusCode) {
          case 500:
            throw HealthCheckNotFound('Strings.healthCheckNotFound');
          default:
            throw HealthCheckApiException('Strings.genericException');
        }
      }
    } catch (e) {
      throw HealthCheckApiException('Strings.genericException');
    }
    throw HealthCheckApiException('Strings.genericException');
  }
}
