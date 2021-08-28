import 'package:chatteree/home_view.dart';
import 'package:chatteree/resources/resources.dart';
import 'package:chatteree/utils/custom_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class IntroView extends StatelessWidget {
  IntroView({Key? key}) : super(key: key);

  final TextEditingController _emailAddressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final Brightness brightness = MediaQuery.of(context).platformBrightness;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  Images.logo,
                  width: 50,
                  height: 50,
                ),
                SizedBox(
                  width: 8,
                ),
                Text(
                  'Chatteree',
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1!
                      .copyWith(fontWeight: FontWeight.bold, fontSize: 18),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(50.0),
              child: Image.asset(
                Images.intro,
              ),
            ),
            Text(
              'Howdy Chatter! Your \npeeps are waiting ',
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .bodyText1!
                  .copyWith(fontWeight: FontWeight.bold, fontSize: 21),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(50, 50, 50, 10),
              child: TextField(
                controller: _emailAddressController,
                style: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(fontWeight: FontWeight.w600),
                textInputAction: TextInputAction.send,
                keyboardType: TextInputType.emailAddress,
                maxLines: 1,
                enableInteractiveSelection: true,
                decoration: InputDecoration(
                  labelText: 'Email Address',
                  alignLabelWithHint: true,
                  hintStyle: Theme.of(context).inputDecorationTheme.hintStyle,
                  contentPadding: EdgeInsets.all(15.0),
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  border: Theme.of(context).inputDecorationTheme.enabledBorder,
                  focusedBorder:
                      Theme.of(context).inputDecorationTheme.focusedBorder,
                  enabledBorder:
                      Theme.of(context).inputDecorationTheme.enabledBorder,
                  disabledBorder:
                      Theme.of(context).inputDecorationTheme.disabledBorder,
                  errorBorder:
                      Theme.of(context).inputDecorationTheme.errorBorder,
                  focusedErrorBorder:
                      Theme.of(context).inputDecorationTheme.focusedErrorBorder,
                  fillColor: Theme.of(context).inputDecorationTheme.fillColor,
                  filled: true,
                  labelStyle: Theme.of(context).inputDecorationTheme.labelStyle,
                  errorStyle: Theme.of(context).inputDecorationTheme.errorStyle,
                  suffixIcon: GestureDetector(
                    onTap: () {
                      if (_emailAddressController.text.isNotEmpty) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomeView()));
                      }
                    },
                    child: CircleAvatar(
                      backgroundColor: brightness == Brightness.dark ? accentColor : darkBackgroundColor,
                      child: SvgPicture.asset(
                        Images.nextIcon,
                        color: brightness == Brightness.dark ? Colors.black : accentColor,
                      ),
                    ),
                  ),
                ),
        
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(50, 10, 50, 50),
              child: TextButton(
                style: TextButton.styleFrom(
                  shape: StadiumBorder(side: BorderSide(color: Colors.grey,width: .5)),
                  padding: const EdgeInsets.all(15)
                ),
                onPressed: (){}, child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(Images.googleIcon,width: 40,height: 30,fit: BoxFit.contain,),
                    SizedBox(width: 10,),
                    Text('Continue with Google',style: Theme.of(context).textTheme.button,),
                  ],
                )),
            )
          ],
        ),
      ),
    );
  }
}
