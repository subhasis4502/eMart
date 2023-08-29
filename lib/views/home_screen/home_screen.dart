import 'package:emart_app/consts/consts.dart';
import 'package:emart_app/consts/lists.dart';
import 'package:emart_app/views/home_screen/components/chat_webview.dart';
import 'package:emart_app/views/home_screen/components/featured_button.dart';
import 'package:emart_app/widgets_common/home_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12.0),
      color: lightGrey,
      width: context.screenWidth,
      height: context.screenHeight,
      child: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  alignment: Alignment.center,
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                        10.0), // Adjust the radius as needed
                    color: whiteColor,
                  ),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      suffixIcon: Icon(Icons.search),
                      filled: true,
                      fillColor: whiteColor,
                      hintText: searchAnything,
                      hintStyle: TextStyle(color: textfieldGrey),
                    ),
                  ),
                ),
                10.heightBox,
                Expanded(
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      children: [
                        // Swipers
                        VxSwiper.builder(
                            aspectRatio: 16 / 9,
                            autoPlay: true,
                            height: 150,
                            enlargeCenterPage: true,
                            itemCount: slidersList.length,
                            itemBuilder: (context, index) {
                              return Image.asset(
                                slidersList[index],
                                fit: BoxFit.fill,
                              )
                                  .box
                                  .rounded
                                  .clip(Clip.antiAlias)
                                  .margin(
                                      const EdgeInsets.symmetric(horizontal: 8))
                                  .make();
                            }),
                        10.heightBox,
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: List.generate(
                                2,
                                (index) => homeButtons(
                                      height: context.screenHeight * 0.15,
                                      width: context.screenWidth / 2.5,
                                      icon: index == 0 ? icBoy : icGirl,
                                      title: index == 0
                                          ? menClothingFashion
                                          : womenDress,
                                    ))),
                        10.heightBox,
                        // VxSwiper.builder(
                        //     aspectRatio: 16 / 9,
                        //     autoPlay: false,
                        //     height: 120,
                        //     itemCount: secondSlidersList.length,
                        //     itemBuilder: (context, index) {
                        //       return Image.asset(
                        //         secondSlidersList[index],
                        //         fit: BoxFit.fill,
                        //       )
                        //           .box
                        //           .roundedSM
                        //           .clip(Clip.antiAlias)
                        //           .margin(
                        //               const EdgeInsets.symmetric(horizontal: 6))
                        //           .make();
                        //     }),
                        10.heightBox,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: List.generate(
                              3,
                              (index) => homeButtons(
                                    height: context.screenHeight * 0.15,
                                    width: context.screenWidth / 3.5,
                                    icon: index == 0
                                        ? icTopCategories
                                        : index == 1
                                            ? icBrands
                                            : icTopSeller,
                                    title: index == 0
                                        ? topCategories
                                        : index == 1
                                            ? brand
                                            : topSellers,
                                  )),
                        ),
                        20.heightBox,
                        Align(
                            alignment: Alignment.centerLeft,
                            child: featureCategories.text
                                .color(darkFontGrey)
                                .size(18)
                                .fontFamily(semibold)
                                .make()),
                        20.heightBox,
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: List.generate(
                                3,
                                (index) => Column(
                                      children: [
                                        featuredButton(
                                            icon: featuredImages1[index],
                                            title: featuredTitles1[index]),
                                        10.heightBox,
                                        featuredButton(
                                            icon: featuredImages2[index],
                                            title: featuredTitles2[index]),
                                      ],
                                    )).toList(),
                          ),
                        ),
                        20.heightBox,
                        Container(
                          padding: const EdgeInsets.all(12),
                          width: double.infinity,
                          decoration: const BoxDecoration(color: redColor),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              featureProducts.text.white
                                  .fontFamily(bold)
                                  .size(18)
                                  .make(),
                              10.heightBox,
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: List.generate(
                                      6,
                                      (index) => Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Image.asset(
                                                imgP4,
                                                width: 150,
                                                fit: BoxFit.cover,
                                              ),
                                              10.heightBox,
                                              "Brown High-heeled"
                                                  .text
                                                  .fontFamily(semibold)
                                                  .color(darkFontGrey)
                                                  .make(),
                                              10.heightBox,
                                              "Rs. 4000"
                                                  .text
                                                  .color(redColor)
                                                  .fontFamily(bold)
                                                  .size(16)
                                                  .make(),
                                            ],
                                          )
                                              .box
                                              .white
                                              .margin(
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 4))
                                              .roundedSM
                                              .padding(const EdgeInsets.all(8))
                                              .make()),
                                ),
                              )
                            ],
                          ),
                        ),
                        20.heightBox,
                        allProducts.text.color(redColor).fontFamily(bold).size(18).make(),
                        10.heightBox,
                        GridView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: 6,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    mainAxisSpacing: 8,
                                    crossAxisSpacing: 8,
                                    mainAxisExtent: 300),
                            itemBuilder: (context, index) {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image.asset(
                                    imgP5,
                                    height: 200,
                                    width: 200,
                                    fit: BoxFit.cover,
                                  ),
                                  const Spacer(),
                                  10.heightBox,
                                  "Premium Lather Bags"
                                      .text
                                      .fontFamily(semibold)
                                      .color(darkFontGrey)
                                      .make(),
                                  10.heightBox,
                                  "Rs. 19,999"
                                      .text
                                      .color(redColor)
                                      .fontFamily(bold)
                                      .size(16)
                                      .make(),
                                  10.heightBox,
                                ],
                              )
                                  .box
                                  .white
                                  .margin(
                                      const EdgeInsets.symmetric(horizontal: 4))
                                  .roundedSM
                                  .padding(const EdgeInsets.all(12))
                                  .make();
                            })
                      ],
                    ),
                  ),
                ),
              ],
            ),
            // const Expanded(child: ChatWebview()),
          ],
        ),
      ),
    );
  }
}
