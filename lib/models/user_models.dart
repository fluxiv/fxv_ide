class UserModels {
  String id;
  String name;
  String birthday;
  String email;

  int? isPremium;
  int? terms;

   UserModels({
     required this.id,
    required this.name,
    required this.birthday,
    required this.email,
   this.isPremium,
   this.terms});

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'birthday': birthday,
      'email': email,
    };
  }

}

class SignUpModels {
  String fieldName;
  dynamic value;
  int errors;

  SignUpModels({
    required this.fieldName,
    required this.value,
    required this.errors,
});
}