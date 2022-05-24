import 'package:metadent/models/appointment/appointementType.dart';
import 'package:metadent/models/appointment/slot.dart';
import 'package:metadent/models/appointment/treatment.dart';

class Appointment {
  var id;
  var facilityId;
  var patientId;
  var typeId;
  var statusId;
  var sourceId;
  var treatmentId;
  var appointmentTypeId;
  List<dynamic> doctors;
  var date;
  List<Slot> slots; //fixme create list of Slot Objects
  var comments;
  var createdAt;
  var updatedAt;
  AppointmentType appointmentType;
  Treatment treatment;

  Appointment(
      {this.id,
      this.facilityId,
      this.patientId,
      this.typeId,
      this.statusId,
      this.sourceId,
      this.treatmentId,
      this.appointmentTypeId,
      required this.doctors,
      this.date,
      required this.slots,
      this.comments,
      this.createdAt,
      this.updatedAt,
      required this.appointmentType,
      required this.treatment});

  factory Appointment.fromJson(Map<String, dynamic> parsedJson) {

    var slotsFromJson = parsedJson['slots'] as List;
    List<Slot> slotsList = slotsFromJson.map((i) => Slot.fromJson(i)).toList();
    return Appointment(
        id: parsedJson['id'],
        facilityId: parsedJson['facility_id'],
        patientId: parsedJson['patient_id'],
        typeId: parsedJson['type_id'],
        statusId: parsedJson['status_id'],
        sourceId: parsedJson['source_id'],
        treatmentId: parsedJson['treatment_id'],
        appointmentTypeId: parsedJson['appointment_type_id'],
        doctors: parsedJson['doctors'],
        date: parsedJson['date'],
        slots: slotsList,
        comments: parsedJson['comments'],
        createdAt: parsedJson['created_at'],
        updatedAt: parsedJson['updated_at'],
        appointmentType:
            AppointmentType.fromJson(parsedJson['appointment_type']),
        treatment: Treatment.fromJson(parsedJson['treatment']));
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['facility_id'] = this.facilityId;
    data['patient_id'] = this.patientId;
    data['type_id'] = this.typeId;
    data['status_id'] = this.statusId;
    data['source_id'] = this.sourceId;
    data['treatment_id'] = this.treatmentId;
    data['appointment_type_id'] = this.appointmentTypeId;
    data['doctors'] = this.doctors;
    data['date'] = this.date;
    data['slots'] = this.slots;
    data['comments'] = this.comments;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['appointment_type'] = this.appointmentType.toJson();
    data['treatment'] = this.treatment.toJson();

    return data;
  }
}
