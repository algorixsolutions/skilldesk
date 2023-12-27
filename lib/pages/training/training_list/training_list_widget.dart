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
import 'training_list_model.dart';

export 'training_list_model.dart';

class TrainingListWidget extends StatefulWidget {
  const TrainingListWidget({super.key});

  @override
  _TrainingListWidgetState createState() => _TrainingListWidgetState();
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
        FFAppState().selectedQuizLabel = '';
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

  String selectedTrainingLabel = "";

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
            'Training',
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
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 350.0,
                  height: 44.0,
                  decoration: BoxDecoration(
                    color: const Color(0xFFF4F4F4),
                    borderRadius: BorderRadius.circular(40.0),
                  ),
                  child: TextFormField(
                    controller: _model.searchFieldController,
                    focusNode: _model.searchFieldFocusNode,
                    onChanged: (_) => EasyDebounce.debounce(
                      '_model.searchFieldController',
                      const Duration(milliseconds: 500),
                      () async {
                        setState(() {
                          selectedTrainingLabel = "";
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
                    validator: _model.searchFieldControllerValidator
                        .asValidator(context),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(
                      31.0, 31.0, 31.0, 31.0),
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
                                      selectedTrainingLabel = getJsonField(
                                        themeItem,
                                        r'''$.label''',
                                      ).toString();
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
                                      if (selectedTrainingLabel ==
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
                  height: MediaQuery.sizeOf(context).height - 300,
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(
                        24.0, 0.0, 24.0, 0.0),
                    child: FutureBuilder<ApiCallResponse>(
                      future: BaseUrlGroup.getTrainingsCall.call(
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
                        final gridViewGetTrainingsResponse = snapshot.data!;
                        return Builder(
                          builder: (context) {
                            final trainingItem = BaseUrlGroup.getTrainingsCall
                                    .trainingData(
                                      gridViewGetTrainingsResponse.jsonBody,
                                    )
                                    ?.toList() ??
                                [];
                            final filterlist = [];
                            for (dynamic item in trainingItem) {
                              if (selectedTrainingLabel.isNotEmpty &&
                                  selectedTrainingLabel ==
                                      getJsonField(
                                        item,
                                        r'''$.label_theme''',
                                      )) {
                                filterlist.add(item);
                              } else if (_model
                                      .searchFieldController.text.isNotEmpty &&
                                  getJsonField(
                                    item,
                                    r'''$.title''',
                                  ).toString().toLowerCase().contains(_model
                                      .searchFieldController.text
                                      .toLowerCase())) {
                                filterlist.add(item);
                              } else if (selectedTrainingLabel.isEmpty &&
                                  _model.searchFieldController.text.isEmpty) {
                                filterlist.add(item);
                              }
                            }

                            return GridView.builder(
                              padding: EdgeInsets.zero,
                              physics: const ScrollPhysics(),
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 20.0,
                                mainAxisSpacing: 10.0,
                                childAspectRatio: 0.6,
                              ),
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemCount: filterlist.length,
                              itemBuilder: (context, trainingItemIndex) {
                                final trainingItemItem =
                                    filterlist[trainingItemIndex];
                                return InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    if ((getJsonField(
                                              trainingItemItem,
                                              r'''$.status''',
                                            ) ==
                                            getJsonField(
                                              FFAppState().quizStatus,
                                              r'''$.publish''',
                                            )) &&
                                        (getJsonField(
                                              trainingItemItem,
                                              r'''$.status_by_user''',
                                            ) !=
                                            getJsonField(
                                              FFAppState().quizStatus,
                                              r'''$.notStarted''',
                                            ))) {
                                      context.pushNamed(
                                        'training_details',
                                        queryParameters: {
                                          'training': serializeParam(
                                            trainingItemItem,
                                            ParamType.JSON,
                                          ),
                                          'allTrainings': serializeParam(
                                            getJsonField(
                                              gridViewGetTrainingsResponse
                                                  .jsonBody,
                                              r'''$.data''',
                                              true,
                                            ),
                                            ParamType.JSON,
                                            true,
                                          ),
                                        }.withoutNulls,
                                      );

                                      return;
                                    } else {
                                      return;
                                    }
                                  },
                                  child: Container(
                                    width: 100.0,
                                    height: 150.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      boxShadow: const [
                                        BoxShadow(
                                          blurRadius: 4.0,
                                          color: Color(0x33000000),
                                          offset: Offset(0.0, 2.0),
                                        )
                                      ],
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    alignment:
                                        const AlignmentDirectional(0.0, 0.0),
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
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
                                                      BorderRadius.circular(
                                                          8.0),
                                                  child: SvgPicture.asset(
                                                    'assets/images/training.a4ae0304.svg',
                                                    width: double.infinity,
                                                    height: 100.0,
                                                    fit: BoxFit.contain,
                                                    alignment: const Alignment(
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
                                                      BorderRadius.circular(
                                                          8.0),
                                                  child: Image.network(
                                                    '${FFAppState().IMAGEURL}${getJsonField(
                                                      trainingItemItem,
                                                      r'''$.cover''',
                                                    ).toString()}',
                                                    width: double.infinity,
                                                    height: 100.0,
                                                    fit: BoxFit.contain,
                                                    alignment: const Alignment(
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
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily:
                                                      'SF Pro Display Bold',
                                                  fontSize: 15.0,
                                                  fontWeight: FontWeight.bold,
                                                  useGoogleFonts: false,
                                                ),
                                          ),
                                          Container(
                                            width: double.infinity,
                                            height: 40.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                            ),
                                            child: AutoSizeText(
                                              getJsonField(
                                                trainingItemItem,
                                                r'''$.short_description''',
                                              ).toString().maybeHandleOverflow(
                                                    maxChars: 45,
                                                    replacement: '…',
                                                  ),
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily:
                                                        'SF Pro Display Bold',
                                                    color:
                                                        const Color(0xFFACACAC),
                                                    useGoogleFonts: false,
                                                  ),
                                            ),
                                          ),
                                          Stack(
                                            children: [
                                              if ((getJsonField(
                                                        trainingItemItem,
                                                        r'''$.status''',
                                                      ) ==
                                                      getJsonField(
                                                        FFAppState().quizStatus,
                                                        r'''$.publish''',
                                                      )) &&
                                                  (getJsonField(
                                                        trainingItemItem,
                                                        r'''$.status_by_user''',
                                                      ) !=
                                                      getJsonField(
                                                        FFAppState().quizStatus,
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
                                                            gridViewGetTrainingsResponse
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
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium,
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
                                                                .primary,
                                                        backgroundColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .accent4,
                                                        center: Text(
                                                          '0',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .headlineSmall
                                                              .override(
                                                                fontFamily:
                                                                    'Outfit',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .trainingColor,
                                                                fontSize: 0.0,
                                                              ),
                                                        ),
                                                        barRadius: const Radius
                                                            .circular(16.0),
                                                        padding:
                                                            EdgeInsets.zero,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              if (getJsonField(
                                                    trainingItemItem,
                                                    r'''$.status''',
                                                  ) ==
                                                  getJsonField(
                                                    FFAppState().quizStatus,
                                                    r'''$.pending''',
                                                  ))
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Icon(
                                                      Icons.access_time_sharp,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                      size: 24.0,
                                                    ),
                                                    Text(
                                                      getJsonField(
                                                        trainingItemItem,
                                                        r'''$.publish_at''',
                                                      ).toString(),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium,
                                                    ),
                                                  ].divide(const SizedBox(
                                                      width: 10.0)),
                                                ),
                                              if ((getJsonField(
                                                        trainingItemItem,
                                                        r'''$.status''',
                                                      ) ==
                                                      getJsonField(
                                                        FFAppState().quizStatus,
                                                        r'''$.publish''',
                                                      )) &&
                                                  (getJsonField(
                                                        trainingItemItem,
                                                        r'''$.status_by_user''',
                                                      ) ==
                                                      getJsonField(
                                                        FFAppState().quizStatus,
                                                        r'''$.notStarted''',
                                                      )))
                                                Padding(
                                                  padding:
                                                      const EdgeInsetsDirectional
                                                          .fromSTEB(
                                                          0.0, 9.0, 0.0, 0.0),
                                                  child: FFButtonWidget(
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
                                                              gridViewGetTrainingsResponse
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
                                                    options: FFButtonOptions(
                                                      width: 184.0,
                                                      height: 31.0,
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(24.0,
                                                              0.0, 24.0, 0.0),
                                                      iconPadding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(0.0,
                                                              0.0, 0.0, 0.0),
                                                      color: const Color(
                                                          0xFFEBEBEB),
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .override(
                                                                fontFamily:
                                                                    'Readex Pro',
                                                                color: const Color(
                                                                    0xFF39B6FF),
                                                                fontSize: 14.0,
                                                              ),
                                                      borderSide:
                                                          const BorderSide(
                                                        color:
                                                            Colors.transparent,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              50.0),
                                                    ),
                                                  ),
                                                ),
                                            ],
                                          ),
                                        ].divide(const SizedBox(height: 5.0)),
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
