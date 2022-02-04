class Room {
  final dynamic id;
  final String name;
  final int capacity;
  final bool status;
  final String image;

  Room({this.id, this.name, this.capacity, this.status = false, this.image});

  Room.copy(from)
      : this(
            id: from.id,
            name: from.name,
            capacity: from.capacity,
            status: from.status,
            image: from.image);

  Room.fromJson(Map<String, dynamic> json)
      : this(
            id: json['id'],
            name: json['name'],
            capacity: json['capacity'],
            status: json['status'],
            image: json['image']);

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'capacity': capacity,
        'status': status,
        'image': image
      };

  Room copyWith({id, name, capacity, status, image}) => Room(
      id: id ?? this.id,
      name: name ?? this.name,
      capacity: capacity ?? this.capacity,
      status: status ?? this.status,
      image: image ?? this.image);
}
