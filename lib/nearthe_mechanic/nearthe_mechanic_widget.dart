import '../add_mechanic/add_mechanic_widget.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_google_map.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../mechanic_details/mechanic_details_widget.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class NeartheMechanicWidget extends StatefulWidget {
  NeartheMechanicWidget({
    Key key,
    this.searchTerm,
  }) : super(key: key);

  final String searchTerm;

  @override
  _NeartheMechanicWidgetState createState() => _NeartheMechanicWidgetState();
}

class _NeartheMechanicWidgetState extends State<NeartheMechanicWidget> {
  LatLng currentUserLocationValue;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  LatLng googleMapsCenter;
  Completer<GoogleMapController> googleMapsController;

  @override
  void initState() {
    super.initState();
    getCurrentUserLocation(defaultLocation: LatLng(0.0, 0.0), cached: true)
        .then((loc) => setState(() => currentUserLocationValue = loc));
  }

  @override
  Widget build(BuildContext context) {
    if (currentUserLocationValue == null) {
      return Center(
        child: SizedBox(
          width: 50,
          height: 50,
          child: SpinKitCubeGrid(
            color: FlutterFlowTheme.primaryColor,
            size: 50,
          ),
        ),
      );
    }
    return FutureBuilder<List<CourtsRecord>>(
      future: CourtsRecord.search(
        term: '*',
        location: getCurrentUserLocation(
            defaultLocation: LatLng(37.4298229, -122.1735655)),
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(
            child: SizedBox(
              width: 50,
              height: 50,
              child: SpinKitCubeGrid(
                color: FlutterFlowTheme.primaryColor,
                size: 50,
              ),
            ),
          );
        }
        List<CourtsRecord> neartheMechanicCourtsRecordList = snapshot.data;
        return Scaffold(
          key: scaffoldKey,
          resizeToAvoidBottomInset: false,
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              print('FloatingActionButton pressed ...');
            },
            backgroundColor: FlutterFlowTheme.primaryColor,
            elevation: 8,
            child: FlutterFlowIconButton(
              borderColor: Colors.transparent,
              borderRadius: 30,
              buttonSize: 48,
              icon: Icon(
                Icons.add,
                color: Colors.white,
                size: 30,
              ),
              onPressed: () async {
                await Navigator.push(
                  context,
                  PageTransition(
                    type: PageTransitionType.bottomToTop,
                    duration: Duration(milliseconds: 250),
                    reverseDuration: Duration(milliseconds: 250),
                    child: AddMechanicWidget(),
                  ),
                );
              },
            ),
          ),
          body: Stack(
            children: [
              FlutterFlowGoogleMap(
                controller: googleMapsController,
                onCameraIdle: (latLng) => googleMapsCenter = latLng,
                initialLocation: googleMapsCenter ??=
                    functions.getInitialMapLocation(currentUserLocationValue),
                markers: (neartheMechanicCourtsRecordList ?? [])
                    .map(
                      (neartheMechanicCourtsRecord) => FlutterFlowMarker(
                        neartheMechanicCourtsRecord.reference.path,
                        neartheMechanicCourtsRecord.location,
                        () async {
                          await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MechanicDetailsWidget(
                                court: neartheMechanicCourtsRecord,
                              ),
                            ),
                          );
                        },
                      ),
                    )
                    .toList(),
                markerColor: GoogleMarkerColor.violet,
                mapType: MapType.normal,
                style: GoogleMapStyle.standard,
                initialZoom: 14,
                allowInteraction: true,
                allowZoom: true,
                showZoomControls: false,
                showLocation: true,
                showCompass: false,
                showMapToolbar: false,
                showTraffic: false,
                centerMapOnMarkerTap: true,
              ),
              Align(
                alignment: AlignmentDirectional(-1, -1),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 140,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [FlutterFlowTheme.white, Color(0x00FFFFFF)],
                      stops: [0, 1],
                      begin: AlignmentDirectional(0, -1),
                      end: AlignmentDirectional(0, 1),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(-0.75, -0.92),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 8),
                  child: Text(
                    'ค้นหาช่างใกล้ตัว',
                    style: FlutterFlowTheme.title3.override(
                      fontFamily: 'Overpass',
                    ),
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
