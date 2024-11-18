import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// Categories
enum EventCategory {
  All,
  Sports,
  Food,
  Kids,
  Creative,
  Popular,
  Calm,
}


String categoryToString(EventCategory category) {
  switch (category) {
    case EventCategory.All:
      return "All";  
    case EventCategory.Sports:
      return "Sports";
    case EventCategory.Food:
      return "Food";
    case EventCategory.Kids:
      return "Kids";
    case EventCategory.Creative:
      return "Creative";
    case EventCategory.Popular:
      return "Popular";
    case EventCategory.Calm:
      return "Calm";
  }
}

Widget EventCard({
  required String title,
  required String time,
  required String location,
  required int spots, 
  required int intensityLevel, 
  required String price,
  required DateTime date,
  required bool childcare, 
  required EventCategory category, 
}) {
  final DateFormat dateFormatter = DateFormat('dd MMM, yyyy');
  final bool isSoldOut = spots < 1;

  // Map insensity level
  final Map<int, Map<String, dynamic>> intensityMap = {
    0: {'text': 'Light', 'color': Colors.lightBlue},
    1: {'text': 'Medium', 'color': Colors.purple},
    2: {'text': 'High', 'color': Colors.orange},
    3: {'text': 'Hard', 'color': Colors.red},
  };

  final String intensityText = intensityMap[intensityLevel]?['text'] ?? 'Unknown';
  final Color intensityColor = intensityMap[intensityLevel]?['color'] ?? Colors.grey;

  return Container(
    margin: const EdgeInsets.symmetric(vertical: 8),
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.1),
          blurRadius: 4,
          offset: const Offset(0, 2),
        ),
      ],
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Left Section
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Date
            Text(
              dateFormatter.format(date),
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.grey),
            ),
            const SizedBox(height: 4),
            // Time and duration
            Text(
              time,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black),
            ),
            const SizedBox(height: 4),
            // Title
            Text(
              title,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            // Location
            Row(
              children: [
                const Icon(Icons.location_on, size: 16, color: Colors.grey),
                const SizedBox(width: 4),
                Text(
                  location,
                  style: const TextStyle(fontSize: 14, color: Colors.grey),
                ),
              ],
            ),
            const SizedBox(height: 8),
            // Spots, Intensity, and Childcare tags
            Row(
              children: [
                // Spots left
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    spots > 0 ? "$spots spots left" : "Sold Out",
                    style: TextStyle(
                      fontSize: 12,
                      color: spots > 0 ? Colors.grey : Colors.red,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                // Intensity
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: intensityColor.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    intensityText,
                    style: TextStyle(fontSize: 12, color: intensityColor),
                  ),
                ),
                const SizedBox(width: 8),
                // Childcare
                if (childcare)
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.green.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Text(
                      'Childcare',
                      style: TextStyle(fontSize: 12, color: Colors.green),
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 8),
            // Category (text test)
            //Text(
            //  "Test* Category: ${categoryToString(category)}",
            //  style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: Colors.grey),
            //),
          ],
        ),
        // Right Section (Price and Button)
        Column(
          children: [
            // Price
            Text(
              price,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            // Join button
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: isSoldOut ? Colors.grey : Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
              ),
              onPressed: isSoldOut
                  ? null 
                  : () {
    
                      print("Join event!");
                    },
              child: Text(
                isSoldOut ? "Sold Out" : "Join",
                style: TextStyle(color: isSoldOut ? Colors.black : Colors.white),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}