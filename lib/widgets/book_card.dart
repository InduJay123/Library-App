import 'package:flutter/material.dart';
import 'package:workout_planner/constant/constant.dart';

class BookCard extends StatelessWidget {
  final String title;
  final String imageUrl;
  final String description;
  const BookCard({
    super.key,
    required this.title,
    required this.imageUrl,
    required this.description
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width* 0.46,
      decoration: BoxDecoration(
        color: kCardBgColor,
        borderRadius: BorderRadius.circular(15),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(0,5),
          )
        ]
      ),
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: Column(
          children: [
            Text(title,style: const TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold
            ),),
            const SizedBox(
              height: 5
            ),
            Image.asset(
                imageUrl,
                width: 130,
              height: 190,
              fit: BoxFit.cover,
            ),
            const SizedBox(
              height: 5,
            ),
            Text(description,style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.normal,
                 color: kMainColor
            ),),
          ],
        ),
      ),
    );
  }
}
