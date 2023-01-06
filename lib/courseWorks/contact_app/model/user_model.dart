import 'package:crypto/crypto.dart' as cy;

class ContactAppUser {
  final String username;
  final String _password;
  final String? _question1;
  final String? _question2;
  final String? _question3;

  //Constructor
  ContactAppUser(
      {required this.username,
      required String pass,
      String? q1,
      String? q2,
      String? q3})
      : _password = pass,
        _question1 = q1,
        _question2 = q2,
        _question3 = q3;

  //method to use in updating datas (etc. usernames, passwords)
  ContactAppUser copyWith(
    String? newUsername,
    String? newPassword,
    String? newQuestion1,
    String? newQuestion2,
    String? newQuestion3,
  ) {
    return ContactAppUser(
      username: newUsername ??
          this.username, // username is the original data from database
      pass: newPassword ??
          _password, // _password  is the original data from database
      q1: newQuestion1 ??
          _question1, // _question1 is the original data from database
      q2: newQuestion2 ??
          _question2, // _question2 is the original data from database
      q3: newQuestion3 ??
          _question3, // _question3 is the original data from database
    );
  }

  //non-crpted values GETTERs
  //(to be used in fetching data from Database {datas fetched from database can't be hashed because it will be hashed again})
  String get password => _password;
  String? get question1 => _question1;
  String? get question2 => _question2;
  String? get question3 => _question3;

  //convert data to hashcode
  String _convert(String data) => cy.sha1.convert(data.codeUnits).toString();

  //crpted values GETTERs
  String get cryptPassword => _convert(_password);
  String? get cryptQuestion1 =>
      _question1 == null ? null : _convert(_question1!);
  String? get cryptQuestion2 =>
      _question2 == null ? null : _convert(_question2!);
  String? get cryptQuestion3 =>
      _question3 == null ? null : _convert(_question3!);

  factory ContactAppUser.fromDynamic(dynamic data) {
    return ContactAppUser(
        username: data['username'],
        pass: data['password'],
        q1: data['question1'],
        q2: data['question2'],
        q3: data['question3']);
  }

  Map<String, dynamic> toMap() => {
        'username': username,
        'password': password,
        'question1': question1,
        'question2': question2,
        'question3': question3,
      };
}

// Guide 24, zoom 18:00
