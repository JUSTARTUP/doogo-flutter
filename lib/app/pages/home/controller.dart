import 'dart:async';

import 'packag:Doogo/app/core/theme/color_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomePageController extends GetxController with StateMixin {
  final TextEditingController searchController = TextEditingController();

  final Completer<GoogleMapController> _googleMapController = Completer();
  final DraggableScrollableController _draggableScrollableController =
      DraggableScrollableController();

  final List<LatLng> locationsList = [
    const LatLng(37.34195769242027, 126.83168100453923),
    const LatLng(37.342455499589924, 126.83009713274917),
    const LatLng(37.34163984380222, 126.82994097805991),
    const LatLng(37.342440830785264, 126.82929591096978),
    const LatLng(37.34329464253305, 126.83410720454255),
    const LatLng(37.340601553769936, 126.82848191121838),
    const LatLng(37.34034970769801, 126.82878717803764),
    const LatLng(37.33994323117728, 126.82808843663354),
    const LatLng(37.33975690111736, 126.83008628466244),
    const LatLng(37.34045575940381, 126.83365076472549),
  ];
  final List<String> titles = [
    "한국디지털미디어고등학교",
    "이마트24   ",
    "하늘미소",
    "와개공원",
    "전기차 충전소",
    "CU",
    "GS25",
    "복지 공원",
    "만남 공원",
    "꽃빛 공원",
  ];

  Rx<Set<Marker>?> _markers = Rx(<Marker>{});

  void generateMarkers() {
    var localMarkers = <Marker>{};
    int i = 0;
    for (var location in locationsList) {
      localMarkers.add(
        Marker(
            markerId: MarkerId("$i"),
            onTap: () {
              //_draggableScrollableController.jumpTo(100);
              _showSheet();
            },
            infoWindow: InfoWindow(title: titles[i]),
            position: LatLng(location.latitude, location.longitude),
            icon: BitmapDescriptor.defaultMarkerWithHue(
                BitmapDescriptor.hueGreen)),
      );
      i++;
    }
    _markers.value = localMarkers;
  }

  final CameraPosition dimigo = const CameraPosition(
    target: LatLng(37.34195769242027, 126.83168100453923),
    zoom: 15.5,
  );

  void _showSheet() {
    Get.bottomSheet(DraggableScrollableSheet(
      expand: false,
      controller: _draggableScrollableController,
      initialChildSize: 0.25,
      minChildSize: 0.1,
      builder: (BuildContext context, ScrollController scrollController) {
        return Container(
          decoration: const BoxDecoration(
              color: AppColorTheme.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0),
              )),
          child: SingleChildScrollView(
            controller: scrollController,
            child: Padding(
              padding: const EdgeInsets.all(22.0),
              child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: []),
            ),
          ),
        );
      },
    ));
  }

  void onMapCreated(GoogleMapController controller) async {
    generateMarkers();
    _googleMapController.complete(controller);
  }

  Set<Marker> get marker => _markers.value!;
}
