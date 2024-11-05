import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'edge_insets.dart';

abstract class InputStyles {
  static InputDecoration formTemplateInput({String? hintText}) {
    return InputDecoration(
      hintText: hintText, // Accept hintText as a parameter
      filled: true,
      fillColor: AppColors.white,
      contentPadding: edge_insets_x_8,
      border: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.rainbow2, width: 1),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.grey4, width: 1),
      ),
    );
  }
}
