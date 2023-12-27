
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:skilldesk/auth/firebase_auth/auth_util.dart';
import 'package:skilldesk/backend/api_requests/api_calls.dart';
import 'package:skilldesk/flutter_flow/flutter_flow_theme.dart';
import 'package:skilldesk/flutter_flow/flutter_flow_timer.dart';
import 'package:skilldesk/flutter_flow/flutter_flow_util.dart';
import 'package:skilldesk/flutter_flow/flutter_flow_widgets.dart';
import 'package:skilldesk/pages/quiz/quiz_finderror/quiz_finderror_model.dart';
import 'package:skilldesk/pages/quiz/quiz_image_answer/quiz_image_answer_widget.dart';
import 'package:skilldesk/pages/quiz/quiz_mcq/quiz_mcq_widget.dart';
import 'package:skilldesk/pages/quiz/quiz_truefalse/quiz_truefalse_widget.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';

import '/flutter_flow/custom_functions.dart' as functions;

export 'quiz_finderror_model.dart';

class QuizFinderrorWidget extends StatefulWidget {
  const QuizFinderrorWidget({

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
  _QuizFinderrorWidgetState createState() => _QuizFinderrorWidgetState();
}

class _QuizFinderrorWidgetState extends State<QuizFinderrorWidget> {
  late QuizFinderrorModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();


  Map<String, dynamic> currQuestion = {};
  bool isExplain = false;
  bool showAnswer = false;
  bool isTimerEnd = false;
  List<int> selectedAns = [];

  @override
  void initState() {
    super.initState();
    print('nextPage');
    _model = createModel(context, () => QuizFinderrorModel());

    setState(() {
      currQuestion = widget.questions![widget.index!];

      // FFAppState().currQuestion = widget.questions![widget.index!];
      // FFAppState().selectedAns = [];
      // FFAppState().isExplain = false;
      // FFAppState().showAnswer = false;
      FFAppState().startingTime = getCurrentTimestamp;
      // FFAppState().isTimerEnd = false;
    });
    if (widget.isCompleted!) {
      _model.timerController.onResetTimer();

      _model.timerController.onStartTimer();
      return;
    } else {
      if (functions.isCurrQuestionCompleted(currQuestion)) {
        if (widget.questions?.length == functions.getIndex(widget.index!)) {
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
          navigateToNextScreen();
        }
      } else {

        _model.timerController.onResetTimer();

        _model.timerController.onStartTimer();
        return;
      }
    }
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
                    padding:const EdgeInsets.only(top: 20, left: 0.82),
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
                ),
                Padding(
                  padding:
                      const EdgeInsetsDirectional.fromSTEB(20.0, 16.0, 20.0, 0.0),

                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Image.asset(
                      'assets/images/onur-binay-wi3xBnWZlvQ-unsplash.png',
                      width: 350.0,
                      height: 195.0,
                      fit: BoxFit.cover,
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

                            alignment: AlignmentDirectional(-1.00, -1.00),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 9.0, 0.0, 0.0),
                              child: Text(
                                getJsonField(
                                  currQuestion,
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
                  padding: const EdgeInsetsDirectional.fromSTEB(20.0, 9.0, 20.0, 0.0),

                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        Icons.arrow_back_ios,
                        color: FlutterFlowTheme.of(context).primaryText,
                        size: 24.0,
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(

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

                            padding: const EdgeInsetsDirectional.fromSTEB(
                                6.0, 0.0, 0.0, 0.0),
                            child: Container(
                              width: 39.0,
                              height: 21.0,
                              decoration: BoxDecoration(

                                color: const Color(0xFF39B6FF),
                                borderRadius: BorderRadius.circular(19.0),
                              ),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    13.0, 0.0, 0.0, 0.0),
                                child: Text(
                                  functions.getIndex(widget.index!).toString(),
                                  style: const TextStyle(

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

                            padding: const EdgeInsetsDirectional.fromSTEB(
                                5.0, 0.0, 0.0, 0.0),
                            child: Text(
                              '/${widget.questions?.length.toString()}',
                              style: const TextStyle(
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
                        'Number of correct answers: ${getJsonField(

                          currQuestion,
                          r'''$.number_correct_answer''',
                        ).toString()}',
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
                              size: 20.0,
                            ),
                          ),
                        ),
                      ),
                      FlutterFlowTimer(
                        initialTime: functions.getCountdownTimer(getJsonField(

                          currQuestion,
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
                          if (isExplain) {
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
                              navigateToNextScreen();
                            }
                          } else {
                            if (functions.isAnswersValidate(
                                getJsonField(

                                  currQuestion,
                                  r'''$.number_correct_answer''',
                                ),
                                selectedAns.length)) {
                              if (functions.isAnswerCorrect(
                                  getJsonField(
                                    currQuestion,
                                    r'''$.answers''',
                                    true,
                                  )!,
                                  selectedAns.toList())) {
                                await BaseUrlGroup.storeAnsweredQuestionCall
                                    .call(
                                  duration: functions.getDuration(
                                      FFAppState().startingTime!,
                                      getCurrentTimestamp),
                                  isCorrect: 1,
                                  questionId: getJsonField(

                                    currQuestion,
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
                                            color: const Color(0xFFE0E2E4),
                                            useGoogleFonts: false,
                                          ),
                                    ),
                                    duration: const Duration(milliseconds: 4000),

                                    backgroundColor:
                                        FlutterFlowTheme.of(context).secondary,
                                  ),
                                );
                                // setState(() {
                                //   FFAppState().correctAns =
                                //       FFAppState().correctAns + 1;
                                // });

                              } else {
                                await BaseUrlGroup.storeAnsweredQuestionCall
                                    .call(
                                  duration: functions.getDuration(
                                      FFAppState().startingTime!,
                                      getCurrentTimestamp),
                                  isCorrect: 0,
                                  questionId: getJsonField(

                                    currQuestion,
                                    r'''$.id''',
                                  ).toString(),
                                  quizId: widget.quizId,
                                  userId: currentUserUid,
                                );
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: const Text(

                                      'Oops! Betterr luck next time',
                                      style: TextStyle(
                                        color: Color(0xFFDAE4ED),
                                      ),
                                    ),
                                    duration: const Duration(milliseconds: 4000),

                                    backgroundColor:
                                        FlutterFlowTheme.of(context).error,
                                  ),
                                );
                              }

                              setState(() {

                                isExplain = true;
                                isTimerEnd = true;
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
                                  currQuestion,
                                  r'''$.id''',
                                ).toString(),
                                quizId: widget.quizId,
                                userId: currentUserUid,
                              );
                              setState(() {
                                isExplain = true;
                                isTimerEnd = true;
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
                     const  EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 20.0),
                  child: Builder(
                    builder: (context) {
                      final answer = getJsonField(
                        currQuestion,
                        r'''$.answers''',
                      ).toList();
                      return ListView.separated(
                        physics: const NeverScrollableScrollPhysics(),
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: answer.length,
                        separatorBuilder: (_, __) => const SizedBox(height: 10.0),

                        itemBuilder: (context, answerIndex) {
                          final answerItem = answer[answerIndex];
                          return Container(
                            width: 352.0,
                            decoration: BoxDecoration(
                              color: () {
                                if (functions.isSelectedIdexCorrect(
                                        getJsonField(

                                          currQuestion,
                                          r'''$.answers''',
                                          true,
                                        )!,
                                        answerIndex) &&

                                    isExplain &&
                                    !isTimerEnd &&
                                    functions.isAnswerCorrect(
                                        getJsonField(
                                          currQuestion,
                                          r'''$.answers''',
                                          true,
                                        )!,
                                        selectedAns.toList())) {
                                  return FlutterFlowTheme.of(context)
                                      .quizSuccessBackground;
                                } else if (isExplain &&
                                    !functions.isSelectedIdexCorrect(
                                        getJsonField(
                                          currQuestion,
                                          r'''$.answers''',
                                          true,
                                        )!,
                                        answerIndex) &&
                                    !functions.isAnswerCorrect(
                                        getJsonField(

                                          currQuestion,
                                          r'''$.answers''',
                                          true,
                                        )!,
                                        selectedAns.toList()) &&
                                    !isTimerEnd &&
                                    functions.isValuePresent(
                                        selectedAns.toList(), answerIndex)) {
                                  return FlutterFlowTheme.of(context)
                                      .quizFailedBackground;
                                } else if (!isExplain &&
                                    functions.isValuePresent(
                                        selectedAns.toList(), answerIndex) &&
                                    !isTimerEnd) {
                                  return FlutterFlowTheme.of(context)
                                      .quizSelectedBackground;
                                } else {
                                  return FlutterFlowTheme.of(context)
                                      .primaryBackground;
                                }
                              }(),
                              borderRadius: BorderRadius.circular(16.0),
                              border: Border.all(
                                color: () {
                                  if (functions.isSelectedIdexCorrect(
                                          getJsonField(

                                            currQuestion,
                                            r'''$.answers''',
                                            true,
                                          )!,
                                          answerIndex) &&

                                      isExplain &&
                                      !isTimerEnd &&
                                      functions.isAnswerCorrect(
                                          getJsonField(
                                            currQuestion,
                                            r'''$.answers''',
                                            true,
                                          )!,
                                          selectedAns.toList())) {
                                    return FlutterFlowTheme.of(context)
                                        .quizSuccessBorder;
                                  } else if (isExplain &&
                                      !functions.isSelectedIdexCorrect(
                                          getJsonField(
                                            currQuestion,
                                            r'''$.answers''',
                                            true,
                                          )!,
                                          answerIndex) &&
                                      !functions.isAnswerCorrect(
                                          getJsonField(

                                            currQuestion,
                                            r'''$.answers''',
                                            true,
                                          )!,
                                          selectedAns.toList()) &&
                                      !isTimerEnd &&
                                      functions.isValuePresent(
                                          selectedAns.toList(), answerIndex)) {
                                    return FlutterFlowTheme.of(context)
                                        .quizFailedBorder;
                                  } else if (!isExplain &&
                                      functions.isValuePresent(
                                          selectedAns.toList(), answerIndex) &&
                                      !isTimerEnd) {
                                    return FlutterFlowTheme.of(context)
                                        .quizSelectedBorder;
                                  } else {
                                    return FlutterFlowTheme.of(context)
                                        .quizDefaultBorder;
                                  }
                                }(),
                                width: 2.0,
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

                                  if (isExplain) {
                                    return;
                                  }
                                  if (selectedAns.contains(answerIndex)) {
                                    setState(() {
                                      selectedAns.remove(answerIndex);
                                    });
                                  } else {
                                    setState(() {
                                      selectedAns.add(answerIndex);
                                    });
                                  }
                                  //
                                  // if (functions.isValuePresent(
                                  //     selectedAns.toList(), answerIndex)) {
                                  //   setState(() {
                                  //     removeFromSelectedAns(answerIndex);
                                  //   });
                                  //   return;
                                  // } else {
                                  //   setState(() {
                                  //     FFAppState()
                                  //         .addToSelectedAns(answerIndex);
                                  //   });
                                  //   return;
                                  // }

                                },
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      flex: 4,
                                      child: Container(
                                        decoration: BoxDecoration(),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  10.0, 0.0, 0.0, 0.0),
                                          child: Text(
                                            getJsonField(
                                              answerItem,
                                              r'''$.content''',
                                            ).toString(),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily:
                                                      'SF Pro Display Bold',
                                                  fontSize: 18.0,
                                                  fontWeight: FontWeight.w500,
                                                  useGoogleFonts: false,
                                                ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Stack(
                                        children: [
                                          if (isExplain &&
                                              !functions.isSelectedIdexCorrect(
                                                  getJsonField(
                                                    currQuestion,
                                                    r'''$.answers''',
                                                    true,
                                                  )!,
                                                  answerIndex) &&
                                              !functions.isAnswerCorrect(
                                                  getJsonField(
                                                    currQuestion,
                                                    r'''$.answers''',
                                                    true,
                                                  )!,
                                                  selectedAns.toList()) &&
                                              !isTimerEnd &&
                                              functions.isValuePresent(
                                                  selectedAns.toList(),
                                                  answerIndex))
                                            Align(
                                              alignment: const AlignmentDirectional(
                                                  1.00, 0.00),
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
                                                  width: 35.0,
                                                  height: 35.0,
                                                  padding: const EdgeInsets.all(0.0),
                                                  iconPadding:
                                                      const EdgeInsetsDirectional
                                                          .fromSTEB(5.0, 0.0,
                                                              0.0, 0.0),
                                                  color: const Color(0xFFF9A1A1),

                                                  textStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleSmall
                                                          .override(
                                                            fontFamily:
                                                                'Readex Pro',
                                                            color: Colors.white,
                                                          ),
                                                  elevation: 3.0,
                                                  borderSide: const BorderSide(

                                                    color: Colors.transparent,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          100.0),
                                                ),
                                              ),
                                            ),

                                          if (isExplain &&
                                              functions.isSelectedIdexCorrect(
                                                  getJsonField(
                                                    currQuestion,
                                                    r'''$.answers''',
                                                    true,
                                                  )!,
                                                  answerIndex) &&
                                              !isTimerEnd &&
                                              functions.isAnswerCorrect(
                                                  getJsonField(
                                                    currQuestion,
                                                    r'''$.answers''',
                                                    true,
                                                  )!,
                                                  selectedAns.toList()))
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  1.00, 0.00),

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
                                                  width: 35.0,
                                                  height: 35.0,
                                                  padding: const EdgeInsets.all(0.0),
                                                  iconPadding:
                                                      const EdgeInsetsDirectional
                                                          .fromSTEB(5.0, 0.0,
                                                              0.0, 0.0),
                                                  color: const Color(0xFFDBEEF6),

                                                  textStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleSmall
                                                          .override(
                                                            fontFamily:
                                                                'Readex Pro',
                                                            color: Colors.white,
                                                          ),
                                                  elevation: 3.0,
                                                  borderSide: const BorderSide(

                                                    color: Colors.transparent,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          100.0),
                                                ),
                                              ),
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
                    },
                  ),
                ),

                if (showAnswer)
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                    child: AutoSizeText(
                      getJsonField(
                        currQuestion,

                        r'''$.explain_correct_anwser''',
                      ).toString(),
                      style: FlutterFlowTheme.of(context).bodyMedium,
                    ),
                  ),

                if (isExplain &&
                    functions.isExplanationNotEmpty(getJsonField(
                      currQuestion,
                      r'''$.explain_correct_anwser''',
                    ).toString()))
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
                    child: FFButtonWidget(
                      onPressed: () async {
                        setState(() {
                          showAnswer = true;
                        });
                      },
                      text: 'Click here for explanation',
                      options: FFButtonOptions(
                        width: 244.0,
                        height: 50.0,
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            24.0, 0.0, 24.0, 0.0),
                        iconPadding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: const Color(0xFFFFCB00),
                        textStyle: FlutterFlowTheme.of(context)
                            .titleSmall
                            .override(
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

                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 39.0, 0.0, 27.0),
                  child: FFButtonWidget(
                    onPressed: () async {
                      if (isExplain) {
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

                          navigateToNextScreen();
                        }
                      } else {
                        if (functions.isAnswersValidate(
                            getJsonField(
                              currQuestion,
                              r'''$.number_correct_answer''',
                            ),
                            selectedAns.length)) {
                          if (functions.isAnswerCorrect(
                              getJsonField(
                                currQuestion,
                                r'''$.answers''',
                                true,
                              )!,
                              selectedAns.toList())) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  'Hurrah! Your answer is correct.',
                                  style: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                        fontFamily: 'SF Pro Display Bold',

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

                                currQuestion,
                                r'''$.id''',
                              ).toString(),
                              quizId: widget.quizId,
                              userId: currentUserUid,
                            );

                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  'Oops! Betterr luck next time',
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
                                currQuestion,
                                r'''$.id''',
                              ).toString(),
                              quizId: widget.quizId,
                              userId: currentUserUid,
                            );
                          }

                          setState(() {
                            isExplain = true;
                          });
                          _model.timerController.onStopTimer();
                          return;
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                'Please Select ${getJsonField(

                                  currQuestion,

                                  r'''$.number_correct_answer''',
                                ).toString()} answer.',
                                style: TextStyle(
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
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

                    text: isExplain ? 'Next' : 'Answer',

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


  navigateToNextScreen() {
    if (getJsonField(
          widget.questions?[functions.getIndex(widget.index!)],
          r'''$.type''',
        ) ==
        getJsonField(
          FFAppState().quiztype,
          r'''$.mcq''',
        )) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => QuizMcqWidget(
              questions: widget.questions,
              index: widget.index! + 1,
              quizId: widget.quizId,
              isCompleted: widget.isCompleted),
        ),
      );
    } else if (getJsonField(
          widget.questions?[functions.getIndex(widget.index!)],
          r'''$.type''',
        ) ==
        getJsonField(
          FFAppState().quiztype,
          r'''$.tf''',
        )) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => QuizTruefalseWidget(
              questions: widget.questions,
              index: widget.index! + 1,
              quizId: widget.quizId,
              isCompleted: widget.isCompleted),
        ),
      );
    } else if (getJsonField(
          widget.questions?[functions.getIndex(widget.index!)],
          r'''$.type''',
        ) ==
        getJsonField(
          FFAppState().quiztype,
          r'''$.error''',
        )) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => QuizFinderrorWidget(
              questions: widget.questions,
              index: widget.index! + 1,
              quizId: widget.quizId,
              isCompleted: widget.isCompleted),
        ),
      );
    } else if (getJsonField(
          widget.questions?[functions.getIndex(widget.index!)],
          r'''$.type''',
        ) ==
        getJsonField(
          FFAppState().quiztype,
          r'''$.image''',
        )) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => QuizImageAnswerWidget(
              questions: widget.questions,
              index: widget.index! + 1,
              quizId: widget.quizId,
              isCompleted: widget.isCompleted),
        ),
      );
    } else {
      return;
    }
  }
}
