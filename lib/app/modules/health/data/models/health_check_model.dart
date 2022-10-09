import 'package:json_annotation/json_annotation.dart';

part 'health_check_model.g.dart';

@JsonSerializable()
class HealthCheckModel {
  @JsonKey(name: 'status')
  final String? status;

  HealthCheckModel({
    this.status,
  });

  factory HealthCheckModel.fromJson(Map<String, dynamic> json) =>
      _$HealthCheckModelFromJson(json);

  Map<String, dynamic> toJson() => _$HealthCheckModelToJson(this);
}
