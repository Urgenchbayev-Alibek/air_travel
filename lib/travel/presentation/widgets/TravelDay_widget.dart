import 'package:air_travel/utils/AppColors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TravelDayItem_widget extends StatelessWidget {
  const TravelDayItem_widget(
      {super.key, required this.day, required this.text, required this.where});

  final String day, text, where;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 108,
      height: 25,
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.GreenMain,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(11),
        color: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          // SizedBox(width: 0),
          Container(
            width: 20,
            height: 20,
            decoration: BoxDecoration(
              color: AppColors.GreenMain,
              borderRadius: BorderRadius.circular(10),
            ),
            alignment: Alignment.center,
            child: SvgPicture.asset(
              "TravelAssets/icons/calendar.svg",
            ),
          ),
          Column(
            children: [
              Text(
                day,
                style: TextStyle(
                  color: AppColors.GreenMain,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                text,
                style: TextStyle(
                  color: AppColors.GreenMain,
                  fontWeight: FontWeight.w600,
                  fontSize: 4,
                ),
              ),
            ],
          ),
          SizedBox(width: 1),
          Text(
            where,
            style: TextStyle(
              color: AppColors.GreenMain,
              fontWeight: FontWeight.w600,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
