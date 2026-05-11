import 'package:flutter/material.dart';
import 'package:rosheta_ai/core/database/user_dao.dart';
import 'package:rosheta_ai/core/resources/width_manager.dart';
import 'package:rosheta_ai/view/widget/main_button_design.dart';

import '../../../core/navigation/app_navigation.dart';
import '../../../core/resources/color_manager.dart';
import '../../../core/resources/height_manager.dart';
import '../../../core/resources/padding_manager.dart';
import '../../../core/resources/route_manager.dart';
import '../../../core/resources/utils.dart';
import '../../../view/widget/app_bar_widget.dart';
import '../widgets/sign_in_fotter_widget.dart';
import '../widgets/sign_up_agree_widget.dart';
import '../widgets/sign_up_form.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isAgree = false;
  bool _isLoading = false;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _signUp() async {
    if (!_formKey.currentState!.validate()) return;
    if (!_isAgree) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please agree to the terms'), backgroundColor: Colors.red),
      );
      return;
    }

    setState(() => _isLoading = true);

    final existing = await UserDao.getUserByEmail(_emailController.text.trim());
    if (existing != null) {
      if (!mounted) return;
      setState(() => _isLoading = false);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Email already registered'), backgroundColor: Colors.red),
      );
      return;
    }

    await UserDao.register({
      'fullName': _nameController.text.trim(),
      'email': _emailController.text.trim(),
      'password': _passwordController.text,
    });

    if (!mounted) return;
    setState(() => _isLoading = false);
    AppNavigation.pushReplacementNamed(context, RoutesName.login, args: {'isNewUser': true});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      appBar: AppBarWidget(title: Utils.signUp),
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

              /// ── Name, Email, Password ──
              SignUpForm(
                formKey: _formKey,
                nameController: _nameController,
                emailController: _emailController,
                passwordController: _passwordController,
              ),

              SizedBox(height: HeightManager.h22),

              /// ── Agree to Terms ──
              SignUpAgreeWidget(
                onChanged: (value) {
                  setState(() {
                    _isAgree = value;
                  });
                },
              ),

              SizedBox(height: HeightManager.h40),

              /// ── Sign Up Button ──
              InkWell(
                  onTap: _isLoading ? null : _signUp,
                  child: MainButtonDesign(width: WidthManagers.w171, text: Utils.signUp, height: HeightManager.h50)),

              SizedBox(height: HeightManager.h30),

              /// ── Already have an account? Sign In ──
              const SignUpFooterWidget(),

              SizedBox(height: HeightManager.h20),
            ],
          ),
        ),
      ),
    );
  }
}