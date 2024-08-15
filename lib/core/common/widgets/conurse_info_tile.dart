import 'package:education_app/core/res/colours.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ConrseInfoTile extends StatelessWidget {
  const ConrseInfoTile({
    super.key,
    this.onTap,
    required this.image,
    required this.title,
    required this.subtitle,
  });

  final VoidCallback? onTap;
  final String image;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          SizedBox(
            height: 48,
            width: 48,
            child: Padding(
              padding: const EdgeInsets.only(top: 2),
              child: Transform.scale(scale: 1.48, child: Image.asset(image)),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              Text(
                subtitle,
                style: TextStyle(
                  fontSize: 12,
                  color: Colours.neutralTextColour,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
