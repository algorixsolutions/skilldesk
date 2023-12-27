import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';

import 'quiz_failed_model.dart';

export 'quiz_failed_model.dart';

class QuizFailedWidget extends StatefulWidget {
  const QuizFailedWidget({

    super.key,
    required this.durations,
    required this.correctAnswers,
    required this.wrongAnswers,
  });

  final String? durations;
  final int? correctAnswers;
  final int? wrongAnswers;

  @override
  _QuizFailedWidgetState createState() => _QuizFailedWidgetState();
}

class _QuizFailedWidgetState extends State<QuizFailedWidget> {
  late QuizFailedModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => QuizFailedModel());
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
        backgroundColor: Colors.white,
        body: SafeArea(
          top: true,
          child: Padding(

            padding: const EdgeInsetsDirectional.fromSTEB(36.0, 0.0, 36.0, 0.0),

            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding:
                      const EdgeInsetsDirectional.fromSTEB(0.0, 122.82, 0.0, 0.0),

                  child: Container(
                    width: 318.0,
                    height: 291.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      borderRadius: BorderRadius.circular(23.0),
                      border: Border.all(

                        color: const Color(0xFFE6E6E6),

                        width: 1.0,
                      ),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(

                              0.0, 32.0, 0.0, 0.0),
                          child: Container(
                            width: 64.0,
                            height: 64.0,
                            decoration: const BoxDecoration(

                              shape: BoxShape.circle,
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: SvgPicture.asset(
                                'assets/images/Groupe_149.svg',
                                width: 300.0,
                                height: 200.0,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(

                              0.0, 34.77, 0.0, 0.0),
                          child: Container(
                            width: 218.0,
                            height: 50.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                            ),
                            child: const Text(
                              'The Quiz was successfully completed',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'SF Pro Display Bold',
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                                fontSize: 18.0,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(

                              0.0, 41.88, 0.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(

                                    35.33, 0.0, 0.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    ClipRRect(
                                      borderRadius:
                                          BorderRadius.circular(100.0),
                                      child: SvgPicture.asset(
                                        'assets/images/Groupe_141.svg',
                                        width: 21.91,
                                        height: 21.91,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          13.73, 0.0, 0.0, 0.0),
                                      child: Text(
                                        widget.durations!,
                                        style: const TextStyle(

                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    35.33, 0.0, 0.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    ClipRRect(
                                      borderRadius:
                                          BorderRadius.circular(100.0),
                                      child: SvgPicture.asset(
                                        'assets/images/Frame_92.svg',
                                        width: 21.91,
                                        height: 21.91,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          13.73, 0.0, 0.0, 0.0),
                                      child: Text(
                                        widget.correctAnswers.toString(),
                                        style: const TextStyle(

                                          fontFamily: 'SF Pro Display Bold',
                                          color: Color(0xFF32DC2C),
                                          fontWeight: FontWeight.w500,
                                          fontSize: 12.0,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(

                                    35.33, 0.0, 0.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    ClipRRect(
                                      borderRadius:
                                          BorderRadius.circular(100.0),
                                      child: SvgPicture.asset(
                                        'assets/images/Groupe_142.svg',
                                        width: 21.91,
                                        height: 21.91,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          13.73, 0.0, 0.0, 0.0),
                                      child: Text(
                                        widget.wrongAnswers.toString(),
                                        style: const TextStyle(

                                          fontFamily: 'SF Pro Display Bold',
                                          color: Color(0xFFFF3636),
                                          fontWeight: FontWeight.w500,
                                          fontSize: 12.0,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 189.0, 0.0, 0.0),

                  child: FFButtonWidget(
                    onPressed: () async {
                      if (Navigator.of(context).canPop()) {
                        context.pop();
                      }
                      context.pushNamed('quiz_list');
                    },
                    text: 'Try again',
                    options: FFButtonOptions(
                      width: 342.0,
                      height: 50.0,
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                      iconPadding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: const Color(0xFF39B6FF),
                      textStyle: const TextStyle(
                        fontFamily: 'SF Pro Display Bold',
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
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
                Padding(

                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 0.0),

                  child: FFButtonWidget(
                    onPressed: () async {
                      if (FFAppState().trainingAfterQuiz != null
                          ? false
                          : true) {
                        context.pushNamed('quiz_list');
                      } else {
                        context.pushNamed(
                          'training_chapters',
                          queryParameters: {
                            'training': serializeParam(
                              FFAppState().trainingAfterQuiz,
                              ParamType.JSON,
                            ),
                          }.withoutNulls,
                        );
                      }
                    },
                    text: FFAppState().trainingAfterQuiz != null
                        ? 'Back To Chapter'

                        : 'Back To Quiz',
                    options: FFButtonOptions(
                      width: 342.0,
                      height: 50.0,
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                      iconPadding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: const Color(0xFF39B6FF),
                      textStyle: const TextStyle(
                        fontFamily: 'SF Pro Display Bold',
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
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
