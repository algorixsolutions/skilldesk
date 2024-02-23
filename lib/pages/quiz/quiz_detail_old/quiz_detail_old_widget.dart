import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'quiz_detail_old_model.dart';
export 'quiz_detail_old_model.dart';

class QuizDetailOldWidget extends StatefulWidget {
  const QuizDetailOldWidget({
    super.key,
    required this.quiz,
    this.allQuiz,
  });

  final dynamic quiz;
  final List<dynamic>? allQuiz;

  @override
  State<QuizDetailOldWidget> createState() => _QuizDetailOldWidgetState();
}

class _QuizDetailOldWidgetState extends State<QuizDetailOldWidget> {
  late QuizDetailOldModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => QuizDetailOldModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        FFAppState().trainingAfterQuiz = null;
        FFAppState().quizID = '';
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
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: InkWell(
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () async {
              setState(() {
                FFAppState().minAnsToPass = 0;
              });
            },
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: const AlignmentDirectional(-1.0, 0.0),
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(20.0, 9.93, 20.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            context.pushNamed('quiz_list_old');
                          },
                          child: Icon(
                            Icons.arrow_back_ios_rounded,
                            color: FlutterFlowTheme.of(context).primaryText,
                            size: 24.0,
                          ),
                        ),
                        Container(
                          width: 300.0,
                          decoration: const BoxDecoration(),
                          child: Text(
                            getJsonField(
                              widget.quiz,
                              r'''$.title''',
                            ).toString(),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'SF Pro Display',
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.w500,
                                  useGoogleFonts: false,
                                ),
                          ),
                        ),
                      ].divide(const SizedBox(width: 40.0)),
                    ),
                  ),
                ),
                Align(
                  alignment: const AlignmentDirectional(0.0, 0.0),
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                    child: Text(
                      '${getJsonField(
                        widget.quiz,
                        r'''$.progress''',
                      ).toString()}% Completed',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'SF Pro Display',
                            fontSize: 16.0,
                            useGoogleFonts: false,
                          ),
                    ),
                  ),
                ),
                Flexible(
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(70.0, 10.0, 70.0, 10.0),
                    child: LinearPercentIndicator(
                      key: const ValueKey('0.66'),
                      percent: functions.calculateProgress(getJsonField(
                        widget.quiz,
                        r'''$.progress''',
                      )),
                      width: 280.0,
                      lineHeight: 8.0,
                      animation: true,
                      animateFromLastPercent: true,
                      progressColor: FlutterFlowTheme.of(context).primary,
                      backgroundColor: const Color(0xFFBBBCBD),
                      barRadius: const Radius.circular(32.0),
                      padding: EdgeInsets.zero,
                    ),
                  ),
                ),
                Align(
                  alignment: const AlignmentDirectional(0.0, -1.0),
                  child: Stack(
                    children: [
                      if (getJsonField(
                            widget.quiz,
                            r'''$.cover''',
                          ) ==
                          getJsonField(
                            FFAppState().quizStatus,
                            r'''$.null''',
                          ))
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              23.0, 18.0, 24.0, 0.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(14.0),
                            child: SvgPicture.asset(
                              'assets/images/quiz.9760d3c2.svg',
                              width: 342.0,
                              height: 199.0,
                              fit: BoxFit.none,
                            ),
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
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              23.0, 18.0, 24.0, 0.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(14.0),
                            child: Image.network(
                              '${FFAppState().IMAGEURL}${getJsonField(
                                widget.quiz,
                                r'''$.cover''',
                              ).toString()}',
                              width: 342.0,
                              height: 199.0,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 21.0, 0.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      FFButtonWidget(
                        onPressed: () {
                          print('Button pressed ...');
                        },
                        text: getJsonField(
                          widget.quiz,
                          r'''$.duration''',
                        ).toString(),
                        icon: Icon(
                          Icons.timer_sharp,
                          color: FlutterFlowTheme.of(context).primaryText,
                          size: 14.0,
                        ),
                        options: FFButtonOptions(
                          height: 34.0,
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              19.0, 0.0, 23.0, 0.0),
                          iconPadding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: const Color(0xFFEBEBEB),
                          textStyle: FlutterFlowTheme.of(context)
                              .titleSmall
                              .override(
                                fontFamily: 'SF Pro Display',
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontSize: 13.0,
                                useGoogleFonts: false,
                              ),
                          borderSide: const BorderSide(
                            color: Colors.transparent,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(61.0),
                        ),
                      ),
                      FFButtonWidget(
                        onPressed: () {
                          print('Button pressed ...');
                        },
                        text: 'xp: ${getJsonField(
                          widget.quiz,
                          r'''$.number_xp''',
                        ).toString()}',
                        options: FFButtonOptions(
                          height: 34.0,
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              19.0, 0.0, 23.0, 0.0),
                          iconPadding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: const Color(0xFFEBEBEB),
                          textStyle: FlutterFlowTheme.of(context)
                              .titleSmall
                              .override(
                                fontFamily: 'SF Pro Display',
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontSize: 13.0,
                                useGoogleFonts: false,
                              ),
                          borderSide: const BorderSide(
                            color: Colors.transparent,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(61.0),
                        ),
                      ),
                      FFButtonWidget(
                        onPressed: () {
                          print('Button pressed ...');
                        },
                        text: getJsonField(
                          widget.quiz,
                          r'''$.label_level''',
                        ).toString(),
                        options: FFButtonOptions(
                          height: 34.0,
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              19.0, 0.0, 23.0, 0.0),
                          iconPadding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: const Color(0xFFEBEBEB),
                          textStyle: FlutterFlowTheme.of(context)
                              .titleSmall
                              .override(
                                fontFamily: 'SF Pro Display',
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontSize: 13.0,
                                useGoogleFonts: false,
                              ),
                          borderSide: const BorderSide(
                            color: Colors.transparent,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(61.0),
                        ),
                      ),
                    ].divide(const SizedBox(width: 7.0)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(17.0, 27.0, 0.0, 0.0),
                  child: Text(
                    '${getJsonField(
                      widget.quiz,
                      r'''$.nbr_correct_answer_to_pass''',
                    ).toString()}  correct responses required to succeed',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'SF Pro Display',
                          fontSize: 16.0,
                          useGoogleFonts: false,
                        ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(17.0, 17.0, 0.0, 0.0),
                  child: Html(
                    data: getJsonField(
                      widget.quiz,
                      r'''$.description''',
                    ).toString(),
                    onLinkTap: (url, _, __, ___) => launchURL(url!),
                  ),
                ),
                Align(
                  alignment: const AlignmentDirectional(0.0, 0.0),
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 50.0, 0.0, 0.0),
                    child: FFButtonWidget(
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
                              FFAppState().quizInitTimer = getCurrentTimestamp;
                              FFAppState().quizID = getJsonField(
                                widget.quiz,
                                r'''$.id''',
                              ).toString();
                            });
                            if (getJsonField(
                                  widget.quiz,
                                  r'''$.questions[0]["type"]''',
                                ) ==
                                getJsonField(
                                  FFAppState().quiztype,
                                  r'''$.mcq''',
                                )) {
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

                              return;
                            } else {
                              if (getJsonField(
                                    widget.quiz,
                                    r'''$.questions[0]["type"]''',
                                  ) ==
                                  getJsonField(
                                    FFAppState().quiztype,
                                    r'''$.error''',
                                  )) {
                                context.pushNamed(
                                  'quiz_finderror',
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

                                return;
                              } else {
                                if (getJsonField(
                                      widget.quiz,
                                      r'''$.questions[0]["type"]''',
                                    ) ==
                                    getJsonField(
                                      FFAppState().quiztype,
                                      r'''$.image''',
                                    )) {
                                  context.pushNamed(
                                    'quiz_image_answer',
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
                                        functions
                                            .getProgressSuccess(getJsonField(
                                          widget.quiz,
                                          r'''$.progress''',
                                        )),
                                        ParamType.bool,
                                      ),
                                    }.withoutNulls,
                                  );

                                  return;
                                } else {
                                  if (getJsonField(
                                        widget.quiz,
                                        r'''$.questions[0]["type"]''',
                                      ) ==
                                      getJsonField(
                                        FFAppState().quiztype,
                                        r'''$.tf''',
                                      )) {
                                    context.pushNamed(
                                      'quiz_truefalse',
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
                                          functions
                                              .getProgressSuccess(getJsonField(
                                            widget.quiz,
                                            r'''$.progress''',
                                          )),
                                          ParamType.bool,
                                        ),
                                      }.withoutNulls,
                                    );

                                    return;
                                  } else {
                                    return;
                                  }
                                }
                              }
                            }
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
                              FFAppState().quizInitTimer = getCurrentTimestamp;
                            });
                            if (getJsonField(
                                  widget.quiz,
                                  r'''$.questions[0]["type"]''',
                                ) ==
                                getJsonField(
                                  FFAppState().quiztype,
                                  r'''$.mcq''',
                                )) {
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

                              return;
                            } else {
                              if (getJsonField(
                                    widget.quiz,
                                    r'''$.questions[0]["type"]''',
                                  ) ==
                                  getJsonField(
                                    FFAppState().quiztype,
                                    r'''$.error''',
                                  )) {
                                context.pushNamed(
                                  'quiz_finderror',
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

                                return;
                              } else {
                                if (getJsonField(
                                      widget.quiz,
                                      r'''$.questions[0]["type"]''',
                                    ) ==
                                    getJsonField(
                                      FFAppState().quiztype,
                                      r'''$.image''',
                                    )) {
                                  context.pushNamed(
                                    'quiz_image_answer',
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
                                        functions
                                            .getProgressSuccess(getJsonField(
                                          widget.quiz,
                                          r'''$.progress''',
                                        )),
                                        ParamType.bool,
                                      ),
                                    }.withoutNulls,
                                  );

                                  return;
                                } else {
                                  if (getJsonField(
                                        widget.quiz,
                                        r'''$.questions[0]["type"]''',
                                      ) ==
                                      getJsonField(
                                        FFAppState().quiztype,
                                        r'''$.tf''',
                                      )) {
                                    context.pushNamed(
                                      'quiz_truefalse',
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
                                          functions
                                              .getProgressSuccess(getJsonField(
                                            widget.quiz,
                                            r'''$.progress''',
                                          )),
                                          ParamType.bool,
                                        ),
                                      }.withoutNulls,
                                    );

                                    return;
                                  } else {
                                    return;
                                  }
                                }
                              }
                            }
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
                            24.0, 0.0, 24.0, 0.0),
                        iconPadding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: const Color(0xFF39B6FF),
                        textStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
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
