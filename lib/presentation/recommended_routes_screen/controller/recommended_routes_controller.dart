import 'package:bustrackingapp/core/app_export.dart';import 'package:bustrackingapp/presentation/recommended_routes_screen/models/recommended_routes_model.dart';/// A controller class for the RecommendedRoutesScreen.
///
/// This class manages the state of the RecommendedRoutesScreen, including the
/// current recommendedRoutesModelObj
class RecommendedRoutesController extends GetxController {Rx<RecommendedRoutesModel> recommendedRoutesModelObj = RecommendedRoutesModel().obs;

 }
