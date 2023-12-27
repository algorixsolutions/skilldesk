import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';

import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/flutter_flow_audio_player.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_video_player.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
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
  _TrainingChapterContentWidgetState createState() =>
      _TrainingChapterContentWidgetState();
}

class _TrainingChapterContentWidgetState
    extends State<TrainingChapterContentWidget> {
  late TrainingChapterContentModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  bool isTimerEnd = false;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TrainingChapterContentModel());

    _model.timerController.onResetTimer();
    _model.timerController.onStartTimer();
    // On page load action.
    setState(() {
      FFAppState().currchapter = widget.chapters![widget.index!];
      // FFAppState().isTimerEnd = false;
    });
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
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      const EdgeInsetsDirectional.fromSTEB(0.0, 9.93, 0.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            20.0, 0.0, 0.0, 0.0),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            context.safePop();
                          },
                          child: Container(
                            width: 24.0,
                            height: 24.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                            ),
                            child: const Icon(
                              Icons.chevron_left,
                              color: Color(0xFF130F26),
                              size: 24.0,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                          ),
                          child: Text(
                            getJsonField(
                              widget.chapters![widget.index!],
                              r'''$.title''',
                            ).toString(),
                            style: TextStyle(
                              fontFamily: 'SF Pro Display Bold',
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 18.0,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(
                      24.0, 25.89, 0.0, 0.0),
                  child: Container(
                    height: 199.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    alignment: const AlignmentDirectional(0.0, 0.0),
                    child: Stack(
                      children: [
                        if (getJsonField(
                              FFAppState().currchapter,
                              r'''$.cover''',
                            ) ==
                            getJsonField(
                              FFAppState().quizStatus,
                              r'''$.null''',
                            ))
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 20.64, 24.0, 0.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: SvgPicture.asset(
                                'assets/images/training.a4ae0304.svg',
                                width: double.infinity,
                                height: 199.0,
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        if (getJsonField(
                              FFAppState().currchapter,
                              r'''$.cover''',
                            ) !=
                            getJsonField(
                              FFAppState().quizStatus,
                              r'''$.null''',
                            ))
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 20.64, 24.0, 0.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: Image.network(
                                '${FFAppState().IMAGEURL}${getJsonField(
                                  FFAppState().currchapter,
                                  r'''$.cover''',
                                ).toString()}',
                                width: double.infinity,
                                height: 199.0,
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            0.0, 0.0, 10.0, 0.0),
                        child: Icon(
                          Icons.access_time,
                          color: FlutterFlowTheme.of(context).secondaryText,
                          size: 24.0,
                        ),
                      ),
                      FlutterFlowTimer(
                        initialTime:
                            functions.getCountDownTImerForChapter(getJsonField(
                          FFAppState().currchapter,
                          r'''$.duration''',
                        ).toString()),
                        getDisplayTime: (value) =>
                            StopWatchTimer.getDisplayTime(value,
                                milliSecond: false),
                        controller: _model.timerController,
                        updateStateInterval: const Duration(milliseconds: 1000),
                        onChanged: (value, displayTime, shouldUpdate) {
                          _model.timerMilliseconds = value;
                          _model.timerValue = displayTime;
                          if (shouldUpdate) setState(() {});
                        },
                        onEnded: () async {
                          setState(() {
                            isTimerEnd = true;
                          });
                        },
                        textAlign: TextAlign.start,
                        style:
                            FlutterFlowTheme.of(context).headlineSmall.override(
                                  fontFamily: 'Outfit',
                                  fontSize: 18.0,
                                ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                  child: Container(
                    width: double.infinity,
                    height: 380.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Builder(
                        builder: (context) {
                          final content = getJsonField(
                            FFAppState().currchapter,
                            r'''$.contents''',
                          ).toList();
                          return ListView.separated(
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: content.length,
                            separatorBuilder: (_, __) =>
                                const SizedBox(height: 10.0),
                            itemBuilder: (context, contentIndex) {
                              final contentItem = content[contentIndex];
                              return SingleChildScrollView(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                            padding: EdgeInsets.zero,
                                            shrinkWrap: true,
                                            scrollDirection: Axis.vertical,
                                            itemCount: audio.length,
                                            itemBuilder: (context, audioIndex) {
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
                                                    title: getJsonField(
                                                      contentItem,
                                                      r'''$.title''',
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
                                            shrinkWrap: true,
                                            scrollDirection: Axis.vertical,
                                            itemCount: video.length,
                                            itemBuilder: (context, videoIndex) {
                                              final videoItem =
                                                  video[videoIndex];
                                              return FlutterFlowVideoPlayer(
                                                path: '${getJsonField(
                                                  videoItem,
                                                  r'''$.url''',
                                                ).toString()}',
                                                videoType: VideoType.network,
                                                autoPlay: false,
                                                looping: false,
                                                showControls: true,
                                                allowFullScreen: true,
                                                allowPlaybackSpeedMenu: false,
                                                lazyLoad: false,
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
                                            style: FlutterFlowTheme.of(context)
                                                .titleLarge,
                                          ),
                                          Text(
                                            functions
                                                .removeHtmlTags(getJsonField(
                                              contentItem,
                                              r'''$.lesson''',
                                            ).toString()),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium,
                                          ),
                                        ].divide(const SizedBox(height: 10.0)),
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
                                            shrinkWrap: true,
                                            scrollDirection: Axis.vertical,
                                            itemCount: image.length,
                                            itemBuilder: (context, imageIndex) {
                                              final imageItem =
                                                  image[imageIndex];
                                              return ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(24.0),
                                                child: Image.network(
                                                  '${FFAppState().IMAGEURL}${getJsonField(
                                                    imageItem,
                                                    r'''$.url''',
                                                  ).toString()}',
                                                  width: double.infinity,
                                                  height: 300.0,
                                                  fit: BoxFit.cover,
                                                ),
                                              );
                                            },
                                          );
                                        },
                                      ),
                                  ],
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      FFButtonWidget(
                        onPressed: () async {
                          // context.safePop();
                          context.pushNamed('training_list');
                        },
                        text: 'Save & Exit',
                        icon: Icon(
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
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            14.0, 0.0, 0.0, 0.0),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            var _shouldSetState = false;
                            if (isTimerEnd) {
                              _model.apiResult09l = await BaseUrlGroup
                                  .storeChapterProgressionCall
                                  .call(
                                chapterId: getJsonField(
                                  FFAppState().currchapter,
                                  r'''$.id''',
                                ).toString(),
                                userId: currentUserUid,
                                trainingId: widget.trainingId,
                              );

                              _shouldSetState = true;

                              if ((_model.apiResult09l?.succeeded ?? true)) {
                                if (getJsonField(
                                      FFAppState().currchapter,
                                      r'''$.quiz''',
                                    ) ==
                                    getJsonField(
                                      FFAppState().quizStatus,
                                      r'''$.null''',
                                    )) {
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
                                        duration:
                                            const Duration(milliseconds: 4000),
                                        backgroundColor:
                                            FlutterFlowTheme.of(context)
                                                .secondary,
                                      ),
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

                                  if (_shouldSetState) setState(() {});

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

                                  if (_shouldSetState) setState(() {});
                                  return;
                                }
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      'Store chapter progression failed.',
                                      style: TextStyle(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                      ),
                                    ),
                                    duration:
                                        const Duration(milliseconds: 4000),
                                    backgroundColor:
                                        FlutterFlowTheme.of(context).secondary,
                                  ),
                                );

                                if (_shouldSetState) setState(() {});

                                return;
                              }
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'Please Wait till timer ends.',
                                    style: TextStyle(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                    ),
                                  ),
                                  duration: Duration(milliseconds: 4000),
                                  backgroundColor:
                                      FlutterFlowTheme.of(context).secondary,
                                ),
                              );

                              if (_shouldSetState) setState(() {});
                              return;
                            }

                            if (_shouldSetState) setState(() {});
                          },
                          child: Container(
                            width: 140.0,
                            height: 50.0,
                            decoration: BoxDecoration(
                              color:
                                  isTimerEnd ? Color(0xFF725DFF) : Colors.grey,
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            alignment: AlignmentDirectional(0.00, 0.00),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Column(
                                  children: [
                                    Text(
                                      'Next Chapter',
                                      style: TextStyle(
                                        fontFamily: 'SF Pro Display Bold',
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14.0,
                                      ),
                                    ),
                                    FlutterFlowTimer(
                                      initialTime:
                                          functions.getCountDownTImerForChapter(
                                              getJsonField(
                                        FFAppState().currchapter,
                                        r'''$.duration''',
                                      ).toString()),
                                      getDisplayTime: (value) =>
                                          StopWatchTimer.getDisplayTime(value,
                                              milliSecond: false),
                                      controller: _model.timerController,
                                      updateStateInterval:
                                          Duration(milliseconds: 1000),
                                      onChanged:
                                          (value, displayTime, shouldUpdate) {
                                        _model.timerMilliseconds = value;
                                        _model.timerValue = displayTime;
                                        if (shouldUpdate) setState(() {});
                                      },
                                      onEnded: () async {
                                        setState(() {
                                          isTimerEnd = true;
                                        });
                                      },
                                      textAlign: TextAlign.start,
                                      style: FlutterFlowTheme.of(context)
                                          .headlineSmall
                                          .override(
                                            color: Colors.white,
                                            fontFamily: 'Outfit',
                                            fontSize: 18.0,
                                          ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 10, 0.0),
                                  child: Icon(
                                    Icons.arrow_forward_ios,
                                    color: Colors.white,
                                    size: 20.0,
                                  ),
                                ),
                              ],
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
