import 'package:get/get.dart';
import 'package:review_flutter/models/make_model.dart';
import 'package:review_flutter/models/manufacturer_model.dart';
import 'package:review_flutter/models/model.dart';
import 'package:review_flutter/repository/vehicles/vehicles_repository.dart';
import 'package:review_flutter/services/api/response/list_response.dart';
import 'package:review_flutter/services/error/error_service.dart';
import 'package:review_flutter/utility/bottom_sheet_utility.dart';
import 'package:review_flutter/widgets/bottom-sheet/manufacturer-detail/manufacturer_detail_content.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

const Map<String, dynamic> defaultParams = {'page': 1};

class HomeScreenCtrl extends GetxController {
  var manufacturers = <ManufacturerModel>[].obs;
  RefreshController refreshController = RefreshController();
  int page = 1;

  void handleFinishFetching(bool refresh, bool load) {
    if (refresh) {
      page = 1;
      refreshController.refreshCompleted();
      return;
    }

    if (load) {
      refreshController.loadComplete();
    }
  }

  Future<List<ManufacturerModel>> fetchManufacturers(
      Map<String, dynamic> params) async {
    VehiclesRepository r = Get.find<VehiclesRepository>();

    final json = await r.getAllManufacturersRequest(params: params);
    final response = ListResponse<ManufacturerModel>.fromJson(json,
        (data) => data.map((e) => ManufacturerModel.fromJson(e)).toList());

    return response.data;
  }

  void fetchData(
      {bool refresh = false,
      bool load = false,
      required Map<String, dynamic> params}) async {
    try {
      List<ManufacturerModel> m = await fetchManufacturers(params);

      if (load) {
        manufacturers.addAll(m);
      } else {
        manufacturers.clear();
        manufacturers.value = m;
      }

      manufacturers.refresh();
    } catch (err) {
      ErrorService.handleError(err);
    } finally {
      handleFinishFetching(refresh, load);
    }
  }

  void onRefresh() {
    fetchData(refresh: true, params: defaultParams);
  }

  void onLoading() {
    page = page + 1;
    Map<String, dynamic> params = {'page': page};

    fetchData(load: true, params: params);
  }

  void onManufacturerItemPress(ManufacturerModel m) async {
    VehiclesRepository r = Get.find<VehiclesRepository>();
    List<Model> models = [];

    await r.makeApiCall(
        callback1: () async {
          final makesjson = await r.getMakesByManufacturerIdRequest(id: m.id);
          final makesResp = ListResponse<MakeModel>.fromJson(makesjson,
              (data) => data.map((e) => MakeModel.fromJson(e)).toList());

          List<Future> futures = [];
          for (var element in makesResp.data) {
            futures.add(r.getModelsByMakeIdRequest(id: element.id));
          }

          final modelsFutures = await Future.wait(futures);
          for (var elementJson in modelsFutures) {
            final modelResp = ListResponse<Model>.fromJson(elementJson,
                (data) => data.map((e) => Model.fromJson(e)).toList());

            models.addAll(modelResp.data);
          }
        },
        callback2: () => BottomSheetUtility.show(
            content:
                ManufacturerDetailContent(manufacturer: m, models: models)));
  }

  @override
  void onInit() {
    super.onInit();

    fetchData(params: defaultParams);
  }
}
