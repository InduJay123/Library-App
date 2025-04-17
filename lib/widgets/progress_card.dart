import 'package:flutter/material.dart';
import 'package:workout_planner/constant/constant.dart';

class ProgressCard extends StatefulWidget {
  final double progressValue;
  final int total;
  const ProgressCard({
    super.key,
    required this.progressValue,
    required this.total
  });

  @override
  State<ProgressCard> createState() => _ProgressCardState();
}

class _ProgressCardState extends State<ProgressCard> {
  @override
  Widget build(BuildContext context) {
    int done = (widget.progressValue * widget.total).toInt();
    return Container(
      width: double.infinity,
      height: 222,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [kMainColor , kMainDarkBlue]
        )
      ),
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Knowledge, Hobby & Mind Relaxing",style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w600,
              color: kMainWhiteColor
            ),),
            const SizedBox(
              height: 25,
            ),
            LinearProgressIndicator(
              value: widget.progressValue,
              backgroundColor: kMainDarkBlue,
              valueColor: const AlwaysStoppedAnimation(kMainWhiteColor),
              minHeight: 15,
              borderRadius: BorderRadius.circular(100),
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
               _buildTag(
                   "Done",
                    done.toString(),
               ),
                _buildTag(
                  "Total",
                  widget.total.toString(),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
  Widget _buildTag (String title , String value){
    return Column(
      children: [
        Text(title,style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: kMainWhiteColor,
        ),),
        const SizedBox(
          height: 8,
        ),
        Text(value,style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: kMainWhiteColor,
        ),)
      ],
    );
  }
}


