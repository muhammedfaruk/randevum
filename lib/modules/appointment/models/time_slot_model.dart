import 'package:json_annotation/json_annotation.dart';

part 'time_slot_model.g.dart';

@JsonSerializable()
class TimeSlotModel {
  final String startTime;
  final String endTime;
  final bool isAvailable;

  TimeSlotModel({
    required this.startTime,
    required this.endTime,
    required this.isAvailable,
  });

  factory TimeSlotModel.fromJson(Map<String, dynamic> json) => _$TimeSlotModelFromJson(json);
  Map<String, dynamic> toJson() => _$TimeSlotModelToJson(this);
}
