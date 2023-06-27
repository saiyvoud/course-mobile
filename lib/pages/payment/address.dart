import 'package:course_mobile/components/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class AddressPage extends StatefulWidget {
  const AddressPage({super.key});

  @override
  State<AddressPage> createState() => _AddressPageState();
}

class _AddressPageState extends State<AddressPage> {
  
  TextEditingController village = TextEditingController();
  TextEditingController district = TextEditingController();
  TextEditingController province = TextEditingController();
  final formKey = GlobalKey<FormState>();
  late bool _serviceEnabled;
  late PermissionStatus _permissionGranted;
  LocationData? userLocation;
  BitmapDescriptor? icon;
@override
  void initState() {
    super.initState();
    _getUserLocation();
    BitmapDescriptor.fromAssetImage(
        ImageConfiguration(size: Size(48, 48)), 'assets/icons/pin.png')
        .then((onValue) {
      icon = onValue;
    });
  }
  // This function will get user location
  Future<void> _getUserLocation() async {
    Location location = Location();
    // Check if location service is enable
    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }
    // Check if permission is granted
    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    final locationData = await location.getLocation();
    setState(() {
      userLocation = locationData;
    });
  }

  Set<Marker> myMarKer() {
    return <Marker>[
      Marker(
        markerId: MarkerId('MarkerId'),
        position: LatLng(userLocation!.latitude!, userLocation!.longitude!),
        icon: icon!,
        
        infoWindow:
            InfoWindow(title: 'This is a Title', snippet: 'this is a snippet'),
      ),
    ].toSet();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: primaryColorBlack,
          ),
        ),
        title: Text(
          "add Address",
          style: TextStyle(fontSize: 18, color: primaryColorBlack),
        ),
        centerTitle: true,
      ),
      bottomNavigationBar: InkWell(
        onTap: () {
          if (formKey.currentState!.validate()) {}
        },
        child: Container(
          height: 50,
          decoration: BoxDecoration(color: Colors.yellow),
          child: Center(
              child: Text(
            "ບັນທຶກ",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: primaryColorBlack,
            ),
          )),
        ),
      ),
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              SizedBox(height: 10),
              Text("village"),
              SizedBox(height: 5),
              TextFormField(
                controller: village,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.home),
                  hintText: "ບ້ານ",
                  border: OutlineInputBorder(borderSide: BorderSide()),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "village is required";
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),
              Text("district"),
              SizedBox(height: 5),
              TextFormField(
                controller: district,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.apartment),
                  hintText: "ເມືອງ",
                  border: OutlineInputBorder(borderSide: BorderSide()),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "district is required";
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),
              Text("province"),
              SizedBox(height: 5),
              TextFormField(
                controller: province,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.map),
                  hintText: "ແຂວງ",
                  border: OutlineInputBorder(borderSide: BorderSide()),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "province is required";
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),
              Text("Map"),
              SizedBox(height: 5),
              userLocation == null
                  ? CircularProgressIndicator()
                  : Container(
                      height: 300,
                      width: double.infinity,
                      decoration: BoxDecoration(color: Colors.yellow),
                      child: GoogleMap(
                        initialCameraPosition: CameraPosition(
                          target:
                              LatLng(userLocation!.latitude!, userLocation!.longitude!),
                          zoom: 14,
                        ),
                        markers: myMarKer(),
                        myLocationEnabled: true,
                        myLocationButtonEnabled: true,
                      ),
                    ),
            ]),
          ),
        ),
      ),
    );
  }
}
