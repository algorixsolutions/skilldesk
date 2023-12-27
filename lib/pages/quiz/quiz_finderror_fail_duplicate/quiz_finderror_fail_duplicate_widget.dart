import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'quiz_finderror_fail_duplicate_model.dart';

export 'quiz_finderror_fail_duplicate_model.dart';

class QuizFinderrorFailDuplicateWidget extends StatefulWidget {
  const QuizFinderrorFailDuplicateWidget({super.key});


  @override
  _QuizFinderrorFailDuplicateWidgetState createState() =>
      _QuizFinderrorFailDuplicateWidgetState();
}

class _QuizFinderrorFailDuplicateWidgetState
    extends State<QuizFinderrorFailDuplicateWidget> {
  late QuizFinderrorFailDuplicateModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => QuizFinderrorFailDuplicateModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Align(
                  alignment: const AlignmentDirectional(-1.0, -1.0),
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(20.0, 0.82, 0.0, 0.0),

                    child: Container(
                      width: 135.0,
                      height: 50.0,
                      decoration: BoxDecoration(
                        color: const Color(0xFFDBEEF6),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(

                            11.0, 15.0, 0.0, 15.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(0.0),
                              child: Image.asset(
                                'assets/images/Groupe_134.png',
                                width: 19.0,
                                height: 20.0,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Padding(

                              padding: const EdgeInsetsDirectional.fromSTEB(

                                  8.0, 0.0, 16.0, 0.0),
                              child: Text(
                                'Save and exit',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'SF Pro Display Bold',

                                      color: const Color(0xFF39B6FF),

                                      fontWeight: FontWeight.w500,
                                      useGoogleFonts: false,
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsetsDirectional.fromSTEB(20.0, 16.0, 20.0, 0.0),

                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: SvgPicture.asset(
                      'assets/images/quiz.9760d3c2.svg',
                      width: 350.0,
                      height: 195.0,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsetsDirectional.fromSTEB(20.0, 23.0, 20.0, 0.0),

                  child: Container(
                    width: 350.0,
                    height: 105.0,
                    decoration: BoxDecoration(

                      color: const Color(0xFF00D1FF),

                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Padding(
                      padding:

                          const EdgeInsetsDirectional.fromSTEB(20.0, 7.0, 0.0, 0.0),

                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(

                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 6.0, 0.0),
                                child: Icon(
                                  Icons.error_outline_outlined,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  size: 15.0,
                                ),
                              ),
                              Align(
                                alignment: const AlignmentDirectional(-1.0, -1.0),

                                child: Text(
                                  'Find The Error',
                                  style:
                                      FlutterFlowTheme.of(context).bodyMedium,
                                ),
                              ),
                            ],
                          ),
                          Align(
                            alignment: const AlignmentDirectional(-1.0, -1.0),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 9.0, 0.0, 0.0),
                              child: Text(
                                'Is Adobe the company that made Photoshop ?',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'SF Pro Display Bold',
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                      fontSize: 21.0,
                                      fontWeight: FontWeight.w500,
                                      useGoogleFonts: false,
                                    ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(20.0, 9.0, 20.0, 0.0),

                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          context.pushNamed('quiz_finderror_fail');
                        },
                        child: Icon(
                          Icons.arrow_back_ios,
                          color: FlutterFlowTheme.of(context).primaryText,
                          size: 24.0,
                        ),
                      ),
                      Text(
                        'Question 5',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'SF Pro Display Bold',
                              fontWeight: FontWeight.bold,
                              useGoogleFonts: false,
                            ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(

                            122.0, 0.0, 0.0, 0.0),
                        child: Text(
                          'Questions',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'SF Pro Display Bold',
                                    fontWeight: FontWeight.bold,
                                    useGoogleFonts: false,
                                  ),
                        ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(

                                6.0, 0.0, 0.0, 0.0),
                            child: Container(
                              width: 39.0,
                              height: 21.0,
                              decoration: BoxDecoration(
                                color: const Color(0xFF39B6FF),
                                borderRadius: BorderRadius.circular(19.0),
                              ),
                              child: const Padding(

                                padding: EdgeInsetsDirectional.fromSTEB(
                                    13.0, 0.0, 0.0, 0.0),
                                child: Text(
                                  '6',
                                  style: TextStyle(
                                    fontFamily: 'SF Pro Display Bold',
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18.0,
                                  ),
                                ),
                              ),
                            ),
                          ),

                          const Padding(

                            padding: EdgeInsetsDirectional.fromSTEB(
                                5.0, 0.0, 0.0, 0.0),
                            child: Text(
                              '/18',
                              style: TextStyle(
                                fontFamily: 'SF Pro Display Bold',
                                fontWeight: FontWeight.bold,
                                fontSize: 14.0,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(

                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 6.0, 0.0, 0.0),

                  child: Stack(
                    children: [
                      Container(
                        width: double.infinity,
                        height: 4.0,
                        decoration: const BoxDecoration(

                          color: Color(0xFFDCDCDC),
                        ),
                      ),
                      Container(
                        width: 106.0,
                        height: 4.0,
                        decoration: const BoxDecoration(

                          color: Color(0xFF00D1FF),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:

                      const EdgeInsetsDirectional.fromSTEB(20.0, 10.0, 20.0, 0.0),

                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Number of correct answers: 1',
                        style: FlutterFlowTheme.of(context).bodyMedium,
                      ),
                      Flexible(
                        child: Align(

                          alignment: const AlignmentDirectional(1.0, 0.0),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(

                                0.0, 0.0, 6.0, 0.0),
                            child: Icon(
                              Icons.timer_sharp,
                              color: FlutterFlowTheme.of(context).primaryText,
                              size: 14.0,
                            ),
                          ),
                        ),
                      ),
                      Text(
                        '2:34',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'SF Pro Display Bold',
                              fontWeight: FontWeight.bold,
                              useGoogleFonts: false,
                            ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:

                      const EdgeInsetsDirectional.fromSTEB(19.0, 16.0, 19.0, 0.0),

                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        width: 352.0,
                        height: 56.0,
                        decoration: BoxDecoration(

                          color: const Color(0xFFFFEEEE),
                          borderRadius: BorderRadius.circular(16.0),
                          border: Border.all(
                            color: const Color(0xFFFF3636),

                            width: 2.0,
                          ),
                        ),
                        child: Padding(

                          padding: const EdgeInsetsDirectional.fromSTEB(

                              10.0, 0.0, 10.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(0.0),
                                child: Image.asset(
                                  'assets/images/image_59@2x.png',
                                  width: 36.0,
                                  height: 36.0,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Padding(

                                padding: const EdgeInsetsDirectional.fromSTEB(

                                    10.0, 0.0, 0.0, 0.0),
                                child: Text(
                                  'Facebook',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'SF Pro Display Bold',
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.w500,
                                        useGoogleFonts: false,
                                      ),
                                ),
                              ),
                              Flexible(
                                child: Align(

                                  alignment: const AlignmentDirectional(1.0, 0.0),

                                  child: FFButtonWidget(
                                    onPressed: () {
                                      print('Button pressed ...');
                                    },
                                    text: '',

                                    icon: const Icon(

                                      Icons.close_rounded,
                                      color: Color(0xFFFF3636),
                                      size: 26.0,
                                    ),
                                    options: FFButtonOptions(
                                      width: 38.0,
                                      height: 38.0,
                                      padding: const EdgeInsets.all(0.0),
                                      iconPadding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              5.0, 0.0, 0.0, 0.0),
                                      color: const Color(0xFFF9A1A1),

                                      textStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            color: Colors.white,
                                          ),
                                      elevation: 3.0,

                                      borderSide: BorderSide(
                                        color: Colors.transparent,
                                        width: 1.0,
                                      ),
                                      borderRadius:
                                          BorderRadius.circular(100.0),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: 352.0,
                        height: 56.0,
                        decoration: BoxDecoration(
                          color: const Color(0xFFFFEEEE),
                          borderRadius: BorderRadius.circular(16.0),
                          border: Border.all(
                            color: const Color(0xFFFF3636),
                            width: 2.0,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(

                              10.0, 0.0, 10.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(0.0),
                                child: Image.asset(
                                  'assets/images/image_58@2x.png',
                                  width: 36.0,
                                  height: 36.0,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(

                                    10.0, 0.0, 0.0, 0.0),
                                child: Text(
                                  'Microsoft',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'SF Pro Display Bold',
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.w500,
                                        useGoogleFonts: false,
                                      ),
                                ),
                              ),
                              Flexible(
                                child: Align(
                                  alignment: const AlignmentDirectional(1.0, 0.0),

                                  child: FFButtonWidget(
                                    onPressed: () {
                                      print('Button pressed ...');
                                    },
                                    text: '',
                                    icon: const Icon(

                                      Icons.close_rounded,
                                      color: Color(0xFFFF3636),
                                      size: 26.0,
                                    ),
                                    options: FFButtonOptions(
                                      width: 38.0,
                                      height: 38.0,
                                      padding: const EdgeInsets.all(0.0),
                                      iconPadding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              5.0, 0.0, 0.0, 0.0),
                                      color: const Color(0xFFF9A1A1),

                                      textStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            color: Colors.white,
                                          ),
                                      elevation: 3.0,

                                      borderSide: const BorderSide(

                                        color: Colors.transparent,
                                        width: 1.0,
                                      ),
                                      borderRadius:
                                          BorderRadius.circular(100.0),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: 352.0,
                        height: 56.0,
                        decoration: BoxDecoration(

                          color: const Color(0xFFE7FFEE),
                          borderRadius: BorderRadius.circular(16.0),
                          border: Border.all(
                            color: const Color(0xFF32DC2C),
                            width: 2.0,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(

                              10.0, 0.0, 10.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(0.0),
                                child: Image.asset(
                                  'assets/images/image_57@2x.png',
                                  width: 36.0,
                                  height: 36.0,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(

                                    10.0, 0.0, 0.0, 0.0),
                                child: Text(
                                  'Figma',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'SF Pro Display Bold',
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.w500,
                                        useGoogleFonts: false,
                                      ),
                                ),
                              ),
                              Flexible(
                                child: Align(
                                  alignment: const AlignmentDirectional(1.0, 0.0),

                                  child: FFButtonWidget(
                                    onPressed: () {
                                      print('Button pressed ...');
                                    },
                                    text: '',
                                    icon: const Icon(

                                      Icons.done_outline_rounded,
                                      color: Color(0xFF32DC2C),
                                      size: 26.0,
                                    ),
                                    options: FFButtonOptions(
                                      width: 38.0,
                                      height: 38.0,
                                      padding: const EdgeInsets.all(0.0),
                                      iconPadding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              5.0, 0.0, 0.0, 0.0),
                                      color: const Color(0xFFDBEEF6),

                                      textStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            color: Colors.white,
                                          ),
                                      elevation: 3.0,

                                      borderSide: const BorderSide(

                                        color: Colors.transparent,
                                        width: 1.0,
                                      ),
                                      borderRadius:
                                          BorderRadius.circular(100.0),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: 352.0,
                        height: 56.0,
                        decoration: BoxDecoration(
                          color: const Color(0xFFFFEEEE),
                          borderRadius: BorderRadius.circular(16.0),
                          border: Border.all(
                            color: const Color(0xFFFF3636),

                            width: 2.0,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(

                              10.0, 0.0, 10.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(0.0),
                                child: Image.asset(
                                  'assets/images/image_56@2x.png',
                                  width: 36.0,
                                  height: 36.0,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(

                                    10.0, 0.0, 0.0, 0.0),
                                child: Text(
                                  'Adobe',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'SF Pro Display Bold',
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.w500,
                                        useGoogleFonts: false,
                                      ),
                                ),
                              ),
                              Flexible(
                                child: Align(
                                  alignment: const AlignmentDirectional(1.0, 0.0),

                                  child: FFButtonWidget(
                                    onPressed: () {
                                      print('Button pressed ...');
                                    },
                                    text: '',
                                    icon: const Icon(

                                      Icons.close_rounded,
                                      color: Color(0xFFFF3636),
                                      size: 26.0,
                                    ),
                                    options: FFButtonOptions(
                                      width: 38.0,
                                      height: 38.0,
                                      padding: const EdgeInsets.all(0.0),
                                      iconPadding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              5.0, 0.0, 0.0, 0.0),
                                      color: const Color(0xFFF9A1A1),
                                      textStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            color: Colors.white,
                                          ),
                                      elevation: 3.0,
                                      borderSide: const BorderSide(

                                        color: Colors.transparent,
                                        width: 1.0,
                                      ),
                                      borderRadius:
                                          BorderRadius.circular(100.0),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ].divide(const SizedBox(height: 13.0)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),

                  child: FFButtonWidget(
                    onPressed: () {
                      print('Button pressed ...');
                    },
                    text: 'Click here for explanation',
                    options: FFButtonOptions(
                      width: 244.0,
                      height: 50.0,
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                      iconPadding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: const Color(0xFFFFCB00),

                      textStyle:
                          FlutterFlowTheme.of(context).titleSmall.override(
                                fontFamily: 'Readex Pro',
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontSize: 14.0,
                              ),
                      borderSide: const BorderSide(

                        color: Colors.transparent,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 26.0, 0.0, 27.0),

                  child: FFButtonWidget(
                    onPressed: () {
                      print('Button pressed ...');
                    },
                    text: 'Answer',
                    options: FFButtonOptions(
                      width: 350.0,
                      height: 50.0,
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                      iconPadding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: const Color(0xFF00D1FF),

                      textStyle:
                          FlutterFlowTheme.of(context).titleSmall.override(
                                fontFamily: 'Readex Pro',
                                color: Colors.white,
                                fontSize: 14.0,
                              ),
                      elevation: 3.0,
                      borderSide: const BorderSide(

                        color: Colors.transparent,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
