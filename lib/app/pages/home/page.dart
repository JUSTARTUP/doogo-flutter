import 'package:firebase_getx_boilerplate/app/core/theme/color_theme.dart';
import 'package:firebase_getx_boilerplate/app/pages/home/controller.dart';
import 'package:firebase_getx_boilerplate/app/pages/home/widget/option.dart';
import 'package:firebase_getx_boilerplate/app/widgets/textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final HomePageController controller = Get.find<HomePageController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColorTheme.white,
        automaticallyImplyLeading: false,
        toolbarHeight: 130,
        flexibleSpace: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FGBPTextField(
                  textController: controller.searchController,
                  borderColor: Colors.grey),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Option(iconData: Icons.tiktok, value: "시간"),
                  Option(iconData: Icons.safety_check, value: "크기"),
                  Option(value: "냉장고"),
                  Option(value: "반려동물"),
                ],
              )
            ],
          ),
        ),
      ),
      body: SafeArea(
          child: Column(children: [
        Expanded(
          child: GoogleMap(
              markers: controller.marker,
              mapType: MapType.terrain,
              initialCameraPosition: controller.dimigo,
              onMapCreated: controller.onMapCreated),
        )
      ])),
    );
  }
}
