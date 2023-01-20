class Login {
  final String email;
  final String password;
  // final String fullname;
  // final String password;
  // final int pin;

  Login({
    required this.email,
    required this.password,
    // required this.password,
    // required this.pin,
  });

  // factory Login.fromJson(Map<String, dynamic> json) {
  //   return Login(
  //     id: json['id'] as String,
  //     email: json['email'] as String,
  //     fullname: json['fullname'] as String,
  //     // password: json['password'] as String,
  //     // pin: json['userPin'] as int,
  //   );
  // }

  // Map<String, dynamic> toJson() {
  //   return <String, dynamic>{
  //     'email': email,
  //     'password': password,
  //   };
  // }
}
