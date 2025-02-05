import 'package:flutter/material.dart';
import '../models/subscription.dart';

class SubscriptionProvider with ChangeNotifier {
  List<Subscription> _subscriptions = [];

  List<Subscription> get subscriptions => _subscriptions;

  void addSubscription(Subscription subscription) {
    _subscriptions.add(subscription);
    notifyListeners();
  }

  void deleteSubscription(String id) {
    _subscriptions.removeWhere((sub) => sub.id == id);
    notifyListeners();
  }

  void updateNextPayments() {
    for (var sub in _subscriptions) {
      sub.updateNextPayment();
    }
    notifyListeners();
  }
}
