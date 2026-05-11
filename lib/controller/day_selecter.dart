import 'dart:async';
import 'package:flutter/material.dart';
import 'package:rosheta_ai/core/resources/fonts_manager.dart';
import 'package:rosheta_ai/core/resources/radius_manager.dart';

import '../core/resources/height_manager.dart';
import '../core/resources/width_manager.dart';

class DaysSelector extends StatefulWidget {
  const DaysSelector({super.key});

  @override
  State<DaysSelector> createState() => _DaysSelectorState();
}

class _DaysSelectorState extends State<DaysSelector> {
  final StreamController<int> _controller = StreamController<int>.broadcast();

  int selectedIndex = 2; // default (Wed)

  final List<Map<String, String>> days = [
    {"day": "Mon", "date": "21"},
    {"day": "Tue", "date": "22"},
    {"day": "Wed", "date": "23"},
    {"day": "Thu", "date": "24"},
    {"day": "Fri", "date": "25"},
    {"day": "Sat", "date": "26"},
  ];

  @override
  void dispose() {
    _controller.close();
    super.dispose();
  }

  void selectDay(int index) {
    selectedIndex = index;
    _controller.sink.add(index);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: HeightManager.h90,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: days.length,
        separatorBuilder: (_, _) => SizedBox(width: WidthManagers.w10),
        itemBuilder: (context, index) {
          return StreamBuilder<int>(
            stream: _controller.stream,
            initialData: selectedIndex,
            builder: (context, snapshot) {
              bool isSelected = snapshot.data == index;

              return GestureDetector(
                onTap: () => selectDay(index),
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  width: WidthManagers.w70,
                  decoration: BoxDecoration(
                    color: isSelected ? Colors.teal : Colors.transparent,
                    borderRadius: BorderRadius.circular(RadiusValuesManager.r20),
                    border: Border.all(
                      color: isSelected ? Colors.teal : Colors.grey.shade300,
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        days[index]["day"]!,
                        style: TextStyle(
                          color:
                          isSelected ? Colors.white : Colors.grey,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        days[index]["date"]!,
                        style: TextStyle(
                          fontSize: FontSizeManagers.f20,
                          fontWeight: FontWeight.bold,
                          color:
                          isSelected ? Colors.white : Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}