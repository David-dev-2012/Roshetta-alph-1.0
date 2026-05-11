import 'database_helper.dart';

class DonationDao {
  static const _table = 'donations';

  static Future<int> insert(Map<String, dynamic> donation) async {
    return await DatabaseHelper.instance.insert(_table, donation);
  }

  static Future<List<Map<String, dynamic>>> getAll() async {
    return await DatabaseHelper.instance.getAll(_table);
  }
}
