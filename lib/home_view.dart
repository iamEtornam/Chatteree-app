import 'package:chatteree/chat_view.dart';
import 'package:chatteree/resources/resources.dart';
import 'package:chatteree/utils/custom_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'utils/custom_appbar.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Brightness brightness = MediaQuery.of(context).platformBrightness;
    return Scaffold(
      appBar: CustomAppBarWidget(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(50.0),
            child: Image.asset(
              Images.noChat,
              color:
                  brightness == Brightness.dark ? Colors.white : Colors.black,
            ),
          ),
          Text(
            'We hear say your mouth die hmmm',
            style: Theme.of(context)
                .textTheme
                .bodyText1!
                .copyWith(color: Colors.grey),
          ),
          SizedBox(
            height: 35,
          ),
          TextButton.icon(
              style: TextButton.styleFrom(
                  backgroundColor: accentColor,
                  shape: StadiumBorder(),
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 25)),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ChatView()));
              },
              icon: SvgPicture.asset(Images.editIcon),
              label: Text(
                'Start Chatting',
                style: Theme.of(context)
                    .textTheme
                    .button!
                    .copyWith(color: Colors.black),
              )),
          Spacer()
        ],
      ),
    );
  }
}

