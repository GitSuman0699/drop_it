import 'package:drop_it/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../constants/sizes.dart';

class TTextFormFieldTheme {
  TTextFormFieldTheme._();

  static InputDecorationTheme lightInputDecorationTheme = InputDecorationTheme(
    errorMaxLines: 3,
    prefixIconColor: TColors.darkGrey,
    suffixIconColor: TColors.darkGrey,

    // constraints: const BoxConstraints.expand(height: TSizes.inputFieldHeight),
    labelStyle: const TextStyle().copyWith(
      fontSize: TSizes.fontSizeMd,
      color: TColors.black,
      fontFamily: GoogleFonts.plusJakartaSans().fontFamily,
    ),
    hintStyle: const TextStyle().copyWith(
      fontSize: TSizes.fontSizeSm,
      color: Colors.black45,
      fontFamily: GoogleFonts.plusJakartaSans().fontFamily,
    ),
    errorStyle: const TextStyle().copyWith(
      fontSize: 12,
      fontStyle: FontStyle.normal,
      fontFamily: GoogleFonts.plusJakartaSans().fontFamily,
    ),
    floatingLabelStyle: const TextStyle().copyWith(
      color: TColors.black.withOpacity(0.8),
      fontFamily: GoogleFonts.plusJakartaSans().fontFamily,
    ),
    border: const UnderlineInputBorder().copyWith(
      // borderRadius: BorderRadius.circular(TSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: TColors.grey),
    ),
    enabledBorder: const UnderlineInputBorder().copyWith(
      borderSide: const BorderSide(color: Colors.black54),
    ),
    focusedBorder: const UnderlineInputBorder().copyWith(
      // borderRadius: BorderRadius.circular(TSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: TColors.black),
    ),
    errorBorder: const UnderlineInputBorder().copyWith(
      // borderRadius: BorderRadius.circular(TSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: TColors.error),
    ),
    focusedErrorBorder: const UnderlineInputBorder().copyWith(
      // borderRadius: BorderRadius.circular(TSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 2, color: TColors.error),
    ),
  );

  static InputDecorationTheme darkInputDecorationTheme = InputDecorationTheme(
    errorMaxLines: 2,
    prefixIconColor: TColors.darkGrey,
    suffixIconColor: TColors.darkGrey,
    // constraints: const BoxConstraints.expand(height: TSizes.inputFieldHeight),
    labelStyle: const TextStyle().copyWith(
      fontSize: TSizes.fontSizeMd,
      color: TColors.white,
      fontFamily: GoogleFonts.plusJakartaSans().fontFamily,
    ),
    hintStyle: const TextStyle().copyWith(
      fontSize: TSizes.fontSizeSm,
      color: TColors.white,
      fontFamily: GoogleFonts.plusJakartaSans().fontFamily,
    ),
    floatingLabelStyle: const TextStyle().copyWith(
      color: TColors.white.withOpacity(0.8),
      fontFamily: GoogleFonts.plusJakartaSans().fontFamily,
    ),
    border: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(TSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: TColors.darkGrey),
    ),
    enabledBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(TSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: TColors.darkGrey),
    ),
    focusedBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(TSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: TColors.white),
    ),
    errorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(TSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: TColors.warning),
    ),
    focusedErrorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(TSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 2, color: TColors.warning),
    ),
  );
}
