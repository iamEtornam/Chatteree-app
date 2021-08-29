import 'package:chatteree/resources/resources.dart';
import 'package:chatteree/utils/custom_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

import 'models/chat.dart';
import 'models/film.dart';
import 'utils/custom_appbar.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
    final TextEditingController _searchController = TextEditingController();

  final ScrollController _scrollController = ScrollController();
  late List<Chat> _chats;
  late List<Film> _films;

  @override
  void initState() {
    loadData();
    super.initState();
  }


  void loadData() async {
    String chatData = await DefaultAssetBundle.of(context)
        .loadString("assets/json/chat.json");
    String filmData = await DefaultAssetBundle.of(context)
        .loadString("assets/json/film.json");

    List<Chat> chats = chatFromJson(chatData);
    List<Film> films = filmFromJson(filmData);
    setState(() {
      this._chats = chats;
      this._films = films;
    });
  }


  @override
  Widget build(BuildContext context) {
    final Brightness brightness = MediaQuery.of(context).platformBrightness;
    return Scaffold(
        appBar: CustomAppBarWidget(),
        body: SafeArea(
          child: ListView(
            shrinkWrap: true,
            controller: _scrollController,
            padding: const EdgeInsets.all(16),
            children: [
              TextField(
                controller: _searchController,
                style: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(fontWeight: FontWeight.w600),
                textInputAction: TextInputAction.send,
                keyboardType: TextInputType.emailAddress,
                maxLines: 1,
                enableInteractiveSelection: true,
                decoration: InputDecoration(
                    labelText: 'Search for a chatter or message',
                    alignLabelWithHint: true,
                    hintStyle: Theme.of(context).inputDecorationTheme.hintStyle,
                    contentPadding: EdgeInsets.all(15.0),
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    border:
                        Theme.of(context).inputDecorationTheme.enabledBorder,
                    focusedBorder:
                        Theme.of(context).inputDecorationTheme.focusedBorder,
                    enabledBorder:
                        Theme.of(context).inputDecorationTheme.enabledBorder,
                    disabledBorder:
                        Theme.of(context).inputDecorationTheme.disabledBorder,
                    errorBorder:
                        Theme.of(context).inputDecorationTheme.errorBorder,
                    focusedErrorBorder: Theme.of(context)
                        .inputDecorationTheme
                        .focusedErrorBorder,
                    fillColor: Theme.of(context).inputDecorationTheme.fillColor,
                    filled: true,
                    labelStyle: Theme.of(context)
                        .inputDecorationTheme
                        .labelStyle!
                        .copyWith(
                            fontWeight: FontWeight.normal,
                            color: Colors.grey,
                            fontSize: 16),
                    errorStyle:
                        Theme.of(context).inputDecorationTheme.errorStyle,
                    prefixIcon:
                        Icon(CupertinoIcons.search, color: Colors.grey)),
              ),
              SizedBox(
                height: 25,
              ),
              FutureBuilder(
                  future: Future.value(_films),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.none &&
                        snapshot.data == null) {
                      return SizedBox.shrink();
                    }
                    if (snapshot.connectionState == ConnectionState.waiting &&
                        snapshot.data == null) {
                      return LinearProgressIndicator();
                    }
                    return SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 106,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        children: [
                          Column(
                            children: [
                              CircleAvatar(
                                radius: 40,
                                child: SvgPicture.asset(Images.addStory,
                                    color: brightness == Brightness.dark
                                        ? accentColor
                                        : Colors.black),
                                backgroundColor: Theme.of(context)
                                    .inputDecorationTheme
                                    .fillColor,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              SizedBox(
                                width: 80,
                                child: Text(
                                  'Add film',
                                  textAlign: TextAlign.center,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              )
                            ],
                          ),
                          ListView.separated(
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return Center(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        width: 80,
                                        height: 80,
                                        margin: const EdgeInsets.only(left: 15),
                                        padding: const EdgeInsets.all(2),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(45),
                                            border: Border.all(
                                                color: _films[index].hasViewed
                                                    ? Colors.grey.shade300
                                                    : accentColor,
                                                width: 2)),
                                        child: CircleAvatar(
                                          backgroundImage: NetworkImage(
                                              _films[index].profilePic),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        _films[index].username,
                                        textAlign: TextAlign.center,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      )
                                    ],
                                  ),
                                );
                              },
                              separatorBuilder: (__, _) => SizedBox(
                                    width: 5,
                                  ),
                              itemCount: _films.length)
                        ],
                      ),
                    );
                  }),
              SizedBox(
                height: 15,
              ),
              FutureBuilder(
                  future: Future.value(_chats),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.none &&
                        snapshot.data == null) {
                      return NoChatWidget(brightness: brightness);
                    }
                    if (snapshot.connectionState == ConnectionState.waiting &&
                        snapshot.data == null) {
                      return Center(
                          child: CircularProgressIndicator.adaptive());
                    }
                    return ListView.separated(
                        controller: _scrollController,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          Chat chat = Chat.fromJson(_chats[index].toJson());
                          return SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: Row(
                              children: [
                                Stack(
                                  children: [
                                    CircleAvatar(
                                      radius: 35,
                                      backgroundImage:
                                          NetworkImage(chat.profilePic),
                                      backgroundColor:
                                          accentColor.withOpacity(.5),
                                    ),
                                    Positioned(
                                      bottom: 3,
                                      right: -1,
                                      child: Container(
                                        width: 20,
                                        height: 20,
                                        decoration: BoxDecoration(
                                            color: chat.isOnline
                                                ? Colors.green
                                                : Colors.grey,
                                            borderRadius:
                                                BorderRadius.circular(45),
                                            border: Border.all(
                                                width: 3,
                                                color: Theme.of(context)
                                                    .scaffoldBackgroundColor)),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width - 175,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        chat.username,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1!
                                            .copyWith(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16),
                                      ),
                                      SizedBox(
                                        height: 6,
                                      ),
                                      Row(
                                        children: [
                                          chat.hasRead
                                              ? Image.asset(
                                                  Images.reply,
                                                  color: Colors.blue,
                                                )
                                              : SizedBox.shrink(),
                                          SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width -
                                                200,
                                            child: Text(
                                              chat.message,
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyText1!
                                                  .copyWith(
                                                      fontWeight: !chat.hasRead
                                                          ? FontWeight.bold
                                                          : FontWeight.normal),
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      '${DateFormat('hh:mm a').format(chat.sentAt)}',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText1!
                                          .copyWith(
                                              fontWeight: FontWeight.normal,
                                              color: Colors.grey),
                                    ),
                                    SizedBox(
                                      height: 6,
                                    ),
                                    !chat.hasRead
                                        ? CircleAvatar(
                                            radius: 14,
                                            backgroundColor: accentColor,
                                            child: Text(
                                              '${chat.messageCount}',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyText2!
                                                  .copyWith(
                                                      color: Colors.black),
                                            ),
                                          )
                                        : SizedBox.shrink()
                                  ],
                                ),
                              ],
                            ),
                          );
                        },
                        separatorBuilder: (__, _) => SizedBox(
                              height: 15,
                            ),
                        itemCount: _chats.length);
                  })
            ],
          ),
        ));
  }
}

class NoChatWidget extends StatelessWidget {
  const NoChatWidget({
    Key? key,
    required this.brightness,
  }) : super(key: key);

  final Brightness brightness;

  @override
  Widget build(BuildContext context) {
    return Column(
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
    );
  }
}

