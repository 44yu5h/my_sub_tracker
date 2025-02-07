import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:google_fonts/google_fonts.dart';
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
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
          child: subscriptionProvider.subscriptions.isEmpty
              ? const Expanded(
                  child: Center(
                    child: Text(
                      "No subscriptions yet.",
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                )
              : SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      subscriptionProvider.subscriptions.isEmpty
                          ? Container()
                          : Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 20),
                                Card.filled(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20))),
                                  color: Colors.cyan.withOpacity(0.18),
                                  child: FittedBox(
                                    alignment: Alignment.topLeft,
                                    fit: BoxFit.scaleDown,
                                    child: Padding(
                                      padding: const EdgeInsets.all(15),
                                      child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                Text(
                                                  "\$ 99.99",
                                                  textAlign: TextAlign.left,
                                                  style: GoogleFonts.montserrat(
                                                    textStyle: TextStyle(
                                                      fontSize: 48,
                                                      color:
                                                          Colors.grey.shade800,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                                  ),
                                                ),
                                                TextButton(
                                                  style: ButtonStyle(
                                                    overlayColor:
                                                        WidgetStateProperty.all(
                                                            Colors.transparent),
                                                  ),
                                                  onPressed: () {
                                                    /* Change from monthly to annual and save config */
                                                  },
                                                  child: Text(
                                                    "monthly",
                                                    textAlign: TextAlign.left,
                                                    style:
                                                        GoogleFonts.montserrat(
                                                      textStyle: TextStyle(
                                                        fontSize: 33,
                                                        color: Colors.grey
                                                            .withOpacity(0.4),
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(height: 10),
                                            Text("Next billing: 12/02/25",
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    color: Colors.black)),
                                            SizedBox(height: 6),
                                            Text(
                                              "11 Active",
                                              textAlign: TextAlign.left,
                                              style: GoogleFonts.montserrat(
                                                textStyle: TextStyle(
                                                  fontSize: 22,
                                                  color: Colors.grey.shade800,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                            ),
                                            SizedBox(height: 6),
                                          ]),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 16),
                                Text(
                                  "\tYour subscriptions",
                                  textAlign: TextAlign.left,
                                  style: GoogleFonts.montserrat(
                                    textStyle: TextStyle(
                                      fontSize: 30,
                                      color: Colors.grey.withOpacity(0.4),
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 14),
                              ],
                            ),
                      ListView.builder(
                        padding: const EdgeInsets.fromLTRB(5, 10, 5, 10),
                        physics: BouncingScrollPhysics(),
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: subscriptionProvider.subscriptions.length,
                        itemBuilder: (context, index) {
                          return SubscriptionCard(
                              subscriptionProvider.subscriptions[index]);
                        },
                      ),
                    ],
                  ),
                ),
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
