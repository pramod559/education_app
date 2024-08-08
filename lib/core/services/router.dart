import 'package:education_app/core/common/app/providers/user_provider.dart';
import 'package:education_app/core/common/views/page_under_construction.dart';
import 'package:education_app/core/services/injection_container.dart';
import 'package:education_app/src/auth/data/models/user_model.dart';
import 'package:education_app/src/auth/presentation/bloc/auth_bloc.dart';
import 'package:education_app/src/auth/presentation/views/sign_up_screen.dart';
import 'package:education_app/src/dashboard/presentation/views/dashboard.dart';
import 'package:education_app/src/on_boarding/data/dataSources/on_boarding_local_data_source.dart';
import 'package:education_app/src/on_boarding/presentation/on_boarding/on_boarding_cubit.dart';
import 'package:education_app/src/on_boarding/presentation/views/on_boarding_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart' as fui;
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../src/auth/presentation/views/sign_in_screen.dart';

part 'router.main.dart';

// Route<dynamic> generateRoute(RouteSettings settings) {
//   switch (settings.name) {
//     case '/':
//       final prefs = sl<SharedPreferences>();
//       return _pageBuilder(
//         (context) {
//           if (prefs.getBool(kFirstTimerkey) ?? true) {
//             return BlocProvider(
//               create: (context) => sl<OnBoardingCubit>(),
//               child: OnBoardingScreen(),
//             );
//           } else if (sl<FirebaseAuth>().currentUser != null) {
//             final user = sl<FirebaseAuth>().currentUser!;
//             final localUser = LocalUserModel(
//                 uId: user.uid,
//                 email: user.email ?? '',
//                 points: 0,
//                 fullName: user.displayName ?? '');
//             context.read<UserProvider>().initUser(localUser);
//             return Dashboard();
//           }
//           return BlocProvider(
//             create: (_) => sl<AuthBloc>(),
//             child: SignInScreen(),
//           );
//         },
//         settings: settings,
//       );

//     case SignInScreen.routerName:
//       return _pageBuilder(
//           (_) => BlocProvider(
//                 create: (_) => sl<AuthBloc>(),
//                 child: SignInScreen(),
//               ),
//           settings: settings);
//     case SignUpScreen.routerName:
//       return _pageBuilder(
//           (_) => BlocProvider(
//                 create: (_) => sl<AuthBloc>(),
//                 child: SignUpScreen(),
//               ),
//           settings: settings);

//     case Dashboard.routeName:
//       return _pageBuilder(
//         (_) => Dashboard(),
//         settings: settings,
//       );

//     default:
//       return _pageBuilder(
//         (_) => PageUnderConstruction(),
//         settings: settings,
//       );
//   }
// }

// PageRouteBuilder<dynamic> _pageBuilder(
//   Widget Function(BuildContext) page, {
//   required RouteSettings settings,
// }) {
//   return PageRouteBuilder(
//     settings: settings,
//     transitionsBuilder: (_, animation, __, child) => FadeTransition(
//       opacity: animation,
//       child: child,
//     ),
//     pageBuilder: (context, _, __) => page(context),
//   );
// }
