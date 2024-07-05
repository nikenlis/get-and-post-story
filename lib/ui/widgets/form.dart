import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tugas2_moa/shared/theme.dart';

class FormFieldController extends GetxController {
  var obsecureText = true.obs;

  void toggleObscureText() {
    obsecureText.value = !obsecureText.value;
  }
}

class CustomFormField extends StatelessWidget {
  final String title;
  final bool obsecureText;
  final TextEditingController? controller;
  final bool isShowTitle;
  final bool iconVisibility;
  final Function(String)? onFieldSubmitted;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final FormFieldValidator<String>? validator;

  const CustomFormField({
    super.key,
    required this.title,
    this.obsecureText = false,
    this.controller,
    this.isShowTitle = true,
    this.iconVisibility = false,
    this.onFieldSubmitted,
    this.keyboardType = TextInputType.text,
    this.textInputAction = TextInputAction.next,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    final FormFieldController formFieldController =
        Get.put(FormFieldController());
    final mediaQuery = MediaQuery.of(context);
    final double screenWidth = mediaQuery.size.width;
    final double fieldWidth = screenWidth - 32;

    return Obx(() => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (isShowTitle)
              Text(
                title,
                style: blackTextStyle.copyWith(
                  fontWeight: medium,
                ),
              ),
            if (isShowTitle) const SizedBox(height: 8),
            SizedBox(
              width: fieldWidth,
              child: TextFormField(
                obscureText:
                    formFieldController.obsecureText.value && obsecureText,
                controller: controller,
                keyboardType: keyboardType,
                textInputAction: textInputAction,
                decoration: InputDecoration(
                  hintText: !isShowTitle ? title : null,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                  contentPadding: EdgeInsets.all(mediaQuery.size.width * 0.04),
                  suffixIcon: iconVisibility
                      ? IconButton(
                          onPressed: () {
                            formFieldController.toggleObscureText();
                          },
                          icon: Icon(
                              formFieldController.obsecureText.value
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: greyColor),
                        )
                      : null,
                ),
                onFieldSubmitted: onFieldSubmitted,
                validator: validator,
              ),
            ),
          ],
        ));
  }
}
