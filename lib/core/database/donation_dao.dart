import 'database_helper.dart';

class DonationDao {
  static const _table = 'donations';

  static Future<int> insert(Map<String, dynamic> donation) async {
    return await DatabaseHelper.instance.insert(_table, donation);
  }

  static Future<List<Map<String, dynamic>>> getAll() async {
    return await DatabaseHelper.instance.getAll(_table);
  }

  static Future<List<Map<String, dynamic>>> getWhere(
      String where, List<dynamic> whereArgs) async {
    return await DatabaseHelper.instance.getWhere(_table, where, whereArgs);
  }

  static Future<int> updateStatus(int id, String status) async {
    return await DatabaseHelper.instance.update(
      _table,
      {'status': status},
      'id = ?',
      [id],
    );
  }

  static Future<int> delete(int id) async {
    return await DatabaseHelper.instance.delete(_table, 'id = ?', [id]);
  }
}
