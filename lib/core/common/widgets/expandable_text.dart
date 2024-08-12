import 'package:education_app/core/extensions/context_extension.dart';
import 'package:education_app/core/res/colours.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class ExpandableText extends StatefulWidget {
  const ExpandableText(
    this.context, {
    super.key,
    this.style,
    required this.text,
  });

  final BuildContext context;
  final String text;
  final TextStyle? style;
  @override
  State<ExpandableText> createState() => _ExpandableTextState();
}

class _ExpandableTextState extends State<ExpandableText> {
  bool expanded = false;
  late TextSpan textSpan;
  late TextPainter textPainter;

  @override
  void initState() {
    // TODO: implement initState

    textSpan = TextSpan(
      text: widget.text,
      style: widget.style?.copyWith(color: Colours.neutralTextColour),
      children: [
        TextSpan(
            text: expanded ? 'show less' : 'show more',
            style: TextStyle(
              color: Colours.primaryColour,
              fontWeight: FontWeight.w600,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                setState(() {
                  expanded = !expanded;
                });
              })
      ],
    );
    textPainter = TextPainter(
      text: textSpan,
      textDirection: TextDirection.ltr,
      maxLines: expanded ? null : 2,
    )..layout(maxWidth: context.width);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
