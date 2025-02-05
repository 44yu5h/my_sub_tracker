import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import '../models/subscription.dart';
import '../providers/subscription_provider.dart';

class SubscriptionCard extends StatelessWidget {
  final Subscription subscription;

  SubscriptionCard(this.subscription);

  @override
  Widget build(BuildContext context) {
    return Slidable(
      endActionPane: ActionPane(
        motion: DrawerMotion(),
        children: [
          SlidableAction(
            onPressed: (context) {
              Provider.of<SubscriptionProvider>(context, listen: false)
                  .deleteSubscription(subscription.id);
            },
            backgroundColor: Colors.red,
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: 'Delete',
          ),
        ],
      ),
      child: Card(
        margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: ListTile(
          leading: Icon(Icons.subscriptions, color: Colors.blueAccent),
          title: Text(
            subscription.name,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Text(
            "\$${subscription.price} - ${subscription.billingCycle}\nNext Payment: ${subscription.nextPayment.toLocal()}",
            style: TextStyle(color: Colors.grey[600]),
          ),
          trailing: subscription.isRecurring
              ? Icon(Icons.autorenew, color: Colors.green)
              : null,
        ),
      ),
    );
  }
}
