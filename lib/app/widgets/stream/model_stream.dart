import 'package:cloud_firestore/cloud_firestore.dart';
import 'packag:Doogo/app/core/theme/color_theme.dart';
import 'packag:Doogo/app/core/theme/text_theme.dart';
import 'packag:Doogo/app/widgets/modal.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ModelStreamWidget extends StatelessWidget {
  const ModelStreamWidget({Key? key, required this.doc, required this.type})
      : super(key: key);
  final DocumentSnapshot doc;
  final String type;

  @override
  Widget build(BuildContext context) {
    switch (type) {
      case "GOOD":
        return Container();
      case "BAD":
        return Container();
      default:
        return Container();
    }
  }
}
