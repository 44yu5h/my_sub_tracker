import 'dart:ui';
import 'package:flutter/material.dart';
import '../models/subscription.dart';

class SubscriptionCard extends StatelessWidget {
  final Subscription subscription;

  SubscriptionCard(this.subscription);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10), // Glass effect
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.1), // Semi-transparent
              borderRadius: BorderRadius.circular(20),
              // border: Border.all(
              //     color: Colors.white.withOpacity(0.2)), // Subtle border
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 10,
                  spreadRadius: 2,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Subscription Logo/Icon
                  CircleAvatar(
                    radius: 28,
                    backgroundColor: Colors.white.withOpacity(0.2),
                    child: _getSubscriptionIcon(subscription.name),
                  ),
                  SizedBox(width: 16),

                  // Subscription Details
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          subscription.name,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          "\$${subscription.price.toStringAsFixed(2)} / ${subscription.billingCycle}",
                          style: TextStyle(color: Colors.grey.shade300),
                        ),
                        SizedBox(height: 4),
                        Text(
                          "Next Payment: ${_formatDate(subscription.nextPayment)}",
                          style: TextStyle(
                              color: Colors.grey.shade400, fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
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
