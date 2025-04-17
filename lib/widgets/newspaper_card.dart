import 'package:flutter/material.dart';
import 'package:workout_planner/constant/constant.dart';
import 'package:workout_planner/models/newspaper_model.dart';
import 'package:workout_planner/data/newspaper_data.dart';

class NewspaperCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String description;
  const NewspaperCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.description
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height*0.1,
      decoration: const BoxDecoration(
        color: kCardBgColor,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(0,5),
          )
        ]
      ),
      child:  Padding(
        padding: const EdgeInsets.all(kDefaultFontSize),
        child: Column(
          children: [
            Text(title,style: const TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.bold
            ),),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset(
                  imageUrl,
                  width: MediaQuery.of(context).size.width * 0.3,
                ),
                Column(
                  children: [

                    SizedBox(
                      width:  MediaQuery.of(context).size.width * 0.5,
                      child: Text(description,style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.normal,
                          color: kMainPinkColor
                      ),),
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Text(description,style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.normal,
                color: kSubTitleColor
            ),),
          ],
        ),
      ),
    );
  }
}
