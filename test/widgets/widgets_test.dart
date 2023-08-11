import 'dart:ui';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:review_flutter/generated/l10n.dart';
import 'package:review_flutter/models/manufacturer_model.dart';
import 'package:review_flutter/models/model.dart';
import 'package:review_flutter/screens/app/home/controller/home_screen_ctrl.dart';
import 'package:review_flutter/screens/app/home/widgets/manufacturer_item.dart';
import 'package:review_flutter/widgets/bottom-sheet/manufacturer-detail/model_item.dart';

void main() async {
  String languageCode = 'en';
  await S.load(Locale(languageCode));

  group('Widget Testing', () {
    testWidgets('Manufacturer Item Test', (widgetTester) async {
      Get.put(HomeScreenCtrl());
      ManufacturerModel manufacturer = ManufacturerModel(0, 'Audi', 'DE');

      await widgetTester
          .pumpWidget(ManufacturerItem(manufacturer: manufacturer));

      final nameFinder = find.text(manufacturer.name);
      final countryFinder = find.text(manufacturer.country);

      expect(nameFinder, findsOneWidget);
      expect(countryFinder, findsOneWidget);
    });

    testWidgets('Model Item Test', (widgetTester) async {
      Model model = Model(1, 'Audi A8');

      await widgetTester.pumpWidget(ModelItem(model: model));

      final nameFinder = find.text(model.name);

      expect(nameFinder, findsOneWidget);
    });
  });
}
