import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'quiz_result_model.dart';

export 'quiz_result_model.dart';

class QuizResultWidget extends StatefulWidget {
  const QuizResultWidget({
    Key? key,
    required this.quizId,
  }) : super(key: key);

  final String? quizId;

  @override
  _QuizResultWidgetState createState() => _QuizResultWidgetState();
}

class _QuizResultWidgetState extends State<QuizResultWidget> {
  late QuizResultModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => QuizResultModel());
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
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(36.0, 0.0, 36.0, 0.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(0.0, 122.82, 0.0, 0.0),
                  child: Container(
                    width: double.infinity,
                    height: 291.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      borderRadius: BorderRadius.circular(23.0),
                      border: Border.all(
                        color: Color(0xFFE6E6E6),
                        width: 1.0,
                      ),
                    ),
                    alignment: AlignmentDirectional(0.00, 0.00),
                    child: FutureBuilder<ApiCallResponse>(
                      future: BaseUrlGroup.getQuizByIdCall.call(
                        quizzId: widget.quizId,
                        userId: currentUserUid,
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
                        final columnGetQuizByIdResponse = snapshot.data!;
                        return Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Stack(
                              children: [
                                if (functions.isQuizSuccess(
                                    getJsonField(
                                      columnGetQuizByIdResponse.jsonBody,
                                      r'''$.data.validated_questions_by_user''',
                                    ),
                                    getJsonField(
                                      columnGetQuizByIdResponse.jsonBody,
                                      r'''$.data.nbr_correct_answer_to_pass''',
                                    )))
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        30.0, 0.0, 0.0, 0.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 32.0, 0.0, 0.0),
                                          child: Container(
                                            width: 64.0,
                                            height: 64.0,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                            ),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                              child: SvgPicture.asset(
                                                'assets/images/Frame_90.svg',
                                                width: 300.0,
                                                height: 200.0,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 34.77, 0.0, 0.0),
                                          child: Container(
                                            width: 218.0,
                                            height: 50.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                            ),
                                            child: Text(
                                              'The Quiz was successfully completed',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                fontFamily:
                                                    'SF Pro Display Bold',
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
                                if (!functions.isQuizSuccess(
                                    getJsonField(
                                      columnGetQuizByIdResponse.jsonBody,
                                      r'''$.data.validated_questions_by_user''',
                                    ),
                                    getJsonField(
                                      columnGetQuizByIdResponse.jsonBody,
                                      r'''$.data.nbr_correct_answer_to_pass''',
                                    )))
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 32.0, 0.0, 0.0),
                                        child: Container(
                                          width: 64.0,
                                          height: 64.0,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                          ),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            child: SvgPicture.asset(
                                              'assets/images/Groupe_149.svg',
                                              width: 300.0,
                                              height: 200.0,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 35.0, 0.0, 0.0),
                                        child: Text(
                                          'Quiz Failed',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontFamily: 'SF Pro Display Bold',
                                            color: Colors.black,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 18.0,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 8.0, 0.0, 0.0),
                                        child: Text(
                                          '${getJsonField(
                                            columnGetQuizByIdResponse.jsonBody,
                                            r'''$.data.nbr_correct_answer_to_pass''',
                                          ).toString()} correct responses required to succeed !',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontFamily: 'SF Pro Display Bold',
                                            color: Colors.black,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 15.0,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 41.88, 0.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        35.33, 0.0, 0.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(100.0),
                                          child: SvgPicture.asset(
                                            'assets/images/Groupe_141.svg',
                                            width: 21.91,
                                            height: 21.91,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  13.73, 0.0, 0.0, 0.0),
                                          child: Text(
                                            functions.getDuration(
                                                FFAppState().quizInitTimer!,
                                                getCurrentTimestamp),
                                            style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        35.33, 0.0, 0.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(100.0),
                                          child: SvgPicture.asset(
                                            'assets/images/Frame_92.svg',
                                            width: 21.91,
                                            height: 21.91,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  13.73, 0.0, 0.0, 0.0),
                                          child: Text(
                                            getJsonField(
                                              columnGetQuizByIdResponse
                                                  .jsonBody,
                                              r'''$.data.validated_questions_by_user''',
                                            ).toString(),
                                            style: TextStyle(
                                              fontFamily: 'SF Pro Display Bold',
                                              color: Color(0xFF32DC2C),
                                              fontWeight: FontWeight.w500,
                                              fontSize: 12.0,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        35.33, 0.0, 0.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(100.0),
                                          child: SvgPicture.asset(
                                            'assets/images/Groupe_142.svg',
                                            width: 21.91,
                                            height: 21.91,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  13.73, 0.0, 0.0, 0.0),
                                          child: Text(
                                            getJsonField(
                                              columnGetQuizByIdResponse
                                                  .jsonBody,
                                              r'''$.data.bad_answer_by_user''',
                                            ).toString(),
                                            style: TextStyle(
                                              fontFamily: 'SF Pro Display Bold',
                                              color: Color(0xFFFF3636),
                                              fontWeight: FontWeight.w500,
                                              fontSize: 12.0,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.sizeOf(context).height * 0.1,
                ),
                FFButtonWidget(
                  onPressed: () async {
                    if (FFAppState().trainingAfterQuiz == null) {
                      context.pushNamed('quiz_list');
                    } else {
                      context.pushNamed(
                        'training_chapters',
                        queryParameters: {
                          'training': serializeParam(
                            FFAppState().trainingAfterQuiz,
                            ParamType.JSON,
                          ),
                        }.withoutNulls,
                      );
                    }
                  },
                  text: FFAppState().trainingAfterQuiz != null
                      ? 'Back To Training'
                      : 'Back To Quiz',
                  options: FFButtonOptions(
                    width: 342.0,
                    height: 50.0,
                    padding:
                        EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                    iconPadding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: Color(0xFF39B6FF),
                    textStyle: TextStyle(
                      fontFamily: 'SF Pro Display Bold',
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 14.0,
                    ),
                    elevation: 3.0,
                    borderSide: BorderSide(
                      color: Colors.transparent,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(12.0),
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
