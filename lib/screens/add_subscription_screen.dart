import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart'; // Import Uuid package
import '../models/subscription.dart';
import '../providers/subscription_provider.dart';

class AddSubscriptionScreen extends StatefulWidget {
  @override
  _AddSubscriptionScreenState createState() => _AddSubscriptionScreenState();
}

class _AddSubscriptionScreenState extends State<AddSubscriptionScreen> {
  final _nameController = TextEditingController();
  final _priceController = TextEditingController();
  DateTime _nextPayment = DateTime.now();
  String _billingCycle = "Monthly";
  String _category = "General";
  final _uuid = Uuid(); // Unique ID generator

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add Subscription")),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: "Subscription Name"),
            ),
            TextField(
              controller: _priceController,
              decoration: InputDecoration(labelText: "Price"),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 10),
            DropdownButtonFormField<String>(
              value: _billingCycle,
              decoration: InputDecoration(labelText: "Billing Cycle"),
              items: ["Monthly", "Yearly"].map((cycle) {
                return DropdownMenuItem(value: cycle, child: Text(cycle));
              }).toList(),
              onChanged: (value) => setState(() => _billingCycle = value!),
            ),
            SizedBox(height: 10),
            DropdownButtonFormField<String>(
              value: _category,
              decoration: InputDecoration(labelText: "Category"),
              items:
                  ["General", "Entertainment", "Work", "Education"].map((cat) {
                return DropdownMenuItem(value: cat, child: Text(cat));
              }).toList(),
              onChanged: (value) => setState(() => _category = value!),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                double? price = double.tryParse(_priceController.text);
                if (price == null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Please enter a valid price")),
                  );
                  return;
                }

                final newSubscription = Subscription(
                  id: _uuid.v4(), // Generate unique ID
                  name: _nameController.text,
                  price: price,
                  billingCycle: _billingCycle,
                  nextPayment: _nextPayment,
                  category: _category,
                );

                Provider.of<SubscriptionProvider>(context, listen: false)
                    .addSubscription(newSubscription);
                Navigator.pop(context);
              },
              child: Text("Add Subscription"),
            ),
          ],
        ),
      ),
    );
  }
}
