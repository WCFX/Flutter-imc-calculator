import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

class AppTextStyles {
  static final TextStyle title = GoogleFonts.archivo(
    color: AppColors.darkRed,
    fontSize: 20,
    fontWeight: FontWeight.w400,
  );

  static final TextStyle titleBold = GoogleFonts.notoSans(
    color: AppColors.white,
    fontSize: 20,
    fontWeight: FontWeight.w600,
  );
  static final TextStyle description = GoogleFonts.notoSans(
    color: AppColors.white,
    fontSize: 20,
    fontWeight: FontWeight.w600,
  );

  static final TextStyle titulo = GoogleFonts.poppins(
      color: AppColors.chartPrimary, fontSize: 24, fontWeight: FontWeight.w400);
}
