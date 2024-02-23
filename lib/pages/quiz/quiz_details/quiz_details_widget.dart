import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/components/custom_appbar_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'quiz_details_model.dart';
export 'quiz_details_model.dart';

class QuizDetailsWidget extends StatefulWidget {
  const QuizDetailsWidget({
    super.key,
    required this.quiz,
    this.allQuiz,
  });

  final dynamic quiz;
  final List<dynamic>? allQuiz;

  @override
  State<QuizDetailsWidget> createState() => _QuizDetailsWidgetState();
}

class _QuizDetailsWidgetState extends State<QuizDetailsWidget> {
  late QuizDetailsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => QuizDetailsModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        FFAppState().quizID = '';
        FFAppState().minAnsToPass = 0;
      });
    });
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
            padding: const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: double.infinity,
                          decoration: const BoxDecoration(),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              wrapWithModel(
                                model: _model.customAppbarModel,
                                updateCallback: () => setState(() {}),
                                child: CustomAppbarWidget(
                                  parameter1: getJsonField(
                                    widget.quiz,
                                    r'''$.title''',
                                  ).toString(),
                                ),
                              ),
                              Align(
                                alignment: const AlignmentDirectional(0.0, 0.0),
                                child: Text(
                                  '${getJsonField(
                                    widget.quiz,
                                    r'''$.progress''',
                                  ).toString()}% Completed',
                                  textAlign: TextAlign.center,
                                  style: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                        fontFamily: 'SF Pro Display',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        useGoogleFonts: false,
                                      ),
                                ),
                              ),
                              Align(
                                alignment: const AlignmentDirectional(0.0, 0.0),
                                child: LinearPercentIndicator(
                                  percent:
                                      functions.calculateProgress(getJsonField(
                                    widget.quiz,
                                    r'''$.progress''',
                                  )),
                                  lineHeight: 9.0,
                                  animation: true,
                                  animateFromLastPercent: true,
                                  progressColor:
                                      FlutterFlowTheme.of(context).quizColor,
                                  backgroundColor: const Color(0xFFF5F5F5),
                                  barRadius: const Radius.circular(20.0),
                                  padding: EdgeInsets.zero,
                                ),
                              ),
                              Stack(
                                children: [
                                  if (getJsonField(
                                        widget.quiz,
                                        r'''$.cover''',
                                      ) ==
                                      getJsonField(
                                        FFAppState().quizStatus,
                                        r'''$.null''',
                                      ))
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(14.0),
                                      child: SvgPicture.asset(
                                        'assets/images/quiz.9760d3c2.svg',
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                1.0,
                                        height: 199.0,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  if (getJsonField(
                                        widget.quiz,
                                        r'''$.cover''',
                                      ) !=
                                      getJsonField(
                                        FFAppState().quizStatus,
                                        r'''$.null''',
                                      ))
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(14.0),
                                      child: Image.network(
                                        '${FFAppState().IMAGEURL}${getJsonField(
                                          widget.quiz,
                                          r'''$.cover''',
                                        ).toString()}',
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                1.0,
                                        height: 199.0,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                ],
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
                                    height: 34.0,
                                    decoration: BoxDecoration(
                                      color: const Color(0xFFF5F5F5),
                                      borderRadius: BorderRadius.circular(61.0),
                                      border: Border.all(
                                        color: const Color(0xFFF5F5F5),
                                      ),
                                    ),
                                    alignment: const AlignmentDirectional(0.0, 0.0),
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          10.0, 0.0, 10.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Icon(
                                            Icons.access_time_sharp,
                                            color: Colors.black,
                                            size: 18.0,
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    4.0, 2.0, 0.0, 0.0),
                                            child: AutoSizeText(
                                              getJsonField(
                                                widget.quiz,
                                                r'''$.duration''',
                                              ).toString(),
                                              style: const TextStyle(
                                                fontFamily: 'SF Pro Display',
                                                color: Colors.black,
                                                fontWeight: FontWeight.normal,
                                                fontSize: 10.0,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: 34.0,
                                    decoration: BoxDecoration(
                                      color: const Color(0xFFF5F5F5),
                                      borderRadius: BorderRadius.circular(61.0),
                                      border: Border.all(
                                        color: const Color(0xFFF5F5F5),
                                      ),
                                    ),
                                    alignment: const AlignmentDirectional(0.0, 0.0),
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          10.0, 0.0, 10.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    4.0, 2.0, 0.0, 0.0),
                                            child: AutoSizeText(
                                              '${getJsonField(
                                                widget.quiz,
                                                r'''$.number_xp''',
                                              ).toString()} Xp',
                                              style: const TextStyle(
                                                fontFamily: 'SF Pro Display',
                                                color: Colors.black,
                                                fontWeight: FontWeight.normal,
                                                fontSize: 10.0,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: 34.0,
                                    decoration: BoxDecoration(
                                      color: const Color(0xFFF5F5F5),
                                      borderRadius: BorderRadius.circular(61.0),
                                      border: Border.all(
                                        color: const Color(0xFFF5F5F5),
                                      ),
                                    ),
                                    alignment: const AlignmentDirectional(0.0, 0.0),
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          10.0, 0.0, 10.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          const Icon(
                                            FFIcons.kenergyIcone01,
                                            color: Colors.black,
                                            size: 18.0,
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    4.0, 2.0, 0.0, 0.0),
                                            child: Text(
                                              getJsonField(
                                                widget.quiz,
                                                r'''$.label_level''',
                                              ).toString(),
                                              style: const TextStyle(
                                                fontFamily: 'SF Pro Display',
                                                color: Colors.black,
                                                fontWeight: FontWeight.normal,
                                                fontSize: 10.0,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                child: Text(
                                  '${getJsonField(
                                    widget.quiz,
                                    r'''$.nbr_correct_answer_to_pass''',
                                  ).toString()}  correct responses required to succeed',
                                  style: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                        fontFamily: 'SF Pro Display',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        useGoogleFonts: false,
                                      ),
                                ),
                              ),
                              Container(
                                width: double.infinity,
                                decoration: const BoxDecoration(),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 70.0),
                                  child: SingleChildScrollView(
                                    primary: false,
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Html(
                                          data: getJsonField(
                                            widget.quiz,
                                            r'''$.description''',
                                          ).toString(),
                                          onLinkTap: (url, _, __, ___) =>
                                              launchURL(url!),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ].divide(const SizedBox(height: 20.0)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      if (getJsonField(
                            widget.quiz,
                            r'''$.status''',
                          ) ==
                          getJsonField(
                            FFAppState().quizStatus,
                            r'''$.publish''',
                          ))
                        FFButtonWidget(
                          onPressed: () async {
                            if (getJsonField(
                                  widget.quiz,
                                  r'''$.priorQuiz''',
                                ) ==
                                null) {
                              if (functions.isQuizHaveQuestions(getJsonField(
                                widget.quiz,
                                r'''$.questions''',
                                true,
                              )!)) {
                                setState(() {
                                  FFAppState().quizInitTimer =
                                      getCurrentTimestamp;
                                  FFAppState().quizID = getJsonField(
                                    widget.quiz,
                                    r'''$.id''',
                                  ).toString();
                                  FFAppState().NbOfQuestionsToAns =
                                      getJsonField(
                                    widget.quiz,
                                    r'''$.number_question''',
                                  );
                                });
                                await BaseUrlGroup.startQuizCall.call(
                                  quizId: getJsonField(
                                    widget.quiz,
                                    r'''$.id''',
                                  ).toString(),
                                  userId: currentUserUid,
                                );

                                context.pushNamed(
                                  'quiz_mcq',
                                  queryParameters: {
                                    'questions': serializeParam(
                                      getJsonField(
                                        widget.quiz,
                                        r'''$.questions''',
                                        true,
                                      ),
                                      ParamType.JSON,
                                      true,
                                    ),
                                    'index': serializeParam(
                                      0,
                                      ParamType.int,
                                    ),
                                    'quizId': serializeParam(
                                      getJsonField(
                                        widget.quiz,
                                        r'''$.id''',
                                      ).toString(),
                                      ParamType.String,
                                    ),
                                    'isCompleted': serializeParam(
                                      functions.getProgressSuccess(getJsonField(
                                        widget.quiz,
                                        r'''$.progress''',
                                      )),
                                      ParamType.bool,
                                    ),
                                  }.withoutNulls,
                                );
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      'Oops! no question exist.',
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
                              }
                            } else {
                              if (functions.isPriorTrainingCompleted(
                                  widget.allQuiz!.toList(),
                                  getJsonField(
                                    widget.quiz,
                                    r'''$.priorQuiz''',
                                  ))) {
                                setState(() {
                                  FFAppState().quizInitTimer =
                                      getCurrentTimestamp;
                                  FFAppState().NbOfQuestionsToAns =
                                      getJsonField(
                                    widget.quiz,
                                    r'''$.number_question''',
                                  );
                                });
                                await BaseUrlGroup.startQuizCall.call(
                                  quizId: getJsonField(
                                    widget.quiz,
                                    r'''$.id''',
                                  ).toString(),
                                  userId: currentUserUid,
                                );

                                context.pushNamed(
                                  'quiz_mcq',
                                  queryParameters: {
                                    'questions': serializeParam(
                                      getJsonField(
                                        widget.quiz,
                                        r'''$.questions''',
                                        true,
                                      ),
                                      ParamType.JSON,
                                      true,
                                    ),
                                    'index': serializeParam(
                                      functions.getIndex(-1),
                                      ParamType.int,
                                    ),
                                    'quizId': serializeParam(
                                      getJsonField(
                                        widget.quiz,
                                        r'''$.id''',
                                      ).toString(),
                                      ParamType.String,
                                    ),
                                    'isCompleted': serializeParam(
                                      functions.getProgressSuccess(getJsonField(
                                        widget.quiz,
                                        r'''$.progress''',
                                      )),
                                      ParamType.bool,
                                    ),
                                  }.withoutNulls,
                                );
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      'Please Complete ${getJsonField(
                                        widget.quiz,
                                        r'''$.priorQuiz.title''',
                                      ).toString()}',
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
                              }
                            }
                          },
                          text: 'Let’s Go',
                          options: FFButtonOptions(
                            width: 342.0,
                            height: 50.0,
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: const Color(0xFF39B6FF),
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'SF Pro Display',
                                  color: Colors.white,
                                  fontSize: 14.0,
                                  useGoogleFonts: false,
                                ),
                            elevation: 3.0,
                            borderSide: const BorderSide(
                              color: Colors.transparent,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                        ),
                      if (getJsonField(
                            widget.quiz,
                            r'''$.status''',
                          ) ==
                          getJsonField(
                            FFAppState().quizStatus,
                            r'''$.pending''',
                          ))
                        Text(
                          'Not available yet.',
                          textAlign: TextAlign.center,
                          style: FlutterFlowTheme.of(context)
                              .titleMedium
                              .override(
                                fontFamily: 'SF Pro Display',
                                color: FlutterFlowTheme.of(context).primaryText,
                                useGoogleFonts: false,
                              ),
                        ),
                    ],
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
