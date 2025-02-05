import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/subscription_provider.dart';
import '../widgets/subscription_card.dart';
import 'add_subscription_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final subscriptionProvider = Provider.of<SubscriptionProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text("Subscriptions")),
      body: subscriptionProvider.subscriptions.isEmpty
          ? Center(child: Text("No subscriptions yet."))
          : ListView.builder(
              itemCount: subscriptionProvider.subscriptions.length,
              itemBuilder: (context, index) {
                return SubscriptionCard(
                    subscriptionProvider.subscriptions[index]);
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddSubscriptionScreen()),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
