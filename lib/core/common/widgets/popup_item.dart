import 'package:flutter/material.dart';

class PopUpItem extends StatelessWidget {
  final String title;
  final Widget icon;

  const PopUpItem({super.key, required this.title, required this.icon});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
        ),
        icon,
      ],
    );
  }
}
