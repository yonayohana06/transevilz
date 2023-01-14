class Model {
  final String? firstname;
  final String? lastname;
  final String? email;
  final String? doc_type;

  Model({
    this.firstname,
    this.lastname,
    this.email,
    this.doc_type
  });

  Map<String, dynamic> toJson(){
    return <String, dynamic> {
      'firstname' : firstname,
      'lastname' : lastname,
      'email' : email,
      'doc_type' : doc_type,
    };
  }

  factory Model.fromJson(Map<String, dynamic> json) {
    return Model(
      firstname: json['firstname'] as String,
      lastname: json['lastname'] as String,
      email: json['email'] as String,
      doc_type: json['doc_type'] as String,
    );
  }
}