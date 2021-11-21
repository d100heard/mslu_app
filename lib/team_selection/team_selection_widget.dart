import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TeamSelectionWidget extends StatefulWidget {
  TeamSelectionWidget({Key key}) : super(key: key);

  @override
  _TeamSelectionWidgetState createState() => _TeamSelectionWidgetState();
}

class _TeamSelectionWidgetState extends State<TeamSelectionWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
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
              List<WalesSquadRecord> columnWalesSquadRecordList = snapshot.data;
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
                            StreamBuilder<List<WalesSquadRecord>>(
                              stream: queryWalesSquadRecord(
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
                                List<WalesSquadRecord>
                                    circleImageWalesSquadRecordList =
                                    snapshot.data;
                                // Return an empty Container when the document does not exist.
                                if (snapshot.data.isEmpty) {
                                  return Container();
                                }
                                final circleImageWalesSquadRecord =
                                    circleImageWalesSquadRecordList.isNotEmpty
                                        ? circleImageWalesSquadRecordList.first
                                        : null;
                                return Container(
                                  width: 60,
                                  height: 60,
                                  clipBehavior: Clip.antiAlias,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                  ),
                                  child: Image.network(
                                    circleImageWalesSquadRecord.playerImage,
                                  ),
                                );
                              },
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
                                final no1CreateData = createNo1RecordData();
                                await No1Record.collection
                                    .doc()
                                    .set(no1CreateData);
                                if (scaffoldKey.currentState.isDrawerOpen ||
                                    scaffoldKey.currentState.isEndDrawerOpen) {
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
                StreamBuilder<List<No1Record>>(
                  stream: queryNo1Record(
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
                    List<No1Record> columnNo1RecordList = snapshot.data;
                    // Return an empty Container when the document does not exist.
                    if (snapshot.data.isEmpty) {
                      return Container();
                    }
                    final columnNo1Record = columnNo1RecordList.isNotEmpty
                        ? columnNo1RecordList.first
                        : null;
                    return Column(
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
                            if (columnNo1Record != null) {
                              scaffoldKey.currentState.openDrawer();
                            }
                          },
                          child: Container(
                            width: 80,
                            height: 80,
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                            child: Image.network(
                              'https://picsum.photos/seed/904/600',
                            ),
                          ),
                        ),
                        Text(
                          '',
                          style: FlutterFlowTheme.bodyText1.override(
                            fontFamily: 'Poppins',
                            color: Color(0xFFFAF7F7),
                            fontSize: 12,
                          ),
                        )
                      ],
                    );
                  },
                ),
                StreamBuilder<List<No2Record>>(
                  stream: queryNo2Record(
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
                    List<No2Record> columnNo2RecordList = snapshot.data;
                    // Return an empty Container when the document does not exist.
                    if (snapshot.data.isEmpty) {
                      return Container();
                    }
                    final columnNo2Record = columnNo2RecordList.isNotEmpty
                        ? columnNo2RecordList.first
                        : null;
                    return Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          'No 2',
                          style: FlutterFlowTheme.subtitle2.override(
                            fontFamily: 'Poppins',
                            color: Color(0xFFFAF7F7),
                          ),
                        ),
                        Container(
                          width: 80,
                          height: 80,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: Image.network(
                            'https://picsum.photos/seed/419/600',
                          ),
                        ),
                        Text(
                          '',
                          style: FlutterFlowTheme.bodyText1.override(
                            fontFamily: 'Poppins',
                            color: Color(0xFFFAF7F7),
                            fontSize: 12,
                          ),
                        )
                      ],
                    );
                  },
                ),
                StreamBuilder<List<No3Record>>(
                  stream: queryNo3Record(
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
                    List<No3Record> columnNo3RecordList = snapshot.data;
                    // Return an empty Container when the document does not exist.
                    if (snapshot.data.isEmpty) {
                      return Container();
                    }
                    final columnNo3Record = columnNo3RecordList.isNotEmpty
                        ? columnNo3RecordList.first
                        : null;
                    return Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          'No 3',
                          style: FlutterFlowTheme.subtitle2.override(
                            fontFamily: 'Poppins',
                            color: Color(0xFFFAF7F7),
                          ),
                        ),
                        Container(
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
                        Text(
                          '',
                          style: FlutterFlowTheme.bodyText1.override(
                            fontFamily: 'Poppins',
                            color: Color(0xFFFAF7F7),
                            fontSize: 12,
                          ),
                        )
                      ],
                    );
                  },
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
