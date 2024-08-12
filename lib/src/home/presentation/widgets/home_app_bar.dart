import 'package:education_app/core/common/app/providers/user_provider.dart';
import 'package:education_app/core/res/media_res.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:provider/provider.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(title: Text('My Classes'), centerTitle: false, actions: [
      IconButton(onPressed: () {}, icon: Icon(Icons.search)),
      Icon(IconlyLight.notification),
      Consumer<UserProvider>(builder: (_, provider, __) {
        return Padding(
          padding: EdgeInsets.only(right: 16),
          child: CircleAvatar(
            backgroundImage: provider.user!.profilePic != null
                ? NetworkImage(provider.user!.profilePic!)
                : AssetImage(MediaRes.user) as ImageProvider,
          ),
        );
      })
    ]);
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
