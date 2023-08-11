import 'package:get/get.dart';
import 'package:review_flutter/services/error/error_service.dart';
import 'package:review_flutter/widgets/common/loading_overlay.dart';

abstract class Serializable {
  Map<String, dynamic> toJson();
}

class BaseRepository extends GetxController {
  Future makeApiCall({
    required Function callback1,
    Function? callback2,
  }) async {
    final overlay = LoadingOverlay();

    try {
      overlay.show();
      await callback1();
      overlay.hide();

      if (callback2 != null) {
        await callback2();
      }
    } catch (err) {
      overlay.hide();
      ErrorService.handleError(err);
    }
  }
}
