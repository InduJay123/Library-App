import 'package:flutter/material.dart';
import 'package:workout_planner/models/book_model.dart';

import '../constant/constant.dart';
import '../constant/responsive.dart';
import '../models/newspaper_model.dart';
import '../widgets/newspaper_card.dart';

class NewspaperDetailsPage extends StatefulWidget {
  final String newspaperTitle;
  final String newspaperDescription;
  final List<Newspaper> newspaperList;
  const NewspaperDetailsPage({
    super.key,
    required this.newspaperTitle,
    required this.newspaperDescription,
    required this.newspaperList
  });

  @override
  State<NewspaperDetailsPage> createState() => _NewspaperDetailsPageState();
}

class _NewspaperDetailsPageState extends State<NewspaperDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.newspaperTitle,
              style: const TextStyle(
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
                widget.newspaperDescription,
                style: const TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 13,
                    color: kMainBlackColor
                ),
              ),
              const SizedBox(height:5,),
              GridView.builder(
                shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1,
                      crossAxisSpacing: kDefaultPadding,
                      mainAxisSpacing: kDefaultPadding,
                      childAspectRatio:17/13
                  ),
                itemCount: widget.newspaperList.length,
                itemBuilder: (context,index) {
                  Newspaper newspaper = widget.newspaperList[index];
                  return NewspaperCard(
                    title: newspaper.newspaperName,
                    imageUrl: newspaper.newspaperImageUrl,
                    description: newspaper.newspaperDescription,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
