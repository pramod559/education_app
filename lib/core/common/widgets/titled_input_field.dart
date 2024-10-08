import 'package:education_app/core/common/widgets/i_field.dart';
import 'package:education_app/core/res/colours.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class TitledInputField extends StatelessWidget {
  const TitledInputField({
    super.key,
    this.required = true,
    required this.controller,
    required this.title,
    this.hintText,
    this.hintStyle,
    this.suffixIcon,
  });

  final bool required;
  final TextEditingController controller;
  final String title;
  final String? hintText;
  final TextStyle? hintStyle;
  final Widget? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            RichText(
              text: TextSpan(
                  text: title,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colours.neutralTextColour,
                  ),
                  children: !required
                      ? null
                      : [
                          TextSpan(
                            text: ' *',
                            style: TextStyle(color: Colours.redColour),
                          )
                        ]),
            ),
            if (suffixIcon != null) suffixIcon!,
          ],
        ),
        SizedBox(height: 10),
        IField(
          controller: controller,
          hintText: hintText ?? 'Enter$title',
          hintStyle: hintStyle,
          overrideValidator: true,
          validator: (value) {
            if (!required) return null;

            if (value == null || value.isEmpty) {
              return 'This field is required';
            }
            return null;
          },
        )
      ],
    );
  }
}
