import 'package:air_travel/utils/AppColors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
class TravelComposition extends StatelessWidget {
  const TravelComposition({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(1),
      // width: 75,
      height: 19,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: AppColors.GreenMain,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.center,
            width: 16,
            height: 16,
            decoration: BoxDecoration(
              color: AppColors.GreenMain,
              borderRadius: BorderRadius.circular(10),
            ),
            child: SvgPicture.asset("TravelAssets/icons/tick.svg"),
          ),
          SizedBox(width: 4),
          Text(
            text,
            style: TextStyle(
              color: AppColors.GreenMain,
              fontSize: 10,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}
