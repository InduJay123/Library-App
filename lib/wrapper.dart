import 'package:flutter/material.dart';
import 'package:workout_planner/models/UserModel.dart';
import 'package:workout_planner/pages/home_page.dart';
import 'package:workout_planner/screens/authentication/authenticate.dart';
import 'package:provider/provider.dart';
import 'package:workout_planner/screens/home/home_nav.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    //the user data that the provider proides this can be a user data or can be null.
    final user = Provider.of<UserModel?>(context);

    if (user == null) {
      return Authenticate();
    } else {
      return HomeMainApp();
    }
  }
}