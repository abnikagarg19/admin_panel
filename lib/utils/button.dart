import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../theme/app_theme.dart';


class Button extends StatelessWidget {
  Button({super.key, required this.tittle, this.tap});
  final String tittle;
  var tap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: tap,
      child: Container(
          height: 40,
          width: double.infinity,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0XFF77CCFF),
                  Color(0XFF55AAFF),
                  Color(0XFF3388FF),
                  Color(0XFF0066FF),
                  Color(0XFF0044FF),
                  // const Colo
                ],

                //       begin: Alignment(-1.0, -1.0),
                // end: Alignment(2.0, 4.0),)
              ),
              borderRadius: BorderRadius.circular(4)),
          child: IntrinsicHeight(
            child: Stack(
              alignment: Alignment.center,
              children: [
                Align(
                  child: Text(
                    tittle,
                    style: GoogleFonts.inter(
                        fontSize: 15,
                        color: AppTheme.whiteColor,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                Positioned(
                    right: 20,
                    child: Icon(
                      size: 12,
                      Icons.arrow_forward_ios,
                      color: AppTheme.whiteColor,
                    )),
              ],
            ),
          )),
    );
  }
}
