import 'package:archlelabsadmin/screens/main/components/site_template.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:archlelabsadmin/controllers/menu_app_controller.dart';
import 'package:image_picker/image_picker.dart';
import '../../constants.dart';
import '../../controllers/BlogController.dart';
import '../../controllers/menu_app_controller.dart';
import '../../responsive.dart';
import '../../theme/app_theme.dart';
import '../../utils/constants.dart';
import '../../utils/multiline_textbox.dart';
import '../../utils/text_feilds.dart';
import '../dashboard/components/header.dart';

class AddBlog extends StatelessWidget {
  AddBlog({super.key});

  @override
  Widget build(BuildContext context) {
    return SiteTemplate(
      body: buildHireForm(context),
    );
  }

  final formKey = GlobalKey<FormState>();
  Widget buildHireForm(context) {
    return GetBuilder<BlogController>(builder: (_controller) {
      return Expanded(
        child: LayoutBuilder(builder: (context, constraints) {
          return Form(
            key: formKey,
            child: Container(
              margin: EdgeInsets.all(defaultPadding),
              child: SingleChildScrollView(
                child: Flex(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  direction: constraints.maxWidth > 800
                      ? Axis.horizontal
                      : Axis.vertical,
                  children: [
                    Expanded(
                      flex: constraints.maxWidth > 800 ? 9 : 0,
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 14, vertical: 20),
                        decoration: BoxDecoration(
                          color: secondaryColor,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(12)),
                        ),
                        // constraints: BoxConstraints(maxWidth: 600),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              "Add Blog",
                              style: GoogleFonts.openSans(
                                fontWeight: FontWeight.w600,
                                color: AppTheme.whiteColor,
                                fontSize: Constant.smallbheadingText(context),
                              ),
                            ),

                            SizedBox(
                              height: 30,
                            ),
                            MyTextField(
                                // inputFormatters: [
                                //   FilteringTextInputFormatter.allow(
                                //       RegExp("[a-zA-Z0-9]")),
                                // ],
                                textEditingController: _controller.title,
                                validation: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "Title is required";
                                  }
                                  return null;
                                },
                                // icon: const Icon(Icons.check_circle_outline,
                                //     color: Colors.blue),
                                hintText: "Blog Title",
                                color: const Color(0xff585A60)),
                            SizedBox(
                              height: 30,
                            ),
                            MyTextField(
                                textEditingController: _controller.subtitle,
                                validation: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "Blog sub title is required";
                                  }
                                  return null;
                                },
                                // icon: const Icon(Icons.check_circle_outline,
                                //     color: Colors.blue),
                                hintText: "Blog Sub heading",
                                color: const Color(0xff585A60)),
                            SizedBox(
                              height: 30,
                            ),
                            InputTextFieldMaxlines(
                              textEditingController: _controller.body1,
                              hintText: "Paragraph 1",
                              counterText: "1000",
                              maxLines: 4,
                              maxlength: 1000,
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            InputTextFieldMaxlines(
                              textEditingController: _controller.body2,
                              hintText: "Paragraph 2",
                              counterText: "1000",
                              maxLines: 4,
                              maxlength: 1000,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            InputTextFieldMaxlines(
                              textEditingController: _controller.body3,
                              hintText: "Paragraph 3",
                              counterText: "1000",
                              maxLines: 4,
                              maxlength: 1000,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            // Container(
                            //   width: double.infinity,
                            //   height: 45,
                            //   decoration: BoxDecoration(
                            //       color: Colors.white,
                            //       borderRadius: BorderRadius.circular(22)),
                            //   child: Center(
                            //     child: Text(
                            //       "Submit",
                            //       style: GoogleFonts.openSans(
                            //         color: AppTheme.black,
                            //         fontWeight: FontWeight.w600,
                            //         fontSize: Constant.body(context),
                            //       ),
                            //     ),
                            //   ),
                            // ),
                            // SizedBox(
                            //   height: 20,
                            // ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      flex: constraints.maxWidth > 800 ? 3 : 0,
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 14, vertical: 20),
                        decoration: BoxDecoration(
                          color: secondaryColor,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(12)),
                        ),
                        // constraints: BoxConstraints(maxWidth: 600),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Upload Images",
                              style: GoogleFonts.openSans(
                                fontWeight: FontWeight.w600,
                                color: AppTheme.whiteColor,
                                fontSize: Constant.smallbheadingText(context),
                              ),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Text(
                              "Image 1",
                              style: GoogleFonts.openSans(
                                color: AppTheme.whiteColor,
                                fontWeight: FontWeight.w400,
                                fontSize: Constant.smallbody(context),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            buildFilePicker(context, () {
                              _controller.getImage(ImageSource.gallery, 1);
                            }, _controller.images1),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              "Image 2",
                              style: GoogleFonts.openSans(
                                color: AppTheme.whiteColor,
                                fontWeight: FontWeight.w400,
                                fontSize: Constant.smallbody(context),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            buildFilePicker(context, () {
                              _controller.getImage(ImageSource.gallery, 2);
                            }, _controller.images2),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              "Image 3",
                              style: GoogleFonts.openSans(
                                color: AppTheme.whiteColor,
                                fontWeight: FontWeight.w400,
                                fontSize: Constant.smallbody(context),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            buildFilePicker(context, () {
                              _controller.getImage(ImageSource.gallery, 3);
                            }, _controller.images3),
                            SizedBox(
                              height: 25,
                            ),
                            Align(
                              alignment: Alignment.topRight,
                              child: GestureDetector(
                                onTap: () {
                                  if (formKey.currentState!.validate()) {
                                    _controller.submit();
                                  }
                                },
                                child: Container(
                                  width: 80,
                                  height: 40,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(4)),
                                  child: Center(
                                    child: Text(
                                      "Submit",
                                      style: GoogleFonts.openSans(
                                        color: AppTheme.black,
                                        fontWeight: FontWeight.w600,
                                        fontSize: Constant.smallbody(context),
                                      ),
                                    ),
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
            ),
          );
        }),
      );
    });
  }

  buildFilePicker(context, ontap, image) {
    return image == null
        ? MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              onTap: ontap,
              child: Container(
                width: double.infinity,
                height: 120,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: Colors.white70,
                    )),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      CupertinoIcons.photo_fill,
                      size: 44,
                      color: Colors.white70,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      " Upload",
                      style: GoogleFonts.openSans(
                        color: Colors.white70,
                        fontWeight: FontWeight.w600,
                        fontSize: Constant.smallbody(context),
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        : Stack(
            children: [
              Container(
                height: 120,
                child: Image.memory(
                  image,
                  fit: BoxFit.contain,
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: InkWell(
                  onTap: () {},
                  child: Container(
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color.fromRGBO(0, 0, 0, 0.5),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(6),
                        child: Icon(
                          Icons.delete,
                          size: 20,
                          color: Colors.red,
                        ),
                      )),
                ),
              )
            ],
          );
  }
}
