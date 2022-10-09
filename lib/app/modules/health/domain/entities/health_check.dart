import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
class HealthCheck extends Equatable {
  final String? status;

  const HealthCheck({
    this.status,
  });

  @override
  List<Object?> get props => [
        status,
      ];
}
