import 'database_helper.dart';

class UserDao {
  static const _table = 'users';

  static Future<int> register(Map<String, dynamic> user) async {
    return await DatabaseHelper.instance.insert(_table, user);
  }

  static Future<Map<String, dynamic>?> login(
      String email, String password) async {
    final users = await DatabaseHelper.instance.getWhere(
      _table,
      'email = ? AND password = ?',
      [email, password],
    );
    return users.isNotEmpty ? users.first : null;
  }

  static Future<Map<String, dynamic>?> getUserByEmail(String email) async {
    final users = await DatabaseHelper.instance
        .getWhere(_table, 'email = ?', [email]);
    return users.isNotEmpty ? users.first : null;
  }
}
