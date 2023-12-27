import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'reset_password1_model.dart';

export 'reset_password1_model.dart';

class ResetPassword1Widget extends StatefulWidget {
  const ResetPassword1Widget({super.key});

  @override
  _ResetPassword1WidgetState createState() => _ResetPassword1WidgetState();
}

class _ResetPassword1WidgetState extends State<ResetPassword1Widget> {
  late ResetPassword1Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ResetPassword1Model());

    _model.emailController ??= TextEditingController();
    _model.emailFocusNode ??= FocusNode();
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
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(
                    118.0, 14.82, 117.0, 0.0),
                child: Container(
                  width: 155.0,
                  height: 44.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.asset(
                      'assets/images/Groupe_13.png',
                      width: 300.0,
                      height: 200.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 43.0, 0.0, 0.0),
                child: Text(
                  'Reset your password',
                  style: TextStyle(
                    fontFamily: 'SF Pro Display Bold',
                    fontWeight: FontWeight.bold,
                    fontSize: 19.0,
                  ),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(-1.0, 0.0),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(
                      34.0, 43.0, 0.0, 0.0),
                  child: Text(
                    'Email',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'SF Pro Display Bold',
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                          useGoogleFonts: false,
                        ),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsetsDirectional.fromSTEB(31.0, 5.0, 31.0, 0.0),
                child: TextFormField(
                  controller: _model.emailController,
                  focusNode: _model.emailFocusNode,
                  autofocus: true,
                  obscureText: false,
                  decoration: InputDecoration(
                    labelStyle: FlutterFlowTheme.of(context).labelMedium,
                    hintStyle: FlutterFlowTheme.of(context).labelMedium,
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Color(0xFFBEBEBE),
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).primary,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).error,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).error,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium,
                  validator:
                      _model.emailControllerValidator.asValidator(context),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsetsDirectional.fromSTEB(0.0, 22.0, 0.0, 0.0),
                child: FFButtonWidget(
                  onPressed: () async {
                    if (_model.emailController.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                            'Email required!',
                          ),
                        ),
                      );
                      return;
                    }
                    await authManager.resetPassword(
                      email: _model.emailController.text,
                      context: context,
                    );

                    context.pushNamed('reset_email_sent');
                  },
                  text: 'Send The Reset Link',
                  options: FFButtonOptions(
                    width: 327.0,
                    height: 50.0,
                    padding: const EdgeInsetsDirectional.fromSTEB(
                        24.0, 0.0, 24.0, 0.0),
                    iconPadding: const EdgeInsetsDirectional.fromSTEB(
                        0.0, 0.0, 0.0, 0.0),
                    color: const Color(0xFF725DFF),
                    textStyle: const TextStyle(
                      fontFamily: 'SF Pro Display Bold',
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                    elevation: 3.0,
                    borderSide: const BorderSide(
                      color: Colors.transparent,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(
                        0.0, 32.0, 0.0, 0.0),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        context.safePop();
                      },
                      child: const Text(
                        'Back to Sign In screen',
                        style: TextStyle(
                          fontFamily: 'SF Pro Display Bold',
                          fontWeight: FontWeight.w600,
                          fontSize: 13.0,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 132.0,
                    height: 1.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).primaryText,
                    ),
                  ),
                ],
              ),
              Padding(
                padding:
                    const EdgeInsetsDirectional.fromSTEB(0.0, 147.0, 0.0, 0.0),
                child: Container(
                  width: 236.22,
                  height: 228.12,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.asset(
                      'assets/images/Coding_website.png',
                      width: 300.0,
                      height: 200.0,
                      fit: BoxFit.cover,
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
