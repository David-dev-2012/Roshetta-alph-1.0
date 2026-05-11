import 'package:flutter/material.dart';

class MedicalItem {
  final String title;
  final dynamic icon;
  final Color color;
  final List<String> tips;

  MedicalItem({
    required this.title,
    required this.icon,
    required this.color,
    required this.tips,
  });
}