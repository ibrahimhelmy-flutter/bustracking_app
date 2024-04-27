import 'package:bustrackingapp/presentation/home_search_screen/home_search_screen.dart';
import 'controller/home_controller.dart';
import 'models/home_model.dart';
import 'package:bustrackingapp/core/app_export.dart';
import 'package:bustrackingapp/widgets/custom_search_view.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class HomePage extends StatelessWidget {
  HomePage({Key? key})
      : super(
          key: key,
        );

  HomeController controller = Get.put(HomeController(HomeModel().obs));

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return WillPopScope(
      onWillPop: () async {
        exitApp();
        return false;
      },
      child: Scaffold(
        // appBar: AppBar(
        //   toolbarHeight: 0,
        //   elevation: 0,
        //   backgroundColor: Colors.transparent,
        // ),
        resizeToAvoidBottomInset: true,
        backgroundColor: Colors.transparent,
        body: SizedBox(
          // height: getVerticalSize(773),
          // width: double.maxFinite,
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              CustomImageView(
                imagePath: ImageConstant.imgRectangle4388,
                height: double.infinity,
                // height: getVerticalSize(773),
                width: double.infinity,
                // width: getHorizontalSize(414),
                alignment: Alignment.topCenter,
              ),
              Align(
                alignment: Alignment.center,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Container(
                        margin: getMargin(
                          top: 24,
                        ),
                        padding: getPadding(
                          left: 16,
                          right: 16,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            AppBar(
                              toolbarHeight: 0,
                              elevation: 0,
                              backgroundColor: Colors.transparent,
                            ),
                            CustomSearchView(
                              controller: controller.searchController,
                              hintText: "lbl_where_to".tr,
                              hintStyle:
                                  CustomTextStyles.bodyLargeErrorContainer,
                              prefix: Container(
                                margin: getMargin(
                                  left: 16,
                                  top: 17,
                                  right: 14,
                                  bottom: 17,
                                ),
                                child: CustomImageView(
                                  svgPath: ImageConstant.imgIcSearch,
                                ),
                              ),
                              prefixConstraints: BoxConstraints(
                                maxHeight: getVerticalSize(54),
                              ),
                              // suffix: Container(),
                              enabled: false,
                              onTap: (){


                                print("called----bottomsheet");

                                showModalBottomSheet(context: context,
                                  isScrollControlled: true,
                                  backgroundColor: appTheme.whiteA700,
                                  barrierColor: Colors.transparent,
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(topRight: Radius.circular(getHorizontalSize(32)),topLeft: Radius.circular(getHorizontalSize(32)))),
                                  builder: (context) {
                                  return HomeSearchScreen();
                                },);
                              },
                            ),
                            Spacer(),
                            Align(
                              alignment: Alignment.centerRight,
                              child: Container(
                                margin: getMargin(bottom: 30),
                                height: getVerticalSize(54),
                                width: getVerticalSize(54),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: theme.colorScheme.primary,
                                ),
                                child: Center(
                                  child: CustomImageView(
                                    svgPath: ImageConstant.imgGroup38172,

                                  ),
                                ),
                              ),
                            ),

                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),

            ],
          ),
        ),
        // floatingActionButton: CustomFloatingButton(
        //   height: 54,
        //   width: 54,
        //   child: Icon(
        //     Icons.add,
        //   ),
        // ),
      ),
    );
  }
}
