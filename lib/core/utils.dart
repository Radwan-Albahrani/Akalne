import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void showSnackBar(BuildContext context, String message) {
  final snackBar = SnackBar(
    elevation: 0,
    behavior: SnackBarBehavior.floating,
    backgroundColor: Colors.transparent,
    content: AwesomeSnackbarContent(
      title: 'Error',
      message: message,
      contentType: ContentType.failure,
    ),
  );

  // hide then show
  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(snackBar);
}

Future<FilePickerResult?> pickImage() async {
  final image = await FilePicker.platform.pickFiles(
    type: FileType.image,
  );

  return image;
}


String timeAgoSinceDate(String dateString, {bool numericDates = true}) {
  DateTime notificationDate = DateTime.parse(dateString);
  final date2 = DateTime.now();
  final difference = date2.difference(notificationDate);
  if (difference.inDays > 7 || difference.inDays < 0) {
    return DateFormat('dd MMM yyyy').format(notificationDate);
  } else if (difference.inDays > 2) {
    return '${difference.inDays} days ago';
  } else if (difference.inDays > 1) {
    return numericDates ? '1 day ago' : 'Yesterday';
  } else if (difference.inHours > 1) {
    return '${difference.inHours} hrs ago';
  } else if (difference.inMinutes > 1) {
    return '${difference.inMinutes} mins ago';
  } else if (difference.inSeconds > 3) {
    return '${difference.inSeconds} secs ago';
  } else {
    return 'Just now';
  }
}
