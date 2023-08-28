import 'package:emart_app/consts/consts.dart';
import 'package:emart_app/views/category_screen/category_details.dart';
import 'package:emart_app/controllers/product_controller.dart';


import 'package:get/get.dart';

Widget homeButtons({width, height, icon, String? title, onPress}) {

  var controller = Get.find<ProductController>();

  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Image.asset(
        icon,
        width: 30,
      ),
      10.heightBox,
      title!.text.size(12).fontFamily(semibold).color(darkFontGrey).make(),
    ],
  ).box.rounded.white.size(width, height).make().onTap(() {
    controller.getSubCategories(title);
    Get.to(CategoryDetails(title: title));
  });
}
