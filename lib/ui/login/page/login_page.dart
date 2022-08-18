import 'package:final_config_enviroment/global/color/color_scheme_extension.dart';
import 'package:final_config_enviroment/global/image/app_images.dart';
import 'package:final_config_enviroment/global/view/button.dart';
import 'package:final_config_enviroment/global/view/button_loading.dart';
import 'package:final_config_enviroment/global/view/input_view.dart';
import 'package:final_config_enviroment/ui/login/controller/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  LoginController controller = Get.find();
  TextEditingController emailTextEditingController =
      TextEditingController(text: 'dongng63@gmail.com');
  TextEditingController passwordTextEditingController =
      TextEditingController(text: 'abc@1234');

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return AnnotatedRegion(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Stack(
            children: [
              SvgPicture.asset(
                Theme.of(context).isLightMode()
                    ? AppImages.loginBackground
                    : AppImages.loginBackgroundDark,
                fit: BoxFit.fitWidth,
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width,
              ),
              Container(
                child: _buildBodyWidget(),
              )
            ],
          ),
        ),
      ),
      value: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: theme.brightness == Brightness.dark
              ? Brightness.light
              : Brightness.dark),
    );
  }

  Widget _buildBodyWidget() {
    return Center(
      child: Container(
        margin: const EdgeInsets.only(left: 31, right: 31, top: 83),
        child: Column(
          children: [
            _buildHeaderTop(),
            const SizedBox(
              height: 192,
            ),
            Text(
              'Login',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.w800,
                color: Theme.of(context).loginHeaderTitleColor,
              ),
            ),
            const SizedBox(height: 56),
            InputView(
              hideText: 'Email',
              controller: emailTextEditingController,
            ),
            const SizedBox(
              height: 16,
            ),
            InputView(
              hideText: 'Password',
              controller: passwordTextEditingController,
              obscureText: true,
            ),
            const SizedBox(
              height: 24,
            ),
            ButtonLoading(
              loadStatus: controller.loadingStatus,
              title: 'Login',
              buttonClick: () {
                _login();
              },
              backgroundColor: Theme.of(context).buttonBackground,
            ),
            const SizedBox(
              height: 42,
            ),
            Text(
              'Or continue with',
              style: TextStyle(
                  fontSize: 14, color: Theme.of(context).loginTextOther),
            ),
            const SizedBox(
              height: 16,
            ),
            _buildOtherMethodLogin(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeaderTop() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          Theme.of(context).isLightMode()
              ? AppImages.loginHeader
              : AppImages.loginHeaderDark,
          width: 42,
          height: 42,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'The Movie',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w700,
                color: Theme.of(context).loginHeaderTitleColor,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 2),
              child: Text(
                'Find Your House',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Theme.of(context).loginHeaderTitleColor,
                ),
              ),
            ),
          ],
        )
      ],
    );
  }

  Widget _buildOtherMethodLogin() {
    return Container(
      margin: const EdgeInsets.only(top: 16, bottom: 50),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
              child: Button(
            title: 'Google',
            buttonClick: () {},
            icon: SvgPicture.asset(AppImages.google),
            backgroundColor: Theme.of(context).loginBackgroundOther,
            titleStyle: TextStyle(
                fontSize: 14, color: Theme.of(context).loginTextGoogle),
          )),
          const SizedBox(width: 16),
          Expanded(
              child: Button(
                  title: 'Facebook',
                  buttonClick: () {},
                  icon: SvgPicture.asset(AppImages.google),
                  backgroundColor: Theme.of(context).loginBackgroundOther,
                  titleStyle: TextStyle(
                      fontSize: 14, color: Theme.of(context).loginTextGoogle))),
        ],
      ),
    );
  }

  void _login() {
    String email = emailTextEditingController.text;
    String pass = passwordTextEditingController.text;

    controller.login(email: email, password: pass);
  }
}
