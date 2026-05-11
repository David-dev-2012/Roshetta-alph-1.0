import 'database_helper.dart';

class MedicineDao {
  static const _table = 'medicines';

  static Future<int> insert(Map<String, dynamic> medicine) async {
    return await DatabaseHelper.instance.insert(_table, medicine);
  }

  static Future<List<Map<String, dynamic>>> getAll() async {
    return await DatabaseHelper.instance.getAll(_table);
  }

  static Future<List<Map<String, dynamic>>> getDonations() async {
    return await DatabaseHelper.instance
        .getWhere(_table, 'isDonation = ?', [1]);
  }

  static Future<int> update(
      int id, Map<String, dynamic> data) async {
    return await DatabaseHelper.instance
        .update(_table, data, 'id = ?', [id]);
  }

  static Future<int> delete(int id) async {
    return await DatabaseHelper.instance
        .delete(_table, 'id = ?', [id]);
  }
}
