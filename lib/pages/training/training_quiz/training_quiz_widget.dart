import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/components/custom_appbar_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
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
  State<TrainingQuizWidget> createState() => _TrainingQuizWidgetState();
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
    context.watch<FFAppState>();

    return FutureBuilder<ApiCallResponse>(
      future: FFAppState().getQuizList(
        uniqueQueryKey: currentUserUid,
        requestFn: () => BaseUrlGroup.getQuizzesCall.call(
          userID: currentUserUid,
        ),
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: const Color(0xFFFFF80D),
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            ),
          );
        }
        final trainingQuizGetQuizzesResponse = snapshot.data!;
        return GestureDetector(
          onTap: () => _model.unfocusNode.canRequestFocus
              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
              : FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: const Color(0xFFFFF80D),
            body: SafeArea(
              top: true,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      wrapWithModel(
                        model: _model.customAppbarModel,
                        updateCallback: () => setState(() {}),
                        child: CustomAppbarWidget(
                          parameter1: getJsonField(
                            widget.chapters?[widget.index!],
                            r'''$.title''',
                          ).toString(),
                          backgroundColor: const Color(0xFFFFF80D),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            0.0, 20.0, 0.0, 20.0),
                        child: Container(
                          width: double.infinity,
                          decoration: const BoxDecoration(),
                          child: Text(
                            'Now! It Is Time To Take A Quiz',
                            textAlign: TextAlign.center,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'SF Pro Display Bold',
                                  fontSize: 27.0,
                                  fontWeight: FontWeight.bold,
                                  useGoogleFonts: false,
                                ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            0.0, 100.0, 0.0, 0.0),
                        child: Container(
                          decoration: const BoxDecoration(),
                          child: Lottie.network(
                            'https://lottie.host/dbb50da6-01a6-436c-b231-a0fc40bb498a/zdYaoETZ0l.json',
                            width: 400.0,
                            height: 200.0,
                            fit: BoxFit.cover,
                            repeat: false,
                            animate: true,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (false)
                          FFButtonWidget(
                            onPressed: () async {
                              if (widget.chapters?.length ==
                                  functions.getIndex(widget.index!)) {
                                context.goNamed('training_list');

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
                        FutureBuilder<ApiCallResponse>(
                          future: BaseUrlGroup.getTrainingByIdCall.call(
                            trainingId: widget.trainingId,
                            userId: currentUserUid,
                          ),
                          builder: (context, snapshot) {
                            // Customize what your widget looks like when it's loading.
                            if (!snapshot.hasData) {
                              return Center(
                                child: SizedBox(
                                  width: 50.0,
                                  height: 50.0,
                                  child: CircularProgressIndicator(
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                      FlutterFlowTheme.of(context).primary,
                                    ),
                                  ),
                                ),
                              );
                            }
                            final buttonGetTrainingByIdResponse =
                                snapshot.data!;
                            return FFButtonWidget(
                              onPressed: () async {
                                FFAppState().trainingAfterQuiz =
                                    BaseUrlGroup.getTrainingByIdCall.data(
                                  buttonGetTrainingByIdResponse.jsonBody,
                                );

                                context.pushNamed(
                                  'quiz_details',
                                  queryParameters: {
                                    'quiz': serializeParam(
                                      getJsonField(
                                        widget.chapters?[widget.index!],
                                        r'''$.quiz''',
                                      ),
                                      ParamType.JSON,
                                    ),
                                    'allQuiz': serializeParam(
                                      BaseUrlGroup.getQuizzesCall.quizData(
                                        trainingQuizGetQuizzesResponse.jsonBody,
                                      ),
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
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
