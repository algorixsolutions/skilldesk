import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'support_list_model.dart';
export 'support_list_model.dart';

class SupportListWidget extends StatefulWidget {
  const SupportListWidget({Key? key}) : super(key: key);

  @override
  _SupportListWidgetState createState() => _SupportListWidgetState();
}

class _SupportListWidgetState extends State<SupportListWidget> {
  late SupportListModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SupportListModel());
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

    return FutureBuilder<ApiCallResponse>(
      future: _model
          .getTickets(
        uniqueQueryKey: currentUserUid,
        requestFn: () => BaseUrlGroup.getTicketsCall.call(
          userID: currentUserUid,
        ),
      )
          .then((result) {
        try {
          _model.apiRequestCompleted2 = true;
          _model.apiRequestLastUniqueKey2 = currentUserUid;
        } finally {}
        return result;
      }),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: Colors.white,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            ),
          );
        }
        final supportListGetTicketsResponse = snapshot.data!;
        return GestureDetector(
          onTap: () => _model.unfocusNode.canRequestFocus
              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
              : FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: Colors.white,
            floatingActionButton: FloatingActionButton(
              onPressed: () async {
                context.pushNamed('new_ticket');
              },
              backgroundColor: FlutterFlowTheme.of(context).primary,
              elevation: 8.0,
              child: Icon(
                Icons.add,
                color: FlutterFlowTheme.of(context).info,
                size: 24.0,
              ),
            ),
            appBar: AppBar(
              backgroundColor: Colors.white,
              automaticallyImplyLeading: false,
              leading: FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 30.0,
                borderWidth: 1.0,
                buttonSize: 60.0,
                icon: Icon(
                  Icons.chevron_left_sharp,
                  color: FlutterFlowTheme.of(context).primaryText,
                  size: 30.0,
                ),
                onPressed: () async {
                  context.goNamed('settings_menu');
                },
              ),
              title: Text(
                'Support',
                style: FlutterFlowTheme.of(context).headlineMedium.override(
                      fontFamily: 'SF Pro Display Bold',
                      color: FlutterFlowTheme.of(context).primaryText,
                      fontSize: 19.0,
                      fontWeight: FontWeight.bold,
                      useGoogleFonts: false,
                    ),
              ),
              actions: [],
              centerTitle: true,
              elevation: 0.0,
            ),
            body: SafeArea(
              top: true,
              child: Stack(
                children: [
                  if (!functions.isListNull(BaseUrlGroup.getTicketsCall
                      .tickets(
                        supportListGetTicketsResponse.jsonBody,
                      )!
                      .toList()))
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                      child: FutureBuilder<ApiCallResponse>(
                        future: _model
                            .getTickets(
                          uniqueQueryKey: currentUserUid,
                          requestFn: () => BaseUrlGroup.getTicketsCall.call(
                            userID: currentUserUid,
                          ),
                        )
                            .then((result) {
                          try {
                            _model.apiRequestCompleted1 = true;
                            _model.apiRequestLastUniqueKey1 = currentUserUid;
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
                          final listViewGetTicketsResponse = snapshot.data!;
                          return Builder(
                            builder: (context) {
                              final ticket = BaseUrlGroup.getTicketsCall
                                      .tickets(
                                        listViewGetTicketsResponse.jsonBody,
                                      )
                                      ?.toList() ??
                                  [];
                              return RefreshIndicator(
                                onRefresh: () async {
                                  setState(() {
                                    _model.clearGetTicketsCacheKey(
                                        _model.apiRequestLastUniqueKey2);
                                    _model.apiRequestCompleted2 = false;
                                  });
                                  await _model.waitForApiRequestCompleted2();
                                  setState(() {
                                    _model.clearGetTicketsCacheKey(
                                        _model.apiRequestLastUniqueKey1);
                                    _model.apiRequestCompleted1 = false;
                                  });
                                  await _model.waitForApiRequestCompleted1();
                                },
                                child: ListView.builder(
                                  padding: EdgeInsets.zero,
                                  scrollDirection: Axis.vertical,
                                  itemCount: ticket.length,
                                  itemBuilder: (context, ticketIndex) {
                                    final ticketItem = ticket[ticketIndex];
                                    return Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          20.0, 0.0, 20.0, 10.0),
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          context.pushNamed(
                                            'support_details',
                                            queryParameters: {
                                              'ticket': serializeParam(
                                                ticketItem,
                                                ParamType.JSON,
                                              ),
                                            }.withoutNulls,
                                          );
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: functions.compareString(
                                                    getJsonField(
                                                      ticketItem,
                                                      r'''$.status''',
                                                    ).toString(),
                                                    'OPEN')
                                                ? Color(0x1B725DFF)
                                                : FlutterFlowTheme.of(context)
                                                    .primaryBackground,
                                            borderRadius:
                                                BorderRadius.circular(16.0),
                                            border: Border.all(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .alternate,
                                              width: 1.0,
                                            ),
                                          ),
                                          child: Padding(
                                            padding: EdgeInsets.all(20.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 0.0, 7.0),
                                                  child: Text(
                                                    getJsonField(
                                                      ticketItem,
                                                      r'''$.object''',
                                                    ).toString(),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'SF Pro Display Bold',
                                                          fontSize: 14.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          useGoogleFonts: false,
                                                        ),
                                                  ),
                                                ),
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Expanded(
                                                      flex: 1,
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            getJsonField(
                                                              ticketItem,
                                                              r'''$.number''',
                                                            ).toString(),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'SF Pro Display Bold',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  useGoogleFonts:
                                                                      false,
                                                                ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        5.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Text(
                                                              getJsonField(
                                                                ticketItem,
                                                                r'''$.category''',
                                                              ).toString(),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'SF Pro Display Bold',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    useGoogleFonts:
                                                                        false,
                                                                  ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Expanded(
                                                      flex: 1,
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .end,
                                                        children: [
                                                          Text(
                                                            getJsonField(
                                                              ticketItem,
                                                              r'''$.created_at''',
                                                            ).toString(),
                                                            textAlign:
                                                                TextAlign.end,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'SF Pro Display Bold',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  useGoogleFonts:
                                                                      false,
                                                                ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        5.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Text(
                                                              getJsonField(
                                                                ticketItem,
                                                                r'''$.status''',
                                                              ).toString(),
                                                              textAlign:
                                                                  TextAlign.end,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'SF Pro Display Bold',
                                                                    color: () {
                                                                      if (functions.compareString(
                                                                          getJsonField(
                                                                            ticketItem,
                                                                            r'''$.status''',
                                                                          ).toString(),
                                                                          'CLOSED')) {
                                                                        return FlutterFlowTheme.of(context)
                                                                            .quizFailedBorder;
                                                                      } else if (functions.compareString(
                                                                          getJsonField(
                                                                            ticketItem,
                                                                            r'''$.status''',
                                                                          ).toString(),
                                                                          'RESOLVED')) {
                                                                        return FlutterFlowTheme.of(context)
                                                                            .quizSuccessBorder;
                                                                      } else {
                                                                        return FlutterFlowTheme.of(context)
                                                                            .trainingColor;
                                                                      }
                                                                    }(),
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    useGoogleFonts:
                                                                        false,
                                                                  ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ),
                  if (functions.isListNull(BaseUrlGroup.getTicketsCall
                      .tickets(
                        supportListGetTicketsResponse.jsonBody,
                      )!
                      .toList()))
                    Align(
                      alignment: AlignmentDirectional(0.0, -1.0),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            20.0, 20.0, 0.0, 0.0),
                        child: Text(
                          'No tickets to display.',
                          style: FlutterFlowTheme.of(context).bodyLarge,
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
