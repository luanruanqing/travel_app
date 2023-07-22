class UserModel {
  int? id;
  String? fName;
  String? lName;
  String? phoneNumber;
  String? dateOfBirth;
  String? avatar;
  String? isPhoneVerified;
  String? address;
  String? email;
  String? emailVerifiedAt;
  String? createdAt;
  String? updatedAt;

  UserModel(
      {required this.id,
      required this.fName,
      required this.lName,
      required this.phoneNumber,
      required this.dateOfBirth,
      required this.avatar,
      required this.isPhoneVerified,
      required this.address,
      required this.email,
      required this.emailVerifiedAt,
      required this.createdAt,
      required this.updatedAt});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      fName: json['f_name'],
      lName: json['l_name'],
      phoneNumber: json['phone_number'],
      dateOfBirth: json['date_of_birth'],
      avatar: json['avatar'],
      isPhoneVerified: json['is_phone_verified'],
      address: json['address'],
      email: json['email'],
      emailVerifiedAt: json['email_verified_at'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }
}
