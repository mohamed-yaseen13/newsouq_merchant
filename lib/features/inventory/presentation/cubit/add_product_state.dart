import 'package:newsouq_merchant/core/api/api_error_model.dart';

sealed class AddProductState {}

class AddProductInitial extends AddProductState {}

class AddProductLoading extends AddProductState {}

class AddProductSuccess extends AddProductState {}

class AddProductError extends AddProductState {
  final ApiErrorModel apiErrorModel;

  AddProductError({required this.apiErrorModel});
}
