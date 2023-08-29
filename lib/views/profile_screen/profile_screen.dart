import 'package:emart_app/controllers/auth_controller.dart';
import 'package:emart_app/views/auth_screen/login_screen.dart';
import 'package:get/get.dart';

import '../../consts/consts.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: OutlinedButton(
          style: OutlinedButton.styleFrom(
              side: const BorderSide(
            color: whiteColor,
          )),
          onPressed: () async {
            await Get.put(AuthController()).signoutMethod(context);
            Get.offAll(const LoginScreen());
          },
          child: logout.text.fontFamily(semibold).white.make(),
        ),
      ),
    );
  }
}
