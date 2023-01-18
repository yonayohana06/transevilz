class Users {
  final String id;
  final String email;
  final String fullname;

  Users({
    required this.id,
    required this.email,
    required this.fullname,
  });

  factory Users.fromJson(Map<String, dynamic> json) {
    return Users(
      id: json['id'] as String,
      email: json['email'] as String,
      fullname: json['fullname'] as String,
    );
  }

  // Map<String, dynamic> toJson() {
  //   return <String, dynamic>{
  //     'email': email,
  //     'password': password,
  //   };
  // }
}
