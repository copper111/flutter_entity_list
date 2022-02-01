import 'package:flutter/material.dart';
import 'package:flutter_entity_list/authentication/api/login_api.dart';
import 'package:flutter_entity_list/authentication/authentication_controller.dart';
import 'package:flutter_entity_list/authentication/authentication_state.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:get/get.dart';

class MarmWebViewScreen extends StatelessWidget {

  late WebViewController _myController;

  JavascriptChannel _toasterJavascriptChannel(BuildContext context) {
    return JavascriptChannel(
        name: 'Toaster',
        onMessageReceived: (JavascriptMessage message) {
          Scaffold.of(context).showSnackBar(
            SnackBar(content: Text(message.message)),
          );
        });
  }

  _getAutoLoginJS(LoginInfo loginInfo) {
    return "javascript: (function() {\n" +
        "   if (document.getElementById('login_page-login_form') != null) {" +
        "       \$('input[name=\"login_page-login_form_sub-username_input\"').val('" +
        loginInfo.loginName +
        "');\n" +
        "       \$('input[name=\"login_page-login_form_sub-password_input\"').val('" +
        loginInfo.loginName +
        "');\n" +
        "       document.getElementById('login_page-login_form_sub-submit').click();" +
        "   }" +
        "}) ();";
  }

  @override
  Widget build(BuildContext context) {
    final AuthenticationController _authenticationController = Get.find();
          return SafeArea(child: Scaffold(
            body: Stack(
                children: <Widget>[
                  new WebView(
                    initialUrl: "http://" + (_authenticationController.state as Authenticated).currentBaseUrl + ":8190",
                    javascriptMode: JavascriptMode.unrestricted,
                    onWebViewCreated: (controller) {
                      _myController = controller;
                    },
                    javascriptChannels: <JavascriptChannel>[
                      _toasterJavascriptChannel(context),
                    ].toSet(),
                    onPageFinished: (url) {
                      print('Page finished loading: $url');
                      _myController.evaluateJavascript(_getAutoLoginJS((_authenticationController.state as Authenticated).user));
                    },
                  ),
                ],
              ),
          ));

  }
}
