class Usermodel {
  String name;
  String email;
  String password;
  String password_confirmation;
  String phone;
  bool gender_id;

  Usermodel(
      {required this.name,
      required this.email,
      required this.password,
      required this.password_confirmation,
      required this.phone,
      required this.gender_id});

  factory Usermodel.fromjson(jsonData) {
    return Usermodel(
      name: jsonData['name'],
      email: jsonData['email'],
      password: jsonData['password'],
      password_confirmation: jsonData['password_confirmation'],
      phone: jsonData['phone'],
      gender_id: jsonData['gender_id'],
    );
  }
}
