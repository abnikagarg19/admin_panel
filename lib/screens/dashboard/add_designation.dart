import 'package:archlelabsadmin/controllers/designationController.dart';
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

class AddDesignation extends StatelessWidget {
  AddDesignation({super.key});

  @override
  Widget build(BuildContext context) {
    return SiteTemplate(
      body: buildHireForm(context),
    );
  }

  final formKey = GlobalKey<FormState>();
  Widget buildHireForm(context) {
    return GetBuilder<DesignationController>(builder: (_controller) {
      return Expanded(
        child: SingleChildScrollView(
          child: LayoutBuilder(builder: (context, constraints) {
            return Container(
              margin: EdgeInsets.all(defaultPadding),
              child: Form(
                key: formKey,
                child: Flex(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  direction: constraints.maxWidth > 800
                      ? Axis.horizontal
                      : Axis.vertical,
                  children: [
                    Expanded(
                      flex: constraints.maxWidth > 800 ? 6 : 0,
                      child: Column(
                        //   mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 30),
                            decoration: BoxDecoration(
                              color: secondaryColor,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(12)),
                            ),
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
                                    textEditingController: _controller.title,
                                    validation: (value) {
                                      if (value == null || value.isEmpty) {
                                        return "Title is required";
                                      }
                                      return null;
                                    },
                                    // icon: const Icon(Icons.check_circle_outline,
                                    //     color: Colors.blue),
                                    hintText: "Job Title",
                                    color: const Color(0xff585A60)),
                                SizedBox(
                                  height: 20,
                                ),
                                MyTextField(
                                    // inputFormatters: [
                                    //   FilteringTextInputFormatter.allow(
                                    //       RegExp("[a-zA-Z0-9]")),
                                    // ],
                                    textEditingController: _controller.exp,
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
                                    textEditingController: _controller.location,
                                    validation: (value) {
                                      if (value == null || value.isEmpty) {
                                        return "location is required";
                                      }
                                      return null;
                                    },
                                    // icon: const Icon(Icons.check_circle_outline,
                                    //     color: Colors.blue),
                                    hintText: "Job Location",
                                    color: const Color(0xff585A60)),
                                SizedBox(
                                  height: 20,
                                ),
                                MyTextField(
                                    // inputFormatters: [
                                    //   FilteringTextInputFormatter.allow(
                                    //       RegExp("[a-zA-Z0-9]")),
                                    // ],
                                    textEditingController: _controller.jobType,
                                    validation: (value) {
                                      if (value == null || value.isEmpty) {
                                        return "Job Type is required";
                                      }
                                      return null;
                                    },
                                    // icon: const Icon(Icons.check_circle_outline,
                                    //     color: Colors.blue),
                                    hintText: "Job Type",
                                    color: const Color(0xff585A60)),
                                SizedBox(
                                  height: 20,
                                ),
                                Text("Key Responsibilities",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                                SizedBox(height: 10),
                                ..._controller.responsibilities
                                    .asMap()
                                    .entries
                                    .map((entry) {
                                  int index = entry.key;
                                  return Column(
                                    children: [
                                      MyTextField(
                                        textEditingController:
                                            _controller.responsibilities[index],
                                        hintText: "Responsibility",
                                        validation: (value) {
                                          if (value == null || value.isEmpty) {
                                            return "Responsibility is required";
                                          }
                                          return null;
                                        },
                                        color: const Color(0xff585A60),
                                      ),
                                      SizedBox(height: 10),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          if (_controller
                                                  .responsibilities.length >
                                              1)
                                            IconButton(
                                              icon: Icon(Icons.close,
                                                  color: Colors.red),
                                              onPressed: () => _controller
                                                  .removeResponsibility(index),
                                            ),
                                        ],
                                      ),
                                    ],
                                  );
                                }).toList(),
                                Align(
                                  alignment: Alignment.topRight,
                                  child: TextButton.icon(
                                    onPressed: _controller.addResponsibility,
                                    icon: Icon(Icons.add, color: Colors.blue),
                                    label: Text("Add Responsibility"),
                                  ),
                                ),

                                SizedBox(height: 10),

                                /// Qualifications Section
                                Text("Qualifications",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                                SizedBox(height: 10),
                                ..._controller.qualifications
                                    .asMap()
                                    .entries
                                    .map((entry) {
                                  int index = entry.key;
                                  return Column(
                                    children: [
                                      MyTextField(
                                        textEditingController:
                                            _controller.qualifications[index],
                                        hintText: "Qualification",
                                        validation: (value) {
                                          if (value == null || value.isEmpty) {
                                            return "Qualification is required";
                                          }
                                          return null;
                                        },
                                        color: const Color(0xff585A60),
                                      ),
                                      SizedBox(height: 10),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          if (_controller
                                                  .qualifications.length >
                                              1)
                                            IconButton(
                                              icon: Icon(Icons.close,
                                                  color: Colors.red),
                                              onPressed: () => _controller
                                                  .removeQualification(index),
                                            ),
                                        ],
                                      ),
                                    ],
                                  );
                                }).toList(),
                                Align(
                                  alignment: Alignment.topRight,
                                  child: TextButton.icon(
                                    onPressed: _controller.addQualification,
                                    icon: Icon(Icons.add, color: Colors.blue),
                                    label: Text("Add Qualification"),
                                  ),
                                ),

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
                                  height: 12,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                        flex: constraints.maxWidth > 800 ? 6 : 0,
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 30),
                          decoration: BoxDecoration(
                            color: secondaryColor,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(12)),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Skills",
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                              SizedBox(height: 10),
                              ..._controller.skills
                                  .asMap()
                                  .entries
                                  .map((entry) {
                                int index = entry.key;
                                return Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        if (_controller.skills.length > 1)
                                          IconButton(
                                            padding: EdgeInsets.zero,
                                            visualDensity: VisualDensity( ),
                                            icon: Icon(Icons.close,
                                                color: Colors.red),
                                            onPressed: () =>
                                                _controller.removeSkill(index),
                                          ),
                                      ],
                                    ),
                                    MyTextField(
                                      textEditingController:
                                          _controller.skills[index]['title']!,
                                      hintText: "Skill Title",
                                      validation: (value) {
                                        if (value == null || value.isEmpty) {
                                          return "Title is required";
                                        }
                                        return null;
                                      },
                                      color: const Color(0xff585A60),
                                    ),
                                    SizedBox(height: 20),
                                    MyTextField(
                                      textEditingController: _controller
                                          .skills[index]['description']!,
                                      hintText: "Skill Description",
                                      validation: (value) {
                                        if (value == null || value.isEmpty) {
                                          return "Description is required";
                                        }
                                        return null;
                                      },
                                      color: const Color(0xff585A60),
                                    ),
                                    SizedBox(height: 10),
                                  ],
                                );
                              }).toList(),
                              Align(
                                alignment: Alignment.bottomRight,
                                child: TextButton.icon(
                                  onPressed: _controller.addSkill,
                                  icon: Icon(Icons.add, color: Colors.blue),
                                  label: const Text("Add Skill"),
                                ),
                              ),
                              SizedBox(height: 20),
                              Text("What we offer",
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                              SizedBox(height: 10),
                              ..._controller.offers
                                  .asMap()
                                  .entries
                                  .map((entry) {
                                int index = entry.key;
                                return Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        if (_controller.offers.length > 1)
                                          IconButton(
                                            icon: Icon(Icons.close,
                                                color: Colors.red),
                                            onPressed: () =>
                                                _controller.removeOffer(index),
                                          ),
                                      ],
                                    ),
                                    MyTextField(
                                      textEditingController:
                                          _controller.offers[index]['title']!,
                                      hintText: "Offer Title",
                                      validation: (value) {
                                        if (value == null || value.isEmpty) {
                                          return "Description is required";
                                        }
                                        return null;
                                      },
                                      color: const Color(0xff585A60),
                                    ),
                                    SizedBox(height: 20),
                                    MyTextField(
                                      textEditingController: _controller
                                          .offers[index]['description']!,
                                      validation: (value) {
                                        if (value == null || value.isEmpty) {
                                          return "Description is required";
                                        }
                                        return null;
                                      },
                                      hintText: "Offer Description",
                                      color: const Color(0xff585A60),
                                    ),
                                    SizedBox(height: 10),
                                  ],
                                );
                              }).toList(),
                              Align(
                                alignment: Alignment.bottomRight,
                                child: TextButton.icon(
                                  onPressed: _controller.addOffer,
                                  icon: Icon(Icons.add, color: Colors.blue),
                                  label: const Text("Add Offer"),
                                ),
                              ),
                              SizedBox(height: 40),

                              /// Responsibilities Section

                              Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 10,
                                ),
                                child: Button(
                                  tittle: "Submit",
                                  tap: () {
                                    if (formKey.currentState!.validate()) {
                                      _controller.submit();
                                    }
                                  },
                                ),
                              ),
                            ],
                          ),
                        ))
                  ],
                ),
              ),
            );
          }),
        ),
      );
    });
  }
}
