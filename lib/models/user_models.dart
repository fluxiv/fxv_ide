class UserModels {
  String name;
  String birthday;
  String email;
  String password;

   UserModels({
    required this.name,
    required this.birthday,
    required this.email,
    required this.password});

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'birthday': birthday,
      'email': email,
      'password': password
    };
  }

}

class SignUpModels {
  String fieldName;
  dynamic value;
  bool errors;

  SignUpModels({
    required this.fieldName,
    required this.value,
    required this.errors,
});
}