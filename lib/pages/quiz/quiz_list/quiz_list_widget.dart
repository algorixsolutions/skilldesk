import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'quiz_list_model.dart';
export 'quiz_list_model.dart';

class QuizListWidget extends StatefulWidget {
  const QuizListWidget({
    super.key,
    this.themeID,
  });

  final String? themeID;

  @override
  State<QuizListWidget> createState() => _QuizListWidgetState();
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
        FFAppState().trainingAfterQuiz = null;
      });
    });

    _model.searchFieldController ??= TextEditingController();
    _model.searchFieldFocusNode ??= FocusNode();
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
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          automaticallyImplyLeading: false,
          title: Text(
            'Quiz',
            style: FlutterFlowTheme.of(context).titleMedium.override(
                  fontFamily: 'SF Pro Display',
                  color: FlutterFlowTheme.of(context).primaryText,
                  useGoogleFonts: false,
                ),
          ),
          actions: const [],
          centerTitle: true,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: SizedBox(
                                width: double.infinity,
                                child: TextFormField(
                                  controller: _model.searchFieldController,
                                  focusNode: _model.searchFieldFocusNode,
                                  onChanged: (_) => EasyDebounce.debounce(
                                    '_model.searchFieldController',
                                    const Duration(milliseconds: 500),
                                    () async {
                                      setState(() {
                                        FFAppState().selectedQuizLabel = '';
                                      });
                                    },
                                  ),
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          fontFamily: 'SF Pro Display',
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          useGoogleFonts: false,
                                        ),
                                    hintText: 'Search ...',
                                    hintStyle:
                                        FlutterFlowTheme.of(context).bodyMedium,
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                        color: Color(0xFFF4F4F4),
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(40.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .trainingColor,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(40.0),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(40.0),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(40.0),
                                    ),
                                    filled: true,
                                    fillColor: const Color(0xFFF4F4F4),
                                    contentPadding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            16.0, 16.0, 16.0, 16.0),
                                    suffixIcon: _model.searchFieldController!
                                            .text.isNotEmpty
                                        ? InkWell(
                                            onTap: () async {
                                              _model.searchFieldController
                                                  ?.clear();
                                              setState(() {
                                                FFAppState().selectedQuizLabel =
                                                    '';
                                              });
                                              setState(() {});
                                            },
                                            child: Icon(
                                              Icons.clear,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              size: 20.0,
                                            ),
                                          )
                                        : null,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'SF Pro Display',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        useGoogleFonts: false,
                                      ),
                                  validator: _model
                                      .searchFieldControllerValidator
                                      .asValidator(context),
                                ),
                              ),
                            ),
                            FlutterFlowIconButton(
                              borderRadius: 20.0,
                              borderWidth: 1.0,
                              buttonSize: 40.0,
                              icon: Icon(
                                Icons.refresh,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 24.0,
                              ),
                              onPressed: () async {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      'Refreshing data ...',
                                      style: TextStyle(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                      ),
                                    ),
                                    duration: const Duration(milliseconds: 2000),
                                    backgroundColor:
                                        FlutterFlowTheme.of(context).secondary,
                                  ),
                                );
                                setState(() {
                                  FFAppState().selectedQuizLabel = '';
                                });
                                FFAppState()
                                    .clearGetQuizListCacheKey(currentUserUid);
                                setState(() {
                                  FFAppState().clearGetQuizListCacheKey(
                                      _model.apiRequestLastUniqueKey);
                                  _model.apiRequestCompleted = false;
                                });
                                await _model.waitForApiRequestCompleted();
                              },
                            ),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: FutureBuilder<ApiCallResponse>(
                                future: FFAppState().getThemes(
                                  uniqueQueryKey: currentUserUid,
                                  requestFn: () =>
                                      BaseUrlGroup.getThemesCall.call(
                                    userID: currentUserUid,
                                  ),
                                ),
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return Center(
                                      child: SizedBox(
                                        width: 50.0,
                                        height: 50.0,
                                        child: CircularProgressIndicator(
                                          valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                          ),
                                        ),
                                      ),
                                    );
                                  }
                                  final dropDownThemesGetThemesResponse =
                                      snapshot.data!;
                                  return FlutterFlowDropDown<String>(
                                    controller:
                                        _model.dropDownThemesValueController ??=
                                            FormFieldController<String>(
                                      _model.dropDownThemesValue ??=
                                          FFAppState().selectedQuizLabel,
                                    ),
                                    options:
                                        BaseUrlGroup.getThemesCall.labelList(
                                      dropDownThemesGetThemesResponse.jsonBody,
                                    )!,
                                    onChanged: (val) async {
                                      setState(() =>
                                          _model.dropDownThemesValue = val);
                                      setState(() {
                                        FFAppState().selectedQuizLabel =
                                            _model.dropDownThemesValue!;
                                      });
                                    },
                                    width: 200.0,
                                    height: 50.0,
                                    textStyle:
                                        FlutterFlowTheme.of(context).bodyMedium,
                                    hintText: 'Please select a theme ...',
                                    icon: Icon(
                                      Icons.keyboard_arrow_down_rounded,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      size: 24.0,
                                    ),
                                    fillColor: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    elevation: 2.0,
                                    borderColor:
                                        FlutterFlowTheme.of(context).alternate,
                                    borderWidth: 2.0,
                                    borderRadius: 40.0,
                                    margin: const EdgeInsetsDirectional.fromSTEB(
                                        16.0, 4.0, 16.0, 4.0),
                                    hidesUnderline: true,
                                    isOverButton: true,
                                    isSearchable: false,
                                    isMultiSelect: false,
                                  );
                                },
                              ),
                            ),
                            FlutterFlowIconButton(
                              borderColor: Colors.transparent,
                              borderRadius: 20.0,
                              borderWidth: 1.0,
                              buttonSize: 40.0,
                              icon: Icon(
                                Icons.clear_sharp,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 24.0,
                              ),
                              onPressed: () async {
                                setState(() {
                                  _model.dropDownThemesValueController?.reset();
                                });
                                setState(() {
                                  FFAppState().selectedQuizLabel = '';
                                });
                              },
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 200.0),
                          child: FutureBuilder<ApiCallResponse>(
                            future: FFAppState()
                                .getQuizList(
                              uniqueQueryKey: currentUserUid,
                              requestFn: () => BaseUrlGroup.getQuizzesCall.call(
                                userID: currentUserUid,
                                quizonly: 1,
                              ),
                            )
                                .then((result) {
                              try {
                                _model.apiRequestCompleted = true;
                                _model.apiRequestLastUniqueKey = currentUserUid;
                              } finally {}
                              return result;
                            }),
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
                              final listViewQuizGetQuizzesResponse =
                                  snapshot.data!;
                              return Builder(
                                builder: (context) {
                                  final quiz = BaseUrlGroup.getQuizzesCall
                                          .quizData(
                                            listViewQuizGetQuizzesResponse
                                                .jsonBody,
                                          )
                                          ?.where((e) => () {
                                                if (functions.isTextFieldEmpty(
                                                        FFAppState()
                                                            .selectedQuizLabel) &&
                                                    functions.isTextFieldEmpty(
                                                        _model
                                                            .searchFieldController
                                                            .text)) {
                                                  return true;
                                                } else if (!functions
                                                        .isTextFieldEmpty(
                                                            FFAppState()
                                                                .selectedQuizLabel) &&
                                                    functions.compareString(
                                                        FFAppState()
                                                            .selectedQuizLabel,
                                                        getJsonField(
                                                          e,
                                                          r'''$.label_theme''',
                                                        ).toString())) {
                                                  return true;
                                                } else if (!functions
                                                        .isTextFieldEmpty(_model
                                                            .searchFieldController
                                                            .text) &&
                                                    functions
                                                        .isContainsLabelTxtField(
                                                            _model
                                                                .searchFieldController
                                                                .text,
                                                            getJsonField(
                                                              e,
                                                              r'''$.title''',
                                                            ).toString())) {
                                                  return true;
                                                } else {
                                                  return false;
                                                }
                                              }())
                                          .toList()
                                          .toList() ??
                                      [];
                                  return ListView.separated(
                                    padding: EdgeInsets.zero,
                                    primary: false,
                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    itemCount: quiz.length,
                                    separatorBuilder: (_, __) =>
                                        const SizedBox(height: 16.0),
                                    itemBuilder: (context, quizIndex) {
                                      final quizItem = quiz[quizIndex];
                                      return Container(
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(16.0),
                                          border: Border.all(
                                            color: FlutterFlowTheme.of(context)
                                                .inputBorder,
                                            width: 1.0,
                                          ),
                                        ),
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            context.pushNamed(
                                              'quiz_details',
                                              queryParameters: {
                                                'quiz': serializeParam(
                                                  quizItem,
                                                  ParamType.JSON,
                                                ),
                                                'allQuiz': serializeParam(
                                                  BaseUrlGroup.getQuizzesCall
                                                      .quizData(
                                                    listViewQuizGetQuizzesResponse
                                                        .jsonBody,
                                                  ),
                                                  ParamType.JSON,
                                                  true,
                                                ),
                                              }.withoutNulls,
                                            );
                                          },
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        14.0, 14.0, 0.0, 14.0),
                                                child: Stack(
                                                  children: [
                                                    if (getJsonField(
                                                          quizItem,
                                                          r'''$.cover''',
                                                        ) ==
                                                        getJsonField(
                                                          FFAppState()
                                                              .quizStatus,
                                                          r'''$.null''',
                                                        ))
                                                      Container(
                                                        width: 122.0,
                                                        height: 83.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      12.0),
                                                        ),
                                                        child: ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      12.0),
                                                          child:
                                                              SvgPicture.asset(
                                                            'assets/images/quiz.9760d3c2.svg',
                                                            width: 300.0,
                                                            height: 200.0,
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                      ),
                                                    if (getJsonField(
                                                          quizItem,
                                                          r'''$.cover''',
                                                        ) !=
                                                        getJsonField(
                                                          FFAppState()
                                                              .quizStatus,
                                                          r'''$.null''',
                                                        ))
                                                      Container(
                                                        width: 122.0,
                                                        height: 83.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      12.0),
                                                        ),
                                                        child: ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
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
                                                  ],
                                                ),
                                              ),
                                              Flexible(
                                                child: Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(10.0, 14.0,
                                                          14.0, 14.0),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        getJsonField(
                                                          quizItem,
                                                          r'''$.title''',
                                                        ).toString(),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'SF Pro Display',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  useGoogleFonts:
                                                                      false,
                                                                ),
                                                      ),
                                                      Text(
                                                        getJsonField(
                                                          quizItem,
                                                          r'''$.short_description''',
                                                        ).toString(),
                                                        maxLines: 1,
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodySmall
                                                                .override(
                                                                  fontFamily:
                                                                      'SF Pro Display',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                  useGoogleFonts:
                                                                      false,
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
                                                            FFButtonWidget(
                                                              onPressed:
                                                                  () async {
                                                                context
                                                                    .pushNamed(
                                                                  'quiz_details',
                                                                  queryParameters:
                                                                      {
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
                                                                        listViewQuizGetQuizzesResponse
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
                                                                height: 30.0,
                                                                padding: const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        13.0,
                                                                        0.0,
                                                                        13.0,
                                                                        0.0),
                                                                iconPadding:
                                                                    const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .quizSelectedBackground,
                                                                textStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelSmall
                                                                    .override(
                                                                      fontFamily:
                                                                          'SF Pro Display',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .quizSelectedBorder,
                                                                      useGoogleFonts:
                                                                          false,
                                                                    ),
                                                                borderSide:
                                                                    const BorderSide(
                                                                  color: Colors
                                                                      .transparent,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            50.0),
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
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Icon(
                                                                  Icons
                                                                      .access_time_rounded,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                  size: 20.0,
                                                                ),
                                                                Align(
                                                                  alignment:
                                                                      const AlignmentDirectional(
                                                                          -0.61,
                                                                          -1.28),
                                                                  child: Text(
                                                                    getJsonField(
                                                                      quizItem,
                                                                      r'''$.publish_at''',
                                                                    ).toString(),
                                                                    style:
                                                                        TextStyle(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                      fontSize:
                                                                          12.0,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ].divide(const SizedBox(
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
                                                              splashColor: Colors
                                                                  .transparent,
                                                              focusColor: Colors
                                                                  .transparent,
                                                              hoverColor: Colors
                                                                  .transparent,
                                                              highlightColor:
                                                                  Colors
                                                                      .transparent,
                                                              onTap: () async {
                                                                context
                                                                    .pushNamed(
                                                                  'quiz_details',
                                                                  queryParameters:
                                                                      {
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
                                                                        listViewQuizGetQuizzesResponse
                                                                            .jsonBody,
                                                                      ),
                                                                      ParamType
                                                                          .JSON,
                                                                      true,
                                                                    ),
                                                                  }.withoutNulls,
                                                                );
                                                              },
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Text(
                                                                    'You Completed ${getJsonField(
                                                                      quizItem,
                                                                      r'''$.progress''',
                                                                    ).toString()}%',
                                                                    textAlign:
                                                                        TextAlign
                                                                            .start,
                                                                    style:
                                                                        TextStyle(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                      fontSize:
                                                                          12.0,
                                                                    ),
                                                                  ),
                                                                  Align(
                                                                    alignment:
                                                                        const AlignmentDirectional(
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
                                                                      width:
                                                                          180.0,
                                                                      lineHeight:
                                                                          8.0,
                                                                      animation:
                                                                          true,
                                                                      animateFromLastPercent:
                                                                          true,
                                                                      progressColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .quizSelectedBorder,
                                                                      backgroundColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .accent4,
                                                                      barRadius:
                                                                          const Radius.circular(
                                                                              32.0),
                                                                      padding:
                                                                          EdgeInsets
                                                                              .zero,
                                                                    ),
                                                                  ),
                                                                ].divide(const SizedBox(
                                                                    height:
                                                                        5.0)),
                                                              ),
                                                            ),
                                                        ],
                                                      ),
                                                    ].divide(
                                                        const SizedBox(height: 10.0)),
                                                  ),
                                                ),
                                              ),
                                            ],
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
                      ].divide(const SizedBox(height: 20.0)),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
