/*
import 'package:flutter/material.dart';
import 'package:flutter_app/models/LoginInfo.dart';
import 'package:flutter_app/models/Task.dart';
import 'package:provider/provider.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewWidget extends StatefulWidget {
  final Task task;
  const WebViewWidget ({ Key key, this.task }): super(key: key);

  @override
  _WebViewWidgetState createState() => _WebViewWidgetState();
}

JavascriptChannel _toasterJavascriptChannel(BuildContext context) {
  return JavascriptChannel(
      name: 'Toaster',
      onMessageReceived: (JavascriptMessage message) {
        Scaffold.of(context).showSnackBar(
          SnackBar(content: Text(message.message)),
        );
      });
}

class _WebViewWidgetState extends State<WebViewWidget> {
  WebViewController _myController;

  final String BI_BASE_O2O_URL = "/views/thirdparty/order/ForeignSiteOrderMobileView.xhtml?businessInteraction=ForeignSiteOrder-";
  final String BI_BASE_SS_URL = "/views/supportservice/problem/InstallationProblemMobileView.xhtml?businessInteraction=SingleProblem-";
  final String BI_BASE_FULFILLMENT_URL = "/views/fulfillment/mobilemounter/order/OrderMobileView.xhtml?businessInteraction=FulfillmentOrder-";
  final String BI_BASE_WFM_URL = "/views/wfm/interaction/mobile/OutdoorInteractionMobileView.xhtml?businessInteraction=OutdoorInteraction-";
  final String BI_BASE_WFM_URL_OLD = "/views/wfm/mobilemounter/order/OrderMobileView.xhtml?businessInteraction=OutdoorInteraction-";

  _getUrlByTask(Task task){
    String url = "";

    if(task.entityId == 10064){
      url = BI_BASE_SS_URL;
    } else if(task.entityId == 32147){
      url = BI_BASE_O2O_URL;
    } else if(task.entityId == 31274){
      url = BI_BASE_FULFILLMENT_URL;
    } else if(task.entityId == 31276){
      url = BI_BASE_FULFILLMENT_URL;
    }

    return url + task.biId.toString();
  }

  _getAutoLoginJS(LoginInfo loginInfo) {
    return "javascript: (function() {\n" +
        "   if (document.getElementById('login_page-login_form') != null) {" +
        "       \$('input[name=\"login_page-login_form_sub-username_input\"').val('" +
        loginInfo.login +
        "');\n" +
        "       \$('input[name=\"login_page-login_form_sub-password_input\"').val('" +
        loginInfo.password +
        "');\n" +
        "       document.getElementById('login_page-login_form_sub-submit').click();" +
        "   }" +
        "}) ();";
  }

  bool _loadedPage = false;

  @override
  void initState() {
    super.initState();
    setState(() {
      _loadedPage = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<LoginInfo>(//                  <--- Consumer
        builder: (context, loginInfo, child) {
          return Scaffold(
            body: Builder(builder: (BuildContext context) {
              return new Stack(
                children: <Widget>[
                  new WebView(
                    initialUrl:
                    'http://' + Provider.of<LoginInfo>(context).actualUrl + _getUrlByTask(widget.task),
                    javascriptMode: JavascriptMode.unrestricted,
                    onWebViewCreated: (controller) {
                      _myController = controller;
                    },
                    javascriptChannels: <JavascriptChannel>[
                      _toasterJavascriptChannel(context),
                    ].toSet(),
                    onPageFinished: (url) {
                      print('Page finished loading: $url');

                      _myController.evaluateJavascript(_getAutoLoginJS(loginInfo));

                      setState(() {
                        _loadedPage = true;
                      });
                    },
                  ),
                  _loadedPage == false
                      ? new Center(
                    child: new CircularProgressIndicator(
                        backgroundColor: Colors.green),
                  )
                      : new Container(),
                ],
              );
            }),
          );
        });
  }
}
*/
