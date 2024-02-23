import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'training_completed2_model.dart';
export 'training_completed2_model.dart';

class TrainingCompleted2Widget extends StatefulWidget {
  const TrainingCompleted2Widget({
    super.key,
    this.durations,
    required this.trainingId,
  });

  final String? durations;
  final String? trainingId;

  @override
  State<TrainingCompleted2Widget> createState() =>
      _TrainingCompleted2WidgetState();
}

class _TrainingCompleted2WidgetState extends State<TrainingCompleted2Widget> {
  late TrainingCompleted2Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TrainingCompleted2Model());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return FutureBuilder<ApiCallResponse>(
      future: BaseUrlGroup.getTrainingDurationCall.call(
        trainingId: widget.trainingId,
        userId: currentUserUid,
      ),
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
        final trainingCompleted2GetTrainingDurationResponse = snapshot.data!;
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
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(36.0, 0.0, 36.0, 0.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          width: double.infinity,
                          height: 291.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 27.0,
                                color: FlutterFlowTheme.of(context).alternate,
                                offset: const Offset(0.0, 19.0),
                              )
                            ],
                            borderRadius: BorderRadius.circular(23.0),
                            border: Border.all(
                              color: const Color(0xFFE6E6E6),
                              width: 1.0,
                            ),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    30.0, 0.0, 0.0, 0.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Lottie.network(
                                      'https://lottie.host/c58cb032-e68f-4d11-972e-dc63fc58a3e9/AiCDcDPvfq.json',
                                      width: 150.0,
                                      height: 130.0,
                                      fit: BoxFit.cover,
                                      repeat: false,
                                      animate: true,
                                    ),
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 34.77, 0.0, 0.0),
                                      child: Container(
                                        width: 218.0,
                                        height: 50.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                        ),
                                        child: const Text(
                                          'The training was successfully completed',
                                          textAlign: TextAlign.center,
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
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(100.0),
                                    child: SvgPicture.asset(
                                      'assets/images/Groupe_141.svg',
                                      width: 21.91,
                                      height: 21.91,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        13.73, 0.0, 0.0, 0.0),
                                    child: Text(
                                      valueOrDefault<String>(
                                        BaseUrlGroup.getTrainingDurationCall
                                            .learningtime(
                                          trainingCompleted2GetTrainingDurationResponse
                                              .jsonBody,
                                        ),
                                        '0h',
                                      ),
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ].divide(const SizedBox(height: 20.0)),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 50.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        FFButtonWidget(
                          onPressed: () async {
                            FFAppState()
                                .clearGetTrainingListCacheKey(currentUserUid);
                            FFAppState()
                                .clearGetQuizListCacheKey(currentUserUid);

                            context.goNamed('training_list');
                          },
                          text: 'Back To Training List',
                          options: FFButtonOptions(
                            width: 342.0,
                            height: 50.0,
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                24.0, 0.0, 24.0, 0.0),
                            iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context).trainingColor,
                            textStyle: const TextStyle(
                              fontFamily: 'SF Pro Display Bold',
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 14.0,
                            ),
                            elevation: 3.0,
                            borderSide: const BorderSide(
                              color: Colors.transparent,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                        ),
                      ].divide(const SizedBox(height: 20.0)),
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
