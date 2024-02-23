import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/components/custom_appbar_widget.dart';
import '/flutter_flow/flutter_flow_audio_player.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/flutter_flow_youtube_player.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'training_chapter_content_model.dart';
export 'training_chapter_content_model.dart';

class TrainingChapterContentWidget extends StatefulWidget {
  const TrainingChapterContentWidget({
    super.key,
    required this.chapters,
    required this.trainingId,
    required this.index,
  });

  final List<dynamic>? chapters;
  final String? trainingId;
  final int? index;

  @override
  State<TrainingChapterContentWidget> createState() =>
      _TrainingChapterContentWidgetState();
}

class _TrainingChapterContentWidgetState
    extends State<TrainingChapterContentWidget> {
  late TrainingChapterContentModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TrainingChapterContentModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (getJsonField(
        widget.chapters![widget.index!],
        r'''$.is_completed''',
      )) {
        setState(() {
          _model.currChapter = widget.chapters?[widget.index!];
          _model.isTimerEnd = true;
        });
        _model.timerController.timer.setPresetTime(mSec: 0, add: false);
        _model.timerController.onResetTimer();
      } else {
        _model.timerController.timer.setPresetTime(
          mSec: functions.getCountDownTImerForChapter(getJsonField(
            widget.chapters![widget.index!],
            r'''$.duration''',
          ).toString().toString()),
          add: false,
        );
        _model.timerController.onResetTimer();

        setState(() {
          _model.currChapter = widget.chapters?[widget.index!];
        });
        _model.timerController.onStartTimer();
        setState(() {
          FFAppState().startingTime = getCurrentTimestamp;
        });
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
        backgroundColor: Colors.white,
        body: SafeArea(
          top: true,
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
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
                                    widget.chapters?[widget.index!],
                                    r'''$.title''',
                                  ).toString(),
                                ),
                              ),
                              Container(
                                height: 199.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                alignment: const AlignmentDirectional(0.0, 0.0),
                                child: Stack(
                                  children: [
                                    if (getJsonField(
                                          widget.chapters?[widget.index!],
                                          r'''$.cover''',
                                        ) ==
                                        getJsonField(
                                          FFAppState().quizStatus,
                                          r'''$.null''',
                                        ))
                                      ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(14.0),
                                        child: SvgPicture.asset(
                                          'assets/images/training.a4ae0304.svg',
                                          width: double.infinity,
                                          height: 199.0,
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                    if (getJsonField(
                                          _model.currChapter,
                                          r'''$.cover''',
                                        ) !=
                                        getJsonField(
                                          FFAppState().quizStatus,
                                          r'''$.null''',
                                        ))
                                      ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(14.0),
                                        child: Image.network(
                                          '${FFAppState().IMAGEURL}${getJsonField(
                                            _model.currChapter,
                                            r'''$.cover''',
                                          ).toString()}',
                                          width: double.infinity,
                                          height: 199.0,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                              if (getJsonField(
                                    widget.chapters?[widget.index!],
                                    r'''$.description''',
                                  ) !=
                                  null)
                                Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Description',
                                        style: FlutterFlowTheme.of(context)
                                            .titleMedium
                                            .override(
                                              fontFamily: 'SF Pro Display',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              useGoogleFonts: false,
                                            ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 20.0, 0.0, 0.0),
                                        child: Html(
                                          data: getJsonField(
                                            widget.chapters![widget.index!],
                                            r'''$.description''',
                                          ).toString(),
                                          onLinkTap: (url, _, __, ___) =>
                                              launchURL(url!),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              Container(
                                width: double.infinity,
                                height: 380.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                child: Builder(
                                  builder: (context) {
                                    final content = getJsonField(
                                      _model.currChapter,
                                      r'''$.contents''',
                                    ).toList();
                                    return ListView.separated(
                                      padding: EdgeInsets.zero,
                                      primary: false,
                                      shrinkWrap: true,
                                      scrollDirection: Axis.vertical,
                                      itemCount: content.length,
                                      separatorBuilder: (_, __) =>
                                          const SizedBox(height: 10.0),
                                      itemBuilder: (context, contentIndex) {
                                        final contentItem =
                                            content[contentIndex];
                                        return Column(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            if (getJsonField(
                                                  contentItem,
                                                  r'''$.media_type''',
                                                ) ==
                                                getJsonField(
                                                  FFAppState().contentType,
                                                  r'''$.audio''',
                                                ))
                                              Builder(
                                                builder: (context) {
                                                  final audio = getJsonField(
                                                    contentItem,
                                                    r'''$.media''',
                                                  ).toList();
                                                  return ListView.builder(
                                                    padding:
                                                        const EdgeInsets.fromLTRB(
                                                      0,
                                                      10.0,
                                                      0,
                                                      0,
                                                    ),
                                                    primary: false,
                                                    shrinkWrap: true,
                                                    scrollDirection:
                                                        Axis.vertical,
                                                    itemCount: audio.length,
                                                    itemBuilder:
                                                        (context, audioIndex) {
                                                      final audioItem =
                                                          audio[audioIndex];
                                                      return FlutterFlowAudioPlayer(
                                                        audio: Audio.network(
                                                          '${FFAppState().AUDIOURL}${getJsonField(
                                                            audioItem,
                                                            r'''$.url''',
                                                          ).toString()}',
                                                          metas: Metas(
                                                            id: 'sample3.mp3-c7cb4f1f',
                                                            title: functions
                                                                    .isTextFieldEmpty(
                                                                        getJsonField(
                                                              contentItem,
                                                              r'''$.title''',
                                                            ).toString())
                                                                ? getJsonField(
                                                                    audioItem,
                                                                    r'''$.file_name''',
                                                                  ).toString()
                                                                : getJsonField(
                                                                    contentItem,
                                                                    r'''$.title''',
                                                                  ).toString(),
                                                          ),
                                                        ),
                                                        titleTextStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'SF Pro Display',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  useGoogleFonts:
                                                                      false,
                                                                ),
                                                        playbackDurationTextStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium,
                                                        fillColor: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                        playbackButtonColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        activeTrackColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .alternate,
                                                        elevation: 4.0,
                                                        playInBackground:
                                                            PlayInBackground
                                                                .disabledPause,
                                                      );
                                                    },
                                                  );
                                                },
                                              ),
                                            if (getJsonField(
                                                  contentItem,
                                                  r'''$.media_type''',
                                                ) ==
                                                getJsonField(
                                                  FFAppState().contentType,
                                                  r'''$.video''',
                                                ))
                                              Builder(
                                                builder: (context) {
                                                  final video = getJsonField(
                                                    contentItem,
                                                    r'''$.media''',
                                                  ).toList();
                                                  return ListView.builder(
                                                    padding: EdgeInsets.zero,
                                                    primary: false,
                                                    shrinkWrap: true,
                                                    scrollDirection:
                                                        Axis.vertical,
                                                    itemCount: video.length,
                                                    itemBuilder:
                                                        (context, videoIndex) {
                                                      final videoItem =
                                                          video[videoIndex];
                                                      return Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          if (getJsonField(
                                                                videoItem,
                                                                r'''$.video_type''',
                                                              ) ==
                                                              getJsonField(
                                                                FFAppState()
                                                                    .contentType,
                                                                r'''$.youtube''',
                                                              ))
                                                            FlutterFlowYoutubePlayer(
                                                              url: getJsonField(
                                                                videoItem,
                                                                r'''$.url''',
                                                              ).toString(),
                                                              autoPlay: false,
                                                              looping: true,
                                                              mute: false,
                                                              showControls:
                                                                  true,
                                                              showFullScreen:
                                                                  false,
                                                              strictRelatedVideos:
                                                                  false,
                                                            ),
                                                        ],
                                                      );
                                                    },
                                                  );
                                                },
                                              ),
                                            if (getJsonField(
                                                  contentItem,
                                                  r'''$.media_type''',
                                                ) ==
                                                getJsonField(
                                                  FFAppState().contentType,
                                                  r'''$.text''',
                                                ))
                                              Column(
                                                mainAxisSize: MainAxisSize.min,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    getJsonField(
                                                      contentItem,
                                                      r'''$.title''',
                                                    ).toString(),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .titleMedium
                                                        .override(
                                                          fontFamily:
                                                              'SF Pro Display',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          useGoogleFonts: false,
                                                        ),
                                                  ),
                                                  Html(
                                                    data: getJsonField(
                                                      contentItem,
                                                      r'''$.lesson''',
                                                    ).toString(),
                                                    onLinkTap:
                                                        (url, _, __, ___) =>
                                                            launchURL(url!),
                                                  ),
                                                ].divide(
                                                    const SizedBox(height: 10.0)),
                                              ),
                                            if (getJsonField(
                                                  contentItem,
                                                  r'''$.media_type''',
                                                ) ==
                                                getJsonField(
                                                  FFAppState().contentType,
                                                  r'''$.image''',
                                                ))
                                              Builder(
                                                builder: (context) {
                                                  final image = getJsonField(
                                                    contentItem,
                                                    r'''$.media''',
                                                  ).toList();
                                                  return ListView.builder(
                                                    padding: EdgeInsets.zero,
                                                    primary: false,
                                                    shrinkWrap: true,
                                                    scrollDirection:
                                                        Axis.vertical,
                                                    itemCount: image.length,
                                                    itemBuilder:
                                                        (context, imageIndex) {
                                                      final imageItem =
                                                          image[imageIndex];
                                                      return ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(24.0),
                                                        child: Image.network(
                                                          '${FFAppState().IMAGEURL}${getJsonField(
                                                            imageItem,
                                                            r'''$.url''',
                                                          ).toString()}',
                                                          width:
                                                              double.infinity,
                                                          height: 300.0,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      );
                                                    },
                                                  );
                                                },
                                              ),
                                          ],
                                        );
                                      },
                                    );
                                  },
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
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 10.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      FFButtonWidget(
                        onPressed: () async {
                          FFAppState()
                              .clearGetTrainingListCacheKey(currentUserUid);
                          FFAppState().clearGetQuizListCacheKey(currentUserUid);

                          context.pushNamed('training_list');
                        },
                        text: 'Save & Exit',
                        icon: const Icon(
                          Icons.keyboard_backspace,
                          size: 15.0,
                        ),
                        options: FFButtonOptions(
                          width: 164.0,
                          height: 50.0,
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              24.0, 0.0, 24.0, 0.0),
                          iconPadding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: const Color(0xFFF1EEFE),
                          textStyle: const TextStyle(
                            fontFamily: 'SF Pro Display Bold',
                            color: Color(0xFF725DFF),
                            fontSize: 14.0,
                          ),
                          borderSide: const BorderSide(
                            color: Colors.transparent,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(14.0, 0.0, 0.0, 0.0),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            var shouldSetState = false;
                            if (_model.isTimerEnd) {
                              if (!getJsonField(
                                _model.currChapter,
                                r'''$.is_completed''',
                              )) {
                                _model.apiResult09l = await BaseUrlGroup
                                    .storeChapterProgressionCall
                                    .call(
                                  chapterId: getJsonField(
                                    _model.currChapter,
                                    r'''$.id''',
                                  ).toString(),
                                  userId: currentUserUid,
                                  trainingId: widget.trainingId,
                                  duration: functions.getDurationComplete(
                                      FFAppState().startingTime!,
                                      getCurrentTimestamp),
                                );
                                shouldSetState = true;
                                if (!(_model.apiResult09l?.succeeded ?? true)) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        'Store chapter progression failed.',
                                        style: TextStyle(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                        ),
                                      ),
                                      duration: const Duration(milliseconds: 4000),
                                      backgroundColor:
                                          FlutterFlowTheme.of(context)
                                              .secondary,
                                    ),
                                  );
                                  if (shouldSetState) setState(() {});
                                  return;
                                }
                              }
                              if (getJsonField(
                                    _model.currChapter,
                                    r'''$.quiz''',
                                  ) ==
                                  getJsonField(
                                    FFAppState().quizStatus,
                                    r'''$.null''',
                                  )) {
                                if (widget.chapters?.length ==
                                    functions.getIndex(widget.index!)) {
                                  context.goNamed(
                                    'training_completed2',
                                    queryParameters: {
                                      'trainingId': serializeParam(
                                        widget.trainingId,
                                        ParamType.String,
                                      ),
                                    }.withoutNulls,
                                  );
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
                                }

                                if (shouldSetState) setState(() {});
                                return;
                              } else {
                                context.pushNamed(
                                  'training_quiz',
                                  queryParameters: {
                                    'chapters': serializeParam(
                                      widget.chapters,
                                      ParamType.JSON,
                                      true,
                                    ),
                                    'index': serializeParam(
                                      widget.index,
                                      ParamType.int,
                                    ),
                                    'trainingId': serializeParam(
                                      widget.trainingId,
                                      ParamType.String,
                                    ),
                                  }.withoutNulls,
                                );

                                if (shouldSetState) setState(() {});
                                return;
                              }
                            } else {
                              _model.timerController.onStartTimer();
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'Please wait till timer ends.',
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
                              if (shouldSetState) setState(() {});
                              return;
                            }

                            if (shouldSetState) setState(() {});
                          },
                          child: Container(
                            width: 164.0,
                            decoration: BoxDecoration(
                              color: valueOrDefault<Color>(
                                _model.isTimerEnd
                                    ? FlutterFlowTheme.of(context).trainingColor
                                    : FlutterFlowTheme.of(context).inputBorder,
                                FlutterFlowTheme.of(context).inputBorder,
                              ),
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            alignment: const AlignmentDirectional(0.0, 0.0),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  10.0, 5.0, 10.0, 5.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Next Chapter',
                                        style: TextStyle(
                                          fontFamily: 'SF Pro Display Bold',
                                          color: valueOrDefault<Color>(
                                            _model.isTimerEnd
                                                ? FlutterFlowTheme.of(context)
                                                    .primaryBackground
                                                : FlutterFlowTheme.of(context)
                                                    .secondaryText,
                                            FlutterFlowTheme.of(context)
                                                .secondaryText,
                                          ),
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14.0,
                                        ),
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 5.0, 0.0),
                                            child: Icon(
                                              Icons.access_time,
                                              color: valueOrDefault<Color>(
                                                _model.isTimerEnd
                                                    ? FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBackground
                                                    : FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryText,
                                                FlutterFlowTheme.of(context)
                                                    .secondaryText,
                                              ),
                                              size: 20.0,
                                            ),
                                          ),
                                          FlutterFlowTimer(
                                            initialTime: getJsonField(
                                              widget.chapters![widget.index!],
                                              r'''$.is_completed''',
                                            )
                                                ? 0
                                                : functions
                                                    .getCountDownTImerForChapter(
                                                        getJsonField(
                                                    _model.currChapter,
                                                    r'''$.duration''',
                                                  ).toString()),
                                            getDisplayTime: (value) =>
                                                StopWatchTimer.getDisplayTime(
                                                    value,
                                                    milliSecond: false),
                                            controller: _model.timerController,
                                            updateStateInterval:
                                                const Duration(milliseconds: 1000),
                                            onChanged: (value, displayTime,
                                                shouldUpdate) {
                                              _model.timerMilliseconds = value;
                                              _model.timerValue = displayTime;
                                              if (shouldUpdate) setState(() {});
                                            },
                                            onEnded: () async {
                                              setState(() {
                                                _model.isTimerEnd = true;
                                              });
                                            },
                                            textAlign: TextAlign.start,
                                            style: FlutterFlowTheme.of(context)
                                                .headlineSmall
                                                .override(
                                                  fontFamily: 'SF Pro Display',
                                                  color: valueOrDefault<Color>(
                                                    _model.isTimerEnd
                                                        ? FlutterFlowTheme.of(
                                                                context)
                                                            .primaryBackground
                                                        : FlutterFlowTheme.of(
                                                                context)
                                                            .secondaryText,
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                  ),
                                                  fontSize: 14.0,
                                                  useGoogleFonts: false,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ].divide(const SizedBox(height: 5.0)),
                                  ),
                                  Icon(
                                    Icons.arrow_forward_ios,
                                    color: valueOrDefault<Color>(
                                      _model.isTimerEnd
                                          ? FlutterFlowTheme.of(context)
                                              .primaryBackground
                                          : FlutterFlowTheme.of(context)
                                              .secondaryText,
                                      FlutterFlowTheme.of(context)
                                          .secondaryText,
                                    ),
                                    size: 20.0,
                                  ),
                                ],
                              ),
                            ),
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
      ),
    );
  }
}
