// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "bad_certificate_error":
            MessageLookupByLibrary.simpleMessage("Bad certificate error"),
        "cancel_error": MessageLookupByLibrary.simpleMessage("Cancel error"),
        "close": MessageLookupByLibrary.simpleMessage("Close"),
        "connection_error":
            MessageLookupByLibrary.simpleMessage("Connection error"),
        "could_not_namespace_json":
            MessageLookupByLibrary.simpleMessage("Could not namespace JSON"),
        "error_occurred_during_request": MessageLookupByLibrary.simpleMessage(
            "An error occurred during the request."),
        "internal_server_error":
            MessageLookupByLibrary.simpleMessage("Internal server error"),
        "manufacturers": MessageLookupByLibrary.simpleMessage("Manufacturers"),
        "models": MessageLookupByLibrary.simpleMessage("Models"),
        "timeout_error": MessageLookupByLibrary.simpleMessage("Timeout error"),
        "unauthorized": MessageLookupByLibrary.simpleMessage("Unauthorized"),
        "unknown_error":
            MessageLookupByLibrary.simpleMessage("There was an unknown error."),
        "warning": MessageLookupByLibrary.simpleMessage("Warning")
      };
}
