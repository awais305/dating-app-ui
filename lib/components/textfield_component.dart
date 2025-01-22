import 'package:flutter/material.dart';

import '../utils/palette.dart';

class TextFieldComponent extends StatelessWidget {
  final Widget? prefixIcon;
  final TextEditingController? controller;
  final Function(String)? onChanged;

  const TextFieldComponent(
      {super.key, this.prefixIcon, this.controller, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      textAlignVertical: TextAlignVertical.top,
      style: const TextStyle(fontSize: 18),
      controller: controller,
      textAlign: TextAlign.left,
      cursorColor: Palette.primary,
      onTapOutside: (_) => FocusScope.of(context).unfocus(),
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.all(Radius.circular(999)),
        ),
        prefixIcon: prefixIcon,
        contentPadding: const EdgeInsets.only(top: 12, left: 25, bottom: 14),
        hintText: 'Search',
        labelStyle: const TextStyle(color: Palette.primary),
      ),
    );
  }
}
