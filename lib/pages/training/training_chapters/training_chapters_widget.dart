import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/components/custom_appbar_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'training_chapters_model.dart';
export 'training_chapters_model.dart';

class TrainingChaptersWidget extends StatefulWidget {
  const TrainingChaptersWidget({
    super.key,
    required this.training,
  });

  final dynamic training;

  @override
  State<TrainingChaptersWidget> createState() => _TrainingChaptersWidgetState();
}

class _TrainingChaptersWidgetState extends State<TrainingChaptersWidget> {
  late TrainingChaptersModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TrainingChaptersModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      FFAppState().trainingAfterQuiz = widget.training!;
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
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        wrapWithModel(
                          model: _model.customAppbarModel,
                          updateCallback: () => setState(() {}),
                          child: CustomAppbarWidget(
                            parameter1: getJsonField(
                              widget.training,
                              r'''$.title''',
                            ).toString(),
                          ),
                        ),
                        Align(
                          alignment: const AlignmentDirectional(0.0, 0.0),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 20.0, 0.0, 0.0),
                            child: Container(
                              width: MediaQuery.sizeOf(context).width * 1.0,
                              height: 199.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                borderRadius: BorderRadius.circular(14.0),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(14.0),
                                child: Image.network(
                                  getJsonField(
                                            widget.training,
                                            r'''$.cover''',
                                          ) ==
                                          getJsonField(
                                            FFAppState().quizStatus,
                                            r'''$.null''',
                                          )
                                      ? 'https://upload.wikimedia.org/wikipedia/commons/6/65/No-Image-Placeholder.svg'
                                      : '${FFAppState().IMAGEURL}${getJsonField(
                                          widget.training,
                                          r'''$.cover''',
                                        ).toString()}',
                                  width: 342.0,
                                  height: 199.0,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 40.0, 0.0, 0.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                            ),
                            child: const Text(
                              'Chapters',
                              style: TextStyle(
                                fontFamily: 'SF Pro Display Bold',
                                fontWeight: FontWeight.w600,
                                fontSize: 14.0,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 20.0, 0.0, 20.0),
                          child: Builder(
                            builder: (context) {
                              final chapter = getJsonField(
                                widget.training,
                                r'''$.chapters''',
                              ).toList();
                              return ListView.separated(
                                padding: EdgeInsets.zero,
                                primary: false,
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemCount: chapter.length,
                                separatorBuilder: (_, __) =>
                                    const SizedBox(height: 10.0),
                                itemBuilder: (context, chapterIndex) {
                                  final chapterItem = chapter[chapterIndex];
                                  return InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      var shouldSetState = false;
                                      if (chapterIndex > 0) {
                                        if (!(getJsonField(
                                              functions.getItemInSpecificIndex(
                                                  getJsonField(
                                                    widget.training,
                                                    r'''$.chapters''',
                                                    true,
                                                  )!,
                                                  chapterIndex - 1),
                                              r'''$.is_completed''',
                                            ) &&
                                            functions
                                                .isQuizCompleted(getJsonField(
                                              functions.getItemInSpecificIndex(
                                                  getJsonField(
                                                    widget.training,
                                                    r'''$.chapters''',
                                                    true,
                                                  )!,
                                                  chapterIndex - 1),
                                              r'''$.quiz''',
                                            )))) {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                'Please complete the previous chapter first.',
                                                style: TextStyle(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBackground,
                                                ),
                                              ),
                                              duration:
                                                  const Duration(milliseconds: 2000),
                                              backgroundColor:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                            ),
                                          );
                                          if (shouldSetState) setState(() {});
                                          return;
                                        }
                                      } else {
                                        if (!getJsonField(
                                          widget.training,
                                          r'''$.is_started''',
                                        )) {
                                          _model.apiResultdr3 =
                                              await BaseUrlGroup
                                                  .startTrainingCall
                                                  .call(
                                            userId: currentUserUid,
                                            trainingId: getJsonField(
                                              widget.training,
                                              r'''$.id''',
                                            ).toString(),
                                          );
                                          shouldSetState = true;
                                        }
                                      }

                                      context.pushNamed(
                                        'training_chapter_contentCopyCopy',
                                        queryParameters: {
                                          'chapters': serializeParam(
                                            getJsonField(
                                              widget.training,
                                              r'''$.chapters''',
                                              true,
                                            ),
                                            ParamType.JSON,
                                            true,
                                          ),
                                          'trainingId': serializeParam(
                                            getJsonField(
                                              widget.training,
                                              r'''$.id''',
                                            ).toString(),
                                            ParamType.String,
                                          ),
                                          'index': serializeParam(
                                            chapterIndex,
                                            ParamType.int,
                                          ),
                                        }.withoutNulls,
                                      );

                                      if (shouldSetState) setState(() {});
                                    },
                                    child: Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        color: getJsonField(
                                                  chapterItem,
                                                  r'''$.is_completed''',
                                                ) &&
                                                functions.isQuizCompleted(
                                                    getJsonField(
                                                  chapterItem,
                                                  r'''$.quiz''',
                                                ))
                                            ? FlutterFlowTheme.of(context)
                                                .trainingColor
                                            : FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                        boxShadow: const [
                                          BoxShadow(
                                            blurRadius: 4.0,
                                            color: Color(0x33000000),
                                            offset: Offset(0.0, 2.0),
                                          )
                                        ],
                                        borderRadius:
                                            BorderRadius.circular(16.0),
                                        border: Border.all(
                                          color: (chapterIndex > 0
                                                  ? (getJsonField(
                                                        functions
                                                            .getItemInSpecificIndex(
                                                                getJsonField(
                                                                  widget
                                                                      .training,
                                                                  r'''$.chapters''',
                                                                  true,
                                                                )!,
                                                                chapterIndex -
                                                                    1),
                                                        r'''$.is_completed''',
                                                      ) &&
                                                      functions.isQuizCompleted(
                                                          getJsonField(
                                                        functions
                                                            .getItemInSpecificIndex(
                                                                getJsonField(
                                                                  widget
                                                                      .training,
                                                                  r'''$.chapters''',
                                                                  true,
                                                                )!,
                                                                chapterIndex -
                                                                    1),
                                                        r'''$.quiz''',
                                                      )))
                                                  : true)
                                              ? FlutterFlowTheme.of(context)
                                                  .trainingColor
                                              : FlutterFlowTheme.of(context)
                                                  .quizDefaultBorder,
                                          width: 1.0,
                                        ),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(
                                              flex: 2,
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  FaIcon(
                                                    FontAwesomeIcons.bookOpen,
                                                    color: () {
                                                      if (getJsonField(
                                                            chapterItem,
                                                            r'''$.is_completed''',
                                                          ) &&
                                                          functions
                                                              .isQuizCompleted(
                                                                  getJsonField(
                                                            chapterItem,
                                                            r'''$.quiz''',
                                                          ))) {
                                                        return FlutterFlowTheme
                                                                .of(context)
                                                            .primaryBackground;
                                                      } else if (chapterIndex >
                                                              0
                                                          ? (getJsonField(
                                                                functions
                                                                    .getItemInSpecificIndex(
                                                                        getJsonField(
                                                                          widget
                                                                              .training,
                                                                          r'''$.chapters''',
                                                                          true,
                                                                        )!,
                                                                        chapterIndex -
                                                                            1),
                                                                r'''$.is_completed''',
                                                              ) &&
                                                              functions
                                                                  .isQuizCompleted(
                                                                      getJsonField(
                                                                functions
                                                                    .getItemInSpecificIndex(
                                                                        getJsonField(
                                                                          widget
                                                                              .training,
                                                                          r'''$.chapters''',
                                                                          true,
                                                                        )!,
                                                                        chapterIndex -
                                                                            1),
                                                                r'''$.quiz''',
                                                              )))
                                                          : true) {
                                                        return FlutterFlowTheme
                                                                .of(context)
                                                            .primaryText;
                                                      } else {
                                                        return FlutterFlowTheme
                                                                .of(context)
                                                            .quizDefaultBorder;
                                                      }
                                                    }(),
                                                    size: 24.0,
                                                  ),
                                                  Container(
                                                    width: 200.0,
                                                    decoration: const BoxDecoration(),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          getJsonField(
                                                            chapterItem,
                                                            r'''$.title''',
                                                          ).toString(),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'SF Pro Display',
                                                                color: () {
                                                                  if (getJsonField(
                                                                        chapterItem,
                                                                        r'''$.is_completed''',
                                                                      ) &&
                                                                      functions
                                                                          .isQuizCompleted(
                                                                              getJsonField(
                                                                        chapterItem,
                                                                        r'''$.quiz''',
                                                                      ))) {
                                                                    return FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryBackground;
                                                                  } else if (chapterIndex >
                                                                          0
                                                                      ? (getJsonField(
                                                                            functions.getItemInSpecificIndex(
                                                                                getJsonField(
                                                                                  widget.training,
                                                                                  r'''$.chapters''',
                                                                                  true,
                                                                                )!,
                                                                                chapterIndex - 1),
                                                                            r'''$.is_completed''',
                                                                          ) &&
                                                                          functions
                                                                              .isQuizCompleted(getJsonField(
                                                                            functions.getItemInSpecificIndex(
                                                                                getJsonField(
                                                                                  widget.training,
                                                                                  r'''$.chapters''',
                                                                                  true,
                                                                                )!,
                                                                                chapterIndex - 1),
                                                                            r'''$.quiz''',
                                                                          )))
                                                                      : true) {
                                                                    return FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText;
                                                                  } else {
                                                                    return FlutterFlowTheme.of(
                                                                            context)
                                                                        .quizDefaultBorder;
                                                                  }
                                                                }(),
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                useGoogleFonts:
                                                                    false,
                                                              ),
                                                        ),
                                                        Text(
                                                          functions
                                                              .removeHtmlTags(
                                                                  getJsonField(
                                                            chapterItem,
                                                            r'''$.description''',
                                                          ).toString()),
                                                          maxLines: 1,
                                                          style: TextStyle(
                                                            color: () {
                                                              if (getJsonField(
                                                                    chapterItem,
                                                                    r'''$.is_completed''',
                                                                  ) &&
                                                                  functions
                                                                      .isQuizCompleted(
                                                                          getJsonField(
                                                                    chapterItem,
                                                                    r'''$.quiz''',
                                                                  ))) {
                                                                return FlutterFlowTheme.of(
                                                                        context)
                                                                    .accent4;
                                                              } else if (chapterIndex >
                                                                      0
                                                                  ? (getJsonField(
                                                                        functions.getItemInSpecificIndex(
                                                                            getJsonField(
                                                                              widget.training,
                                                                              r'''$.chapters''',
                                                                              true,
                                                                            )!,
                                                                            chapterIndex - 1),
                                                                        r'''$.is_completed''',
                                                                      ) &&
                                                                      functions
                                                                          .isQuizCompleted(
                                                                              getJsonField(
                                                                        functions.getItemInSpecificIndex(
                                                                            getJsonField(
                                                                              widget.training,
                                                                              r'''$.chapters''',
                                                                              true,
                                                                            )!,
                                                                            chapterIndex - 1),
                                                                        r'''$.quiz''',
                                                                      )))
                                                                  : true) {
                                                                return FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText;
                                                              } else {
                                                                return FlutterFlowTheme.of(
                                                                        context)
                                                                    .quizDefaultBorder;
                                                              }
                                                            }(),
                                                            fontSize: 10.0,
                                                          ),
                                                        ),
                                                      ].divide(const SizedBox(
                                                          height: 5.0)),
                                                    ),
                                                  ),
                                                ].divide(const SizedBox(width: 10.0)),
                                              ),
                                            ),
                                            Expanded(
                                              flex: 1,
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  if (getJsonField(
                                                        chapterItem,
                                                        r'''$.quiz''',
                                                      ) !=
                                                      getJsonField(
                                                        FFAppState().quizStatus,
                                                        r'''$.null''',
                                                      ))
                                                    Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  5.0,
                                                                  0.0),
                                                      child: Icon(
                                                        FFIcons
                                                            .kjeuxIconeArtboard301Colors01,
                                                        color: () {
                                                          if (getJsonField(
                                                                chapterItem,
                                                                r'''$.is_completed''',
                                                              ) &&
                                                              functions
                                                                  .isQuizCompleted(
                                                                      getJsonField(
                                                                chapterItem,
                                                                r'''$.quiz''',
                                                              ))) {
                                                            return FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryBackground;
                                                          } else if (chapterIndex >
                                                                  0
                                                              ? (getJsonField(
                                                                    functions.getItemInSpecificIndex(
                                                                        getJsonField(
                                                                          widget
                                                                              .training,
                                                                          r'''$.chapters''',
                                                                          true,
                                                                        )!,
                                                                        chapterIndex - 1),
                                                                    r'''$.is_completed''',
                                                                  ) &&
                                                                  functions
                                                                      .isQuizCompleted(
                                                                          getJsonField(
                                                                    functions.getItemInSpecificIndex(
                                                                        getJsonField(
                                                                          widget
                                                                              .training,
                                                                          r'''$.chapters''',
                                                                          true,
                                                                        )!,
                                                                        chapterIndex - 1),
                                                                    r'''$.quiz''',
                                                                  )))
                                                              : true) {
                                                            return FlutterFlowTheme
                                                                    .of(context)
                                                                .quizColor;
                                                          } else {
                                                            return FlutterFlowTheme
                                                                    .of(context)
                                                                .quizDefaultBorder;
                                                          }
                                                        }(),
                                                        size: 24.0,
                                                      ),
                                                    ),
                                                  Icon(
                                                    Icons.access_time,
                                                    color: () {
                                                      if (getJsonField(
                                                            chapterItem,
                                                            r'''$.is_completed''',
                                                          ) &&
                                                          functions
                                                              .isQuizCompleted(
                                                                  getJsonField(
                                                            chapterItem,
                                                            r'''$.quiz''',
                                                          ))) {
                                                        return FlutterFlowTheme
                                                                .of(context)
                                                            .primaryBackground;
                                                      } else if (chapterIndex >
                                                              0
                                                          ? (getJsonField(
                                                                functions
                                                                    .getItemInSpecificIndex(
                                                                        getJsonField(
                                                                          widget
                                                                              .training,
                                                                          r'''$.chapters''',
                                                                          true,
                                                                        )!,
                                                                        chapterIndex -
                                                                            1),
                                                                r'''$.is_completed''',
                                                              ) &&
                                                              functions
                                                                  .isQuizCompleted(
                                                                      getJsonField(
                                                                functions
                                                                    .getItemInSpecificIndex(
                                                                        getJsonField(
                                                                          widget
                                                                              .training,
                                                                          r'''$.chapters''',
                                                                          true,
                                                                        )!,
                                                                        chapterIndex -
                                                                            1),
                                                                r'''$.quiz''',
                                                              )))
                                                          : true) {
                                                        return FlutterFlowTheme
                                                                .of(context)
                                                            .primaryText;
                                                      } else {
                                                        return FlutterFlowTheme
                                                                .of(context)
                                                            .quizDefaultBorder;
                                                      }
                                                    }(),
                                                    size: 20.0,
                                                  ),
                                                  Text(
                                                    getJsonField(
                                                      chapterItem,
                                                      r'''$.duration''',
                                                    ).toString(),
                                                    style:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'SF Pro Display',
                                                              color: () {
                                                                if (getJsonField(
                                                                      chapterItem,
                                                                      r'''$.is_completed''',
                                                                    ) &&
                                                                    functions
                                                                        .isQuizCompleted(
                                                                            getJsonField(
                                                                      chapterItem,
                                                                      r'''$.quiz''',
                                                                    ))) {
                                                                  return FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryBackground;
                                                                } else if (chapterIndex >
                                                                        0
                                                                    ? (getJsonField(
                                                                          functions.getItemInSpecificIndex(
                                                                              getJsonField(
                                                                                widget.training,
                                                                                r'''$.chapters''',
                                                                                true,
                                                                              )!,
                                                                              chapterIndex - 1),
                                                                          r'''$.is_completed''',
                                                                        ) &&
                                                                        functions
                                                                            .isQuizCompleted(getJsonField(
                                                                          functions.getItemInSpecificIndex(
                                                                              getJsonField(
                                                                                widget.training,
                                                                                r'''$.chapters''',
                                                                                true,
                                                                              )!,
                                                                              chapterIndex - 1),
                                                                          r'''$.quiz''',
                                                                        )))
                                                                    : true) {
                                                                  return FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText;
                                                                } else {
                                                                  return FlutterFlowTheme.of(
                                                                          context)
                                                                      .quizDefaultBorder;
                                                                }
                                                              }(),
                                                              fontSize: 12.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .normal,
                                                              useGoogleFonts:
                                                                  false,
                                                            ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ].divide(const SizedBox(width: 10.0)),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
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
      ),
    );
  }
}
