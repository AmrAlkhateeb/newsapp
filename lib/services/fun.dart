import 'package:clipboard/clipboard.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class Fun {

 static void openlink (String url) async {
    if (!await launch(url)) throw 'Could not launch $url';
  }

 static void sharelink (String url) async {
   Share.share('$url', subject: 'Look what I made!');
 }


 static Future<void> copiedlink (String url) async {
   FlutterClipboard.copy('$url').then(( value ) => print('copied'));
 }
}
