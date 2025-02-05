import 'package:flutter/material.dart';

class Subscription {
  String id;
  String name;
  double price;
  String billingCycle;
  DateTime nextPayment;
  bool isRecurring;
  String category; // ✅ Ensure category is included

  Subscription({
    required this.id,
    required this.name,
    required this.price,
    required this.billingCycle,
    required this.nextPayment,
    required this.category, // ✅ Add category
    this.isRecurring = false,
  });

  void updateNextPayment() {
    if (isRecurring) {
      if (billingCycle == 'Monthly') {
        nextPayment = nextPayment.add(Duration(days: 30));
      } else if (billingCycle == 'Yearly') {
        nextPayment = nextPayment.add(Duration(days: 365));
      }
    }
  }
}
