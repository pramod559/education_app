import 'package:education_app/core/common/app/providers/user_provider.dart';
import 'package:education_app/core/res/colours.dart';
import 'package:education_app/core/res/media_res.dart';
import 'package:education_app/src/profile/presentation/widgets/user_into_card.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:iconly/iconly.dart';
import 'package:provider/provider.dart';

class ProfileBody extends StatelessWidget {
  const ProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<UserProvider>(builder: (_, provider, __) {
      final user = provider.user;

      return Column(
        children: [
          Row(
            children: [
              Expanded(
                  child: UserInfoCard(
                infoThemeColour: Colours.physicsTileColour,
                infoIcon: Icon(
                  IconlyLight.document,
                  size: 24,
                  color: Color(0xFF767DFF),
                ),
                infoTitle: 'Cources',
                infoValue: user!.enrolledCourseIds.length.toString(),
              )),
              SizedBox(width: 20),
              Expanded(
                child: UserInfoCard(
                  infoThemeColour: Colours.languageTileColour,
                  infoIcon: Image.asset(
                    MediaRes.scoreboard,
                    height: 24,
                    width: 24,
                  ),
                  infoTitle: 'Score',
                  infoValue: user.points.toString(),
                ),
              )
            ],
          ),
          SizedBox(height: 20),
          Row(
            children: [
              //
            ],
          )
        ],
      );
    });
  }
}
