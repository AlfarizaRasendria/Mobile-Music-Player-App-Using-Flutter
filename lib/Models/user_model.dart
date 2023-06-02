
class User with ChangeNotifier {

  final String uid;
  final String? email;

  UserAttribute(this.uid, this.email);
}
