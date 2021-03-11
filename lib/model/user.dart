class Users {
  final String userName;
  final String userRole;
  final String phoneNumber;
  final String email;
  Users({
    this.userName,
    this.userRole,
    this.phoneNumber,
    this.email,
  });

  Map<String, dynamic> toMap() {
    return {
      'userName': userName,
      'userRole': userRole,
      'phoneNumber': phoneNumber,
      'email': email,
    };
  }

  factory Users.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Users(
      userName: map['userName'],
      userRole: map['userRole'],
      phoneNumber: map['phoneNumber'],
      email: map['email'],
    );
  }
}
