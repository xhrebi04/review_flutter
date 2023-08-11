import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:review_flutter/generated/l10n.dart';
import 'package:review_flutter/screens/app/home/controller/home_screen_ctrl.dart';
import 'package:review_flutter/screens/app/home/widgets/manufacturer_item.dart';
import 'package:review_flutter/screens/app/home/widgets/separator.dart';
import 'package:review_flutter/widgets/common/paged_footer.dart';
import 'package:review_flutter/widgets/navigation/my_app_bar.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    HomeScreenCtrl c = Get.put(HomeScreenCtrl());

    return Scaffold(
        appBar: MyAppBar(title: S.current.manufacturers),
        body: Obx(() => Scrollbar(
              child: SmartRefresher(
                controller: c.refreshController,
                enablePullUp: true,
                onRefresh: c.onRefresh,
                onLoading: c.onLoading,
                footer: CustomFooter(
                    builder: (context, mode) => PagedFooter(mode: mode)),
                child: ListView.separated(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  itemBuilder: (context, index) => ManufacturerItem(
                    manufacturer: c.manufacturers[index],
                  ),
                  separatorBuilder: (context, index) => const Separator(),
                  itemCount: c.manufacturers.length,
                ),
              ),
            )));
  }
}
