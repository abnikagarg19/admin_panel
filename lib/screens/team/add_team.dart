import 'package:archlelabsadmin/controllers/teamController.dart';
import 'package:archlelabsadmin/screens/main/components/site_template.dart';
import 'package:archlelabsadmin/utils/loaders.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:archlelabsadmin/controllers/menu_app_controller.dart';
import 'package:image_picker/image_picker.dart';
import '../../constants.dart';
import '../../controllers/menu_app_controller.dart';
import '../../responsive.dart';
import '../../theme/app_theme.dart';
import '../../utils/button.dart';
import '../../utils/constants.dart';
import '../../utils/multiline_textbox.dart';
import '../../utils/text_feilds.dart';
import '../dashboard/components/header.dart';

class AddTeam extends StatelessWidget {
  AddTeam({super.key});

  @override
  Widget build(BuildContext context) {
    return SiteTemplate(
      body: buildHireForm(context),
    );
  }

  final formKey = GlobalKey<FormState>();
  Widget buildHireForm(context) {
    return GetBuilder<TeamController>(builder: (_controller) {
      return Expanded(
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
               
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                    decoration: BoxDecoration(
                      color: secondaryColor,
                      borderRadius: const BorderRadius.all(Radius.circular(12)),
                    ),
                    constraints: BoxConstraints(maxWidth: 500),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      // mainAxisSize: MainAxisSize.min,
                      children: [
                        MyTextField(
                            // inputFormatters: [
                            //   FilteringTextInputFormatter.allow(
                            //       RegExp("[a-zA-Z0-9]")),
                            // ],
                            textEditingController: _controller.name,
                            validation: (value) {
                              if (value == null || value.isEmpty) {
                                return "Name is required";
                              }
                              return null;
                            },
                            // icon: const Icon(Icons.check_circle_outline,
                            //     color: Colors.blue),
                            hintText: "Name",
                            color: const Color(0xff585A60)),
                        SizedBox(
                          height: 20,
                        ),
                        MyTextField(
                            // inputFormatters: [
                            //   FilteringTextInputFormatter.allow(
                            //       RegExp("[a-zA-Z0-9]")),
                            // ],
                            textEditingController: _controller.role,
                            validation: (value) {
                              if (value == null || value.isEmpty) {
                                return "Designation is required";
                              }
                              return null;
                            },
                            // icon: const Icon(Icons.check_circle_outline,
                            //     color: Colors.blue),
                            hintText: "Designation",
                            color: const Color(0xff585A60)),
                        SizedBox(
                          height: 20,
                        ),
                        MyTextField(
                            // inputFormatters: [
                            //   FilteringTextInputFormatter.allow(
                            //       RegExp("[a-zA-Z0-9]")),
                            // ],
                            textEditingController: _controller.experience,
                            validation: (value) {
                              if (value == null || value.isEmpty) {
                                return "Experience is required";
                              }
                              return null;
                            },
                            // icon: const Icon(Icons.check_circle_outline,
                            //     color: Colors.blue),
                            hintText: "Experience",
                            color: const Color(0xff585A60)),
                        SizedBox(
                          height: 20,
                        ),
                        MyTextField(
                            // inputFormatters: [
                            //   FilteringTextInputFormatter.allow(
                            //       RegExp("[a-zA-Z0-9]")),
                            // ],
                            textEditingController: _controller.skills,
        
                            // icon: const Icon(Icons.check_circle_outline,
                            //     color: Colors.blue),
                            hintText: "Skills",
                            color: const Color(0xff585A60)),
                        SizedBox(
                          height: 20,
                        ),
                        MyTextField(
                            // inputFormatters: [
                            //   FilteringTextInputFormatter.allow(
                            //       RegExp("[a-zA-Z0-9]")),
                            // ],
                            textEditingController: _controller.linkedin,
                            validation: (value) {
                              if (value == null || value.isEmpty) {
                                return "Linkedin is required";
                              }
                              return null;
                            },
                            // icon: const Icon(Icons.check_circle_outline,
                            //     color: Colors.blue),
                            hintText: "Linked In",
                            color: const Color(0xff585A60)),
                        SizedBox(
                          height: 20,
                        ),
                        InputTextFieldMaxlines(
                          textEditingController: _controller.des,
                          hintText: "Description",
                          counterText: "1000",
                          maxLines: 4,
                          validation: (value) {
                            if (value == null || value.isEmpty) {
                              return "Description is required";
                            }
                            return null;
                          },
                          maxlength: 2000,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        buildFilePicker(context, () {
                          _controller.getImage(ImageSource.gallery);
                        }, _controller.images1, _controller.profileUrl),
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 10,
                          ),
                          child: Button(
                            tittle: "Submit",
                            tap: () {
                              if (formKey.currentState!.validate()) {
                               if(_controller.images1==null){
                                Loaders.customToast(message: "Select Image");
                                return;
                               }
                                _controller.submit();
                              }
                            },
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
    });
  }
  buildFilePicker(context, ontap, image, profileurl) {
    return image == null && profileurl==""
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
              if(profileurl=="")
              Center(
                child: Container(
                  height: 120,
                  child: Image.memory(
                    image,
                    fit: BoxFit.contain,
                  ),
                ),
              )
              else
               Center(
                child: Container(
                  height: 120,
                  child: Image.network(
                    profileurl,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: InkWell(
                  onTap: ontap,
                  child: Container(
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color.fromRGBO(0, 0, 0, 0.5),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(6),
                        child: Icon(
                          Icons.edit,
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
