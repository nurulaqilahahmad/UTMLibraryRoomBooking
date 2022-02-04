class Booking {
  final dynamic id;
  final String date;
  final String startTime;
  final String endTime;
  final bool approve;
  final String room;

  Booking(
      {this.id,
      this.date,
      this.startTime,
      this.endTime,
      this.approve,
      this.room});

  Booking.copy(from)
      : this(
            id: from.id,
            date: from.date,
            startTime: from.startTime,
            endTime: from.endTime,
            approve: from.approve,
            room: from.room);

  Booking.fromJson(Map<String, dynamic> json)
      : this(
            id: json['id'],
            date: json['date'],
            startTime: json['startTime'],
            endTime: json['endTime'],
            approve: json['approve'],
            room: json['room']);

  Map<String, dynamic> toJson() => {
        'id': id,
        'date': date,
        'startTime': startTime,
        'endTime': endTime,
        'approve': approve,
        'room': room
      };

  Booking copyWith({id, date, startTime, endTime, approve, room}) => Booking(
      id: id ?? this.id,
      date: date ?? this.date,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
      approve: approve ?? this.approve,
      room: room ?? this.room);
}
