import 'package:flutter/material.dart';
import 'package:workout_planner/constant/constant.dart';
import 'package:workout_planner/constant/responsive.dart';
import 'package:workout_planner/widgets/book_card.dart';

import '../models/book_model.dart';
class ScienceFictionDetailsPage extends StatefulWidget {
  final String bookTitle;
  final String bookDescription;
  final List <Book> scienceFictionBookList;
  const ScienceFictionDetailsPage({
    super.key,
    required this.bookTitle,
    required this.bookDescription,
    required this.scienceFictionBookList
  });

  @override
  State<ScienceFictionDetailsPage> createState() => _ScienceFictionDetailsPageState();
}

class _ScienceFictionDetailsPageState extends State<ScienceFictionDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.bookTitle,style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w900,
                color: kMainBlackColor
            ),

            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(kDefaultPadding),
          child: Column(
            children: [
              Text(
                widget.bookDescription,
                style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: kMainBlackColor
                ),
              ),
              const SizedBox(height: 10),
              GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: kDefaultPadding,
                      mainAxisSpacing: kDefaultPadding,
                      childAspectRatio: 8/11
                  ),
                  itemCount: widget.scienceFictionBookList.length,
                  itemBuilder: (context,index){
                    Book book = widget.scienceFictionBookList[index];
                    return BookCard(
                        title: book.bookName,
                        imageUrl: book.bookimageUrl,
                        description: "${book.noOfDays} of Workout"
                    );
                  }
              )
            ],
          ),
        ),
      ),
    );
  }
}
