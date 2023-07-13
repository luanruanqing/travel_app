class SignUpBody {
  String firstname;
  String lastname;
  String phone;
  String password;

  SignUpBody({
    required this.firstname,
    required this.lastname,
    required this.phone,
    required this.password,
  });

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["first_name"] = this.firstname;
    data["last_name"] = this.lastname;
    data["phone"] = this.phone;
    data["password"] = this.password;

    return data;
  }
}
