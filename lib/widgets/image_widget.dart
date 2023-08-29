import 'dart:convert';
import 'package:app/utils/constants.dart';
import 'package:flutter/material.dart';

class ImageWidget extends StatelessWidget {
  final String base64String;

  const ImageWidget({required this.base64String, super.key});

  @override
  Widget build(BuildContext context) {
    return Image.memory(base64Decode(base64String));
  }
}
