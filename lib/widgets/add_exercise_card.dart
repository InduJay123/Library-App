import 'package:flutter/material.dart';
import 'package:workout_planner/constant/constant.dart';
import 'package:workout_planner/constant/responsive.dart';

class AddBookCard extends StatefulWidget {
  final String bookTitle;
  final String bookImageUrl;
  final int noOfDays;
  final bool isAdded;
  final bool isAddedFav;
  final void Function() toggleAddBooks;
  final void Function() toggleAddFavBook;
  const AddBookCard({
    super.key,
    required this.bookTitle,
    required this.bookImageUrl,
    required this.noOfDays,
    required this.toggleAddBooks,
    required this.isAdded,
    required this.toggleAddFavBook,
    required this.isAddedFav,
  });

  @override
  State<AddBookCard> createState() => _AddBookCardState();
}

class _AddBookCardState extends State<AddBookCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      margin: const EdgeInsets.only(right:15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: kCardBgColor,
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(0,2),
            blurRadius: 2
          )
        ]
      ),
      child: Padding(
        padding: const EdgeInsets.all(kDefaultPadding),
        child: Column(
          children: [
            Text(
              widget.bookTitle,
              style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: kMainBlackColor
              ),),
            const SizedBox(
              height: 6,
            ),
            Image.asset(
              widget.bookImageUrl,
              width: 115,
              height: 130,
              fit: BoxFit.cover,
            ),
            const SizedBox(
              height: 6,
            ),
            Text("${widget.noOfDays.toString()} Days",
              style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.normal,
                  color: kSubTitleColor
              ),),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: kSubTitleColor.withOpacity(0.2)
                    ),
                    child: Center(
                      child: IconButton(
                          onPressed: () {
                            widget.toggleAddBooks();
                          },
                          icon: Icon(
                          widget.isAdded ? Icons.remove : Icons.add,
                            size: 30,
                            color: kMainColor,
                          )
                      ),
                    ),
                  ),
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: kSubTitleColor.withOpacity(0.2)
                    ),
                    child: Center(
                      child: IconButton(
                          onPressed: () {
                            widget.toggleAddFavBook();
                          },
                          icon: Icon(
                            widget.isAddedFav ? Icons.favorite : Icons.favorite_border,
                            size: 30,
                            color: kMainPinkColor,
                          )),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
