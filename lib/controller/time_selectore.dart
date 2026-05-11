import 'dart:async';
import 'package:flutter/material.dart';
import 'package:rosheta_ai/core/resources/radius_manager.dart';

class TimeSelector extends StatefulWidget {
  const TimeSelector({super.key});

  @override
  State<TimeSelector> createState() => _TimeSelectorState();
}

class _TimeSelectorState extends State<TimeSelector> {
  final StreamController<int> _controller = StreamController<int>.broadcast();

  int selectedIndex = 4;

  final List<Map<String, dynamic>> times = [
    {"time": "09:00 AM", "active": false},
    {"time": "10:00 AM", "active": true},
    {"time": "11:00 AM", "active": false},
    {"time": "01:00 PM", "active": false},
    {"time": "02:00 PM", "active": true},
    {"time": "03:00 PM", "active": true},
    {"time": "04:00 PM", "active": true},
    {"time": "07:00 PM", "active": true},
    {"time": "08:00 PM", "active": false},
  ];

  @override
  void dispose() {
    _controller.close();
    super.dispose();
  }

  void selectTime(int index) {
    if (!times[index]["active"]) return; // ignore inactive
    selectedIndex = index;
    _controller.sink.add(index);
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      itemCount: times.length,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
        childAspectRatio: 2.2,
      ),
      itemBuilder: (context, index) {
        return StreamBuilder<int>(
          stream: _controller.stream,
          initialData: selectedIndex,
          builder: (context, snapshot) {
            bool isSelected = snapshot.data == index;
            bool isActive = times[index]["active"];

            return GestureDetector(
              onTap: () => selectTime(index),
              child: AnimatedContainer(
                duration: Duration(milliseconds: 250),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: isSelected
                      ? Colors.teal
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(RadiusValuesManager.r20),
                  border: Border.all(
                    color: isSelected
                        ? Colors.teal
                        : isActive
                        ? Colors.teal.withValues(alpha: 0.5)
                        : Colors.grey.shade300,
                  ),
                ),
                child: Text(
                  times[index]["time"],
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: isSelected
                        ? Colors.white
                        : isActive
                        ? Colors.black
                        : Colors.grey.shade400,
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}