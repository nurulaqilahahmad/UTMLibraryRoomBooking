class User {
  final String password;
  final String email;
  final String uid;
  final String name;

  User({this.uid, this.email, this.password, this.name});

  User.copy(from)
      : this(
            uid: from.uid,
            email: from.email,
            password: from.password,
            name: from.name);

  User.fromJson(Map<String, dynamic> json)
      : this(
            uid: json['uid'],
            email: json['email'],
            password: json['password'],
            name: json['name']);

  Map<String, dynamic> toJson() =>
      {'uid': uid, 'email': email, 'password': password, 'name': name};

  User copyWith({uid, email, password}) => User(
      uid: uid ?? this.uid,
      email: email ?? this.email,
      password: password ?? this.password,
      name: name ?? this.name);
}
