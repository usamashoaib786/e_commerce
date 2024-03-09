import 'package:flutter/material.dart';
import 'package:tt_offer/Utils/resources/res/app_theme.dart';

class CustomAppFormField extends StatefulWidget {
  final double? height;
  final double? width;
  final double? fontsize;
  final fontweight;
  final bool containerBorderCondition;
  final String texthint;
  final errorText;
  final TextEditingController? controller;
  final FormFieldValidator? validator;
  final ValueChanged<String>? onChanged;
  final GestureTapCallback? onTap;
  final TapRegionCallback? onTapOutside;
  final VoidCallback? onEditingComplete;
  final ValueChanged<String>? onFieldSubmitted;
  final bool obscureText;
  final double? cursorHeight;
  final TextAlign textAlign;
  final Widget? prefix;
  final Widget? suffix;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Color? prefixIconColor;
  final Color? suffixIconColor;
  final Color? cursorColor;
  final borderColor;
  final hintTextColor;
  final maxline;
  final texAlign;
  final TextStyle? hintStyle;
  final style;
  final radius;
  final errorStyle;
  final errorBorder;
  final focusedErrorBorder;
  final cPadding;
  final type;

  CustomAppFormField({
    Key? key,
    this.containerBorderCondition = false,
    required this.texthint,
    required this.controller,
    this.validator,
    this.height,
    this.width,
    this.obscureText = false,
    this.onChanged,
    this.onTap,
    this.onTapOutside,
    this.onEditingComplete,
    this.onFieldSubmitted,
    this.cursorHeight,
    this.textAlign = TextAlign.start,
    this.prefix,
    this.suffix,
    this.prefixIcon,
    this.suffixIcon,
    this.prefixIconColor,
    this.suffixIconColor,
    this.fontweight,
    this.fontsize,
    this.hintStyle,
    this.borderColor,
    this.errorText,
    this.radius,
    this.style,
    this.errorStyle,
    this.maxline,
    this.errorBorder,
    this.hintTextColor,
    this.focusedErrorBorder,
    this.cursorColor,
    this.texAlign,
    this.cPadding, this.type,
  }) : super(key: key);

  @override
  State<CustomAppFormField> createState() => _CustomAppFormFieldState();
}

class _CustomAppFormFieldState extends State<CustomAppFormField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height ?? 48,
      width: widget.width ?? MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          border:
              Border.all(color: widget.borderColor ?? const Color(0xff464646)),
          color: AppTheme.white,
          borderRadius: BorderRadius.circular(widget.radius ?? 10)),
      child: TextField(
        style:
            TextStyle(fontSize: widget.fontsize, fontWeight: widget.fontweight),
        textAlign: widget.textAlign ?? TextAlign.start,
        maxLines: widget.maxline ?? 1,
        controller: widget.controller,
        cursorColor: AppTheme.white,
        cursorHeight: 20,
        
        cursorWidth: 2,
        keyboardType: widget.type??TextInputType.name,
        decoration: InputDecoration(
            prefixIcon: widget.prefixIcon,
            prefixIconConstraints: const BoxConstraints(
              minWidth: 50,
            ),
            border: InputBorder.none,
            contentPadding: EdgeInsets.all(widget.cPadding ?? 8),
            hintText: widget.texthint,
            hintStyle: TextStyle(
                color: widget.hintTextColor ?? AppTheme.textColor,
                fontSize: 14,
                fontWeight: FontWeight.w400),
            isDense: true),
      ),
    );
  }
}

class CustomAppPasswordfield extends StatefulWidget {
  final double? height;
  final double? width;
  final bool containerBorderCondition;
  final String texthint;
  final errorText;
  final TextEditingController? controller;
  final FormFieldValidator? validator;
  final ValueChanged<String>? onChanged;
  final GestureTapCallback? onTap;
  final TapRegionCallback? onTapOutside;
  final VoidCallback? onEditingComplete;
  final ValueChanged<String>? onFieldSubmitted;
  final double? cursorHeight;
  final TextAlign textAlign;
  final Widget? prefix;
  final Widget? suffix;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Color? prefixIconColor;
  final Color? suffixIconColor;
  final Color? cursorColor;
  final hintStyle;
  final style;
  final errorStyle;
  final errorBorder;
  final focusedErrorBorder;

  CustomAppPasswordfield(
      {Key? key,
      this.containerBorderCondition = false,
      required this.texthint,
      required this.controller,
      this.validator,
      this.height,
      this.width,
      this.onChanged,
      this.onTap,
      this.onTapOutside,
      this.onEditingComplete,
      this.onFieldSubmitted,
      this.cursorHeight,
      this.textAlign = TextAlign.start,
      this.prefix,
      this.suffix,
      this.prefixIcon,
      this.suffixIcon,
      this.prefixIconColor,
      this.suffixIconColor,
      this.errorText,
      this.hintStyle,
      this.cursorColor,
      this.style,
      this.errorStyle,
      this.errorBorder,
      this.focusedErrorBorder})
      : super(key: key);

  @override
  State<CustomAppPasswordfield> createState() => _CustomAppPasswordfieldState();
}

class _CustomAppPasswordfieldState extends State<CustomAppPasswordfield> {
  bool _obscureText = true;

  @override
  void setState(fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textAlignVertical: TextAlignVertical.center,
      onChanged: widget.onChanged,
      onTap: widget.onTap,
      onTapOutside: widget.onTapOutside,
      onFieldSubmitted: widget.onFieldSubmitted,
      cursorHeight: widget.cursorHeight,
      textAlign: widget.textAlign,
      key: widget.key,
      obscureText: _obscureText,
      validator: widget.validator,
      controller: widget.controller,
      cursorColor: widget.cursorColor,
      style: widget.style,
      decoration: InputDecoration(
          errorText: widget.errorText,
          errorStyle: widget.errorStyle,
          errorBorder: widget.errorBorder,
          focusedErrorBorder: widget.focusedErrorBorder,
          prefixIconColor: widget.prefixIconColor,
          suffixIconColor: widget.suffixIconColor,
          prefix: widget.prefix,
          suffix: widget.suffix,
          prefixIcon: widget.prefixIcon,
          contentPadding: const EdgeInsets.only(
            top: 20,
            left: 5,
          ),
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: AppTheme.appColor)),
          disabledBorder:
              const UnderlineInputBorder(borderSide: BorderSide.none),
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
            color: AppTheme.appColor,
          )),
          border: UnderlineInputBorder(
              borderSide: BorderSide(color: AppTheme.appColor)),
          hintText: widget.texthint,
          hintStyle: widget.hintStyle,
          suffixIcon: InkWell(
            onTap: () {
              setState(() {
                _obscureText = !_obscureText;
              });
            },
            child: Padding(
              padding: const EdgeInsets.only(top: 13),
              child: Icon(
                _obscureText
                    ? Icons.visibility_off_outlined
                    : Icons.visibility_outlined,
                color: AppTheme.appColor,
              ),
            ),
          )),
    );
  }
}
