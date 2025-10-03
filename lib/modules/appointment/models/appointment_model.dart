import 'package:json_annotation/json_annotation.dart';

part 'appointment_model.g.dart';

@JsonSerializable()
class AppointmentModel {
  final int id;
  final int branchId;
  final int serviceId;
  final int staffId;
  final String guestFirstName;
  final String guestLastName;
  final String guestEmail;
  final String guestPhone;
  final String status;
  final String confirmationCode;
  final String? notes;
  final String startTime;
  final String endTime;

  AppointmentModel({
    required this.id,
    required this.branchId,
    required this.serviceId,
    required this.staffId,
    required this.guestFirstName,
    required this.guestLastName,
    required this.guestEmail,
    required this.guestPhone,
    required this.status,
    required this.confirmationCode,
    this.notes,
    required this.startTime,
    required this.endTime,
  });

  factory AppointmentModel.fromJson(Map<String, dynamic> json) => _$AppointmentModelFromJson(json);
  Map<String, dynamic> toJson() => _$AppointmentModelToJson(this);
}
