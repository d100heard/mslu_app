import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ThankyouWidget extends StatefulWidget {
  ThankyouWidget({Key key}) : super(key: key);

  @override
  _ThankyouWidgetState createState() => _ThankyouWidgetState();
}

class _ThankyouWidgetState extends State<ThankyouWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xFFF5F5F5),
    );
  }
}
