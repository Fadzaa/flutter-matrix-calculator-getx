import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

//Colors
final Color colorBg = Color(0xFF111315);
final Color colorPrimary = Color(0xFF1A1D1F);
final Color colorLine= Color(0xFF4E4E4E);


//TextStyle
TextStyle tsTitle = GoogleFonts.montserratAlternates(
  textStyle: const TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 46,
    color: Color(0xFFDEDEDE)

  )
);

TextStyle tsTextField = GoogleFonts.montserratAlternates(
    textStyle: const TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 42,
        color: Color(0xFFDEDEDE)

    )
);

TextStyle tsHeading({required isActive}) {
  return isActive? GoogleFonts.montserrat(
      textStyle: const TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 42,
          color: Color(0xFFDEDEDE)

      )
  ) : GoogleFonts.montserrat(
      textStyle: const TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 42,
          color: Color(0xFF646464)

      )
  );
}

TextStyle tsOperator({required isActive}) {
  return isActive? GoogleFonts.montserrat(
      textStyle: const TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 28,
          color: Colors.white

      )
  ) : GoogleFonts.montserrat(
      textStyle: const TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 28,
          color: Color(0xFFBFBFBF)

      )
  );
}

TextStyle tsRunText = GoogleFonts.montserrat(
    textStyle: const TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 32,
        color: Color(0xFFDEDEDE)

    )
);


TextStyle tsMatrixBody = GoogleFonts.montserrat(
    textStyle: const TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 36,
        color: Color(0xFFDEDEDE)

    )
);

