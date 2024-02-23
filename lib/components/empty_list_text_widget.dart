import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'empty_list_text_model.dart';
export 'empty_list_text_model.dart';

class EmptyListTextWidget extends StatefulWidget {
  const EmptyListTextWidget({
    super.key,
    required this.item,
  });

  final String? item;

  @override
  State<EmptyListTextWidget> createState() => _EmptyListTextWidgetState();
}

class _EmptyListTextWidgetState extends State<EmptyListTextWidget> {
  late EmptyListTextModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EmptyListTextModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(5.0, 5.0, 5.0, 5.0),
      child: Text(
        'No ${widget.item} to display.',
        style: FlutterFlowTheme.of(context).labelMedium.override(
              fontFamily: 'SF Pro Display',
              color: FlutterFlowTheme.of(context).primaryText,
              useGoogleFonts: false,
            ),
      ),
    );
  }
}
