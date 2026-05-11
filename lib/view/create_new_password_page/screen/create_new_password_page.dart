import 'package:flutter/material.dart';

import '../../../core/database/user_dao.dart';
import '../../../core/resources/color_manager.dart';
import '../../../core/resources/fonts_manager.dart';
import '../../../core/resources/height_manager.dart';
import '../../../core/resources/padding_manager.dart';
import '../../../core/resources/route_manager.dart';
import '../../../core/resources/utils.dart';
import '../../login_page/widget/success_dialog.dart';
import '../widget/create_password_button.dart';
import '../widget/text_form_field_for_password.dart';

class CreateNewPasswordPage extends StatefulWidget {
  const CreateNewPasswordPage({super.key});

  @override
  State<CreateNewPasswordPage> createState() => _CreateNewPasswordPageState();
}

class _CreateNewPasswordPageState extends State<CreateNewPasswordPage> {
  final _formKey = GlobalKey<FormState>();
  final _passwordController = TextEditingController();
  final _confirmController = TextEditingController();

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmController.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;

    final args = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    final email = args?['email'] as String?;
    if (email == null || email.isEmpty) return;

    await UserDao.updatePassword(email, _passwordController.text);
    if (!mounted) return;

    showDialog(
      context: context,
      builder: (_) => SuccessDialogWidget(
        titleDialog: 'Password Reset',
        desc: Utils.youHaveSuccessfullyResetYourPassword,
        buttonTitle: Utils.signIn,
        route: RoutesName.login,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: PaddingManager.p38,
            horizontal: PaddingManager.p24,
          ),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: InkWell(
                    onTap: () => Navigator.pop(context),
                    child: Icon(
                      Icons.arrow_back_ios,
                      size: 24,
                      color: ColorManager.blackText,
                    ),
                  ),
                ),
                SizedBox(height: HeightManager.h24),
                Text(
                  Utils.createNewPassword,
                  style: TextStyle(
                    color: ColorManager.blackText,
                    fontSize: FontSizeManagers.f24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: HeightManager.h8),
                Text(
                  Utils.messageForCreateNewPassword,
                  style: TextStyle(
                    color: ColorManager.grey2,
                    fontSize: FontSizeManagers.f16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(height: HeightManager.h24),
                TextFormFieldForPassword(controller: _passwordController),
                SizedBox(height: HeightManager.h20),
                TextFormFieldForPassword(
                  isConfirmPassword: true,
                  controller: _confirmController,
                  passController: _passwordController,
                ),
                SizedBox(height: HeightManager.h32),
                CreatePasswordButton(onPressed: _submit),
                SizedBox(height: HeightManager.h15),
              ],
            ),
          ),
        ),
      ),
    );
  }
}





