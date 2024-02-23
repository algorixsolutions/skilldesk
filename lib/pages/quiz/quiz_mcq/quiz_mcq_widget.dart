import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_audio_player.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'quiz_mcq_model.dart';
export 'quiz_mcq_model.dart';

class QuizMcqWidget extends StatefulWidget {
  const QuizMcqWidget({
    super.key,
    required this.questions,
    required this.index,
    required this.quizId,
    required this.isCompleted,
  });

  final List<dynamic>? questions;
  final int? index;
  final String? quizId;
  final bool? isCompleted;

  @override
  State<QuizMcqWidget> createState() => _QuizMcqWidgetState();
}

class _QuizMcqWidgetState extends State<QuizMcqWidget>
    with TickerProviderStateMixin {
  late QuizMcqModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = {
    'listViewOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        MoveEffect(
          curve: Curves.bounceOut,
          delay: 720.ms,
          duration: 600.ms,
          begin: const Offset(-200.0, 0.0),
          end: const Offset(0.0, 0.0),
        ),
      ],
    ),
    'iconButtonOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        ScaleEffect(
          curve: Curves.easeIn,
          delay: 610.ms,
          duration: 600.ms,
          begin: const Offset(0.0, 1.0),
          end: const Offset(1.0, 1.0),
        ),
      ],
    ),
    'iconButtonOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        ScaleEffect(
          curve: Curves.bounceOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: const Offset(0.0, 1.0),
          end: const Offset(1.0, 1.0),
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => QuizMcqModel());

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
      setState(() {
        _model.currQuiz = widget.questions?[widget.index!];
      });
      if (widget.isCompleted!) {
        _model.timerController.timer.setPresetTime(
          mSec: functions.getCountdownTimer(getJsonField(
            widget.questions![widget.index!],
            r'''$.duration''',
          ).toString().toString()),
          add: false,
        );
        _model.timerController.onResetTimer();

        _model.timerController.onStartTimer();
        return;
      } else {
        if (functions.isCurrQuestionCompleted(FFAppState().currQuestion)) {
          setState(() {
            FFAppState().NbOfQuestionsToAns =
                FFAppState().NbOfQuestionsToAns + -1;
          });
          if (FFAppState().NbOfQuestionsToAns == 0) {
            context.goNamed(
              'quiz_result',
              queryParameters: {
                'quizId': serializeParam(
                  widget.quizId,
                  ParamType.String,
                ),
              }.withoutNulls,
            );
          } else {
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
          }

          return;
        } else {
          _model.timerController.timer.setPresetTime(
            mSec: functions.getCountdownTimer(getJsonField(
              widget.questions![widget.index!],
              r'''$.duration''',
            ).toString().toString()),
            add: false,
          );
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
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FFButtonWidget(
                          onPressed: () async {
                            _model.timerController.onResetTimer();

                            if (FFAppState().trainingAfterQuiz == null) {
                              FFAppState()
                                  .clearGetQuizListCacheKey(currentUserUid);

                              context.goNamed('quiz_list');
                            } else {
                              if (getJsonField(
                                    FFAppState().trainingAfterQuiz,
                                    r'''$.status_by_user''',
                                  ) ==
                                  getJsonField(
                                    FFAppState().quizStatus,
                                    r'''$.completed''',
                                  )) {
                                context.goNamed(
                                  'training_completed2',
                                  queryParameters: {
                                    'trainingId': serializeParam(
                                      FFAppState().trainingAfterQuiz.toString(),
                                      ParamType.String,
                                    ),
                                  }.withoutNulls,
                                );
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
                            }
                          },
                          text: 'Save and exit',
                          icon: const Icon(
                            FFIcons.kback01,
                            size: 15.0,
                          ),
                          options: FFButtonOptions(
                            height: 50.0,
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                24.0, 0.0, 24.0, 0.0),
                            iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context)
                                .quizSelectedBackground,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'SF Pro Display',
                                  color: FlutterFlowTheme.of(context).quizColor,
                                  useGoogleFonts: false,
                                ),
                            elevation: 1.0,
                            borderSide: const BorderSide(
                              color: Colors.transparent,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(10.0),
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
                                primary: false,
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
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(14.0),
                                          child: Image.network(
                                            '${FFAppState().IMAGEURL}${getJsonField(
                                              mediaItem,
                                              r'''$.url''',
                                            ).toString()}',
                                            width: double.infinity,
                                            height: 195.0,
                                            fit: BoxFit.cover,
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
                                        FlutterFlowAudioPlayer(
                                          audio: Audio.network(
                                            getJsonField(
                                              mediaItem,
                                              r'''$.url''',
                                            ).toString(),
                                            metas: Metas(
                                              id: 'sample3.mp3-507c84b9',
                                              title: getJsonField(
                                                mediaItem,
                                                r'''$.file_name''',
                                              ).toString(),
                                            ),
                                          ),
                                          titleTextStyle:
                                              FlutterFlowTheme.of(context)
                                                  .titleLarge,
                                          playbackDurationTextStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium,
                                          fillColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                          playbackButtonColor:
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                          activeTrackColor:
                                              FlutterFlowTheme.of(context)
                                                  .alternate,
                                          elevation: 4.0,
                                          playInBackground: PlayInBackground
                                              .disabledRestoreOnForeground,
                                        ),
                                    ].divide(const SizedBox(height: 10.0)),
                                  );
                                },
                              );
                            },
                          ),
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: const Color(0xFF00D1FF),
                            borderRadius: BorderRadius.circular(14.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                10.0, 15.0, 10.0, 15.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 6.0, 0.0),
                                      child: Icon(
                                        Icons.format_list_numbered,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        size: 15.0,
                                      ),
                                    ),
                                    Align(
                                      alignment:
                                          const AlignmentDirectional(-1.0, -1.0),
                                      child: Text(
                                        'Multiple Choice Question',
                                        style: TextStyle(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          fontSize: 12.0,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Text(
                                  getJsonField(
                                    FFAppState().currQuestion,
                                    r'''$.label''',
                                  ).toString(),
                                  style: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                        fontFamily: 'SF Pro Display',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.w600,
                                        useGoogleFonts: false,
                                      ),
                                ),
                              ].divide(const SizedBox(height: 10.0)),
                            ),
                          ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            if (false)
                              InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  if (Navigator.of(context).canPop()) {
                                    context.pop();
                                  }
                                  context.pushNamed('quiz_list_old');
                                },
                                child: Icon(
                                  Icons.arrow_back_ios,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  size: 24.0,
                                ),
                              ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  'Questions',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'SF Pro Display',
                                        fontWeight: FontWeight.bold,
                                        useGoogleFonts: false,
                                      ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    color: const Color(0xFF39B6FF),
                                    borderRadius: BorderRadius.circular(19.0),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        14.0, 2.0, 14.0, 2.0),
                                    child: Text(
                                      functions
                                          .getIndex(widget.index!)
                                          .toString(),
                                      style: FlutterFlowTheme.of(context)
                                          .titleMedium
                                          .override(
                                            fontFamily: 'SF Pro Display Bold',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                            useGoogleFonts: false,
                                          ),
                                    ),
                                  ),
                                ),
                                Text(
                                  '/${widget.questions?.length.toString()}',
                                  style: const TextStyle(
                                    fontFamily: 'SF Pro Display Bold',
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14.0,
                                  ),
                                ),
                              ].divide(const SizedBox(width: 5.0)),
                            ),
                          ],
                        ),
                        Container(
                          width: double.infinity,
                          decoration: const BoxDecoration(),
                          child: Align(
                            alignment: const AlignmentDirectional(0.0, 0.0),
                            child: LinearPercentIndicator(
                              percent: 1.0,
                              lineHeight: 4.0,
                              animation: true,
                              animateFromLastPercent: true,
                              progressColor:
                                  FlutterFlowTheme.of(context).quizColor,
                              backgroundColor: const Color(0xFFF5F5F5),
                              barRadius: const Radius.circular(20.0),
                              padding: EdgeInsets.zero,
                            ),
                          ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Number of correct answers :${getJsonField(
                                FFAppState().currQuestion,
                                r'''$.number_correct_answer''',
                              ).toString()}',
                              style: TextStyle(
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontSize: 12.0,
                              ),
                            ),
                            Flexible(
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  _model.timerController.onStartTimer();
                                },
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Icon(
                                      Icons.timer_sharp,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      size: 20.0,
                                    ),
                                    FlutterFlowTimer(
                                      initialTime: functions
                                          .getCountdownTimer(getJsonField(
                                        _model.currQuiz,
                                        r'''$.duration''',
                                      ).toString()),
                                      getDisplayTime: (value) =>
                                          StopWatchTimer.getDisplayTime(
                                        value,
                                        hours: false,
                                        milliSecond: false,
                                      ),
                                      controller: _model.timerController,
                                      onChanged:
                                          (value, displayTime, shouldUpdate) {
                                        _model.timerMilliseconds = value;
                                        _model.timerValue = displayTime;
                                        if (shouldUpdate) setState(() {});
                                      },
                                      onEnded: () async {
                                        if (FFAppState().isExplain) {
                                          FFAppState().NbOfQuestionsToAns =
                                              FFAppState().NbOfQuestionsToAns +
                                                  -1;
                                          if (FFAppState().NbOfQuestionsToAns ==
                                              0) {
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
                                            if (Navigator.of(context)
                                                .canPop()) {
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
                                                  functions
                                                      .getIndex(widget.index!),
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
                                          }
                                        } else {
                                          if (functions.isAnswersValidate(
                                              getJsonField(
                                                FFAppState().currQuestion,
                                                r'''$.number_correct_answer''',
                                              ),
                                              FFAppState()
                                                  .selectedAns
                                                  .length)) {
                                            if (functions.isAnswerCorrect(
                                                getJsonField(
                                                  FFAppState().currQuestion,
                                                  r'''$.answers''',
                                                  true,
                                                )!,
                                                FFAppState()
                                                    .selectedAns
                                                    .toList())) {
                                              await BaseUrlGroup
                                                  .storeAnsweredQuestionCall
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
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                SnackBar(
                                                  content: Text(
                                                    'Hurrah! Your answer is correct.',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily:
                                                              'SF Pro Display',
                                                          color:
                                                              const Color(0xFFE0E2E4),
                                                          useGoogleFonts: false,
                                                        ),
                                                  ),
                                                  duration: const Duration(
                                                      milliseconds: 4000),
                                                  backgroundColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondary,
                                                ),
                                              );
                                              setState(() {
                                                FFAppState().correctAns =
                                                    FFAppState().correctAns + 1;
                                              });
                                            } else {
                                              await BaseUrlGroup
                                                  .storeAnsweredQuestionCall
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
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                SnackBar(
                                                  content: const Text(
                                                    'Oops! Better luck next time',
                                                    style: TextStyle(
                                                      color: Color(0xFFDAE4ED),
                                                    ),
                                                  ),
                                                  duration: const Duration(
                                                      milliseconds: 4000),
                                                  backgroundColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .error,
                                                ),
                                              );
                                            }

                                            setState(() {
                                              FFAppState().isExplain = true;
                                              FFAppState().isTimerEnd = true;
                                            });
                                            return;
                                          } else {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              SnackBar(
                                                content: Text(
                                                  'You didn\'t choose correct answer in time.',
                                                  style: TextStyle(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                  ),
                                                ),
                                                duration: const Duration(
                                                    milliseconds: 4000),
                                                backgroundColor:
                                                    FlutterFlowTheme.of(context)
                                                        .error,
                                              ),
                                            );
                                            await BaseUrlGroup
                                                .storeAnsweredQuestionCall
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
                                            setState(() {
                                              FFAppState().isExplain = true;
                                              FFAppState().isTimerEnd = true;
                                            });
                                            return;
                                          }
                                        }
                                      },
                                      textAlign: TextAlign.start,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyLarge
                                          .override(
                                            fontFamily: 'SF Pro Display Bold',
                                            fontSize: 14.0,
                                            useGoogleFonts: false,
                                          ),
                                    ),
                                  ].divide(const SizedBox(width: 5.0)),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Builder(
                          builder: (context) {
                            final answer = getJsonField(
                              FFAppState().currQuestion,
                              r'''$.answers''',
                            ).toList();
                            return ListView.separated(
                              padding: EdgeInsets.zero,
                              primary: false,
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemCount: answer.length,
                              separatorBuilder: (_, __) =>
                                  const SizedBox(height: 13.0),
                              itemBuilder: (context, answerIndex) {
                                final answerItem = answer[answerIndex];
                                return Container(
                                  width: 352.0,
                                  decoration: BoxDecoration(
                                    color: valueOrDefault<Color>(
                                      () {
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
                                              .quizSuccessBackground;
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
                                                FFAppState()
                                                    .selectedAns
                                                    .toList(),
                                                answerIndex)) {
                                          return FlutterFlowTheme.of(context)
                                              .quizFailedBackground;
                                        } else if (!FFAppState().isExplain &&
                                            functions.isValuePresent(
                                                FFAppState()
                                                    .selectedAns
                                                    .toList(),
                                                answerIndex) &&
                                            !FFAppState().isTimerEnd) {
                                          return FlutterFlowTheme.of(context)
                                              .quizSelectedBackground;
                                        } else {
                                          return FlutterFlowTheme.of(context)
                                              .primaryBackground;
                                        }
                                      }(),
                                      FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                    ),
                                    borderRadius: BorderRadius.circular(16.0),
                                    border: Border.all(
                                      color: valueOrDefault<Color>(
                                        () {
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
                                                  FFAppState()
                                                      .selectedAns
                                                      .toList(),
                                                  answerIndex)) {
                                            return FlutterFlowTheme.of(context)
                                                .quizFailedBorder;
                                          } else if (!FFAppState().isExplain &&
                                              functions.isValuePresent(
                                                  FFAppState()
                                                      .selectedAns
                                                      .toList(),
                                                  answerIndex) &&
                                              !FFAppState().isTimerEnd) {
                                            return FlutterFlowTheme.of(context)
                                                .quizSelectedBorder;
                                          } else {
                                            return FlutterFlowTheme.of(context)
                                                .quizDefaultBorder;
                                          }
                                        }(),
                                        FlutterFlowTheme.of(context)
                                            .quizDefaultBorder,
                                      ),
                                      width: 1.0,
                                    ),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
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
                                            FFAppState().removeFromSelectedAns(
                                                answerIndex);
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
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Expanded(
                                            flex: 4,
                                            child: Container(
                                              decoration: const BoxDecoration(),
                                              child: AutoSizeText(
                                                getJsonField(
                                                  answerItem,
                                                  r'''$.content''',
                                                ).toString(),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'SF Pro Display',
                                                          fontSize: 18.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          useGoogleFonts: false,
                                                        ),
                                              ),
                                            ),
                                          ),
                                          Flexible(
                                            flex: 1,
                                            child: Stack(
                                              children: [
                                                if (FFAppState().isExplain &&
                                                    functions
                                                        .isSelectedIdexCorrect(
                                                            getJsonField(
                                                              FFAppState()
                                                                  .currQuestion,
                                                              r'''$.answers''',
                                                              true,
                                                            )!,
                                                            answerIndex) &&
                                                    !FFAppState().isTimerEnd &&
                                                    functions.isAnswerCorrect(
                                                        getJsonField(
                                                          FFAppState()
                                                              .currQuestion,
                                                          r'''$.answers''',
                                                          true,
                                                        )!,
                                                        FFAppState()
                                                            .selectedAns
                                                            .toList()))
                                                  FlutterFlowIconButton(
                                                    borderColor:
                                                        const Color(0xFF65BF73),
                                                    borderRadius: 20.0,
                                                    borderWidth: 1.0,
                                                    buttonSize: 40.0,
                                                    fillColor:
                                                        const Color(0xFFCDF2D5),
                                                    icon: const FaIcon(
                                                      FontAwesomeIcons.check,
                                                      color: Color(0xFF65BF73),
                                                      size: 24.0,
                                                    ),
                                                    onPressed: () {
                                                      print(
                                                          'IconButton pressed ...');
                                                    },
                                                  ).animateOnPageLoad(animationsMap[
                                                      'iconButtonOnPageLoadAnimation1']!),
                                                if (FFAppState().isExplain &&
                                                    !functions
                                                        .isSelectedIdexCorrect(
                                                            getJsonField(
                                                              FFAppState()
                                                                  .currQuestion,
                                                              r'''$.answers''',
                                                              true,
                                                            )!,
                                                            answerIndex) &&
                                                    !functions.isAnswerCorrect(
                                                        getJsonField(
                                                          FFAppState()
                                                              .currQuestion,
                                                          r'''$.answers''',
                                                          true,
                                                        )!,
                                                        FFAppState()
                                                            .selectedAns
                                                            .toList()) &&
                                                    !FFAppState().isTimerEnd &&
                                                    functions.isValuePresent(
                                                        FFAppState()
                                                            .selectedAns
                                                            .toList(),
                                                        answerIndex))
                                                  FlutterFlowIconButton(
                                                    borderColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .quizFailedBorder,
                                                    borderRadius: 20.0,
                                                    borderWidth: 1.0,
                                                    buttonSize: 40.0,
                                                    fillColor:
                                                        const Color(0xFFF3A4A4),
                                                    icon: Icon(
                                                      Icons.close,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .quizFailedBorder,
                                                      size: 24.0,
                                                    ),
                                                    onPressed: () {
                                                      print(
                                                          'IconButton pressed ...');
                                                    },
                                                  ).animateOnPageLoad(animationsMap[
                                                      'iconButtonOnPageLoadAnimation2']!),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ).animateOnPageLoad(
                                animationsMap['listViewOnPageLoadAnimation']!);
                          },
                        ),
                      ].divide(const SizedBox(height: 20.0)),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 50.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    if (FFAppState().showAnswer)
                      Text(
                        getJsonField(
                          FFAppState().currQuestion,
                          r'''$.explain_correct_anwser''',
                        ).toString(),
                        style: TextStyle(
                          color: FlutterFlowTheme.of(context).primaryText,
                          fontSize: 12.0,
                        ),
                      ),
                    if (FFAppState().isExplain &&
                        functions.isExplanationNotEmpty(getJsonField(
                          FFAppState().currQuestion,
                          r'''$.explain_correct_anwser''',
                        ).toString()))
                      FFButtonWidget(
                        onPressed: () async {
                          setState(() {
                            FFAppState().showAnswer = true;
                          });
                        },
                        text: 'Click here for explanation',
                        options: FFButtonOptions(
                          width: 244.0,
                          height: 50.0,
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              24.0, 0.0, 24.0, 0.0),
                          iconPadding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: const Color(0xFFFFCB00),
                          textStyle: FlutterFlowTheme.of(context)
                              .titleSmall
                              .override(
                                fontFamily: 'SF Pro Display',
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontSize: 14.0,
                                useGoogleFonts: false,
                              ),
                          borderSide: const BorderSide(
                            color: Colors.transparent,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                      ),
                    FFButtonWidget(
                      onPressed: () async {
                        if (FFAppState().isExplain) {
                          FFAppState().NbOfQuestionsToAns =
                              FFAppState().NbOfQuestionsToAns + -1;
                          if (FFAppState().NbOfQuestionsToAns == 0) {
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
                                          fontFamily: 'SF Pro Display',
                                          color: const Color(0xFFE0E2E4),
                                          useGoogleFonts: false,
                                        ),
                                  ),
                                  duration: const Duration(milliseconds: 4000),
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
                                  content: const Text(
                                    'Oops! Betterr luck next time.',
                                    style: TextStyle(
                                      color: Color(0xFFDAE4ED),
                                    ),
                                  ),
                                  duration: const Duration(milliseconds: 4000),
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
                      text: FFAppState().isExplain ? 'Next' : 'Answer',
                      options: FFButtonOptions(
                        width: 350.0,
                        height: 50.0,
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            24.0, 0.0, 24.0, 0.0),
                        iconPadding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: valueOrDefault<Color>(
                          FFAppState().isExplain
                              ? FlutterFlowTheme.of(context).primaryBackground
                              : FlutterFlowTheme.of(context).quizColor,
                          FlutterFlowTheme.of(context).quizColor,
                        ),
                        textStyle: FlutterFlowTheme.of(context)
                            .titleSmall
                            .override(
                              fontFamily: 'SF Pro Display',
                              color: valueOrDefault<Color>(
                                FFAppState().isExplain
                                    ? FlutterFlowTheme.of(context).quizColor
                                    : FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                FlutterFlowTheme.of(context).primaryBackground,
                              ),
                              fontSize: 14.0,
                              useGoogleFonts: false,
                            ),
                        elevation: 3.0,
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).quizColor,
                          width: 3.0,
                        ),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                    ),
                  ].divide(const SizedBox(height: 5.0)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
