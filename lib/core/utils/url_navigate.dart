import 'package:url_launcher/url_launcher_string.dart';

Future launchMyUrl(String url) async {
  if (!await canLaunchUrlString(url)) {
    throw Exception('Could not launch');
  }
  await launchUrlString(url);
}
