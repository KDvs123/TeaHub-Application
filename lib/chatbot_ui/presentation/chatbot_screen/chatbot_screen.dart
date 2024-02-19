import 'package:flutter/material.dart';
import 'package:shenali_s_application1/core/app_export.dart';
import 'package:shenali_s_application1/widgets/app_bar/appbar_leading_image.dart';
import 'package:shenali_s_application1/widgets/app_bar/custom_app_bar.dart';
import 'package:shenali_s_application1/widgets/custom_text_form_field.dart';

class ChatbotScreen extends StatelessWidget {
  ChatbotScreen({Key? key})
      : super(
          key: key,
        );

  TextEditingController messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: _buildAppBar(context),
        body: SizedBox(
          width: double.maxFinite,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildEleven(context),
              SizedBox(height: 56.v),
              Padding(
                padding: EdgeInsets.only(
                  left: 23.h,
                  right: 78.h,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomImageView(
                      imagePath: ImageConstant.imgSettings,
                      height: 60.v,
                      width: 45.h,
                      margin: EdgeInsets.only(top: 32.v),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        left: 15.h,
                        bottom: 6.v,
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: 16.h,
                        vertical: 17.v,
                      ),
                      decoration: AppDecoration.outlineBlack.copyWith(
                        borderRadius: BorderRadiusStyle.customBorderLR22,
                      ),
                      child: Container(
                        width: 166.h,
                        margin: EdgeInsets.only(right: 14.h),
                        child: Text(
                          "Hi !  How may i assist you today?",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: CustomTextStyles.bodyLargeBlack900,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 51.v),
              Align(
                alignment: Alignment.centerRight,
                child: Container(
                  width: 161.h,
                  margin: EdgeInsets.only(
                    left: 182.h,
                    right: 32.h,
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: 23.h,
                    vertical: 3.v,
                  ),
                  decoration: AppDecoration.outlineBlack900.copyWith(
                    borderRadius: BorderRadiusStyle.circleBorder31,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      SizedBox(height: 5.v),
                      Container(
                        width: 102.h,
                        margin: EdgeInsets.only(left: 11.h),
                        child: Text(
                          "",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: theme.textTheme.bodyLarge,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 29.v),
              Padding(
                padding: EdgeInsets.only(left: 24.h),
                child: Row(
                  children: [
                    CustomImageView(
                      imagePath: ImageConstant.imgSettings,
                      height: 60.v,
                      width: 45.h,
                    ),
                    Container(
                      height: 56.v,
                      width: 111.h,
                      margin: EdgeInsets.only(
                        left: 14.h,
                        bottom: 4.v,
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: 18.h,
                        vertical: 21.v,
                      ),
                      decoration: AppDecoration.outlineBlack.copyWith(
                        borderRadius: BorderRadiusStyle.customBorderLR22,
                      ),
                      child: CustomImageView(
                        imagePath: ImageConstant.imgGrid,
                        height: 11.v,
                        width: 56.h,
                        alignment: Alignment.bottomLeft,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 69.v),
              _buildTen(context),
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      leadingWidth: double.maxFinite,
      leading: AppbarLeadingImage(
        imagePath: ImageConstant.imgArrowDown,
        margin: EdgeInsets.fromLTRB(33.h, 17.v, 321.h, 17.v),
      ),
    );
  }

  /// Section Widget
  Widget _buildEleven(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Padding(
        padding: EdgeInsets.only(
          left: 25.h,
          right: 4.h,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              width: 197.h,
              margin: EdgeInsets.only(
                top: 14.v,
                bottom: 8.v,
              ),
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "Hello! \nI’m ",
                      style: CustomTextStyles.displaySmallff000000,
                    ),
                    TextSpan(
                      text: "TeaBot",
                      style: theme.textTheme.displaySmall,
                    ),
                  ],
                ),
                textAlign: TextAlign.left,
              ),
            ),
            CustomImageView(
              imagePath: ImageConstant.imgA59568969729,
              height: 131.v,
              width: 127.h,
              radius: BorderRadius.circular(
                63.h,
              ),
              margin: EdgeInsets.only(left: 20.h),
            ),
          ],
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildTen(BuildContext context) {
    return SizedBox(
      height: 178.v,
      width: double.maxFinite,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: EdgeInsets.fromLTRB(19.h, 72.v, 34.h, 13.v),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  CustomImageView(
                    imagePath: ImageConstant.imgGallerySvgrepoCom,
                    height: 48.adaptSize,
                    width: 48.adaptSize,
                    margin: EdgeInsets.only(top: 45.v),
                  ),
                  Spacer(
                    flex: 54,
                  ),
                  Container(
                    height: 45.v,
                    width: 46.h,
                    margin: EdgeInsets.only(bottom: 48.v),
                    decoration: BoxDecoration(
                      color: appTheme.whiteA700,
                      borderRadius: BorderRadius.circular(
                        23.h,
                      ),
                    ),
                  ),
                  Spacer(
                    flex: 45,
                  ),
                  CustomImageView(
                    imagePath: ImageConstant.imgQuestionMarkC,
                    height: 48.adaptSize,
                    width: 48.adaptSize,
                    margin: EdgeInsets.only(top: 45.v),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: 19.h,
                vertical: 17.v,
              ),
              decoration: AppDecoration.fillGreen.copyWith(
                borderRadius: BorderRadiusStyle.customBorderTL30,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  SizedBox(height: 83.v),
                  Padding(
                    padding: EdgeInsets.only(left: 58.h),
                    child: CustomTextFormField(
                      controller: messageController,
                      hintText: "Message",
                      textInputAction: TextInputAction.done,
                      suffix: Container(
                        margin: EdgeInsets.fromLTRB(30.h, 15.v, 15.h, 11.v),
                        child: CustomImageView(
                          imagePath: ImageConstant.imgSendsvgrepocom,
                          height: 35.adaptSize,
                          width: 35.adaptSize,
                        ),
                      ),
                      suffixConstraints: BoxConstraints(
                        maxHeight: 61.v,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
