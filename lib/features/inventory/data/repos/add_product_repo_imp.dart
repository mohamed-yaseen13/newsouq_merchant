import 'package:newsouq_merchant/core/api/api_error_handler.dart';
import 'package:newsouq_merchant/core/api/api_result.dart';
import 'package:newsouq_merchant/features/inventory/data/apis/add_product_api_service.dart';
import 'package:newsouq_merchant/features/inventory/data/models/add_product_request_model.dart';

class AddProductRepoImp {
  final AddProductApiService addProductApiService;

  AddProductRepoImp({required this.addProductApiService});

  Future<ApiResult<void>> addProduct(AddProductRequestModel model) async {
    try {
      final response = await addProductApiService.addProduct(model);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
