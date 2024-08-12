import 'package:flutter/material.dart';

// Ensure you have the iconly package imported

class UserInfoCard extends StatelessWidget {
  final Color infoThemeColour;
  final Widget infoIcon;
  final String infoTitle;
  final String infoValue;

  const UserInfoCard({
    super.key,
    required this.infoThemeColour,
    required this.infoIcon,
    required this.infoTitle,
    required this.infoValue,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: infoThemeColour,
        borderRadius: BorderRadius.circular(8.0),
      ),
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          infoIcon,
          const SizedBox(width: 8.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                infoTitle,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                infoValue,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14.0,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
