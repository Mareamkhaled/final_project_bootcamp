// ignore: duplicate_ignore
// ignore_for_file: public_member_api_docs, sort_constructors_first
class SignUpModel {
  final String msg;

  const SignUpModel({
    required this.msg,
  });

  factory SignUpModel.fromJson(Map<String, dynamic> json) {
    if (!json.containsKey('msg') || json['msg'] == null) {
      throw ArgumentError('Invalid JSON format');
    }
    return SignUpModel(
      msg: json['msg'],
    );
  }
}
