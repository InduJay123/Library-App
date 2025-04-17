import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constant/constant.dart';
import '../constant/responsive.dart';
import '../models/book_model.dart';
import '../widgets/book_card.dart';

class NovelDetailsPage extends StatefulWidget {
  final String bookTitle;
  final String bookDescription;
  final List<Book> novelBookList;
  const NovelDetailsPage({
      required this.bookTitle,
      required this.bookDescription,
      required this.novelBookList,
      super.key
  });

  @override
  State<NovelDetailsPage> createState() => _NovelDetailsPageState();
}

class _NovelDetailsPageState extends State<NovelDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
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
                    childAspectRatio: 8/11),
                itemCount: widget.novelBookList.length,
                itemBuilder: (context,index){
                  Book book = widget.novelBookList[index];
                  return BookCard(
                      title: book.bookName,
                      imageUrl: book.bookimageUrl,
                      description: "${book.noOfDays} Days"
                  );
                }
            )
            ]
    ),
      ),
    )
    );
  }
}
