import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'login_controller.dart';
import 'login_state.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image(
                  image: AssetImage('assets/logo.png'),
                  fit: BoxFit.scaleDown,
                  height: 100,

                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: _SignInForm(),
                ),
              ],
            ),
      )),
    );
  }
}

class _SignInForm extends StatefulWidget {
  @override
  __SignInFormState createState() => __SignInFormState();
}

class __SignInFormState extends State<_SignInForm> {
  final _controller = Get.put(LoginController());

  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  final _passwordController = TextEditingController();
  final _emailController = TextEditingController();
  final _ipController = TextEditingController();
  MaskTextInputFormatter formatter = MaskTextInputFormatter(mask: "###.###.#.##");

  bool _autoValidate = false;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Form(
        key: _key,
        autovalidateMode:
            _autoValidate ? AutovalidateMode.always : AutovalidateMode.disabled,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Логин',
                  filled: true,
                  isDense: true,
                ),
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                autocorrect: false,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Необходимо указать логин.';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 12,
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Пароль',
                  filled: true,
                  isDense: true,
                ),
                obscureText: _controller.obscureText.value,
                controller: _passwordController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Необходимо указать пароль.';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 12,
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'IP',
                  filled: true,
                  isDense: true,
                ),
                obscureText: false,
                controller: _ipController,
                inputFormatters: [formatter],
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Необходимо задать адрес.';
                  }
                  return null;
                },
              ),
              IconButton(onPressed: _controller.tuggleObscureText, icon: Icon(Icons.remove_red_eye)),
              const SizedBox(
                height: 16,
              ),
              ElevatedButton(
                child: Text('ВОЙТИ'),
                style: ElevatedButton.styleFrom(
                  primary: Color.fromRGBO(64, 75, 96, .9)
                ),
                onPressed: _controller.state is LoginLoading
                    ? () {}
                    : _onLoginButtonPressed,
              ),
              const SizedBox(
                height: 20,
              ),
              if (_controller.state is LoginFailure)
                Text(
                  (_controller.state as LoginFailure).error,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Get.theme.errorColor),
                ),
              if (_controller.state is LoginLoading)
                Center(
                  child: CircularProgressIndicator(),
                )
            ],
          ),
        ),
      );
    });
  }

  _onLoginButtonPressed() {
    if (_key.currentState.validate()) {
      _controller.login(_emailController.text, _passwordController.text, _ipController.text);
    } else {
      setState(() {
        _autoValidate = true;
      });
    }
  }
}
