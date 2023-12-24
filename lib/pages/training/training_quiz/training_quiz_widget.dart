import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'training_quiz_model.dart';
export 'training_quiz_model.dart';

class TrainingQuizWidget extends StatefulWidget {
  const TrainingQuizWidget({
    super.key,
    required this.chapters,
    required this.index,
    required this.trainingId,
  });

  final List<dynamic>? chapters;
  final int? index;
  final String? trainingId;

  @override
  _TrainingQuizWidgetState createState() => _TrainingQuizWidgetState();
}

class _TrainingQuizWidgetState extends State<TrainingQuizWidget> {
  late TrainingQuizModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TrainingQuizModel());
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
        backgroundColor: const Color(0xFFFFF80D),
        body: SafeArea(
          top: true,
          child: Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 9.93, 0.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          const Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                20.0, 0.0, 0.0, 0.0),
                            child: Icon(
                              Icons.chevron_left,
                              color: Color(0xFF130F26),
                              size: 24.0,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                48.5, 0.0, 0.0, 0.0),
                            child: Container(
                              width: 222.0,
                              height: 21.0,
                              decoration: const BoxDecoration(
                                color: Color(0xFFFFF80D),
                              ),
                              child: const Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Text(
                                  'Install Photoshop',
                                  style: TextStyle(
                                    fontFamily: 'SF Pro Display Bold',
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18.0,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          106.0, 30.89, 105.0, 0.0),
                      child: Text(
                        'Now! It Is Time To Take A Quiz',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontFamily: 'SF Pro Display Bold',
                          fontWeight: FontWeight.bold,
                          fontSize: 27.0,
                          height: 32.0,
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 289.0, 0.0),
                      child: Container(
                        width: 101.0,
                        height: 144.0,
                        decoration: const BoxDecoration(
                          color: Color(0xFFFFDA0D),
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(0.0),
                            bottomRight: Radius.circular(72.0),
                            topLeft: Radius.circular(0.0),
                            topRight: Radius.circular(72.0),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(24.0, 430.0, 0.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          FFButtonWidget(
                            onPressed: () async {
                              if (widget.chapters?.length ==
                                  functions.getIndex(widget.index!)) {
                                if (Navigator.of(context).canPop()) {
                                  context.pop();
                                }
                                context.pushNamed('training_list');

                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      'Hurrah! Training Completed',
                                      style: TextStyle(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                      ),
                                    ),
                                    duration: const Duration(milliseconds: 4000),
                                    backgroundColor:
                                        FlutterFlowTheme.of(context).secondary,
                                  ),
                                );
                                return;
                              } else {
                                context.pushNamed(
                                  'training_chapter_content',
                                  queryParameters: {
                                    'chapters': serializeParam(
                                      widget.chapters,
                                      ParamType.JSON,
                                      true,
                                    ),
                                    'trainingId': serializeParam(
                                      widget.trainingId,
                                      ParamType.String,
                                    ),
                                    'index': serializeParam(
                                      functions.getIndex(widget.index!),
                                      ParamType.int,
                                    ),
                                  }.withoutNulls,
                                );

                                return;
                              }
                            },
                            text: 'Skip',
                            options: FFButtonOptions(
                              width: 164.0,
                              height: 50.0,
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  24.0, 0.0, 24.0, 0.0),
                              iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: const Color(0xFFFFF80D),
                              textStyle: const TextStyle(
                                fontFamily: 'SF Pro Display Bold',
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 14.0,
                              ),
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).primaryText,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                14.0, 0.0, 0.0, 0.0),
                            child: FFButtonWidget(
                              onPressed: () async {
                                context.pushNamed(
                                  'quiz_detail',
                                  queryParameters: {
                                    'quiz': serializeParam(
                                      getJsonField(
                                        FFAppState().currchapter,
                                        r'''$.quiz''',
                                      ),
                                      ParamType.JSON,
                                    ),
                                    'allQuiz': serializeParam(
                                      widget.chapters,
                                      ParamType.JSON,
                                      true,
                                    ),
                                  }.withoutNulls,
                                );
                              },
                              text: 'Take a Quiz',
                              options: FFButtonOptions(
                                width: 164.0,
                                height: 50.0,
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    24.0, 0.0, 24.0, 0.0),
                                iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: const Color(0xFF39B6FF),
                                textStyle: const TextStyle(
                                  fontFamily: 'SF Pro Display Bold',
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14.0,
                                ),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(44.0, 549.8, 0.0, 0.0),
                      child: Container(
                        width: 74.83,
                        height: 74.83,
                        decoration: const BoxDecoration(
                          color: Color(0xFFFFDA0D),
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(
                          294.96, 530.93, 0.0, 0.0),
                      child: Container(
                        width: 95.04,
                        height: 162.3,
                        decoration: const BoxDecoration(
                          color: Color(0xFFFFDA0D),
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(25.0),
                            bottomRight: Radius.circular(0.0),
                            topLeft: Radius.circular(25.0),
                            topRight: Radius.circular(0.0),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsetsDirectional.fromSTEB(28.88, 279.65, 28.88, 0.0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: SvgPicture.asset(
                          'assets/images/Build_a_website.svg',
                          width: 332.24,
                          height: 171.37,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
