import 'package:flutter/material.dart';

class PromoCard extends StatelessWidget {
  final String title;
  final String description;

  PromoCard({required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.green[50],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          Text(description, style: TextStyle(fontSize: 14)),
        ],
      ),
    );
  }
}
