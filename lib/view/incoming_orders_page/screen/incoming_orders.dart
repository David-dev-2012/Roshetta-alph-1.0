import 'package:flutter/material.dart';

import '../../../core/resources/color_manager.dart';

class IncomingOrder {
  final String orderId;
  final String customerName;
  final String phone;
  final int itemCount;
  final String amount;
  final String timeAgo;
  OrderStatus status;

  IncomingOrder({
    required this.orderId,
    required this.customerName,
    required this.phone,
    required this.itemCount,
    required this.amount,
    required this.timeAgo,
    this.status = OrderStatus.pending,
  });
}

enum OrderStatus { pending, processing, ready }

final List<IncomingOrder> _allOrders = [
  IncomingOrder(
    orderId: 'Order #12345',
    customerName: 'John Doe',
    phone: '+1 234-567-8901',
    itemCount: 3,
    amount: '\$30.47',
    timeAgo: '10 mins ago',
    status: OrderStatus.pending,
  ),
  IncomingOrder(
    orderId: 'Order #12342',
    customerName: 'Alice Williams',
    phone: '+1 234-567-8904',
    itemCount: 1,
    amount: '\$18.75',
    timeAgo: '2 hours ago',
    status: OrderStatus.pending,
  ),
  IncomingOrder(
    orderId: 'Order #12340',
    customerName: 'Mark Spencer',
    phone: '+1 234-567-8910',
    itemCount: 4,
    amount: '\$55.20',
    timeAgo: '30 mins ago',
    status: OrderStatus.processing,
  ),
  IncomingOrder(
    orderId: 'Order #12338',
    customerName: 'Sara Connor',
    phone: '+1 234-567-8920',
    itemCount: 2,
    amount: '\$22.00',
    timeAgo: '1 hour ago',
    status: OrderStatus.processing,
  ),
  IncomingOrder(
    orderId: 'Order #12335',
    customerName: 'Tom Hanks',
    phone: '+1 234-567-8930',
    itemCount: 6,
    amount: '\$88.99',
    timeAgo: '3 hours ago',
    status: OrderStatus.ready,
  ),
  IncomingOrder(
    orderId: 'Order #12330',
    customerName: 'Emily Rose',
    phone: '+1 234-567-8940',
    itemCount: 2,
    amount: '\$34.50',
    timeAgo: '5 hours ago',
    status: OrderStatus.ready,
  ),
];

class IncomingOrdersPage extends StatefulWidget {
  const IncomingOrdersPage({super.key});

  @override
  State<IncomingOrdersPage> createState() => _IncomingOrdersPageState();
}

class _IncomingOrdersPageState extends State<IncomingOrdersPage> {
  OrderStatus _selectedTab = OrderStatus.pending;

  List<IncomingOrder> get _filtered =>
      _allOrders.where((o) => o.status == _selectedTab).toList();

  void _accept(IncomingOrder order) {
    setState(() => order.status = OrderStatus.processing);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${order.orderId} accepted & moved to Processing'),
        backgroundColor: ColorManager.primary,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }

  void _reject(IncomingOrder order) {
    setState(() => _allOrders.remove(order));
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${order.orderId} rejected'),
        backgroundColor: const Color(0xFFEF4444),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
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
            padding: const EdgeInsets.fromLTRB(16, 18, 16, 0),
            child: _TabBar(
              selected: _selectedTab,
              onChanged: (t) => setState(() => _selectedTab = t),
            ),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: _filtered.isEmpty
                ? _EmptyState(tab: _selectedTab)
                : ListView.separated(
                    padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
                    itemCount: _filtered.length,
                    separatorBuilder: (_, _) => const SizedBox(height: 14),
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
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(28),
          bottomRight: Radius.circular(28),
        ),
      ),
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top + 16,
        left: 8,
        right: 20,
        bottom: 24,
      ),
      child: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.arrow_back_ios_new_rounded,
                color: Colors.white, size: 20),
            onPressed: onBack,
          ),
          const Text(
            'Incoming Orders',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
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
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: ColorManager.primary.withValues(alpha: 0.08),
            blurRadius: 12,
            offset: const Offset(0, 4),
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
                padding: const EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  color: active ? ColorManager.primary : Colors.transparent,
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Text(
                  labels[tab]!,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: active ? Colors.white : const Color(0xFF8898B3),
                    fontWeight:
                        active ? FontWeight.w700 : FontWeight.w500,
                    fontSize: 13,
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
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: ColorManager.primary.withValues(alpha: 0.07),
            blurRadius: 14,
            offset: const Offset(0, 4),
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
                style: const TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 15,
                  color: Color(0xFF1A1D2E),
                ),
              ),
              Text(
                order.amount,
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 15,
                  color: ColorManager.primary,
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                order.customerName,
                style: const TextStyle(
                  color: Color(0xFF1A1D2E),
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Row(
                children: [
                  const Icon(Icons.access_time_rounded,
                      size: 13, color: Color(0xFF8898B3)),
                  const SizedBox(width: 4),
                  Text(
                    order.timeAgo,
                    style: const TextStyle(
                      color: Color(0xFF8898B3),
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            order.phone,
            style: const TextStyle(
              color: Color(0xFF8898B3),
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 6),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${order.itemCount} items',
                style: const TextStyle(
                  color: Color(0xFFB0BEC5),
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                decoration: BoxDecoration(
                  color: badgeColor.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  badgeLabel,
                  style: TextStyle(
                    color: badgeColor,
                    fontSize: 11,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          const Divider(color: Color(0xFFF0F4FF), height: 1),
          const SizedBox(height: 14),
          Row(
            children: [
              Expanded(
                child: ElevatedButton.icon(
                  onPressed: onAccept,
                  icon: const Icon(Icons.check_rounded,
                      size: 16, color: Colors.white),
                  label: const Text(
                    'Accept & Add\nReceiver',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 13,
                      height: 1.3,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ColorManager.primary,
                    elevation: 0,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: onReject,
                  icon: const Icon(Icons.close_rounded,
                      size: 16, color: Color(0xFF8898B3)),
                  label: const Text(
                    'Reject',
                    style: TextStyle(
                      color: Color(0xFF8898B3),
                      fontWeight: FontWeight.w700,
                      fontSize: 13,
                    ),
                  ),
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    side: const BorderSide(color: Color(0xFFE2E8F0)),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
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
          Icon(Icons.inbox_rounded, size: 64, color: Colors.grey.shade300),
          const SizedBox(height: 16),
          Text(
            labels[tab]!,
            style: const TextStyle(
              color: Color(0xFF8898B3),
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
