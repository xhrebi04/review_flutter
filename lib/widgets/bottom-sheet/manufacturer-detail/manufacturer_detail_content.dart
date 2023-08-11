import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:review_flutter/generated/l10n.dart';
import 'package:review_flutter/models/manufacturer_model.dart';
import 'package:review_flutter/models/model.dart';
import 'package:review_flutter/theme/my_text_style.dart';
import 'package:review_flutter/widgets/bottom-sheet/manufacturer-detail/model_item.dart';
import 'package:review_flutter/widgets/bottom-sheet/manufacturer-detail/separator.dart';
import 'package:review_flutter/widgets/buttons/primary_btn.dart';
import 'package:review_flutter/widgets/common/my_text.dart';

class ManufacturerDetailContent extends StatelessWidget {
  final ManufacturerModel manufacturer;
  final List<Model> models;

  const ManufacturerDetailContent(
      {super.key, required this.manufacturer, required this.models});

  Widget _renderTitle() {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: MyText(
            text: manufacturer.name,
            style: MyTextStyle.satoshiBold.copyWith(fontSize: 14)));
  }

  Widget _renderModels() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
          child: MyText(
              text: S.current.models,
              style: MyTextStyle.satoshiBold.copyWith(fontSize: 13))),
      SizedBox(
          height: 90,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            itemBuilder: (context, index) => ModelItem(model: models[index]),
            separatorBuilder: (context, index) => const Separator(),
            itemCount: models.length,
          ))
    ]);
  }

  Widget _renderFooterBtn() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: PrimaryBtn(title: S.current.close, onPress: () => Get.back()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Expanded(
        child: Column(
          children: [_renderTitle(), _renderModels()],
        ),
      ),
      _renderFooterBtn()
    ]);
  }
}
