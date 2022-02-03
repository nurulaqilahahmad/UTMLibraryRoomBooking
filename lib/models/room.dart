class Room {
  final dynamic id;
  final String name;
  final int capacity;
  final bool status;

  Room({this.id, this.name, this.capacity, this.status = false});

  Room.copy(from)
      : this(
            id: from.id,
            name: from.name,
            capacity: from.capacity,
            status: from.status);

  Room.fromJson(Map<String, dynamic> json)
      : this(
            id: json['id'],
            name: json['name'],
            capacity: json['capacity'],
            status: json['status']);

  Map<String, dynamic> toJson() =>
      {'id': id, 'name': name, 'capacity': capacity, 'status': status};

  Room copyWith({id, name, capacity, status}) => Room(
      id: id ?? this.id,
      name: name ?? this.name,
      capacity: capacity ?? this.capacity,
      status: status ?? this.status);
}
