class Slot{
  var startTime;
  var endTime;

  Slot({this.startTime, this.endTime});

  factory Slot.fromJson(Map<String, dynamic> parseJson){
    return Slot(startTime: parseJson['start-time'],
    endTime: parseJson['end-time']);
  }

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['start-time'];
    data['end-time'];
    return data;
  }
}