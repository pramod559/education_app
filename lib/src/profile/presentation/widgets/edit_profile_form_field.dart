import 'package:education_app/core/common/widgets/i_field.dart';
import 'package:education_app/core/res/colours.dart';
import 'package:flutter/material.dart';

class EditProfileFormField extends StatelessWidget {
  const EditProfileFormField({
    super.key,
    required this.fieldTitle,
    required this.controller,
    this.hintText,
    this.readOnly = false,
  });

  final String fieldTitle;
  final TextEditingController controller;
  final String? hintText;
  final bool readOnly;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 10),
          child: Text(
            fieldTitle,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
          ),
        ),
        SizedBox(height: 10),
        IField(
          controller: controller,
          hintText: hintText,
          readOnly: readOnly,
        ),
        SizedBox(height: 30),
      ],
    );
  }
}
