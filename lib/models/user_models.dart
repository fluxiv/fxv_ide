class UserModels {
  String id;
  String name;
  String birthday;
  String email;

  int? isPremium;
  int? terms;
  String? photo;

   UserModels({
     required this.id,
    required this.name,
    required this.birthday,
    required this.email,
   this.isPremium,
   this.terms,
   this.photo});

  factory UserModels.fromJson(dynamic json){
    return UserModels(
        id: json['id'],
        name: json['name'],
        birthday: json['birthday'],
        email: json['email'],
        isPremium: json['isPremium'],
        terms: json['terms'],
        photo: json['photo'],

    );
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