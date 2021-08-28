import 'package:chatteree/resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'custom_colors.dart';


class CustomAppBarWidget extends StatelessWidget with PreferredSizeWidget{
  const CustomAppBarWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Padding(
        padding: const EdgeInsets.only(left: 10.0),
        child: CircleAvatar(
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: Image.asset(
              Images.avatar,
            ),
          ),
          backgroundColor: accentColor.withOpacity(.3),
        ),
      ),
      title: Text(
        'Chats',
        style: Theme.of(context)
            .textTheme
            .headline6!
            .copyWith(fontWeight: FontWeight.bold),
      ),
      centerTitle: false,
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 10.0),
          child: CircleAvatar(
            backgroundColor: accentColor,
            radius: 25,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SvgPicture.asset(Images.editIcon),
            ),
          ),
        )
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
