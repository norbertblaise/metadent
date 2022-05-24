class AppointmentType {
  var id;
  var title;
  var code;
  var color;
  var duration;
  var agendaInterval;
  var forWeb;
  List<dynamic> doctors;
  List<dynamic> weekdays;
  var startTime;
  var endTime;
  var startDate;
  var endDate;
  var frequencyId;
  var notes;
  var facilityId;
  var createdAt;
  var updatedAt;

  AppointmentType({
      this.id,
      this.title,
      this.code,
      this.color,
      this.duration,
      this.agendaInterval,
      this.forWeb,
      required this.doctors,
      required this.weekdays,
      this.startTime,
      this.endTime,
      this.startDate,
      this.endDate,
      this.frequencyId,
      this.notes,
      this.facilityId,
      this.createdAt,
      this.updatedAt});

  factory AppointmentType.fromJson(Map<String, dynamic> parsedJson){
    // var doctorsFromJson = parsedJson['doctors'];
    // List<>

    return AppointmentType(
      id: parsedJson['id'],
      title: parsedJson['title'],
      code: parsedJson['code'],
      color: parsedJson['color'],
      duration: parsedJson['duration'],
      agendaInterval: parsedJson['agenda_interval'],
      forWeb: parsedJson['for_web'],
      doctors: parsedJson['doctors'],
      weekdays: parsedJson['week_days'],
      startTime: parsedJson['start_time'],
      endTime:  parsedJson['end_time'],
      startDate:  parsedJson['start_date'],
      endDate: parsedJson['end_date'],
      frequencyId: parsedJson['frequency_id'],
      createdAt: parsedJson['created_at'],
      updatedAt: parsedJson['updated_at']
    );
  }
  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['code'] = this.code;
    data['color'] = this.color;
    data['duration'] = this.duration;
    data['agenda_interval'] = this.agendaInterval;
    data['for_web'] = this.forWeb;
    data['doctors'] = this.doctors;
    data['week_days'] = this.weekdays;
    data['start_time'] = this.startTime;
    data['end_time'] = this.endTime;
    data['start_date'] = this.startDate;
    data['end_date'] = this.endDate;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;

    return data;
  }
}
