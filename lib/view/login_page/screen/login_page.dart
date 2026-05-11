import 'package:flutter/material.dart';

import '../../../core/database/user_dao.dart';
import '../../../core/resources/color_manager.dart';
import '../../../core/resources/height_manager.dart';
import '../../../core/resources/padding_manager.dart';
import '../../../core/resources/route_manager.dart';
import '../../../core/resources/utils.dart';
import '../../../core/resources/width_manager.dart';
import '../../../core/session/session_manager.dart';
import '../../../view/widget/app_bar_widget.dart';
import '../../widget/main_button_design.dart';
import '../widget/forget_password_button.dart';
import '../widget/login_form.dart';
import '../widget/login_fotter_widget.dart';
import '../widget/success_dialog.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _login() async {
    if (!_formKey.currentState!.validate()) return;

    final email = _emailController.text.trim();
    final password = _passwordController.text;

    final user = await UserDao.login(email, password);
    if (!mounted) return;

    if (user != null) {
      SessionManager.instance.login(user);

      final args = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
      final isNewUser = args?['isNewUser'] == true;

      showDialog(
        context: context,
        builder: (_) => SuccessDialogWidget(
          titleDialog: Utils.welcomeBack,
          desc: '${Utils.welcomeMessage}\n${Utils.intoRoshetaApp}',
          buttonTitle: Utils.goToHome,
          route: isNewUser ? RoutesName.choose : RoutesName.home,
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Invalid email or password'), backgroundColor: Colors.red),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      appBar: AppBarWidget(title: Utils.login),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: HorizontalPaddingManager.p24,
            vertical: VerticalPaddingManager.p20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: HeightManager.h20),

              /// ── Email & Password ──
              LoginForm(formKey: _formKey, emailController: _emailController, passwordController: _passwordController),

              SizedBox(height: HeightManager.h8),

              /// ── Forget Password ──
              ForgetPasswordButton(),

              SizedBox(height: HeightManager.h20),

              /// ── Login Button ──
              InkWell(
                  onTap: _login,
                  child: MainButtonDesign(width: WidthManagers.w171, text: Utils.login, height: HeightManager.h50)),

              SizedBox(height: HeightManager.h25),

              /// ── Footer (Sign Up + OR + Social Buttons) ──
              const LoginFooterWidget(),
            ],
          ),
        ),
      ),
    );
  }
}

