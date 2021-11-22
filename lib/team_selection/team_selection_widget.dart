import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../credits/credits_widget.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TeamSelectionWidget extends StatefulWidget {
  TeamSelectionWidget({Key key}) : super(key: key);

  @override
  _TeamSelectionWidgetState createState() => _TeamSelectionWidgetState();
}

class _TeamSelectionWidgetState extends State<TeamSelectionWidget> {
  bool _loadingButton = false;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<GameSelectionRecord>>(
      stream: queryGameSelectionRecord(
        singleRecord: true,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(
            child: SizedBox(
              width: 50,
              height: 50,
              child: CircularProgressIndicator(
                color: FlutterFlowTheme.primaryColor,
              ),
            ),
          );
        }
        List<GameSelectionRecord> teamSelectionGameSelectionRecordList =
            snapshot.data;
        // Return an empty Container when the document does not exist.
        if (snapshot.data.isEmpty) {
          return Container();
        }
        final teamSelectionGameSelectionRecord =
            teamSelectionGameSelectionRecordList.isNotEmpty
                ? teamSelectionGameSelectionRecordList.first
                : null;
        return Scaffold(
          key: scaffoldKey,
          backgroundColor: Color(0xFF226518),
          drawer: Drawer(
            elevation: 16,
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 50, 0, 0),
              child: StreamBuilder<List<WalesSquadRecord>>(
                stream: queryWalesSquadRecord(),
                builder: (context, snapshot) {
                  // Customize what your widget looks like when it's loading.
                  if (!snapshot.hasData) {
                    return Center(
                      child: SizedBox(
                        width: 50,
                        height: 50,
                        child: CircularProgressIndicator(
                          color: FlutterFlowTheme.primaryColor,
                        ),
                      ),
                    );
                  }
                  List<WalesSquadRecord> columnWalesSquadRecordList =
                      snapshot.data;
                  return Column(
                    mainAxisSize: MainAxisSize.max,
                    children: List.generate(columnWalesSquadRecordList.length,
                        (columnIndex) {
                      final columnWalesSquadRecord =
                          columnWalesSquadRecordList[columnIndex];
                      return Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Container(
                                  width: 60,
                                  height: 60,
                                  clipBehavior: Clip.antiAlias,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                  ),
                                  child: Image.network(
                                    'https://picsum.photos/seed/985/600',
                                  ),
                                )
                              ],
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Text(
                                  'Hello World',
                                  style: FlutterFlowTheme.bodyText1,
                                )
                              ],
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                FlutterFlowIconButton(
                                  borderColor: Colors.transparent,
                                  borderRadius: 30,
                                  borderWidth: 1,
                                  buttonSize: 60,
                                  icon: Icon(
                                    Icons.add_box_outlined,
                                    color: Colors.black,
                                    size: 30,
                                  ),
                                  onPressed: () async {
                                    final gameSelectionCreateData =
                                        createGameSelectionRecordData(
                                      no1: columnWalesSquadRecord.playerName,
                                      no1Image:
                                          columnWalesSquadRecord.playerImage,
                                    );
                                    await GameSelectionRecord.collection
                                        .doc()
                                        .set(gameSelectionCreateData);
                                    if (scaffoldKey.currentState.isDrawerOpen ||
                                        scaffoldKey
                                            .currentState.isEndDrawerOpen) {
                                      Navigator.pop(context);
                                    }
                                  },
                                )
                              ],
                            )
                          ],
                        ),
                      );
                    }),
                  );
                },
              ),
            ),
          ),
          body: SafeArea(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            'No 1',
                            style: FlutterFlowTheme.subtitle2.override(
                              fontFamily: 'Poppins',
                              color: Color(0xFFFAF7F7),
                            ),
                          ),
                          InkWell(
                            onTap: () async {
                              scaffoldKey.currentState.openDrawer();
                            },
                            child: Container(
                              width: 80,
                              height: 80,
                              clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                              ),
                              child: Image.network(
                                teamSelectionGameSelectionRecord.no1Image,
                              ),
                            ),
                          ),
                          Text(
                            teamSelectionGameSelectionRecord.no1,
                            style: FlutterFlowTheme.bodyText1.override(
                              fontFamily: 'Poppins',
                              color: Color(0xFFFAF7F7),
                              fontSize: 12,
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            'No 2',
                            style: FlutterFlowTheme.subtitle2.override(
                              fontFamily: 'Poppins',
                              color: Color(0xFFFAF7F7),
                            ),
                          ),
                          InkWell(
                            onTap: () async {
                              scaffoldKey.currentState.openDrawer();
                            },
                            child: Container(
                              width: 80,
                              height: 80,
                              clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                              ),
                              child: Image.network(
                                teamSelectionGameSelectionRecord.no2Image,
                              ),
                            ),
                          ),
                          Text(
                            teamSelectionGameSelectionRecord.no2,
                            style: FlutterFlowTheme.bodyText1.override(
                              fontFamily: 'Poppins',
                              color: Color(0xFFFAF7F7),
                              fontSize: 12,
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            'No 3',
                            style: FlutterFlowTheme.subtitle2.override(
                              fontFamily: 'Poppins',
                              color: Color(0xFFFAF7F7),
                            ),
                          ),
                          InkWell(
                            onTap: () async {
                              scaffoldKey.currentState.openDrawer();
                            },
                            child: Container(
                              width: 80,
                              height: 80,
                              clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                              ),
                              child: Image.network(
                                'https://picsum.photos/seed/673/600',
                              ),
                            ),
                          ),
                          Text(
                            teamSelectionGameSelectionRecord.no3,
                            style: FlutterFlowTheme.bodyText1.override(
                              fontFamily: 'Poppins',
                              color: Color(0xFFFAF7F7),
                              fontSize: 12,
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 50, 0, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FFButtonWidget(
                        onPressed: () async {
                          setState(() => _loadingButton = true);
                          try {
                            await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CreditsWidget(),
                              ),
                            );
                          } finally {
                            setState(() => _loadingButton = false);
                          }
                        },
                        text: 'Button',
                        options: FFButtonOptions(
                          width: 130,
                          height: 40,
                          color: FlutterFlowTheme.primaryColor,
                          textStyle: FlutterFlowTheme.subtitle2.override(
                            fontFamily: 'Poppins',
                            color: Colors.white,
                          ),
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 1,
                          ),
                          borderRadius: 12,
                        ),
                        loading: _loadingButton,
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
