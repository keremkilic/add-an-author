class Writer {
  late int id;
  String? firstName;
  String? lastName;
  String dateOfBirth;
  late String status;

  Writer(String this.firstName, String this.lastName, this.dateOfBirth) {
    this.firstName = firstName;
    this.lastName = lastName;
    this.dateOfBirth = dateOfBirth;
  }

  Writer.withId(this.id, this.firstName, this.lastName, this.dateOfBirth) {
    this.id = id;
    this.firstName = firstName;
    this.lastName = lastName;
    this.dateOfBirth = dateOfBirth;
  }

  // String get getStatus {
  //   String message = "";
  //   if (dateOfBirth >= ) {
  //     message = "Geçti";
  //   } else if (dateOfBirth >= 40) {
  //     message = "Bütünlemeye kaldı";
  //   } else {
  //     message = "Kaldı";
  //   }
  //   return message;
  // }
}
