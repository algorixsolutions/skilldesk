import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'notifications_detail_model.dart';
export 'notifications_detail_model.dart';

class NotificationsDetailWidget extends StatefulWidget {
  const NotificationsDetailWidget({
    super.key,
    required this.notification,
  });

  final dynamic notification;

  @override
  _NotificationsDetailWidgetState createState() =>
      _NotificationsDetailWidgetState();
}

class _NotificationsDetailWidgetState extends State<NotificationsDetailWidget> {
  late NotificationsDetailModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NotificationsDetailModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.apiResultzee =
          await BaseUrlGroup.incrementNotificationViewCall.call(
        notificationID: getJsonField(
          widget.notification,
          r'''$.id''',
        ).toString().toString(),
      );
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
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 14.82, 0.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 0.0, 0.0),
                      child: Container(
                        width: 24.0,
                        height: 24.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            context.safePop();
                          },
                          child: const Icon(
                            Icons.chevron_left,
                            color: Colors.black,
                            size: 24.0,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 0.0, 0.0),
                      child: Container(
                        width: 184.0,
                        height: 23.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                        child: Text(
                          getJsonField(
                            widget.notification,
                            r'''$.object''',
                          ).toString(),
                          style: const TextStyle(
                            fontFamily: 'SF Pro Display Bold',
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 19.0,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Align(
                    alignment: const AlignmentDirectional(-1.0, 0.0),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(71.0, 6.0, 0.0, 0.0),
                      child: Text(
                        functions.calculateNotifDuration(getJsonField(
                          widget.notification,
                          r'''$.published_at''',
                        ).toString()),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'SF Pro Display Bold',
                              color: const Color(0xFF725DFF),
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold,
                              useGoogleFonts: false,
                            ),
                      ),
                    ),
                  ),
                  if (getJsonField(
                        widget.notification,
                        r'''$.media''',
                      ) !=
                      null)
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(52.0, 56.0, 54.0, 0.0),
                      child: Container(
                        width: 284.0,
                        height: 186.0,
                        decoration: BoxDecoration(
                          color: const Color(0xFFE1F5FE),
                          borderRadius: BorderRadius.circular(15.0),
                          border: Border.all(
                            color: const Color(0xFF00D1FF),
                            width: 1.5,
                          ),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.network(
                            '${FFAppState().IMAGEURL}${getJsonField(
                              widget.notification,
                              r'''$.media''',
                            ).toString()}',
                            width: 284.0,
                            height: 186.0,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),
                  Align(
                    alignment: const AlignmentDirectional(-1.0, 0.0),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(47.0, 27.0, 34.0, 0.0),
                      child: Container(
                        width: 309.0,
                        height: 171.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                        child: Text(
                          functions.removeHtmlTags(getJsonField(
                            widget.notification,
                            r'''$.message''',
                          ).toString()),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'SF Pro Display Bold',
                                    color: const Color(0xFF595959),
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w300,
                                    useGoogleFonts: false,
                                  ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
