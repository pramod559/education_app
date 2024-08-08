import 'dart:async';

import 'package:education_app/core/common/widgets/popup_item.dart';
import 'package:education_app/core/extensions/context_extension.dart';
import 'package:education_app/core/res/colours.dart';
import 'package:education_app/core/services/injection_container.dart';
import 'package:education_app/src/auth/presentation/bloc/auth_bloc.dart';
import 'package:education_app/src/profile/presentation/views/edit_profile_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconly/iconly.dart';

class ProfileAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ProfileAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text(
        'Account',
        style: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 24,
        ),
      ),
      actions: [
        PopupMenuButton(
            offset: const Offset(0, 50),
            surfaceTintColor: Colors.white,
            icon: Icon(Icons.more_horiz),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            itemBuilder: (_) => [
                  PopupMenuItem<void>(
                    child: const PopUpItem(
                      title: 'Edit Profile',
                      icon: Icon(
                        Icons.edit_outlined,
                        color: Colours.neutralTextColour,
                      ),
                    ),
                    onTap: () => context.push(
                      BlocProvider(
                          create: (_) => sl<AuthBloc>(),
                          child: const EditProfileView()),
                    ),
                  ),
                  PopupMenuItem<void>(
                    child: const PopUpItem(
                        title: 'Notification',
                        icon: Icon(IconlyLight.notification,
                            color: Colours.neutralTextColour)),
                  ),
                  PopupMenuItem<void>(
                    child: const PopUpItem(
                        title: 'Help',
                        icon: Icon(Icons.help_outline_outlined,
                            color: Colours.neutralTextColour)),
                  ),
                  PopupMenuItem(
                    height: 1,
                    padding: EdgeInsets.zero,
                    child: Divider(
                      height: 1,
                      color: Colors.grey.shade300,
                      endIndent: 16,
                      indent: 16,
                    ),
                  ),
                  PopupMenuItem<void>(
                      child: const PopUpItem(
                          title: 'Logout',
                          icon: Icon(Icons.logout_rounded,
                              color: Colours.neutralTextColour)),
                      onTap: () async {
                        final navigator = Navigator.of(context);

                        await FirebaseAuth.instance.signOut();
                        unawaited(navigator.pushNamedAndRemoveUntil(
                          '/',
                          (route) => false,
                        ));
                      }),
                ]),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
