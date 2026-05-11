import 'package:flutter/material.dart';

import '../core/resources/color_manager.dart';
import '../core/resources/width_manager.dart';

class CounterControl extends StatefulWidget {
  final int initialValue;
  final Function(int)? onChanged;
  final double iconSize;
  final double numberSize;
  const CounterControl({super.key, this.initialValue = 0, this.onChanged, required this.iconSize, required this.numberSize});

  @override
  State<CounterControl> createState() => _CounterControlState();
}

class _CounterControlState extends State<CounterControl> {
  late int count;

  @override
  void initState() {
    super.initState();
    count = widget.initialValue;
  }

  void increment() {
    setState(() {
      count++;
    });
    widget.onChanged?.call(count);
  }

  void decrement() {
    if (count > 0) {
      setState(() {
        count--;
      });
      widget.onChanged?.call(count);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          onPressed: decrement,
          icon: Icon(Icons.remove, size: widget.iconSize),
        ),

        Text('$count', style: TextStyle(fontSize: widget.numberSize,fontWeight: FontWeight.bold)),

        SizedBox(width: WidthManagers.w8),
        InkWell(
          onTap: () {
            increment();
          },
          child: Icon(
            Icons.add_box_rounded,
            color: ColorManager.primary,
            size: widget.iconSize,
          ),
        ),
      ],
    );
  }
}