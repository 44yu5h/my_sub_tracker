import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:provider/provider.dart';
import '../providers/subscription_provider.dart';
import '../widgets/subscription_card.dart';
import 'add_subscription_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final subscriptionProvider = Provider.of<SubscriptionProvider>(context);

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(color: Colors.white),
        child: Column(
          children: [
            Expanded(
              child: subscriptionProvider.subscriptions.isEmpty
                  ? Center(
                      child: Text(
                        "No subscriptions yet.",
                        style: TextStyle(color: Colors.white54, fontSize: 16),
                      ),
                    )
                  : ListView.builder(
                      itemCount: subscriptionProvider.subscriptions.length,
                      itemBuilder: (context, index) {
                        return SubscriptionCard(
                            subscriptionProvider.subscriptions[index]);
                      },
                    ),
            ),
          ],
        ),
      ),
      // FAB ########################################################
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.cyan.shade50,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
        onPressed: () {
          // Modal Sheet ################################################
          showModalBottomSheet(
            context: context,
            showDragHandle: true,
            isScrollControlled: true, // Allows for a fully customizable height
            backgroundColor: Colors.white, // Transparent background
            // barrierColor: Colors.black,
            builder: (context) => ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.75,
                child: Stack(
                  children: [
                    Container(),
                    AddSubscriptionScreen(), // Add your content here
                  ],
                ),
              ),
            ),
          );
        },
        child: Icon(Icons.add, color: Colors.black),
      ),
    );
  }
}
