import 'dart:ui';
import 'package:flutter/material.dart';
import '../models/subscription.dart';

class SubscriptionCard extends StatelessWidget {
  final Subscription subscription;

  SubscriptionCard(this.subscription);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.1), // Semi-transparent
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 13, 18, 13),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Subscription Logo/Icon
                  CircleAvatar(
                    radius: 25,
                    backgroundColor: Colors.black,
                    child: _getSubscriptionIcon(subscription.name),
                  ),
                  SizedBox(width: 16),

                  // Subscription Details
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                subscription.name,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 2),
                              Text(
                                "Next Payment: ${_formatDate(subscription.nextPayment)}",
                                style: TextStyle(
                                    color: Colors.grey.shade500, fontSize: 12),
                              ),
                            ]),
                        Column(
                          children: [
                            Text(
                              "\$${subscription.price.toStringAsFixed(2)}",
                              style: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700),
                            ),
                            Text(
                              "${subscription.billingCycle}",
                              style: TextStyle(
                                  color: Colors.black45, fontSize: 16),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 8),
        ],
      ),
    );
  }

  // Function to get Subscription Icon
  Widget _getSubscriptionIcon(String name) {
    Map<String, IconData> iconMap = {
      "Netflix": Icons.movie,
      "Spotify": Icons.music_note,
      "YouTube": Icons.play_circle_filled,
      "Duolingo": Icons.school,
      "Amazon": Icons.shopping_cart,
    };

    return Icon(
      iconMap[name] ?? Icons.subscriptions,
      size: 28,
      color: Colors.white,
    );
  }

  // Function to format date
  String _formatDate(DateTime date) {
    return "${date.day} ${_getMonthName(date.month)} ${date.year}";
  }

  String _getMonthName(int month) {
    const monthNames = [
      "Jan",
      "Feb",
      "Mar",
      "Apr",
      "May",
      "Jun",
      "Jul",
      "Aug",
      "Sep",
      "Oct",
      "Nov",
      "Dec"
    ];
    return monthNames[month - 1];
  }
}
