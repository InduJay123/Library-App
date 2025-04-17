import 'package:flutter/material.dart';
import 'package:workout_planner/constant/constant.dart';
import 'package:workout_planner/constant/responsive.dart';

class AddEquipmentCard extends StatefulWidget {
  final String equipmentTitle;
  final String equipmentImageUrl;

  final String equipmentDescription;

  final bool isAdded;
  final bool isAddedFav;
  final void Function() toggleAddEquipment;
  final void Function() toggleAddFavEquipment;
  const AddEquipmentCard({
    super.key,
    required this.equipmentTitle,
    required this.equipmentImageUrl,

    required this.equipmentDescription,

    required this.toggleAddEquipment,
    required this.toggleAddFavEquipment,
    required this.isAdded, required this.
    isAddedFav,
    });

  @override
  State<AddEquipmentCard> createState() => _AddEquipmentCardState();
}

class _AddEquipmentCardState extends State<AddEquipmentCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: kCardBgColor,
        boxShadow:const [
          BoxShadow (
              color: Colors.black12,
              offset: Offset(0,2),
              blurRadius: 2
          )
        ]
      ),
      child:  Padding(
        padding: const EdgeInsets.symmetric(vertical: kDefaultPadding,horizontal: kDefaultPadding*2),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
         children: [
            Text(
              widget.equipmentTitle,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: kMainBlackColor
            ),),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
               Image.asset(
                  widget.equipmentImageUrl,
                  width: 120,
                  height: 100,
                  fit: BoxFit.cover,),
                SizedBox(
                  width: MediaQuery.of(context).size.width*0.5,
                  child: Column(
                    children: [
                      Text(
                          widget.equipmentDescription,
                          style:const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: kMainDarkBlue
                          ),),
                      //const SizedBox(
                      //  height: 10,
                      //),
                      // SizedBox(
                      //   width: 210,
                      //   child: Text(
                      //     "Time: ${widget.noOfMinuites.toString()} min and ${widget.noOfCal.toString()} cal burned",
                      //     style:TextStyle(
                      //         fontSize: 16,
                      //         fontWeight: FontWeight.bold,
                      //         color: kSubTitleColor
                      //     ),),
                      // ),
                    ],
                  ),
                )
              ],
            ),
           const SizedBox(
             height: 15,
           ),
           Row(
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
                           widget.toggleAddEquipment();
                         },
                         icon: Icon(
                             widget.isAdded ? Icons.remove :Icons.add,
                             size: 30,
                             color: kMainDarkBlue),
                   )
               )
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
                           widget.toggleAddFavEquipment();
                         },
                         icon: Icon(
                             widget.isAddedFav ? Icons.favorite : Icons.favorite_border,
                             size: 30,
                             color: kMainPinkColor),
                       )
                   )
               ),
             ],
           )
          ],
        ),
      ),
    );
  }
}
