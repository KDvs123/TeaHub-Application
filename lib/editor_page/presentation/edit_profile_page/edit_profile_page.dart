import '../../widgets/app_bar/custom_app_bar.dart';
import '../../widgets/app_bar/appbar_leading_image.dart';
import '../../widgets/app_bar/appbar_title.dart';
import '../../widgets/custom_text_form_field.dart';
import '../../widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import 'package:chatbotui/chatbot_ui/core/utils/size_utils.dart';


// ignore_for_file: must_be_immutable
class EditProfilePage extends StatelessWidget {
  EditProfilePage({Key? key}) : super(key: key);

  TextEditingController fullNameController = TextEditingController();

  TextEditingController nameController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController phoneNumberController = TextEditingController();

  TextEditingController bigOutlineDefaultController = TextEditingController();

  TextEditingController addressController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: _buildAppBar(context),
            body: SizedBox(
                width: SizeUtils.width,
                child: SingleChildScrollView(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom),
                    child: Form(
                        key: _formKey,
                        child: Container(
                            width: double.maxFinite,
                            padding: EdgeInsets.symmetric(
                                horizontal: 24.h, vertical: 17.v),
                            child: Column(children: [
                              _buildFullName(context),
                              SizedBox(height: 24.v),
                              _buildName(context),
                              SizedBox(height: 24.v),
                              _buildEmail(context),
                              SizedBox(height: 24.v),
                              _buildPhoneNumber(context),
                              SizedBox(height: 24.v),
                              _buildBigOutlineDefault(context),
                              SizedBox(height: 24.v),
                              _buildAddress(context),
                              SizedBox(height: 24.v),
                              _buildSubmit(context),
                              SizedBox(height: 5.v)
                            ])))))));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        leadingWidth: 48.h,
        leading: AppbarLeadingImage(
            imagePath: ImageConstant.imgArrowLeft,
            margin: EdgeInsets.only(left: 24.h, top: 15.v, bottom: 16.v),
            onTap: () {
              onTapArrowLeft(context);
            }),
        title: AppbarTitle(
            text: "Edit profile", 
            margin: EdgeInsets.only(left: 90.h)));
  }

  /// Section Widget
  Widget _buildFullName(BuildContext context) {
    return CustomTextFormField(
        controller: fullNameController, 
        hintText: "Full name");
  }

  /// Section Widget
  Widget _buildName(BuildContext context) {
    return CustomTextFormField(
        controller: nameController, 
        hintText: "Nick name");
  }

  /// Section Widget
  Widget _buildEmail(BuildContext context) {
    return CustomTextFormField(
        controller: emailController,
        hintText: "Email",
        textInputType: TextInputType.emailAddress);
  }

  /// Section Widget
  Widget _buildPhoneNumber(BuildContext context) {
    return CustomTextFormField(
        controller: phoneNumberController,
        hintText: "Phone number",
        textInputType: TextInputType.phone);
  }

  /// Section Widget
  Widget _buildBigOutlineDefault(BuildContext context) {
    return CustomTextFormField(
        controller: bigOutlineDefaultController,
        hintText: "Gender",
        textInputAction: TextInputAction.done);
  }

  /// Section Widget
  Widget _buildAddress(BuildContext context) {
    return CustomTextFormField(
        controller: addressController,
        hintText: "Address",
        textInputAction: TextInputAction.done);
  }

  /// Section Widget
  Widget _buildSubmit(BuildContext context) {
    return CustomElevatedButton(text: "submit".toUpperCase());
  }

  /// Navigates back to the previous screen.
  onTapArrowLeft(BuildContext context) {
    Navigator.pop(context);
  }
}
