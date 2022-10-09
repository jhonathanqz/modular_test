abstract class HealthCheckException implements Exception {
  final String message;

  HealthCheckException(this.message);
}

class HealthCheckNotFound extends HealthCheckException {
  HealthCheckNotFound(String message) : super(message);
}

class HealthCheckApiException extends HealthCheckException {
  HealthCheckApiException(String message) : super(message);
}

class HealthCheckTimeOutException extends HealthCheckException {
  HealthCheckTimeOutException(String message) : super(message);
}
