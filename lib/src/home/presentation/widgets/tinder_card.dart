import 'package:education_app/core/common/app/providers/course_of_the_day_notifier.dart';
import 'package:education_app/core/extensions/context_extension.dart';
import 'package:education_app/core/res/colours.dart';
import 'package:education_app/core/res/media_res.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconly/iconly.dart';

class TinderCard extends StatelessWidget {
  const TinderCard({
    super.key,
    required this.isFirst,
    this.colour,
  });

  final bool isFirst;
  final Color? colour;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomCenter,
      height: 137,
      padding: EdgeInsets.only(left: 20),
      decoration: BoxDecoration(
          gradient: isFirst
              ? LinearGradient(
                  colors: [
                    Color(0xFF8E96FF),
                    Color(0xFFA06AF9),
                  ],
                )
              : null,
          color: colour,
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(.15),
                offset: Offset(0, 4),
                blurRadius: 10)
          ]),
      child: isFirst
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  '${context.courseOfTheDay?.title ?? 'Chemistry'}'
                  ' final\nexams',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                  ),
                ),
                Row(
                  children: [
                    Icon(IconlyLight.notification, color: Colors.white),
                    SizedBox(width: 8),
                    Text(
                      '45 minutes',
                      style: TextStyle(color: Colors.white, fontSize: 14),
                    )
                  ],
                )
              ],
            )
          : null,
    );

/*
    Center(
      child: Container(
        padding: isFirst ? EdgeInsets.only(top: 65) : null,
        color: isFirst ? Colours.redColour : null,
        child: Center(
          child: Stack(
            children: [
              if (isFirst)
                Positioned(
                  bottom: 20,
                  right: 20,
                  child: Image.asset(
                    MediaRes.microscope,
                    height: 180,
                    width: 149,
                  ),
                )
            ],
          ),
        ),
      ),
    );


*/
  }
}
