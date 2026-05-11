class SessionManager {
  SessionManager._();

  static final SessionManager _instance = SessionManager._();
  static SessionManager get instance => _instance;

  Map<String, dynamic>? _user;
  Map<String, dynamic>? get user => _user;
  String? get fullName => _user?['fullName'] as String?;
  String? get email => _user?['email'] as String?;

  void login(Map<String, dynamic> user) {
    _user = user;
  }

  void logout() {
    _user = null;
  }

  bool get isLoggedIn => _user != null;
}
