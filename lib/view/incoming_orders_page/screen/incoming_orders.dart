import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/database/order_dao.dart';
import '../../../core/resources/color_manager.dart';

class IncomingOrder {
  final int dbId;
  final String orderId;
  final String customerName;
  final String phone;
  final int itemCount;
  final String amount;
  final String timeAgo;
  OrderStatus status;

  IncomingOrder({
    required this.dbId,
    required this.orderId,
    required this.customerName,
    required this.phone,
    required this.itemCount,
    required this.amount,
    required this.timeAgo,
    this.status = OrderStatus.pending,
  });

  factory IncomingOrder.fromDb(Map<String, dynamic> row) {
    return IncomingOrder(
      dbId: row['id'] as int,
      orderId: 'Order #${row['id']}',
      customerName: row['orderNumber'] as String? ?? '#${row['id']}',
      phone: '',
      itemCount: row['itemsCount'] as int? ?? 0,
      amount: '\$${(row['total'] as num?)?.toStringAsFixed(2) ?? '0.00'}',
      timeAgo: row['createdAt'] as String? ?? '',
      status: _parseStatus(row['status'] as String? ?? 'Pending'),
    );
  }

  static OrderStatus _parseStatus(String s) {
    switch (s.toLowerCase()) {
      case 'processing':
        return OrderStatus.processing;
      case 'ready':
      case 'delivered':
        return OrderStatus.ready;
      default:
        return OrderStatus.pending;
    }
  }
}

enum OrderStatus { pending, processing, ready }

class IncomingOrdersPage extends StatefulWidget {
  const IncomingOrdersPage({super.key});

  @override
  State<IncomingOrdersPage> createState() => _IncomingOrdersPageState();
}

class _IncomingOrdersPageState extends State<IncomingOrdersPage> {
  OrderStatus _selectedTab = OrderStatus.pending;
  List<IncomingOrder> _allOrders = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadOrders();
  }

  Future<void> _loadOrders() async {
    final rows = await OrderDao.getAll();
    if (!mounted) return;
    setState(() {
      _allOrders = rows.map((r) => IncomingOrder.fromDb(r)).toList();
      _isLoading = false;
    });
  }

  List<IncomingOrder> get _filtered =>
      _allOrders.where((o) => o.status == _selectedTab).toList();

  Future<void> _accept(IncomingOrder order) async {
    await OrderDao.updateStatus(order.dbId, 'Processing');
    setState(() => order.status = OrderStatus.processing);
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${order.orderId} accepted & moved to Processing'),
        backgroundColor: ColorManager.primary,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
      ),
    );
  }

  Future<void> _reject(IncomingOrder order) async {
    await OrderDao.delete(order.dbId);
    setState(() => _allOrders.remove(order));
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${order.orderId} rejected'),
        backgroundColor: const Color(0xFFEF4444),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF0F4FF),
      body: Column(
        children: [
          _IncomingHeader(onBack: () => Navigator.maybePop(context)),
          Padding(
            padding: EdgeInsets.fromLTRB(16.w, 18.h, 16.w, 0),
            child: _TabBar(
              selected: _selectedTab,
              onChanged: (t) => setState(() => _selectedTab = t),
            ),
          ),
          SizedBox(height: 16.h),
          Expanded(
            child: _isLoading
                ? const Center(child: CircularProgressIndicator())
                : _filtered.isEmpty
                    ? _EmptyState(tab: _selectedTab)
                    : ListView.separated(
                        padding: EdgeInsets.fromLTRB(16.w, 0, 16.w, 24.h),
                        itemCount: _filtered.length,
                        separatorBuilder: (_, _) => SizedBox(height: 14.h),
                        itemBuilder: (context, i) {
                          final order = _filtered[i];
                          return _IncomingOrderCard(
                            order: order,
                            onAccept: () => _accept(order),
                            onReject: () => _reject(order),
                          );
                        },
                      ),
          ),
        ],
      ),
    );
  }
}

class _IncomingHeader extends StatelessWidget {
  final VoidCallback onBack;
  const _IncomingHeader({required this.onBack});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [ColorManager.primary, const Color(0xFF448AFF)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(28.r),
          bottomRight: Radius.circular(28.r),
        ),
      ),
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top + 16.h,
        left: 8.w,
        right: 20.w,
        bottom: 24.h,
      ),
      child: Row(
        children: [
          IconButton(
            icon: Icon(Icons.arrow_back_ios_new_rounded,
                color: Colors.white, size: 20.sp),
            onPressed: onBack,
          ),
          Text(
            'Incoming Orders',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20.sp,
              fontWeight: FontWeight.w800,
              letterSpacing: 0.3,
            ),
          ),
        ],
      ),
    );
  }
}

class _TabBar extends StatelessWidget {
  final OrderStatus selected;
  final ValueChanged<OrderStatus> onChanged;

  const _TabBar({required this.selected, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(4.r),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30.r),
        boxShadow: [
          BoxShadow(
            color: ColorManager.primary.withValues(alpha: 0.08),
            blurRadius: 12.r,
            offset: Offset(0, 4.h),
          ),
        ],
      ),
      child: Row(
        children: OrderStatus.values.map((tab) {
          final active = tab == selected;
          final labels = {
            OrderStatus.pending: 'Pending',
            OrderStatus.processing: 'Processing',
            OrderStatus.ready: 'Ready',
          };
          return Expanded(
            child: GestureDetector(
              onTap: () => onChanged(tab),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                padding: EdgeInsets.symmetric(vertical: 10.h),
                decoration: BoxDecoration(
                  color: active ? ColorManager.primary : Colors.transparent,
                  borderRadius: BorderRadius.circular(24.r),
                ),
                child: Text(
                  labels[tab]!,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: active ? Colors.white : const Color(0xFF8898B3),
                    fontWeight:
                        active ? FontWeight.w700 : FontWeight.w500,
                    fontSize: 13.sp,
                  ),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}

class _IncomingOrderCard extends StatelessWidget {
  final IncomingOrder order;
  final VoidCallback onAccept;
  final VoidCallback onReject;

  const _IncomingOrderCard({
    required this.order,
    required this.onAccept,
    required this.onReject,
  });

  @override
  Widget build(BuildContext context) {
    final badgeData = {
      OrderStatus.pending: ('Pending', const Color(0xFFF59E0B)),
      OrderStatus.processing: ('Processing', ColorManager.primary),
      OrderStatus.ready: ('Ready', const Color(0xFF10B981)),
    };
    final (badgeLabel, badgeColor) = badgeData[order.status]!;

    return Container(
      padding: EdgeInsets.all(18.r),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            color: ColorManager.primary.withValues(alpha: 0.07),
            blurRadius: 14.r,
            offset: Offset(0, 4.h),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                order.orderId,
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 15.sp,
                  color: const Color(0xFF1A1D2E),
                ),
              ),
              Text(
                order.amount,
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 15.sp,
                  color: ColorManager.primary,
                ),
              ),
            ],
          ),
          SizedBox(height: 6.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                order.customerName,
                style: TextStyle(
                  color: const Color(0xFF1A1D2E),
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Row(
                children: [
                  Icon(Icons.access_time_rounded,
                      size: 13.sp, color: const Color(0xFF8898B3)),
                  SizedBox(width: 4.w),
                  Text(
                    order.timeAgo,
                    style: TextStyle(
                      color: const Color(0xFF8898B3),
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 4.h),
          Text(
            order.phone,
            style: TextStyle(
              color: const Color(0xFF8898B3),
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 6.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${order.itemCount} items',
                style: TextStyle(
                  color: const Color(0xFFB0BEC5),
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 3.h),
                decoration: BoxDecoration(
                  color: badgeColor.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: Text(
                  badgeLabel,
                  style: TextStyle(
                    color: badgeColor,
                    fontSize: 11.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 14.h),
          Divider(color: const Color(0xFFF0F4FF), height: 1.h),
          SizedBox(height: 14.h),
          Row(
            children: [
              Expanded(
                child: ElevatedButton.icon(
                  onPressed: onAccept,
                  icon: Icon(Icons.check_rounded,
                      size: 16.sp, color: Colors.white),
                  label: Text(
                    'Accept & Add\nReceiver',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 13.sp,
                      height: 1.3,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ColorManager.primary,
                    elevation: 0,
                    padding: EdgeInsets.symmetric(vertical: 14.h),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.r),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: onReject,
                  icon: Icon(Icons.close_rounded,
                      size: 16.sp, color: const Color(0xFF8898B3)),
                  label: Text(
                    'Reject',
                    style: TextStyle(
                      color: const Color(0xFF8898B3),
                      fontWeight: FontWeight.w700,
                      fontSize: 13.sp,
                    ),
                  ),
                  style: OutlinedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 14.h),
                    side: const BorderSide(color: Color(0xFFE2E8F0)),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.r),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _EmptyState extends StatelessWidget {
  final OrderStatus tab;
  const _EmptyState({required this.tab});

  @override
  Widget build(BuildContext context) {
    final labels = {
      OrderStatus.pending: 'No pending orders',
      OrderStatus.processing: 'No orders in processing',
      OrderStatus.ready: 'No orders ready yet',
    };
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.inbox_rounded, size: 64.sp, color: Colors.grey.shade300),
          SizedBox(height: 16.h),
          Text(
            labels[tab]!,
            style: TextStyle(
              color: const Color(0xFF8898B3),
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
