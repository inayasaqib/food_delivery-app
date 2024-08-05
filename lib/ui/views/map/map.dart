import 'dart:async';
import 'package:flutter/material.dart';
import 'package:food_delivery/ui/common/app_colors.dart';
import 'package:food_delivery/ui/views/home/searchfield.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geocoding/geocoding.dart';

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  GoogleMapController? _controller;
  final FocusNode focunode = FocusNode();
  final TextEditingController _startPointController = TextEditingController();
  final TextEditingController _destinationController = TextEditingController();
  List<LatLng> _polylineCoordinates = [];
  final Set<Polyline> _polylines = {};
  Set<Marker> _markers = {};
  String _distance = "0.0";
  final CameraPosition _initialLocation = const CameraPosition(target: LatLng(37.77483, -122.41942), zoom: 12);

  LatLng? _currentLocation;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: gradient,
        ),
        child: Column(
          children: [
          const  Row(
              children: [
                 Padding(
                   padding: EdgeInsets.all(8.0),
                   child: Text('Find Location', style: TextStyle(color: fontColor, fontSize: 20,),),
                 ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: SearchField(hintText: "Find Your Location", controller: _startPointController, prefixIcon: Icons.search, focusNode: focunode),
            ),
            Expanded(
              child: GoogleMap(
                initialCameraPosition: _initialLocation,
                myLocationEnabled: true,
                myLocationButtonEnabled: true,
                mapType: MapType.normal,
                zoomGesturesEnabled: true,
                zoomControlsEnabled: false,
                markers: _markers,
                polylines: _polylines,
                onMapCreated: (GoogleMapController controller) {
                  _controller = controller;
                },
                onTap: _handleMapTap,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Distance: $_distance km"),
            ),
            if (_currentLocation != null)
              ElevatedButton.icon(
                onPressed: _goToCurrentLocation,
                icon: const Icon(Icons.location_on),
                label: const Text('Show Current Location'),
              ),
             
          ],
        ),
      ),
    );
  }

  void _handleMapTap(LatLng tappedPosition) {
    _markers.clear();
    _polylineCoordinates.clear();
  }

  void _drawPolyline() {
    setState(() {
      _polylines.add(
        Polyline(
          polylineId: const PolylineId('polyline'),
          visible: true,
          points: _polylineCoordinates,
          color: Colors.blue,
        ),
      );
    });
  }

  Future<LatLng?> _getCoordinates(String address) async {
    try {
      List<Location> locations = await locationFromAddress(address);
      if (locations != null && locations.isNotEmpty) {
        Location location = locations.first;
        return LatLng(location.latitude, location.longitude);
      } else {
        return null;
      }
    } catch (e) {
      print('Error retrieving coordinates: $e');
      return null;
    }
  }

  void _calculateDistance(LatLng start, LatLng destination) {
    double distance = Geolocator.distanceBetween(
          start.latitude,
          start.longitude,
          destination.latitude,
          destination.longitude,
        ) /
        1000;
    setState(() {
      _distance = distance.toStringAsFixed(2);
    });
  }

  void _showSnackbar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
    ));
  }

  void _goToCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition();
      LatLng latLng = LatLng(position.latitude, position.longitude);

      setState(() {
        _currentLocation = latLng;
      });

      _controller?.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
            target: latLng,
            zoom: 15,
          ),
        ),
      );
    } catch (e) {
      _showSnackbar('Error getting current location: $e');
    }
  }

  @override
  void dispose() {
    _startPointController.dispose();
    _destinationController.dispose();
    super.dispose();
  }
}
