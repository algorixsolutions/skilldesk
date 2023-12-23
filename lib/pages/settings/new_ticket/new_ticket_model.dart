import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'new_ticket_widget.dart' show NewTicketWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class NewTicketModel extends FlutterFlowModel<NewTicketWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // State field(s) for TextFieldObject widget.
  FocusNode? textFieldObjectFocusNode;
  TextEditingController? textFieldObjectController;
  String? Function(BuildContext, String?)? textFieldObjectControllerValidator;
  String? _textFieldObjectControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for DropDownCategory widget.
  String? dropDownCategoryValue;
  FormFieldController<String>? dropDownCategoryValueController;
  // State field(s) for TicketMessage widget.
  FocusNode? ticketMessageFocusNode;
  TextEditingController? ticketMessageController;
  String? Function(BuildContext, String?)? ticketMessageControllerValidator;
  String? _ticketMessageControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // Stores action output result for [Backend Call - API (Store New Ticket)] action in Button widget.
  ApiCallResponse? apiResultja4;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    textFieldObjectControllerValidator = _textFieldObjectControllerValidator;
    ticketMessageControllerValidator = _ticketMessageControllerValidator;
  }

  void dispose() {
    unfocusNode.dispose();
    textFieldObjectFocusNode?.dispose();
    textFieldObjectController?.dispose();

    ticketMessageFocusNode?.dispose();
    ticketMessageController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
