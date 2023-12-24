import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'training_chapters_model.dart';

export 'training_chapters_model.dart';

class TrainingChaptersWidget extends StatefulWidget {
  const TrainingChaptersWidget({
    Key? key,
    required this.training,
  }) : super(key: key);

  final dynamic training;

  @override
  _TrainingChaptersWidgetState createState() => _TrainingChaptersWidgetState();
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
      setState(() {
        FFAppState().trainingAfterQuiz = widget.training!;
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
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 9.93, 0.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 40.0, 0.0),
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
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              context.safePop();
                            },
                            child: Icon(
                              Icons.chevron_left,
                              color: Color(0xFF130F26),
                              size: 24.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 84.0, 0.0),
                      child: AutoSizeText(
                        getJsonField(
                          widget.training,
                          r'''$.title''',
                        ).toString().maybeHandleOverflow(maxChars: 25),
                        style: TextStyle(
                          fontFamily: 'SF Pro Display Bold',
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 18.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 25.89, 0.0, 0.0),
                child: Container(
                  width: 342.0,
                  height: 199.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    borderRadius: BorderRadius.circular(14.0),
                  ),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 20.64, 0.0, 0.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
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
                padding: EdgeInsetsDirectional.fromSTEB(26.0, 39.07, 0, 0.0),
                child: Container(
                  height: 16.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  child: Text(
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
                padding: EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 20.0),
                child: Builder(
                  builder: (context) {
                    final chapter = getJsonField(
                      widget.training,
                      r'''$.chapters''',
                    ).toList();
                    return ListView.separated(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: chapter.length,
                      separatorBuilder: (_, __) => SizedBox(height: 5.0),
                      itemBuilder: (context, chapterIndex) {
                        final chapterItem = chapter[chapterIndex];
                        return Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              10.0, 10.0, 10.0, 10.0),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              if (chapterIndex == 0 ||
                                  chapter[chapterIndex - 1]['is_completed']) {
                                context.pushNamed(
                                  'training_chapter_content',
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
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      'Please complete the previous chapter first.',
                                      style: TextStyle(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                      ),
                                    ),
                                    duration: Duration(milliseconds: 2000),
                                    backgroundColor:
                                        FlutterFlowTheme.of(context).secondary,
                                  ),
                                );
                              }
                            },
                            child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: getJsonField(
                                  chapterItem,
                                  r'''$.is_completed''',
                                )
                                    ? FlutterFlowTheme.of(context).trainingColor
                                    : FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 4.0,
                                    color: Color(0x33000000),
                                    offset: Offset(0.0, 2.0),
                                  )
                                ],
                                borderRadius: BorderRadius.circular(12.0),
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context)
                                      .trainingColor,
                                  width: 2.0,
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    20.0, 10.0, 20.0, 10.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    FaIcon(
                                      FontAwesomeIcons.bookOpen,
                                      color: getJsonField(
                                        chapterItem,
                                        r'''$.is_completed''',
                                      )
                                          ? FlutterFlowTheme.of(context)
                                              .primaryBackground
                                          : FlutterFlowTheme.of(context)
                                              .primaryText,
                                      size: 24.0,
                                    ),
                                    Container(
                                      width: 130.0,
                                      decoration: BoxDecoration(
                                        color: getJsonField(
                                          chapterItem,
                                          r'''$.is_completed''',
                                        )
                                            ? FlutterFlowTheme.of(context)
                                                .trainingColor
                                            : FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                      ),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          AutoSizeText(
                                            getJsonField(
                                              chapterItem,
                                              r'''$.title''',
                                            ).toString().maybeHandleOverflow(
                                                maxChars: 18),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyLarge
                                                .override(
                                                  fontFamily: 'Readex Pro',
                                                  color: getJsonField(
                                                    chapterItem,
                                                    r'''$.is_completed''',
                                                  )
                                                      ? FlutterFlowTheme.of(
                                                              context)
                                                          .primaryBackground
                                                      : FlutterFlowTheme.of(
                                                              context)
                                                          .primaryText,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                          ),
                                          AutoSizeText(
                                            getJsonField(
                                              chapterItem,
                                              r'''$.description''',
                                            ).toString().maybeHandleOverflow(
                                                maxChars: 25),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily:
                                                      'SF Pro Display Bold',
                                                  color: getJsonField(
                                                    chapterItem,
                                                    r'''$.is_completed''',
                                                  )
                                                      ? FlutterFlowTheme.of(
                                                              context)
                                                          .primaryBackground
                                                      : FlutterFlowTheme.of(
                                                              context)
                                                          .primaryText,
                                                  fontWeight: FontWeight.normal,
                                                  useGoogleFonts: false,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    FittedBox(
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Icon(
                                            Icons.access_time,
                                            color: getJsonField(
                                              chapterItem,
                                              r'''$.is_completed''',
                                            )
                                                ? FlutterFlowTheme.of(context)
                                                    .primaryBackground
                                                : FlutterFlowTheme.of(context)
                                                    .primaryText,
                                            size: 20.0,
                                          ),
                                          Text(
                                            getJsonField(
                                              chapterItem,
                                              r'''$.duration''',
                                            ).toString(),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily:
                                                      'SF Pro Display Bold',
                                                  color: getJsonField(
                                                    chapterItem,
                                                    r'''$.is_completed''',
                                                  )
                                                      ? FlutterFlowTheme.of(
                                                              context)
                                                          .primaryBackground
                                                      : FlutterFlowTheme.of(
                                                              context)
                                                          .primaryText,
                                                  fontWeight: FontWeight.normal,
                                                  useGoogleFonts: false,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ].divide(SizedBox(width: 10.0)),
                                ),
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
    );
  }
}
