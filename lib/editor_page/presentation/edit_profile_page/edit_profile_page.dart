import 'package:http/http.dart' as http;
import '../../widgets/app_bar/custom_app_bar.dart';
import '../../widgets/app_bar/appbar_leading_image.dart';
import '../../widgets/app_bar/appbar_title.dart';
import '../../widgets/custom_text_form_field.dart';
import '../../widgets/custom_drop_down.dart';
import '../../widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import 'package:chatbotui/chatbot_ui/core/utils/size_utils.dart';
import 'dart:convert';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({Key? key}) : super(key: key);

  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  TextEditingController fullNameController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController bigOutlineDefaultController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  List<String> dropdownItemList = [];

  @override
void initState() {
  super.initState();
  fetchCountryList();
}

Future<void> fetchCountryList() async {
  try {
    var response = await http.get(
      Uri.parse('https://countryapi.io/api/all?apikey=awlkpZbZQ4NK60l6hMIUWhgzuiYH8tNAHcRXfOth'),
    );

    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      List<String> countries =
          data.map<String>((country) => country['name']).toList();
      setState(() {
        dropdownItemList = countries;
      });
    } else {
      print('Failed to fetch country list: ${response.statusCode}');
    }
  } catch (error) {
    print('Error fetching country list: $error');
  }
}


  // @override
  // void initState() {
  //   super.initState();
  //   fetchCountryList();
  // }

  // Future<void> fetchCountryList() async {
  //   try {
  //     var response = await http.get(
  //       Uri.parse('https://countryapi.io/api/all'),
  //       headers: {
  //         'Authorization': 'Bearer awlkpZbZQ4NK60l6hMIUWhgzuiYH8tNAHcRXfOth',
  //       },
  //     );

  //     if (response.statusCode == 200) {
  //       List<dynamic> data = jsonDecode(response.body);
  //       List<String> countries =
  //           data.map<String>((country) => country['name']).toList();
  //       setState(() {
  //         dropdownItemList = countries;
  //       });
  //     } else {
  //       print('Failed to fetch country list: ${response.statusCode}');
  //     }
  //   } catch (error) {
  //     print('Error fetching country list: $error');
  //   }
  // }


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
                              _buildSix(context),
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
            text: "Edit profile", margin: EdgeInsets.only(left: 90.h)));
  }

  /// Section Widget
  Widget _buildFullName(BuildContext context) {
    return CustomTextFormField(
        controller: fullNameController, hintText: "Full name");
  }

  /// Section Widget
  Widget _buildName(BuildContext context) {
    return CustomTextFormField(
        controller: nameController, hintText: "Nick name");
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
        textInputType: TextInputType.phone,
        prefix: Container(
            margin: EdgeInsets.fromLTRB(16.h, 11.v, 25.h, 7.v),
            child: CustomImageView(
                imagePath: ImageConstant.imgSrilanka1,
                height: 32.adaptSize,
                width: 32.adaptSize)),
        prefixConstraints: BoxConstraints(maxHeight: 50.v),
        contentPadding: EdgeInsets.only(top: 19.v, right: 30.h, bottom: 19.v));
  }

  /// Section Widget
  Widget _buildBigOutlineDefault(BuildContext context) {
    return CustomTextFormField(
        width: 149.h,
        controller: bigOutlineDefaultController,
        hintText: "Genre");
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

   /// Section Widget
  Widget _buildSix(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(right: 3.h),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          CustomDropDown(
            width: 153.h,
            icon: Container(
              margin: EdgeInsets.fromLTRB(30.h, 13.v, 8.h, 13.v),
              child: CustomImageView(
                imagePath: ImageConstant.imgArrowdropdown,
                height: 24.adaptSize,
                width: 24.adaptSize,
                ),
                ),
                hintText: "Country",
                items: dropdownItemList,
                value: dropdownItemList.isNotEmpty ? dropdownItemList[0] : null, // Set initial value
                onChanged: (value) {
                  // Handle dropdown item selection
                  setState(() {
      // Update the selected value
      // Example: selectedCountry = value;
    });
  },
              // width: 153.h,
              // icon: Container(
              //     margin: EdgeInsets.fromLTRB(30.h, 13.v, 8.h, 13.v),
              //     child: CustomImageView(
              //         imagePath: ImageConstant.imgArrowdropdown,
              //         height: 24.adaptSize,
              //         width: 24.adaptSize)),
              // hintText: "Country",
              // items: dropdownItemList
              ),
          _buildBigOutlineDefault(context)
        ]));
  }
}
