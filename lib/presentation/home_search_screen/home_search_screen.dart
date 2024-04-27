import 'package:bustrackingapp/widgets/custom_dotted_line.dart';

import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_text_form_field.dart';
import 'controller/home_search_controller.dart';
import 'package:bustrackingapp/core/app_export.dart';
import 'package:flutter/material.dart';

// ignore_for_file: must_be_immutable
class HomeSearchScreen extends GetWidget<HomeSearchController> {
  HomeSearchScreen({Key? key})
      : super(
          key: key,
        );
  HomeSearchController controller = Get.put(HomeSearchController());
  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return Padding(
      padding: mediaQueryData.viewInsets,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        // alignment: Alignment.bottomCenter,
        children: [
          // SizedBox(
          //   // height: getVerticalSize(526),
          //   // width: double.maxFinite,
          //   child: Column(
          //     // alignment: Alignment.topCenter,
          //     children: [
          //       // CustomImageView(
          //       //   imagePath: ImageConstant.imgRectangle4388526x414,
          //       //   height: getVerticalSize(526),
          //       //   width: getHorizontalSize(414),
          //       //   alignment: Alignment.center,
          //       // ),
          //       Align(
          //         alignment: Alignment.topCenter,
          //         child: Padding(
          //           padding: getPadding(
          //             left: 16,
          //             top: 24,
          //             right: 16,
          //           ),
          //           child: Column(
          //             mainAxisSize: MainAxisSize.min,
          //             crossAxisAlignment: CrossAxisAlignment.start,
          //             mainAxisAlignment: MainAxisAlignment.start,
          //             children: [
          //               // CustomSearchView(
          //               //   controller: controller.searchController,
          //               //   hintText: "lbl_where_to".tr,
          //               //   hintStyle:
          //               //   CustomTextStyles.bodyLargeErrorContainer,
          //               //   prefix: Container(
          //               //     margin: getMargin(
          //               //       left: 16,
          //               //       top: 17,
          //               //       right: 14,
          //               //       bottom: 17,
          //               //     ),
          //               //     child: CustomImageView(
          //               //       svgPath: ImageConstant.imgIcSearch,
          //               //     ),
          //               //   ),
          //               //   prefixConstraints: BoxConstraints(
          //               //     maxHeight: getVerticalSize(54),
          //               //   ),
          //               //   suffix: Padding(
          //               //     padding: EdgeInsets.only(
          //               //       right: getHorizontalSize(15),
          //               //     ),
          //               //     child: IconButton(
          //               //       onPressed: () {
          //               //         controller.searchController.clear();
          //               //       },
          //               //       icon: Icon(
          //               //         Icons.clear,
          //               //         color: Colors.grey.shade600,
          //               //       ),
          //               //     ),
          //               //   ),
          //               // ),
          //               // CustomIconButton(
          //               //   height: getSize(34),
          //               //   width: getSize(34),
          //               //   margin: getMargin(
          //               //     top: 144,
          //               //   ),
          //               //   padding: getPadding(
          //               //     all: 9,
          //               //   ),
          //               //   alignment: Alignment.centerRight,
          //               //   child: CustomImageView(
          //               //     svgPath: ImageConstant.imgTrophy,
          //               //   ),
          //               // ),
          //               // CustomIconButton(
          //               //   height: getSize(34),
          //               //   width: getSize(34),
          //               //   margin: getMargin(
          //               //     left: 17,
          //               //     top: 86,
          //               //   ),
          //               //   padding: getPadding(
          //               //     all: 9,
          //               //   ),
          //               //   child: CustomImageView(
          //               //     svgPath: ImageConstant.imgTrophy,
          //               //   ),
          //               // ),
          //               // Container(
          //               //   height: getSize(83),
          //               //   width: getSize(83),
          //               //   padding: getPadding(
          //               //     all: 24,
          //               //   ),
          //               //   decoration: AppDecoration
          //               //       .outlinePrimaryContainer
          //               //       .copyWith(
          //               //     borderRadius:
          //               //     BorderRadiusStyle.roundedBorder41,
          //               //   ),
          //               //   child: CustomIconButton(
          //               //     height: getSize(34),
          //               //     width: getSize(34),
          //               //     padding: getPadding(
          //               //       all: 8,
          //               //     ),
          //               //     decoration:
          //               //     IconButtonStyleHelper.fillErrorContainer,
          //               //     alignment: Alignment.center,
          //               //     child: CustomImageView(
          //               //       svgPath:
          //               //       ImageConstant.imgCheckmarkWhiteA700,
          //               //     ),
          //               //   ),
          //               // ),
          //             ],
          //           ),
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
          Container(
            padding: getPadding(
              left: 16,
              top: 34,
              right: 16,
              bottom: 34,
            ),
            decoration: AppDecoration.outlineBlack.copyWith(
              borderRadius: BorderRadiusStyle.customBorderTL24,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: getPadding(
                    top: 2,
                  ),
                  child: Text(
                    "msg_where_would_you".tr,
                    style: theme.textTheme.headlineSmall,
                  ),
                ),
                Padding(
                  padding: getPadding(
                    top: 36,
                  ),
                  child: Row(
                    children: [
                      Container(
                        height: getVerticalSize(102),
                        width: getHorizontalSize(24),
                        // color: Colors.grey,
                        margin: getMargin(
                          top: 15,
                          bottom: 15,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          // alignment: Alignment.bottomCenter,
                          children: [
                            CustomImageView(
                              svgPath: ImageConstant.imgLocationGray900,
                              height: getSize(24),
                              width: getSize(24),
                              alignment: Alignment.topCenter,
                            ),
                            Expanded(
                              child: SizedBox(
                                height: double.infinity,
                                // height: getVerticalSize(60),
                                child: FDottedLine(
                                  color: appTheme.gray900,
                                  width: getHorizontalSize(1),
                                ),
                                // child: VerticalDivider(
                                //   width: getHorizontalSize(1),
                                //   thickness: getVerticalSize(1),
                                //   color: appTheme.gray900,
                                // ),
                              ),
                            ),
                            CustomImageView(
                              svgPath: ImageConstant.imgIcgps,
                              height: getSize(24),
                              width: getSize(24),
                              alignment: Alignment.bottomCenter,
                            ),

                          ],
                        ),
                      ),

                      Expanded(
                        child: Padding(
                          padding: getPadding(
                            left: 12,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              CustomTextFormField(
                                controller: controller.locationController,
                                hintText: "msg_enter_your_location".tr,
                                hintStyle: CustomTextStyles
                                    .bodyLargeErrorContainer,
                                contentPadding: getPadding(
                                  left: 12,
                                  top: 18,
                                  right: 12,
                                  bottom: 18,
                                ),
                              ),
                              CustomTextFormField(
                                controller:
                                controller.actiononeController,
                                margin: getMargin(
                                  top: 24,
                                ),
                                hintText: "lbl_where_to_go".tr,
                                hintStyle: CustomTextStyles
                                    .bodyLargeErrorContainer,
                                textInputAction: TextInputAction.done,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                CustomElevatedButton(
                  text: "lbl_find_bus".tr,
                  onTap: () {
                    Get.toNamed(AppRoutes.recommendedRoutesScreen);
                  },
                  margin: getMargin(
                    top: 34,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
