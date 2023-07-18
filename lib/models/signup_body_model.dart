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
    data["f_name"] = this.firstname;
    data["l_name"] = this.lastname;
    data["phone_number"] = this.phone;
    data["password"] = this.password;

    return data;
  }
}
