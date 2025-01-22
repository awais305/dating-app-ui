import 'package:dating_app_ui/models/users_model.dart';
import 'package:dating_app_ui/screens/home_screen/widgets/thumb_image_widget.dart';
import 'package:dating_app_ui/utils/fonts.dart';
import 'package:dating_app_ui/utils/palette.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class UserCardWidget extends StatelessWidget {
  final Result user;

  const UserCardWidget({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: Color(0xFFedeef4),
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Column(
        children: [
          Row(
            spacing: 10,
            children: [
              Icon(Icons.calendar_today_outlined,
                  color: Palette.primary, size: 22),
              Text('Dinner', style: CustomFontStyle.boldText),
              Spacer(),
              Icon(Icons.more_horiz, size: 28)
            ],
          ),
          SizedBox(height: 3),
          Divider(height: 25, endIndent: 5, indent: 5, thickness: 0.5),
          Row(
            spacing: 10,
            children: [
              ThumbImageWidget(url: user.picture!.thumbnail!),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(user.name?.first ?? '',
                        style: CustomFontStyle.boldText.copyWith(fontSize: 17)),
                    Text('3km from you',
                        style: CustomFontStyle.regularText
                            .copyWith(color: Colors.grey)),
                  ],
                ),
              ),
              Icon(Icons.maps_ugc, color: Palette.primary),
              SizedBox.shrink(),
              Icon(Icons.call, color: Palette.primary),
            ],
          ),
          SizedBox(height: 17),
          IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 46,
                  child: Column(
                    spacing: 15,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        spacing: 10,
                        children: [
                          Icon(Icons.calendar_month, size: 22),
                          Text('Date', style: CustomFontStyle.regularText),
                        ],
                      ),
                      Text(
                          '${DateFormat('E', 'en_US').format(user.dob!.date!)}, ${DateFormat.yMMMd('en_US').format(user.registered!.date!).replaceAll(",", "")}',
                          style:
                              CustomFontStyle.boldText.copyWith(fontSize: 16)),
                      Text(DateFormat.jm('en_US').format(user.dob!.date!),
                          style:
                              CustomFontStyle.boldText.copyWith(fontSize: 16)),
                    ],
                  ),
                ),
                VerticalDivider(color: Colors.grey, thickness: 0.22, width: 30),
                Expanded(
                  flex: 55,
                  child: Column(
                    spacing: 15,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        spacing: 10,
                        children: [
                          Icon(Icons.location_on, size: 22),
                          Text('Location', style: CustomFontStyle.regularText),
                        ],
                      ),
                      Text(user.location?.timezone?.description ?? '',
                          style:
                              CustomFontStyle.boldText.copyWith(fontSize: 16)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
