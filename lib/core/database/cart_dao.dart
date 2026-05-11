import 'database_helper.dart';

class CartDao {
  static const _table = 'cart_items';

  static Future<int> addItem(Map<String, dynamic> item) async {
    return await DatabaseHelper.instance.insert(_table, item);
  }

  static Future<List<Map<String, dynamic>>> getAll() async {
    return await DatabaseHelper.instance.getAll(_table);
  }

  static Future<void> clear() async {
    await DatabaseHelper.instance.clearTable(_table);
  }

  static Future<int> updateQuantity(int id, int quantity) async {
    return await DatabaseHelper.instance
        .update(_table, {'quantity': quantity}, 'id = ?', [id]);
  }

  static Future<int> removeItem(int id) async {
    return await DatabaseHelper.instance
        .delete(_table, 'id = ?', [id]);
  }
}
