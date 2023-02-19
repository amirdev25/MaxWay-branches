import 'package:flutter/material.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:maxway_branches/core/theme/app_colors.dart';
import 'package:maxway_branches/data/data_model.dart';

class MapPage extends StatefulWidget {
  const MapPage({Key? key}) : super(key: key);

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {

  MapType _mapType = MapType.hybrid;

  @override
  Widget build(BuildContext context) {
    final args = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;

    final location = args['location'] as Location;

    final name = args['name'] as String;

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: AppColors.color2,
        ),
        backgroundColor: AppColors.mainColor,
        titleTextStyle: TextStyle(
          color: AppColors.color2,
          fontSize: 18.0,
          fontWeight: FontWeight.bold,
        ),
        title: Text(name),
        actions: [
          IconButton(
            onPressed: () {
              shareLocation(location, context, name);
            },
            icon: Icon(
              Icons.share,
              color: AppColors.color2,
            ),
          ),
          const SizedBox(
            width: 8.0,
          ),
        ],
      ),
      body: Stack(
        alignment: Alignment.bottomRight,
        children: [
          GoogleMap(
            zoomControlsEnabled: false,
            mapType: _mapType,
            initialCameraPosition: CameraPosition(
              target: LatLng(
                location.lat,
                location.long,
              ),
              zoom: 16.0,
            ),
            markers: {
              Marker(
                markerId: MarkerId("marker1"),
                position: LatLng(location.lat, location.long),
              ),
            },
          ),
          InkWell(
            onTap: () {
              setState(() {
                if (_mapType == MapType.normal) {
                  _mapType = MapType.hybrid;
                } else {
                  _mapType = MapType.normal;
                }
              });
            },
            child: Container(
              margin: const EdgeInsets.only(
                right: 16.0,
                bottom: 56.0,
              ),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(8.0),
                ),
              ),
              height: 40.0,
              width: 40.0,
              child: const Icon(
                Icons.map_outlined,
                color: Color(0xFF161123),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> shareLocation(
      Location location, BuildContext context, String name) async {
    await FlutterShare.share(
      title: 'Max Way',
      text:
          'Assalomu alaykum! \nBizning $name filialiga quyidagi link orqali tashrif buyurishingiz mumkin \nYoqimli ishtaxa!',
      linkUrl: 'http://maps.google.com/maps?q=${location.lat},${location.long}',
    );
  }
}
