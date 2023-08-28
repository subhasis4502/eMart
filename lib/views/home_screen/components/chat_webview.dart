import '../../../consts/consts.dart';
import 'package:webview_flutter_plus/webview_flutter_plus.dart';

class ChatWebview extends StatefulWidget {
  const ChatWebview({super.key});

  @override
  State<ChatWebview> createState() => _ChatWebviewState();
}

class _ChatWebviewState extends State<ChatWebview> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(),
        child: const WebViewPlus(
          initialUrl: "assets/index.html",
          javascriptMode: JavascriptMode.unrestricted,
        ),
      )
    );
  }
}
