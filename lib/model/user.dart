class Users {
  final String userName;
  final String phoneNumber;
  final String email;
  Users({
    this.userName,
    this.phoneNumber,
    this.email,
  });

  Map<String, dynamic> toMap() {
    return {
      'userName': userName,
      'phoneNumber': phoneNumber,
      'email': email,
    };
  }

  factory Users.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Users(
      userName: map['userName'],
      phoneNumber: map['phoneNumber'],
      email: map['email'],
    );
  }
}
