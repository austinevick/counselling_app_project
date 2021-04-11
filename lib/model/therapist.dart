class Therapist {
  final String fullName;
  final String emailAddress;
  final String phoneNumber;
  final String nationality;
  final String experienceLength;
  Therapist({
    this.fullName,
    this.emailAddress,
    this.phoneNumber,
    this.nationality,
    this.experienceLength,
  });

  Map<String, dynamic> toMap() {
    return {
      'fullName': fullName,
      'emailAddress': emailAddress,
      'phoneNumber': phoneNumber,
      'Nationality': nationality,
      'experienceLength': experienceLength,
    };
  }

  factory Therapist.fromMap(Map<String, dynamic> map) {
    return Therapist(
      fullName: map['fullName'],
      emailAddress: map['emailAddress'],
      phoneNumber: map['phoneNumber'],
      nationality: map['Nationality'],
      experienceLength: map['experienceLength'],
    );
  }

  @override
  String toString() {
    return 'Therapist(fullName: $fullName, emailAddress: $emailAddress, phoneNumber: $phoneNumber, Nationality: $nationality, experienceLength: $experienceLength)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Therapist &&
        other.fullName == fullName &&
        other.emailAddress == emailAddress &&
        other.phoneNumber == phoneNumber &&
        other.nationality == nationality &&
        other.experienceLength == experienceLength;
  }

  @override
  int get hashCode {
    return fullName.hashCode ^
        emailAddress.hashCode ^
        phoneNumber.hashCode ^
        nationality.hashCode ^
        experienceLength.hashCode;
  }
}
