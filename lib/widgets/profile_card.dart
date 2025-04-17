import 'package:flutter/material.dart';
import 'package:workout_planner/constant/constant.dart';
import 'package:workout_planner/constant/responsive.dart';

class ProfileCard extends StatefulWidget {
  final String taskName;
  final String taskImageUrl;
  final void Function() marksAsDone;
  const ProfileCard({
    super.key,
    required this.taskName,
    required this.taskImageUrl,
    required this.marksAsDone
  });

  @override
  State<ProfileCard> createState() => _ProfileCardState();
}

class _ProfileCardState extends State<ProfileCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin:const  EdgeInsets.only(bottom: 10),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: kCardBgColor,
      ),
      child: Padding(
        padding: const EdgeInsets.all(kDefaultPadding),
        child: Row(
          children: [
            Image.asset(
              widget.taskImageUrl,
              width: 50,
              fit: BoxFit.cover,
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              widget.taskName,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            const Spacer(),
            IconButton(
                onPressed: () {
                  widget.marksAsDone();
                },
                icon: const Icon(
                    Icons.check,
                  color: kMainColor,
                )
            ),
          ],
        ),
      ),
    );
  }
}
