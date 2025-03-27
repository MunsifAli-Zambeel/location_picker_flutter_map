// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:location_picker_flutter_map/location_picker_flutter_map.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Location Picker',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text('Flutter Location Picker')),
        body: FlutterLocationPicker(
          initPosition: LatLong(33.6462, 72.9964),
          selectLocationButtonText: 'Pick Location',
          selectLocationButtonWidth: 200,
          searchbarDebounceDuration: const Duration(milliseconds: 500),
          markerIcon: SizedBox(),
          showCurrentLocationPointer: true,
          showLocationController: true,
          showSelectLocationButton: false,
          initZoom: 11,

          currentLocationIcon: Icon(Icons.location_on),
          onLocationChanged: (latlng) {
            print("${latlng.latitude}, ${latlng.longitude} Picked");
          },

          // minZoomLevel: 5,
          maxZoomLevel: 22,
          trackMyPosition: true,
          onError: (e) => print("ERROR On Picked: $e"),

          onPicked: (pickedData) async {
            final PickedData pickedLocationData = pickedData;
            print("${pickedData.latLong}");
            print(pickedData.address);
            print(pickedData.addressData['country']);
            print("Location Picked: ${pickedData.addressData}");
          },

          onChanged: (pickedData) {
            print(
              "${pickedData.latLong.latitude}, ${pickedData.latLong.longitude} ${pickedData.address} and ${pickedData.addressData}",
            );
          },
        ),
      ),
    );
  }
}
