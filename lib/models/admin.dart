class Donor {
  String? email;

  Donor({this.email});

  factory Donor.fromJson(Map<String, dynamic> responseData) {
    return Donor(email: responseData['email']);
  }
}
