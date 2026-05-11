import 'database_helper.dart';

class OrderDao {
  static const _table = 'orders';

  static Future<int> createOrder(Map<String, dynamic> order) async {
    return await DatabaseHelper.instance.insert(_table, order);
  }

  static Future<List<Map<String, dynamic>>> getAll() async {
    return await DatabaseHelper.instance.getAll(_table);
  }

  static Future<int> updateStatus(int id, String status) async {
    return await DatabaseHelper.instance
        .update(_table, {'status': status}, 'id = ?', [id]);
  }

  static Future<void> insertOrderItem(Map<String, dynamic> item) async {
    await DatabaseHelper.instance.insert('order_items', item);
  }
}
