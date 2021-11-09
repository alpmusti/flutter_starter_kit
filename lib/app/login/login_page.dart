import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/app/home/home_page.dart';
import '/core/components/loading_button.dart';
import '/core/components/base_page.dart';
import '/domain/repositories/login/login_repository.dart';
import 'login_view_model.dart';

class LoginPage extends StatelessWidget {
  static const String name = '/';
  LoginPage({Key? key}) : super(key: key);
  get usernameTextController =>
      TextEditingController(text: loginViewModel.username);
  get passwordTextController =>
      TextEditingController(text: loginViewModel.password);
  final loginViewModel = Get.put(LoginViewModel(() => LoginRepository()));

  @override
  Widget build(BuildContext context) {
    return BasePage(
      hasScroll: true,
      isCentered: true,
      titleKey: 'sign_in',
      child: Container(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'login'.tr,
              style: Theme.of(context).textTheme.headline5,
            ),
            const SizedBox(
              height: 5,
            ),
            _usernameFieldWidget,
            const SizedBox(
              height: 5,
            ),
            _passwordFieldWidget,
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: buildLoginComponent(),
            )
          ],
        ),
      ),
    );
  }

  Widget get _usernameFieldWidget {
    return TextField(
      onChanged: (text) => loginViewModel.username = text,
      controller: usernameTextController,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        contentPadding: const EdgeInsets.all(8.0),
        prefixIcon: const Icon(Icons.person),
        hintText: 'enter_username'.tr,
      ),
      textInputAction: TextInputAction.continueAction,
      autocorrect: false,
    );
  }

  Widget get _passwordFieldWidget {
    return TextField(
      onChanged: (text) => loginViewModel.password = text,
      obscureText: true,
      controller: passwordTextController,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        contentPadding: const EdgeInsets.all(8.0),
        prefixIcon: const Icon(Icons.lock),
        hintText: 'enter_password'.tr,
      ),
    );
  }

  Widget buildLoginComponent() {
    return Row(
      children: [
        Obx(
          () => Expanded(
            child: LoadingButton(
              'login'.tr,
              isLoading: loginViewModel.isLoading,
              onPressed: () async {
                await loginViewModel.login();
                Get.offAllNamed(HomePage.name);
              },
            ),
          ),
        ),
      ],
    );
  }
}
