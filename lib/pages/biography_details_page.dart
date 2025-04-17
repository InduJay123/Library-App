import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:workout_planner/constant/constant.dart';
import 'package:workout_planner/constant/responsive.dart';
import 'package:workout_planner/widgets/book_card.dart';

import '../models/book_model.dart';

class BiographyDetailsPage extends StatefulWidget {
  final String bookTitle;
  final String bookDescription;
  final List<Book> biographyBookList;
  const BiographyDetailsPage({
    required this.bookTitle,
    required this.bookDescription,
    required this.biographyBookList,
    super.key
  });

  @override
  State<BiographyDetailsPage> createState() => _BiographyDetailsPageState();
}

class _BiographyDetailsPageState extends State<BiographyDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title:Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.bookTitle,
                style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                    color: kMainBlackColor
                ),
              )
            ],
          )
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
              const SizedBox(height: 10,),
              GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: kDefaultPadding,
                      mainAxisSpacing: kDefaultPadding,
                      childAspectRatio: 8/11
                  ),
                  itemCount: widget.biographyBookList.length,
                  itemBuilder: (context , index){
                    Book book = widget.biographyBookList[index];
                    return BookCard(
                        title: book.bookName,
                        imageUrl: book.bookimageUrl,
                        description: "${book.noOfDays} Days"
                    );
                  })
            ],
          ),
        ),


      ),
    );
  }
}
