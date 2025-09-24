import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsouq_merchant/core/api/api_result.dart';
import 'package:newsouq_merchant/features/inventory/data/models/add_product_request_model.dart';
import 'package:newsouq_merchant/features/inventory/data/repos/add_product_repo_imp.dart';
import 'package:newsouq_merchant/features/inventory/presentation/cubit/add_product_state.dart';

class AddProductCubit extends Cubit<AddProductState> {
  final AddProductRepoImp addProductRepoImp;

  AddProductCubit({required this.addProductRepoImp})
    : super(AddProductInitial());

  void addProduct(AddProductRequestModel model) async {
    emit(AddProductLoading());

    ApiResult<void> response = await addProductRepoImp.addProduct(model);

    if (response is Success<void>) {
      emit(AddProductSuccess());
    } else if (response is Failure<void>) {
      emit(AddProductError(apiErrorModel: response.apiErrorModel));
    }
  }
}
