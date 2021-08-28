import 'dart:io';

import 'package:chatteree/resources/resources.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('images assets test', () {
    expect(true, File(Images.image10).existsSync());
    expect(true, File(Images.image11).existsSync());
    expect(true, File(Images.editIcon).existsSync());
    expect(true, File(Images.image8).existsSync());
    expect(true, File(Images.image9).existsSync());
    expect(true, File(Images.googleIcon).existsSync());
    expect(true, File(Images.intro).existsSync());
    expect(true, File(Images.reply).existsSync());
    expect(true, File(Images.addStory).existsSync());
    expect(true, File(Images.image2).existsSync());
    expect(true, File(Images.image3).existsSync());
    expect(true, File(Images.avatar).existsSync());
    expect(true, File(Images.image1).existsSync());
    expect(true, File(Images.logo).existsSync());
    expect(true, File(Images.noChat).existsSync());
    expect(true, File(Images.image4).existsSync());
    expect(true, File(Images.image5).existsSync());
    expect(true, File(Images.image7).existsSync());
    expect(true, File(Images.image6).existsSync());
    expect(true, File(Images.nextIcon).existsSync());
  });
}
