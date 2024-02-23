import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/components/empty_list_text_widget.dart';
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
import 'training_list_model.dart';
export 'training_list_model.dart';

class TrainingListWidget extends StatefulWidget {
  const TrainingListWidget({
    super.key,
    this.selectedTheme,
  });

  final String? selectedTheme;

  @override
  State<TrainingListWidget> createState() => _TrainingListWidgetState();
}

class _TrainingListWidgetState extends State<TrainingListWidget> {
  late TrainingListModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TrainingListModel());

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
            'Training',
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
                              borderColor: Colors.transparent,
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
                                FFAppState().clearGetTrainingListCacheKey(
                                    currentUserUid);
                                setState(() {
                                  FFAppState().clearGetTrainingListCacheKey(
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
                                .getTrainingList(
                              uniqueQueryKey: currentUserUid,
                              requestFn: () =>
                                  BaseUrlGroup.getTrainingsCall.call(
                                userID: currentUserUid,
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
                              final gridViewTrainingsGetTrainingsResponse =
                                  snapshot.data!;
                              return Builder(
                                builder: (context) {
                                  final trainingItem =
                                      BaseUrlGroup.getTrainingsCall
                                              .trainingData(
                                                gridViewTrainingsGetTrainingsResponse
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
                                  if (trainingItem.isEmpty) {
                                    return const EmptyListTextWidget(
                                      item: 'training',
                                    );
                                  }
                                  return GridView.builder(
                                    padding: EdgeInsets.zero,
                                    gridDelegate:
                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      crossAxisSpacing: 20.0,
                                      mainAxisSpacing: 20.0,
                                      childAspectRatio: 0.75,
                                    ),
                                    primary: false,
                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    itemCount: trainingItem.length,
                                    itemBuilder: (context, trainingItemIndex) {
                                      final trainingItemItem =
                                          trainingItem[trainingItemIndex];
                                      return InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          context.pushNamed(
                                            'training_details',
                                            queryParameters: {
                                              'training': serializeParam(
                                                trainingItemItem,
                                                ParamType.JSON,
                                              ),
                                              'allTrainings': serializeParam(
                                                getJsonField(
                                                  gridViewTrainingsGetTrainingsResponse
                                                      .jsonBody,
                                                  r'''$.data''',
                                                  true,
                                                ),
                                                ParamType.JSON,
                                                true,
                                              ),
                                            }.withoutNulls,
                                          );
                                        },
                                        child: Container(
                                          width: double.infinity,
                                          height: 150.0,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(16.0),
                                            border: Border.all(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .inputBorder,
                                              width: 1.0,
                                            ),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Stack(
                                                      children: [
                                                        if (getJsonField(
                                                              trainingItemItem,
                                                              r'''$.cover''',
                                                            ) ==
                                                            null)
                                                          ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        12.0),
                                                            child: SvgPicture
                                                                .asset(
                                                              'assets/images/training.a4ae0304.svg',
                                                              width: double
                                                                  .infinity,
                                                              height: 100.0,
                                                              fit: BoxFit.cover,
                                                              alignment:
                                                                  const Alignment(
                                                                      0.0, 0.0),
                                                            ),
                                                          ),
                                                        if (getJsonField(
                                                              trainingItemItem,
                                                              r'''$.cover''',
                                                            ) !=
                                                            null)
                                                          ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                            child:
                                                                Image.network(
                                                              '${FFAppState().IMAGEURL}${getJsonField(
                                                                trainingItemItem,
                                                                r'''$.cover''',
                                                              ).toString()}',
                                                              width: double
                                                                  .infinity,
                                                              height: 100.0,
                                                              fit: BoxFit.cover,
                                                              alignment:
                                                                  const Alignment(
                                                                      0.0, 0.0),
                                                            ),
                                                          ),
                                                      ],
                                                    ),
                                                    Text(
                                                      getJsonField(
                                                        trainingItemItem,
                                                        r'''$.title''',
                                                      ).toString(),
                                                      maxLines: 2,
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium,
                                                    ),
                                                    Container(
                                                      width: double.infinity,
                                                      decoration:
                                                          const BoxDecoration(),
                                                      child: Text(
                                                        functions
                                                            .removeHtmlTags(
                                                                getJsonField(
                                                          trainingItemItem,
                                                          r'''$.short_description''',
                                                        ).toString()),
                                                        maxLines: 2,
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
                                                    ),
                                                  ].divide(
                                                      const SizedBox(height: 10.0)),
                                                ),
                                                Stack(
                                                  children: [
                                                    if ((getJsonField(
                                                              trainingItemItem,
                                                              r'''$.status''',
                                                            ) ==
                                                            getJsonField(
                                                              FFAppState()
                                                                  .quizStatus,
                                                              r'''$.publish''',
                                                            )) &&
                                                        (getJsonField(
                                                              trainingItemItem,
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
                                                            'training_details',
                                                            queryParameters: {
                                                              'training':
                                                                  serializeParam(
                                                                trainingItemItem,
                                                                ParamType.JSON,
                                                              ),
                                                              'allTrainings':
                                                                  serializeParam(
                                                                getJsonField(
                                                                  gridViewTrainingsGetTrainingsResponse
                                                                      .jsonBody,
                                                                  r'''$.data''',
                                                                  true,
                                                                ),
                                                                ParamType.JSON,
                                                                true,
                                                              ),
                                                            }.withoutNulls,
                                                          );
                                                        },
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              'You completed ${getJsonField(
                                                                trainingItemItem,
                                                                r'''$.progress''',
                                                              ).toString()}%',
                                                              style: TextStyle(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                fontSize: 12.0,
                                                              ),
                                                            ),
                                                            LinearPercentIndicator(
                                                              percent: functions
                                                                  .calculateProgress(
                                                                      getJsonField(
                                                                trainingItemItem,
                                                                r'''$.progress''',
                                                              )),
                                                              width: 120.0,
                                                              lineHeight: 7.0,
                                                              animation: true,
                                                              animateFromLastPercent:
                                                                  true,
                                                              progressColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .trainingColor,
                                                              backgroundColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .accent4,
                                                              center: Text(
                                                                '0',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .headlineSmall
                                                                    .override(
                                                                      fontFamily:
                                                                          'SF Pro Display',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .trainingColor,
                                                                      fontSize:
                                                                          0.0,
                                                                      useGoogleFonts:
                                                                          false,
                                                                    ),
                                                              ),
                                                              barRadius: const Radius
                                                                  .circular(
                                                                      16.0),
                                                              padding:
                                                                  EdgeInsets
                                                                      .zero,
                                                            ),
                                                          ].divide(const SizedBox(
                                                              height: 5.0)),
                                                        ),
                                                      ),
                                                    if (getJsonField(
                                                          trainingItemItem,
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
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        children: [
                                                          Icon(
                                                            Icons
                                                                .access_time_sharp,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryText,
                                                            size: 20.0,
                                                          ),
                                                          Flexible(
                                                            child: Text(
                                                              getJsonField(
                                                                trainingItemItem,
                                                                r'''$.publish_at''',
                                                              ).toString(),
                                                              style: TextStyle(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                fontSize: 12.0,
                                                              ),
                                                            ),
                                                          ),
                                                        ].divide(const SizedBox(
                                                            width: 10.0)),
                                                      ),
                                                    if ((getJsonField(
                                                              trainingItemItem,
                                                              r'''$.status''',
                                                            ) ==
                                                            getJsonField(
                                                              FFAppState()
                                                                  .quizStatus,
                                                              r'''$.publish''',
                                                            )) &&
                                                        (getJsonField(
                                                              trainingItemItem,
                                                              r'''$.status_by_user''',
                                                            ) ==
                                                            getJsonField(
                                                              FFAppState()
                                                                  .quizStatus,
                                                              r'''$.notStarted''',
                                                            )))
                                                      FFButtonWidget(
                                                        onPressed: () async {
                                                          context.pushNamed(
                                                            'training_details',
                                                            queryParameters: {
                                                              'training':
                                                                  serializeParam(
                                                                trainingItemItem,
                                                                ParamType.JSON,
                                                              ),
                                                              'allTrainings':
                                                                  serializeParam(
                                                                getJsonField(
                                                                  gridViewTrainingsGetTrainingsResponse
                                                                      .jsonBody,
                                                                  r'''$.data''',
                                                                  true,
                                                                ),
                                                                ParamType.JSON,
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
                                                          padding:
                                                              const EdgeInsetsDirectional
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
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .trainingButtonLightBackColor,
                                                          textStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelSmall
                                                                  .override(
                                                                    fontFamily:
                                                                        'SF Pro Display',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .trainingColor,
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
                                                  ],
                                                ),
                                              ].divide(const SizedBox(height: 10.0)),
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
