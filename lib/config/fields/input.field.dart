import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class InputFieldOne extends StatelessWidget {
  InputFieldOne({
    super.key,
    this.controller,
    this.onClick,
    this.style,
    this.onChanged,
    this.hintText,
    this.hintStyle,
    this.prefixIcon,
    this.suffixIcon,
    this.readOnly,
    this.keyboardType,
    this.obscureText,
    this.decoration,
    this.padding,
    this.maxLength,
  });

  final TextEditingController? controller;
  final void Function()? onClick;
  final void Function(String)? onChanged;
  final TextStyle? style;
  final String? hintText;
  final TextStyle? hintStyle;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool? readOnly;
  final TextInputType? keyboardType;
  final bool? obscureText;
  final BoxDecoration? decoration;
  final EdgeInsetsGeometry? padding;
  final int? maxLength;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding ?? EdgeInsets.zero,
      alignment: Alignment.center,
      clipBehavior: Clip.antiAlias,
      decoration: decoration ??
          BoxDecoration(
            border: Border.all(color: Color(0xFFFFBC3A)),
            borderRadius: BorderRadius.circular(10.sp),
          ),
      child: TextField(
        controller: controller,
        style: style,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          alignLabelWithHint: true,
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          hintText: hintText ?? "Demo Text",
          hintStyle: hintStyle,
          counterText: "",
        ),
        onTap: onClick,
        onChanged: onChanged,
        readOnly: readOnly ?? false,
        obscureText: obscureText ?? false,
        maxLength: maxLength,
      ),
    );
  }
}

class InputFieldTwo extends StatelessWidget {
  InputFieldTwo({
    super.key,
    this.controller,
    this.onClick,
    this.style,
    this.onChanged,
    this.hintText,
    this.hintStyle,
    this.prefixIcon,
    this.suffixIcon,
    this.readOnly,
    this.keyboardType,
    this.obscureText,
  });

  final TextEditingController? controller;
  final void Function()? onClick;
  final void Function(String)? onChanged;
  final TextStyle? style;
  final String? hintText;
  final TextStyle? hintStyle;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool? readOnly;
  final TextInputType? keyboardType;
  final bool? obscureText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      style: style,
      decoration: InputDecoration(
        enabledBorder: InputBorder.none,
        focusedBorder: InputBorder.none,
        alignLabelWithHint: true,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        hintText: hintText ?? "Demo Text",
        hintStyle: hintStyle,
      ),
      onTap: onClick,
      onChanged: onChanged,
      readOnly: readOnly ?? false,
      obscureText: obscureText ?? false,
    );
  }
}

class InputSearchField extends StatelessWidget {
  InputSearchField({
    super.key,
    this.controller,
    this.onClick,
    this.style,
    this.onChanged,
    this.hintText,
    this.hintStyle,
    this.prefixIcon,
    this.suffixIcon,
    this.suffixStyle,
    this.suffixIconColor,
    this.suffixIconConstraints,
    this.readOnly,
    this.keyboardType,
    this.obscureText,
  });

  final TextEditingController? controller;
  final void Function()? onClick;
  final void Function(String)? onChanged;
  final TextStyle? style;
  final String? hintText;
  final TextStyle? hintStyle;
  final Widget? prefixIcon;
  final TextStyle? suffixStyle;
  final Color? suffixIconColor;
  final BoxConstraints? suffixIconConstraints;
  final Widget? suffixIcon;
  final bool? readOnly;
  final TextInputType? keyboardType;
  final bool? obscureText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      style: style,
      decoration: InputDecoration(
        enabledBorder: InputBorder.none,
        focusedBorder: InputBorder.none,
        alignLabelWithHint: true,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        hintText: hintText ?? "Demo Text",
        hintStyle: hintStyle,
      ),
      onTap: onClick,
      onChanged: onChanged,
      readOnly: readOnly ?? false,
      // obscureText: obscureText ?? false,
    );
  }
}

class FieldLable extends StatelessWidget {
  FieldLable({
    super.key,
    required this.lable,
    this.lableColors,
    this.lableStyle,
    this.require,
    this.requireColors,
    this.requireText,
  });

  final String lable;
  final Color? lableColors;
  final TextStyle? lableStyle;
  final Bool? require;
  final Color? requireColors;
  final String? requireText;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          WidgetSpan(
            child: Text(
              lable,
              style: lableStyle ??
                  GoogleFonts.inter(
                    color: lableColors ?? Colors.black,
                    fontSize: 15.sp,
                    fontWeight: FontWeight.normal,
                  ),
            ),
            alignment: PlaceholderAlignment.middle,
          ),
          if (require != null) WidgetSpan(child: SizedBox(width: 10.sp)),
          if (require != null)
            WidgetSpan(
              child: Text(
                requireText ?? "*",
                style: lableStyle ??
                    GoogleFonts.inter(
                      color: requireColors ?? Colors.red,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.normal,
                    ),
              ),
              alignment: PlaceholderAlignment.middle,
            ),
        ],
      ),
    );
  }
}
