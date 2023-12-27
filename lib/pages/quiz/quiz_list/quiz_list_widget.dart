import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';

import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'quiz_list_model.dart';

export 'quiz_list_model.dart';

class QuizListWidget extends StatefulWidget {
  const QuizListWidget({super.key});

  @override
  _QuizListWidgetState createState() => _QuizListWidgetState();
}

class _QuizListWidgetState extends State<QuizListWidget> {
  late QuizListModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => QuizListModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        FFAppState().selectedQuizLabel = '';

        FFAppState().trainingAfterQuiz = null;
      });
    });

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();
    _model.textFieldFocusNode!.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }


  String selectedQuizLabel = '';
  bool isLoaded = false;

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

        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Quizes',
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: 'SF Pro Display Bold',
                  fontSize: 18.0,
                  fontWeight: FontWeight.w500,
                  useGoogleFonts: false,
                ),
          ),
        ),
        body: SafeArea(
          top: true,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  width: 350.0,
                  height: 44.0,
                  decoration: BoxDecoration(
                    color: Color(0xFFF4F4F4),
                    borderRadius: BorderRadius.circular(40.0),
                  ),
                  child: TextFormField(
                    controller: _model.textController,
                    focusNode: _model.textFieldFocusNode,
                    onChanged: (_) => EasyDebounce.debounce(
                      '_model.textController',
                      Duration(milliseconds: 1000),
                      () async {
                        setState(() {
                          selectedQuizLabel = "";
                          // FFAppState().selectedQuizLabel = '';
                        });
                      },
                    ),
                    obscureText: false,
                    decoration: InputDecoration(
                      labelText: 'Search',
                      labelStyle:
                          FlutterFlowTheme.of(context).labelMedium.override(
                                fontFamily: 'SF Pro Display Bold',
                                color: FlutterFlowTheme.of(context).primaryText,
                                useGoogleFonts: false,
                              ),
                          hintStyle: FlutterFlowTheme.of(context).labelMedium,
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).alternate,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(40.0),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).primary,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(40.0),
                          ),
                          errorBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).error,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(40.0),
                          ),
                          focusedErrorBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).error,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(40.0),
                          ),
                          contentPadding: const EdgeInsetsDirectional.fromSTEB(
                              24.0, 0.0, 20.0, 0.0),
                          suffixIcon: Icon(
                            Icons.search_rounded,
                            color: FlutterFlowTheme.of(context).primaryText,
                            size: 18.0,
                          ),
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium,
                        validator:
                            _model.textControllerValidator.asValidator(context),
                      ),
                    ),

                Padding(
                  padding: const EdgeInsets.all(31.0),

                  child: Container(
                    width: 350.0,
                    height: 31.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    child: FutureBuilder<ApiCallResponse>(

                      future: BaseUrlGroup.getThemesCall.call(
                        userID: currentUserUid,
                      ),
                      builder: (context, snapshot) {
                        // Customize what your widget looks like when it's loading.
                        if (!snapshot.hasData) {

                          return const SizedBox();
                          // return Center(
                          //   child: SizedBox(
                          //     width: 50.0,
                          //     height: 50.0,
                          //     child: CircularProgressIndicator(
                          //       valueColor: AlwaysStoppedAnimation<Color>(
                          //         FlutterFlowTheme.of(context).primary,
                          //       ),
                          //     ),
                          //   ),
                          // );
                        }
                        final listViewGetThemesResponse = snapshot.data!;
                        return Builder(
                          builder: (context) {
                            final theme =
                                listViewGetThemesResponse.jsonBody.toList();
                            return ListView.separated(
                              padding: EdgeInsets.zero,
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemCount: theme.length,
                              separatorBuilder: (_, __) =>
                                  const SizedBox(width: 15.0),

                              itemBuilder: (context, themeIndex) {
                                final themeItem = theme[themeIndex];
                                return InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    setState(() {

                                      selectedQuizLabel = getJsonField(
                                          themeItem, r'''$.label''');
                                      // FFAppState().selectedQuizLabel =
                                      //     getJsonField(
                                      //   themeItem,
                                      //   r'''$.label''',
                                      // ).toString();

                                    });
                                  },
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        getJsonField(
                                          themeItem,
                                          r'''$.label''',
                                        ).toString(),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'SF Pro Display Bold',
                                              fontSize: 14.0,
                                              useGoogleFonts: false,
                                            ),
                                      ),

                                      if (selectedQuizLabel ==

                                          getJsonField(
                                            themeItem,
                                            r'''$.label''',
                                          ))

                                        Container(
                                          height: 5.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .trainingColor,
                                            borderRadius:
                                                BorderRadius.circular(16.0),
                                            shape: BoxShape.rectangle,
                                            border: Border.all(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .trainingColor,
                                            ),
                                          ),
                                          child: Text(
                                            getJsonField(
                                              themeItem,
                                              r'''$.label''',
                                            ).toString(),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily:
                                                      'SF Pro Display Bold',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .trainingColor,
                                                  useGoogleFonts: false,
                                                ),
                                          ),
                                        ),
                                    ].divide(const SizedBox(height: 5.0)),

                                  ),
                                );
                              },
                            );
                          },
                        );
                      },
                    ),
                  ),
                ),

                SizedBox(
                  height: MediaQuery.sizeOf(context).height - 250,
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                    child: FutureBuilder<ApiCallResponse>(
                      future: BaseUrlGroup.getQuizzesCall.call(
                        userID: currentUserUid,
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
                        final listViewGetQuizzesResponse = snapshot.data!;
                        return Builder(
                          builder: (context) {
                            final quiz = BaseUrlGroup.getQuizzesCall
                                    .quizData(
                                      listViewGetQuizzesResponse.jsonBody,
                                    )
                                    ?.toList() ??
                                [];
                            return ListView.separated(
                              padding: EdgeInsets.zero,
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemCount: quiz.length,
                              physics: const ScrollPhysics(),
                              separatorBuilder: (_, __) =>
                                  SizedBox(height: 10.0),
                              itemBuilder: (context, quizIndex) {
                                final quizItem = quiz[quizIndex];
                                return Visibility(
                                  visible: () {
                                    // if (!functions.isValueSelected(
                                    //         FFAppState().selectedQuizLabel) &&
                                    //     functions.isTextFieldEmpty(
                                    //         _model.textController.text)) {
                                    if (selectedQuizLabel.isEmpty &&
                                        _model.textController.text.isEmpty) {
                                      return true;
                                    } else if (selectedQuizLabel.isNotEmpty &&
                                        getJsonField(
                                              quizItem,
                                              r'''$.label_theme''',
                                            ) ==
                                            selectedQuizLabel) {
                                      /*
                                      functions.isValueSelected(
                                            FFAppState().selectedQuizLabel) &&
                                        functions.matchValue(
                                            getJsonField(
                                              quizItem,
                                              r'''$.label_theme''',
                                            ).toString(),
                                            FFAppState().selectedQuizLabel)
                                      * */
                                      return true;
                                    } else if (_model
                                            .textController.text.isNotEmpty &&
                                        getJsonField(
                                          quizItem,
                                          r'''$.title''',
                                        ).toString().toLowerCase().contains(
                                            _model.textController.text
                                                .toLowerCase())) {
                                      /*
                                      !functions.isTextFieldEmpty(
                                            _model.textController.text) &&
                                        functions.isContainsLabelTxtField(
                                            _model.textController.text,
                                            getJsonField(
                                              quizItem,
                                              r'''$.label_theme''',
                                            ).toString())
                                      * */
                                      return true;
                                    } else {
                                      return false;
                                    }
                                  }(),
                                  child: Container(
                                    width: 342.0,
                                    height: 111.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      borderRadius: BorderRadius.circular(16.0),
                                      border: Border.all(
                                        color: Color(0xFFEBEBEB),
                                        width: 2.0,
                                      ),
                                    ),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        if ((getJsonField(
                                                  quizItem,
                                                  r'''$.status''',
                                                ) ==
                                                getJsonField(
                                                  FFAppState().quizStatus,
                                                  r'''$.publish''',
                                                )) &&
                                            (getJsonField(
                                                  quizItem,
                                                  r'''$.status_by_user''',
                                                ) !=
                                                getJsonField(
                                                  FFAppState().quizStatus,
                                                  r'''$.notStarted''',
                                                ))) {
                                          context.pushNamed(
                                            'quiz_detail',
                                            queryParameters: {
                                              'quiz': serializeParam(
                                                quizItem,
                                                ParamType.JSON,
                                              ),
                                              'allQuiz': serializeParam(
                                                BaseUrlGroup.getQuizzesCall
                                                    .quizData(
                                                  listViewGetQuizzesResponse
                                                      .jsonBody,
                                                ),
                                                ParamType.JSON,
                                                true,
                                              ),
                                            }.withoutNulls,
                                          );
                                        }
                                      },
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Stack(
                                            children: [
                                              if (getJsonField(
                                                    quizItem,
                                                    r'''$.cover''',
                                                  ) ==
                                                  getJsonField(
                                                    FFAppState().quizStatus,
                                                    r'''$.null''',
                                                  ))
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          13.0, 0.0, 0.0, 0.0),
                                                  child: Container(
                                                    width: 122.0,
                                                    height: 83.0,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12.0),
                                                    ),
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12.0),
                                                      child: SvgPicture.asset(
                                                        'assets/images/quiz.9760d3c2.svg',
                                                        width: 300.0,
                                                        height: 200.0,
                                                        fit: BoxFit.none,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              if (getJsonField(
                                                    quizItem,
                                                    r'''$.cover''',
                                                  ) !=
                                                  getJsonField(
                                                    FFAppState().quizStatus,
                                                    r'''$.null''',
                                                  ))
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          13.0, 0.0, 0.0, 0.0),
                                                  child: Container(
                                                    width: 122.0,
                                                    height: 83.0,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12.0),
                                                    ),
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12.0),
                                                      child: Image.network(
                                                        '${FFAppState().IMAGEURL}${getJsonField(
                                                          quizItem,
                                                          r'''$.cover''',
                                                        ).toString()}',
                                                        width: 300.0,
                                                        height: 200.0,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                            ],
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    10.0, 14.0, 0.0, 0.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                AutoSizeText(
                                                  getJsonField(
                                                    quizItem,
                                                    r'''$.title''',
                                                  )
                                                      .toString()
                                                      .maybeHandleOverflow(
                                                        maxChars: 30,
                                                        replacement: '…',
                                                      ),
                                                  textAlign: TextAlign.start,

                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'SF Pro Display Bold',
                                                        fontSize: 16.0,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        useGoogleFonts: false,
                                                      ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 8.0, 0.0, 0.0),
                                                  child: AutoSizeText(
                                                    getJsonField(
                                                      quizItem,
                                                      r'''$.short_description''',
                                                    )
                                                        .toString()
                                                        .maybeHandleOverflow(
                                                          maxChars: 30,
                                                          replacement: '…',
                                                        ),
                                                    textAlign: TextAlign.start,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'SF Pro Display Bold',
                                                          color:
                                                              Color(0xFFACACAC),
                                                          fontSize: 12.0,
                                                          useGoogleFonts: false,
                                                        ),
                                                  ),
                                                ),
                                                Stack(
                                                  children: [
                                                    if ((getJsonField(
                                                              quizItem,
                                                              r'''$.status''',
                                                            ) ==
                                                            getJsonField(
                                                              FFAppState()
                                                                  .quizStatus,
                                                              r'''$.publish''',
                                                            )) &&
                                                        (getJsonField(
                                                              quizItem,
                                                              r'''$.status_by_user''',
                                                            ) ==
                                                            getJsonField(
                                                              FFAppState()
                                                                  .quizStatus,
                                                              r'''$.notStarted''',
                                                            )))
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    9.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: FFButtonWidget(
                                                          onPressed: () async {
                                                            context.pushNamed(
                                                              'quiz_detail',
                                                              queryParameters: {
                                                                'quiz':
                                                                    serializeParam(
                                                                  quizItem,
                                                                  ParamType
                                                                      .JSON,
                                                                ),
                                                                'allQuiz':
                                                                    serializeParam(
                                                                  BaseUrlGroup
                                                                      .getQuizzesCall
                                                                      .quizData(
                                                                    listViewGetQuizzesResponse
                                                                        .jsonBody,
                                                                  ),
                                                                  ParamType
                                                                      .JSON,
                                                                  true,
                                                                ),
                                                              }.withoutNulls,
                                                            );
                                                          },
                                                          text: 'Start Now',
                                                          options:
                                                              FFButtonOptions(
                                                            width: 184.0,
                                                            height: 31.0,
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        24.0,
                                                                        0.0,
                                                                        24.0,
                                                                        0.0),
                                                            iconPadding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            color: Color(
                                                                0xFFEBEBEB),
                                                            textStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .override(
                                                                      fontFamily:
                                                                          'Readex Pro',
                                                                      color: Color(
                                                                          0xFF39B6FF),
                                                                      fontSize:
                                                                          14.0,
                                                                    ),
                                                            borderSide:
                                                                BorderSide(
                                                              color: Colors
                                                                  .transparent,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        50.0),
                                                          ),
                                                        ),
                                                      ),
                                                    if (getJsonField(
                                                          quizItem,
                                                          r'''$.status''',
                                                        ) ==
                                                        getJsonField(
                                                          FFAppState()
                                                              .quizStatus,
                                                          r'''$.pending''',
                                                        ))
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    -0.76,
                                                                    0.84),
                                                            child: Icon(
                                                              Icons
                                                                  .access_time_rounded,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryText,
                                                              size: 24.0,
                                                            ),
                                                          ),
                                                          Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    -0.61,
                                                                    -1.28),
                                                            child: Text(
                                                              getJsonField(
                                                                quizItem,
                                                                r'''$.publish_at''',
                                                              ).toString(),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'SF Pro Display Bold',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryText,
                                                                    fontSize:
                                                                        17.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    useGoogleFonts:
                                                                        false,
                                                                  ),
                                                            ),
                                                          ),
                                                        ].divide(SizedBox(
                                                            width: 10.0)),
                                                      ),
                                                    if ((getJsonField(
                                                              quizItem,
                                                              r'''$.status''',
                                                            ) ==
                                                            getJsonField(
                                                              FFAppState()
                                                                  .quizStatus,
                                                              r'''$.publish''',
                                                            )) &&
                                                        (getJsonField(
                                                              quizItem,
                                                              r'''$.status_by_user''',
                                                            ) !=
                                                            getJsonField(
                                                              FFAppState()
                                                                  .quizStatus,
                                                              r'''$.notStarted''',
                                                            )))
                                                      InkWell(
                                                        splashColor:
                                                            Colors.transparent,
                                                        focusColor:
                                                            Colors.transparent,
                                                        hoverColor:
                                                            Colors.transparent,
                                                        highlightColor:
                                                            Colors.transparent,
                                                        onTap: () async {
                                                          context.pushNamed(
                                                            'quiz_detail',
                                                            queryParameters: {
                                                              'quiz':
                                                                  serializeParam(
                                                                quizItem,
                                                                ParamType.JSON,
                                                              ),
                                                              'allQuiz':
                                                                  serializeParam(
                                                                BaseUrlGroup
                                                                    .getQuizzesCall
                                                                    .quizData(
                                                                  listViewGetQuizzesResponse
                                                                      .jsonBody,
                                                                ),
                                                                ParamType.JSON,
                                                                true,
                                                              ),
                                                            }.withoutNulls,
                                                          );
                                                        },

                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Text(
                                                              'You Completed ${getJsonField(
                                                                quizItem,
                                                                r'''$.progress''',
                                                              ).toString()}%',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'SF Pro Display Bold',
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    useGoogleFonts:
                                                                        false,
                                                                  ),
                                                            ),
                                                            Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      0.05,
                                                                      1.07),
                                                              child:
                                                                  LinearPercentIndicator(
                                                                percent: functions
                                                                    .calculateProgress(
                                                                        getJsonField(
                                                                  quizItem,
                                                                  r'''$.progress''',
                                                                )),
                                                                width: 180.0,
                                                                lineHeight: 8.0,
                                                                animation: true,
                                                                animateFromLastPercent:
                                                                    true,
                                                                progressColor:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                                backgroundColor:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .accent4,
                                                                barRadius: Radius
                                                                    .circular(
                                                                        32.0),
                                                                padding:
                                                                    EdgeInsets
                                                                        .zero,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                  ],
                                                ),
                                              ].divide(SizedBox(height: 3.0)),
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
                        );
                      },
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
