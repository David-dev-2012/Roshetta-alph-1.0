import 'package:flutter/material.dart';
import 'medicine_card.dart';
import '../../../core/resources/utils.dart';

class MedicineList extends StatelessWidget {
  const MedicineList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        MedicineCard(Utils.obhCombi, Utils.ml75, Utils.p999),
        MedicineCard(Utils.betadine, Utils.ml50, Utils.p699),
        MedicineCard(Utils.panadol, Utils.pcs20, Utils.p1599),
        MedicineCard(Utils.bodrexHerbal, Utils.ml100, Utils.p799),
      ],
    );
  }
}