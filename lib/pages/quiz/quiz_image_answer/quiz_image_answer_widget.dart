import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_audio_player.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'quiz_image_answer_model.dart';
export 'quiz_image_answer_model.dart';

class QuizImageAnswerWidget extends StatefulWidget {
  const QuizImageAnswerWidget({
    Key? key,
    required this.questions,
    required this.index,
    required this.quizId,
    required this.isCompleted,
  }) : super(key: key);

  final List<dynamic>? questions;
  final int? index;
  final String? quizId;
  final bool? isCompleted;

  @override
  _QuizImageAnswerWidgetState createState() => _QuizImageAnswerWidgetState();
}

class _QuizImageAnswerWidgetState extends State<QuizImageAnswerWidget> {
  late QuizImageAnswerModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => QuizImageAnswerModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        FFAppState().currQuestion = widget.questions![widget.index!];
        FFAppState().selectedAns = [];
        FFAppState().isExplain = false;
        FFAppState().showAnswer = false;
        FFAppState().startingTime = getCurrentTimestamp;
        FFAppState().isTimerEnd = false;
      });
      if (widget.isCompleted!) {
        _model.timerController.onResetTimer();

        _model.timerController.onStartTimer();
        return;
      } else {
        if (functions.isCurrQuestionCompleted(FFAppState().currQuestion)) {
          if (getJsonField(
                widget.questions?[functions.getIndex(widget.index!)],
                r'''$.type''',
              ) ==
              getJsonField(
                FFAppState().quiztype,
                r'''$.mcq''',
              )) {
            if (Navigator.of(context).canPop()) {
              context.pop();
            }
            context.pushNamed(
              'quiz_mcq',
              queryParameters: {
                'questions': serializeParam(
                  widget.questions,
                  ParamType.JSON,
                  true,
                ),
                'index': serializeParam(
                  functions.getIndex(widget.index!),
                  ParamType.int,
                ),
                'quizId': serializeParam(
                  widget.quizId,
                  ParamType.String,
                ),
                'isCompleted': serializeParam(
                  widget.isCompleted,
                  ParamType.bool,
                ),
              }.withoutNulls,
            );

            return;
          } else {
            if (getJsonField(
                  widget.questions?[functions.getIndex(widget.index!)],
                  r'''$.type''',
                ) ==
                getJsonField(
                  FFAppState().quiztype,
                  r'''$.tf''',
                )) {
              context.pushNamed(
                'quiz_truefalse',
                queryParameters: {
                  'questions': serializeParam(
                    widget.questions,
                    ParamType.JSON,
                    true,
                  ),
                  'index': serializeParam(
                    functions.getIndex(widget.index!),
                    ParamType.int,
                  ),
                  'quizId': serializeParam(
                    widget.quizId,
                    ParamType.String,
                  ),
                  'isCompleted': serializeParam(
                    widget.isCompleted,
                    ParamType.bool,
                  ),
                }.withoutNulls,
              );

              return;
            } else {
              if (getJsonField(
                    widget.questions?[functions.getIndex(widget.index!)],
                    r'''$.type''',
                  ) ==
                  getJsonField(
                    FFAppState().quiztype,
                    r'''$.error''',
                  )) {
                if (Navigator.of(context).canPop()) {
                  context.pop();
                }
                context.pushNamed(
                  'quiz_finderror',
                  queryParameters: {
                    'questions': serializeParam(
                      widget.questions,
                      ParamType.JSON,
                      true,
                    ),
                    'index': serializeParam(
                      functions.getIndex(widget.index!),
                      ParamType.int,
                    ),
                    'quizId': serializeParam(
                      widget.quizId,
                      ParamType.String,
                    ),
                    'isCompleted': serializeParam(
                      widget.isCompleted,
                      ParamType.bool,
                    ),
                  }.withoutNulls,
                );

                return;
              } else {
                if (getJsonField(
                      widget.questions?[functions.getIndex(widget.index!)],
                      r'''$.type''',
                    ) ==
                    getJsonField(
                      FFAppState().quiztype,
                      r'''$.image''',
                    )) {
                  context.pushNamed(
                    'quiz_image_answer',
                    queryParameters: {
                      'questions': serializeParam(
                        widget.questions,
                        ParamType.JSON,
                        true,
                      ),
                      'index': serializeParam(
                        functions.getIndex(widget.index!),
                        ParamType.int,
                      ),
                      'quizId': serializeParam(
                        widget.quizId,
                        ParamType.String,
                      ),
                      'isCompleted': serializeParam(
                        widget.isCompleted,
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
          _model.timerController.onResetTimer();

          _model.timerController.onStartTimer();
          return;
        }
      }
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
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
                  alignment: AlignmentDirectional(-1.0, -1.0),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(20.0, 0.82, 0.0, 0.0),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        context.pushNamed('quiz_list');

                        _model.timerController.onResetTimer();
                      },
                      child: Container(
                        width: 135.0,
                        height: 50.0,
                        decoration: BoxDecoration(
                          color: Color(0xFFDBEEF6),
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
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
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    8.0, 0.0, 16.0, 0.0),
                                child: Text(
                                  'Save and exit',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'SF Pro Display Bold',
                                        color: Color(0xFF39B6FF),
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
                ),
                if (functions.isMediaExist(getJsonField(
                  FFAppState().currQuestion,
                  r'''$.media''',
                  true,
                )!))
                  Builder(
                    builder: (context) {
                      final media = getJsonField(
                        FFAppState().currQuestion,
                        r'''$.media''',
                      ).toList();
                      return ListView.builder(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: media.length,
                        itemBuilder: (context, mediaIndex) {
                          final mediaItem = media[mediaIndex];
                          return Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              if (getJsonField(
                                    mediaItem,
                                    r'''$.type''',
                                  ) ==
                                  getJsonField(
                                    FFAppState().mediaType,
                                    r'''$.image''',
                                  ))
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      20.0, 16.0, 20.0, 0.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10.0),
                                    child: Image.network(
                                      '${FFAppState().IMAGEURL}${getJsonField(
                                        mediaItem,
                                        r'''$.url''',
                                      ).toString()}',
                                      width: 350.0,
                                      height: 195.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              if (getJsonField(
                                    mediaItem,
                                    r'''$.type''',
                                  ) ==
                                  getJsonField(
                                    FFAppState().mediaType,
                                    r'''$.audio''',
                                  ))
                                Padding(
                                  padding: EdgeInsets.all(20.0),
                                  child: FlutterFlowAudioPlayer(
                                    audio: Audio.network(
                                      getJsonField(
                                        mediaItem,
                                        r'''$.url''',
                                      ).toString(),
                                      metas: Metas(
                                        id: 'sample3.mp3-51edfd7e',
                                        title: getJsonField(
                                          mediaItem,
                                          r'''$.file_name''',
                                        ).toString(),
                                      ),
                                    ),
                                    titleTextStyle:
                                        FlutterFlowTheme.of(context).titleLarge,
                                    playbackDurationTextStyle:
                                        FlutterFlowTheme.of(context)
                                            .labelMedium,
                                    fillColor: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    playbackButtonColor:
                                        FlutterFlowTheme.of(context).primary,
                                    activeTrackColor:
                                        FlutterFlowTheme.of(context).alternate,
                                    elevation: 4.0,
                                    playInBackground: PlayInBackground
                                        .disabledRestoreOnForeground,
                                  ),
                                ),
                            ],
                          );
                        },
                      );
                    },
                  ),
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(20.0, 23.0, 20.0, 0.0),
                  child: Container(
                    width: 350.0,
                    height: 105.0,
                    decoration: BoxDecoration(
                      color: Color(0xFF00D1FF),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(20.0, 7.0, 0.0, 0.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 6.0, 0.0),
                                child: Icon(
                                  Icons.error_outline_outlined,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  size: 15.0,
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(-1.0, -1.0),
                                child: Text(
                                  'Find The Error',
                                  style:
                                      FlutterFlowTheme.of(context).bodyMedium,
                                ),
                              ),
                            ],
                          ),
                          Align(
                            alignment: AlignmentDirectional(-1.0, -1.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 9.0, 0.0, 0.0),
                              child: Text(
                                getJsonField(
                                  FFAppState().currQuestion,
                                  r'''$.label''',
                                ).toString(),
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
                  padding: EdgeInsetsDirectional.fromSTEB(20.0, 9.0, 20.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          context.pushNamed('quiz_finderror_fail-duplicate');
                        },
                        child: Icon(
                          Icons.arrow_back_ios,
                          color: FlutterFlowTheme.of(context).primaryText,
                          size: 24.0,
                        ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                122.0, 0.0, 0.0, 0.0),
                            child: Text(
                              'Questions',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'SF Pro Display Bold',
                                    fontWeight: FontWeight.bold,
                                    useGoogleFonts: false,
                                  ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                6.0, 0.0, 0.0, 0.0),
                            child: Container(
                              width: 39.0,
                              height: 21.0,
                              decoration: BoxDecoration(
                                color: Color(0xFF39B6FF),
                                borderRadius: BorderRadius.circular(19.0),
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    13.0, 0.0, 0.0, 0.0),
                                child: Text(
                                  functions.getIndex(widget.index!).toString(),
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
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                5.0, 0.0, 0.0, 0.0),
                            child: Text(
                              '/${widget.questions?.length?.toString()}',
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
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 6.0, 0.0, 0.0),
                  child: Stack(
                    children: [
                      Container(
                        width: double.infinity,
                        height: 4.0,
                        decoration: BoxDecoration(
                          color: Color(0xFFDCDCDC),
                        ),
                      ),
                      Container(
                        width: 106.0,
                        height: 4.0,
                        decoration: BoxDecoration(
                          color: Color(0xFF00D1FF),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(20.0, 10.0, 20.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Number of correct answers: ${getJsonField(
                          FFAppState().currQuestion,
                          r'''$.number_correct_answer''',
                        ).toString()}',
                        style: FlutterFlowTheme.of(context).bodyMedium,
                      ),
                      Flexible(
                        child: Align(
                          alignment: AlignmentDirectional(1.0, 0.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 6.0, 0.0),
                            child: Icon(
                              Icons.timer_sharp,
                              color: FlutterFlowTheme.of(context).primaryText,
                              size: 20.0,
                            ),
                          ),
                        ),
                      ),
                      FlutterFlowTimer(
                        initialTime: functions.getCountdownTimer(getJsonField(
                          FFAppState().currQuestion,
                          r'''$.duration''',
                        ).toString()),
                        getDisplayTime: (value) =>
                            StopWatchTimer.getDisplayTime(
                          value,
                          hours: false,
                          milliSecond: false,
                        ),
                        controller: _model.timerController,
                        onChanged: (value, displayTime, shouldUpdate) {
                          _model.timerMilliseconds = value;
                          _model.timerValue = displayTime;
                          if (shouldUpdate) setState(() {});
                        },
                        onEnded: () async {
                          if (FFAppState().isExplain) {
                            if (widget.questions?.length ==
                                functions.getIndex(widget.index!)) {
                              context.pushNamed(
                                'quiz_result',
                                queryParameters: {
                                  'quizId': serializeParam(
                                    widget.quizId,
                                    ParamType.String,
                                  ),
                                }.withoutNulls,
                              );

                              return;
                            } else {
                              if (getJsonField(
                                    widget.questions?[
                                        functions.getIndex(widget.index!)],
                                    r'''$.type''',
                                  ) ==
                                  getJsonField(
                                    FFAppState().quiztype,
                                    r'''$.mcq''',
                                  )) {
                                context.goNamed(
                                  'quiz_mcq',
                                  queryParameters: {
                                    'questions': serializeParam(
                                      widget.questions,
                                      ParamType.JSON,
                                      true,
                                    ),
                                    'index': serializeParam(
                                      functions.getIndex(widget.index!),
                                      ParamType.int,
                                    ),
                                    'quizId': serializeParam(
                                      widget.quizId,
                                      ParamType.String,
                                    ),
                                    'isCompleted': serializeParam(
                                      widget.isCompleted,
                                      ParamType.bool,
                                    ),
                                  }.withoutNulls,
                                );

                                return;
                              } else {
                                if (getJsonField(
                                      widget.questions?[
                                          functions.getIndex(widget.index!)],
                                      r'''$.type''',
                                    ) ==
                                    getJsonField(
                                      FFAppState().quiztype,
                                      r'''$.tf''',
                                    )) {
                                  context.goNamed(
                                    'quiz_truefalse',
                                    queryParameters: {
                                      'questions': serializeParam(
                                        widget.questions,
                                        ParamType.JSON,
                                        true,
                                      ),
                                      'index': serializeParam(
                                        functions.getIndex(widget.index!),
                                        ParamType.int,
                                      ),
                                      'quizId': serializeParam(
                                        widget.quizId,
                                        ParamType.String,
                                      ),
                                      'isCompleted': serializeParam(
                                        widget.isCompleted,
                                        ParamType.bool,
                                      ),
                                    }.withoutNulls,
                                  );

                                  return;
                                } else {
                                  if (getJsonField(
                                        widget.questions?[
                                            functions.getIndex(widget.index!)],
                                        r'''$.type''',
                                      ) ==
                                      getJsonField(
                                        FFAppState().quiztype,
                                        r'''$.error''',
                                      )) {
                                    context.goNamed(
                                      'quiz_finderror',
                                      queryParameters: {
                                        'questions': serializeParam(
                                          widget.questions,
                                          ParamType.JSON,
                                          true,
                                        ),
                                        'index': serializeParam(
                                          functions.getIndex(widget.index!),
                                          ParamType.int,
                                        ),
                                        'quizId': serializeParam(
                                          widget.quizId,
                                          ParamType.String,
                                        ),
                                        'isCompleted': serializeParam(
                                          widget.isCompleted,
                                          ParamType.bool,
                                        ),
                                      }.withoutNulls,
                                    );

                                    return;
                                  } else {
                                    if (getJsonField(
                                          widget.questions?[functions
                                              .getIndex(widget.index!)],
                                          r'''$.type''',
                                        ) ==
                                        getJsonField(
                                          FFAppState().quiztype,
                                          r'''$.image''',
                                        )) {
                                      context.goNamed(
                                        'quiz_image_answer',
                                        queryParameters: {
                                          'questions': serializeParam(
                                            widget.questions,
                                            ParamType.JSON,
                                            true,
                                          ),
                                          'index': serializeParam(
                                            functions.getIndex(widget.index!),
                                            ParamType.int,
                                          ),
                                          'quizId': serializeParam(
                                            widget.quizId,
                                            ParamType.String,
                                          ),
                                          'isCompleted': serializeParam(
                                            widget.isCompleted,
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
                            }
                          } else {
                            if (functions.isAnswersValidate(
                                getJsonField(
                                  FFAppState().currQuestion,
                                  r'''$.number_correct_answer''',
                                ),
                                FFAppState().selectedAns.length)) {
                              if (functions.isAnswerCorrect(
                                  getJsonField(
                                    FFAppState().currQuestion,
                                    r'''$.answers''',
                                    true,
                                  )!,
                                  FFAppState().selectedAns.toList())) {
                                await BaseUrlGroup.storeAnsweredQuestionCall
                                    .call(
                                  duration: functions.getDuration(
                                      FFAppState().startingTime!,
                                      getCurrentTimestamp),
                                  isCorrect: 1,
                                  questionId: getJsonField(
                                    FFAppState().currQuestion,
                                    r'''$.id''',
                                  ).toString(),
                                  quizId: widget.quizId,
                                  userId: currentUserUid,
                                );
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      'Hurrah! Your answer is correct.',
                                      style: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .override(
                                            fontFamily: 'SF Pro Display Bold',
                                            color: Color(0xFFE0E2E4),
                                            useGoogleFonts: false,
                                          ),
                                    ),
                                    duration: Duration(milliseconds: 4000),
                                    backgroundColor:
                                        FlutterFlowTheme.of(context).secondary,
                                  ),
                                );
                                setState(() {
                                  FFAppState().correctAns =
                                      FFAppState().correctAns + 1;
                                });
                              } else {
                                await BaseUrlGroup.storeAnsweredQuestionCall
                                    .call(
                                  duration: functions.getDuration(
                                      FFAppState().startingTime!,
                                      getCurrentTimestamp),
                                  isCorrect: 0,
                                  questionId: getJsonField(
                                    FFAppState().currQuestion,
                                    r'''$.id''',
                                  ).toString(),
                                  quizId: widget.quizId,
                                  userId: currentUserUid,
                                );
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      'Oops! Betterr luck next time',
                                      style: TextStyle(
                                        color: Color(0xFFDAE4ED),
                                      ),
                                    ),
                                    duration: Duration(milliseconds: 4000),
                                    backgroundColor:
                                        FlutterFlowTheme.of(context).error,
                                  ),
                                );
                              }

                              setState(() {
                                FFAppState().isExplain = true;
                                FFAppState().isTimerEnd = true;
                              });
                              return;
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'You didn\'t choose correct answer in time.',
                                    style: TextStyle(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                    ),
                                  ),
                                  duration: Duration(milliseconds: 4000),
                                  backgroundColor:
                                      FlutterFlowTheme.of(context).error,
                                ),
                              );
                              setState(() {
                                FFAppState().isExplain = true;
                                FFAppState().isTimerEnd = true;
                              });
                              return;
                            }
                          }
                        },
                        textAlign: TextAlign.start,
                        style: FlutterFlowTheme.of(context).bodyLarge,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(35.0, 22.0, 32.0, 0.0),
                  child: Wrap(
                    spacing: 17.0,
                    runSpacing: 15.0,
                    alignment: WrapAlignment.start,
                    crossAxisAlignment: WrapCrossAlignment.start,
                    direction: Axis.horizontal,
                    runAlignment: WrapAlignment.start,
                    verticalDirection: VerticalDirection.down,
                    clipBehavior: Clip.none,
                    children: [
                      Builder(
                        builder: (context) {
                          final answer = getJsonField(
                            FFAppState().currQuestion,
                            r'''$.answers''',
                          ).toList();
                          return GridView.builder(
                            padding: EdgeInsets.zero,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 10.0,
                              mainAxisSpacing: 10.0,
                              childAspectRatio: 1.0,
                            ),
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: answer.length,
                            itemBuilder: (context, answerIndex) {
                              final answerItem = answer[answerIndex];
                              return Container(
                                width: 153.0,
                                height: 146.0,
                                decoration: BoxDecoration(
                                  color: Color(0xFFFFEEEE),
                                  borderRadius: BorderRadius.circular(4.0),
                                  border: Border.all(
                                    color: () {
                                      if (functions.isSelectedIdexCorrect(
                                              getJsonField(
                                                FFAppState().currQuestion,
                                                r'''$.answers''',
                                                true,
                                              )!,
                                              answerIndex) &&
                                          FFAppState().isExplain &&
                                          !FFAppState().isTimerEnd &&
                                          functions.isAnswerCorrect(
                                              getJsonField(
                                                FFAppState().currQuestion,
                                                r'''$.answers''',
                                                true,
                                              )!,
                                              FFAppState()
                                                  .selectedAns
                                                  .toList())) {
                                        return FlutterFlowTheme.of(context)
                                            .quizSuccessBorder;
                                      } else if (FFAppState().isExplain &&
                                          !functions.isSelectedIdexCorrect(
                                              getJsonField(
                                                FFAppState().currQuestion,
                                                r'''$.answers''',
                                                true,
                                              )!,
                                              answerIndex) &&
                                          !functions.isAnswerCorrect(
                                              getJsonField(
                                                FFAppState().currQuestion,
                                                r'''$.answers''',
                                                true,
                                              )!,
                                              FFAppState()
                                                  .selectedAns
                                                  .toList()) &&
                                          !FFAppState().isTimerEnd &&
                                          functions.isValuePresent(
                                              FFAppState().selectedAns.toList(),
                                              answerIndex)) {
                                        return FlutterFlowTheme.of(context)
                                            .quizFailedBorder;
                                      } else if (!FFAppState().isExplain &&
                                          functions.isValuePresent(
                                              FFAppState().selectedAns.toList(),
                                              answerIndex) &&
                                          !FFAppState().isTimerEnd) {
                                        return FlutterFlowTheme.of(context)
                                            .quizSelectedBorder;
                                      } else {
                                        return Color(0x00000000);
                                      }
                                    }(),
                                    width: 2.0,
                                  ),
                                ),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    if (FFAppState().isExplain) {
                                      return;
                                    }

                                    if (functions.isValuePresent(
                                        FFAppState().selectedAns.toList(),
                                        answerIndex)) {
                                      setState(() {
                                        FFAppState()
                                            .removeFromSelectedAns(answerIndex);
                                      });
                                      return;
                                    } else {
                                      setState(() {
                                        FFAppState()
                                            .addToSelectedAns(answerIndex);
                                      });
                                      return;
                                    }
                                  },
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(4.0),
                                    child: Image.network(
                                      '${FFAppState().IMAGEURL}${getJsonField(
                                        answerItem,
                                        r'''$.url''',
                                      ).toString()}',
                                      width: 300.0,
                                      height: 200.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ],
                  ),
                ),
                if (FFAppState().showAnswer)
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                    child: AutoSizeText(
                      getJsonField(
                        FFAppState().currQuestion,
                        r'''$.explain_correct_anwser''',
                      ).toString(),
                      style: FlutterFlowTheme.of(context).bodyMedium,
                    ),
                  ),
                if (FFAppState().isExplain &&
                    functions.isExplanationNotEmpty(getJsonField(
                      FFAppState().currQuestion,
                      r'''$.explain_correct_anwser''',
                    ).toString()))
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
                    child: FFButtonWidget(
                      onPressed: () async {
                        setState(() {
                          FFAppState().showAnswer = true;
                        });
                      },
                      text: 'Click here for explanation',
                      options: FFButtonOptions(
                        width: 244.0,
                        height: 50.0,
                        padding: EdgeInsetsDirectional.fromSTEB(
                            24.0, 0.0, 24.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: Color(0xFFFFCB00),
                        textStyle: FlutterFlowTheme.of(context)
                            .titleSmall
                            .override(
                              fontFamily: 'Readex Pro',
                              color: FlutterFlowTheme.of(context).primaryText,
                              fontSize: 14.0,
                            ),
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                    ),
                  ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 39.0, 0.0, 27.0),
                  child: FFButtonWidget(
                    onPressed: () async {
                      if (FFAppState().isExplain) {
                        if (widget.questions?.length ==
                            functions.getIndex(widget.index!)) {
                          context.pushNamed(
                            'quiz_result',
                            queryParameters: {
                              'quizId': serializeParam(
                                widget.quizId,
                                ParamType.String,
                              ),
                            }.withoutNulls,
                          );

                          return;
                        } else {
                          if (getJsonField(
                                widget.questions?[
                                    functions.getIndex(widget.index!)],
                                r'''$.type''',
                              ) ==
                              getJsonField(
                                FFAppState().quiztype,
                                r'''$.mcq''',
                              )) {
                            context.goNamed(
                              'quiz_mcq',
                              queryParameters: {
                                'questions': serializeParam(
                                  widget.questions,
                                  ParamType.JSON,
                                  true,
                                ),
                                'index': serializeParam(
                                  functions.getIndex(widget.index!),
                                  ParamType.int,
                                ),
                                'quizId': serializeParam(
                                  widget.quizId,
                                  ParamType.String,
                                ),
                                'isCompleted': serializeParam(
                                  widget.isCompleted,
                                  ParamType.bool,
                                ),
                              }.withoutNulls,
                            );

                            return;
                          } else {
                            if (getJsonField(
                                  widget.questions?[
                                      functions.getIndex(widget.index!)],
                                  r'''$.type''',
                                ) ==
                                getJsonField(
                                  FFAppState().quiztype,
                                  r'''$.tf''',
                                )) {
                              context.goNamed(
                                'quiz_truefalse',
                                queryParameters: {
                                  'questions': serializeParam(
                                    widget.questions,
                                    ParamType.JSON,
                                    true,
                                  ),
                                  'index': serializeParam(
                                    functions.getIndex(widget.index!),
                                    ParamType.int,
                                  ),
                                  'quizId': serializeParam(
                                    widget.quizId,
                                    ParamType.String,
                                  ),
                                  'isCompleted': serializeParam(
                                    widget.isCompleted,
                                    ParamType.bool,
                                  ),
                                }.withoutNulls,
                              );

                              return;
                            } else {
                              if (getJsonField(
                                    widget.questions?[
                                        functions.getIndex(widget.index!)],
                                    r'''$.type''',
                                  ) ==
                                  getJsonField(
                                    FFAppState().quiztype,
                                    r'''$.error''',
                                  )) {
                                context.goNamed(
                                  'quiz_finderror',
                                  queryParameters: {
                                    'questions': serializeParam(
                                      widget.questions,
                                      ParamType.JSON,
                                      true,
                                    ),
                                    'index': serializeParam(
                                      functions.getIndex(widget.index!),
                                      ParamType.int,
                                    ),
                                    'quizId': serializeParam(
                                      widget.quizId,
                                      ParamType.String,
                                    ),
                                    'isCompleted': serializeParam(
                                      widget.isCompleted,
                                      ParamType.bool,
                                    ),
                                  }.withoutNulls,
                                );

                                return;
                              } else {
                                if (getJsonField(
                                      widget.questions?[
                                          functions.getIndex(widget.index!)],
                                      r'''$.type''',
                                    ) ==
                                    getJsonField(
                                      FFAppState().quiztype,
                                      r'''$.image''',
                                    )) {
                                  context.goNamed(
                                    'quiz_image_answer',
                                    queryParameters: {
                                      'questions': serializeParam(
                                        widget.questions,
                                        ParamType.JSON,
                                        true,
                                      ),
                                      'index': serializeParam(
                                        functions.getIndex(widget.index!),
                                        ParamType.int,
                                      ),
                                      'quizId': serializeParam(
                                        widget.quizId,
                                        ParamType.String,
                                      ),
                                      'isCompleted': serializeParam(
                                        widget.isCompleted,
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
                        }
                      } else {
                        if (functions.isAnswersValidate(
                            getJsonField(
                              FFAppState().currQuestion,
                              r'''$.number_correct_answer''',
                            ),
                            FFAppState().selectedAns.length)) {
                          if (functions.isAnswerCorrect(
                              getJsonField(
                                FFAppState().currQuestion,
                                r'''$.answers''',
                                true,
                              )!,
                              FFAppState().selectedAns.toList())) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  'Hurrah! Your answer is correct.',
                                  style: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                        fontFamily: 'SF Pro Display Bold',
                                        color: Color(0xFFE0E2E4),
                                        useGoogleFonts: false,
                                      ),
                                ),
                                duration: Duration(milliseconds: 4000),
                                backgroundColor:
                                    FlutterFlowTheme.of(context).secondary,
                              ),
                            );
                            await BaseUrlGroup.storeAnsweredQuestionCall.call(
                              duration: functions.getDuration(
                                  FFAppState().startingTime!,
                                  getCurrentTimestamp),
                              isCorrect: 1,
                              questionId: getJsonField(
                                FFAppState().currQuestion,
                                r'''$.id''',
                              ).toString(),
                              quizId: widget.quizId,
                              userId: currentUserUid,
                            );
                            setState(() {
                              FFAppState().correctAns =
                                  FFAppState().correctAns + 1;
                            });
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  'Oops! Betterr luck next time',
                                  style: TextStyle(
                                    color: Color(0xFFDAE4ED),
                                  ),
                                ),
                                duration: Duration(milliseconds: 4000),
                                backgroundColor:
                                    FlutterFlowTheme.of(context).error,
                              ),
                            );
                            await BaseUrlGroup.storeAnsweredQuestionCall.call(
                              duration: functions.getDuration(
                                  FFAppState().startingTime!,
                                  getCurrentTimestamp),
                              isCorrect: 0,
                              questionId: getJsonField(
                                FFAppState().currQuestion,
                                r'''$.id''',
                              ).toString(),
                              quizId: widget.quizId,
                              userId: currentUserUid,
                            );
                          }

                          setState(() {
                            FFAppState().isExplain = true;
                          });
                          _model.timerController.onStopTimer();
                          return;
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                'Please Select ${getJsonField(
                                  FFAppState().currQuestion,
                                  r'''$.number_correct_answer''',
                                ).toString()} answer.',
                                style: TextStyle(
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                ),
                              ),
                              duration: Duration(milliseconds: 4000),
                              backgroundColor:
                                  FlutterFlowTheme.of(context).secondary,
                            ),
                          );
                          return;
                        }
                      }
                    },
                    text: FFAppState().isExplain ? 'Next' : 'Answer',
                    options: FFButtonOptions(
                      width: 350.0,
                      height: 50.0,
                      padding:
                          EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                      iconPadding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: Color(0xFF00D1FF),
                      textStyle:
                          FlutterFlowTheme.of(context).titleSmall.override(
                                fontFamily: 'Readex Pro',
                                color: Colors.white,
                                fontSize: 14.0,
                              ),
                      elevation: 3.0,
                      borderSide: BorderSide(
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
