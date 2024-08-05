import 'package:flutter/material.dart';
import 'package:food_delivery/ui/common/app_colors.dart';
import 'package:food_delivery/ui/views/home/home_viewmodel.dart';
import 'package:food_delivery/ui/views/home/searchfield.dart';
import 'package:stacked/stacked.dart';

class Homeview extends StatefulWidget {
  const Homeview({super.key});

  @override
  State<Homeview> createState() => _HomeviewState();
}

class _HomeviewState extends State<Homeview> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
        viewModelBuilder: () => HomeViewmodel(),
        builder: (context, viewmodel, child) {
          return SafeArea(
            child: Container(
              height: double.infinity,
              decoration: BoxDecoration(gradient: viewmodel.gradient),
              child: Scaffold(
                backgroundColor: Colors.transparent,
                appBar: AppBar(
                  backgroundColor: Colors.transparent,
                ),
                body: SingleChildScrollView(
                  child: Column(
                    children: [
                      SearchField(
                        hintText: "Your Order?",
                        controller: viewmodel.searchController,
                        prefixIcon: Icons.search,
                        focusNode: viewmodel.focusNode1,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12.0, vertical: 15.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            _text("Categories", fontColor),
                            _text("See All", fontColor),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: [
                                Container(
                                  height: 60,
                                  width: 60,
                                  decoration: BoxDecoration(
                                      color: Colors.black,
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                          color: fontColor.withOpacity(0.3))),
                                  child: const Image(
                                    image:
                                        AssetImage("assets/images/burger1.png"),
                                    width: 30,
                                    height: 30,
                                  ),
                                ),
                                _text("Burgers", fontColor),
                              ],
                            ),
                            Column(
                              children: [
                                Container(
                                  height: 60,
                                  width: 60,
                                  decoration: BoxDecoration(
                                      color: Colors.black,
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                          color: fontColor.withOpacity(0.3))),
                                  child: const Image(
                                    image: AssetImage("assets/images/cake1.png"),
                                    width: 30,
                                    height: 30,
                                  ),
                                ),
                                _text("Dessert", fontColor),
                              ],
                            ),
                            Column(
                              children: [
                                Container(
                                  height: 60,
                                  width: 60,
                                  decoration: BoxDecoration(
                                      color: Colors.black,
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                          color: fontColor.withOpacity(0.3))),
                                  child: const Image(
                                    image: AssetImage("assets/images/taco1.png"),
                                    width: 30,
                                    height: 30,
                                  ),
                                ),
                                _text("Mexcian", fontColor),
                              ],
                            ),
                            Column(
                              children: [
                                Container(
                                  height: 60,
                                  width: 60,
                                  decoration: BoxDecoration(
                                      color: Colors.black,
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                          color: fontColor.withOpacity(0.3))),
                                  child: const Image(
                                    image: AssetImage("assets/images/sushi1.png"),
                                    width: 30,
                                    height: 30,
                                  ),
                                ),
                                _text("Sushi", fontColor),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: backgroundcolor,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        width: 300,
                        height: 150,
                        child: Stack(
                          children: [
                            const Positioned(
                              top: 20,
                              left: 20,
                              child: Text(
                                '30% OFF',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 24,
                                    color: fontColor2),
                              ),
                            ),
                            const Positioned(
                              bottom: 50,
                              left: 20,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Discover discounts in your',
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: fontColor2,
                                        fontWeight: FontWeight.w100),
                                  ),
                                  Text(
                                    'favourite local restaurants',
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: fontColor2,
                                        fontWeight: FontWeight.w100),
                                  ),
                                ],
                              ),
                            ),
                            Positioned(
                              top: 0,
                              right: 0,
                              bottom: 10,
                              child: Image.asset(
                                'assets/images/Pasta.png',
                                width: 150,
                                height: 200,
                                fit: BoxFit.contain,
                              ),
                            ),
                            Positioned(
                              bottom: 10,
                              left: 16,
                              child: ElevatedButton(
                                onPressed: () {
                                  viewmodel.nav();
                                },
                                style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        const Color.fromARGB(255, 2, 83, 222)),
                                child: const Text(
                                  'Order Now',
                                  style: TextStyle(
                                    color: fontColor,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      const Row(
                        children: [
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            "Fastest near you",
                            style: TextStyle(
                              color: fontColor,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Container(
                        width: 300,
                        height: 200,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/images/imagesushi.png'),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                 bottomNavigationBar: BottomAppBar(
            elevation: 1,
            height: 60,
            color: bottomcolor,
            shape: const CircularNotchedRectangle(),
            notchMargin: 10,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      viewmodel.currentIndex == 2;
                    });
                  },
                  child: Column(
                    children: [
                      Icon(
                        Icons.home_outlined,
                        size: 25,
                        color: viewmodel.currentIndex == 2? iconcolor: fontColor,
                      ),
                      Text(
                        'setting',
                        style: TextStyle(fontSize: 7, color: viewmodel.currentIndex == 2? iconcolor: fontColor,),
                      ),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      viewmodel.currentIndex == 0; 
                    });
                    viewmodel.navs();
                  },
                  child: Column(
                    children: [
                      Icon(
                        Icons.manage_search_sharp,
                        size: 25,
                        color: viewmodel.currentIndex == 0? iconcolor: fontColor,
                      ),
                      Text(
                        'Browse',
                        style: TextStyle(fontSize: 7, color: viewmodel.currentIndex == 0? iconcolor: fontColor,),
                      ),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      viewmodel.currentIndex == 1;
                    });
                  },
                  child: Column(
                    children: [
                      Icon(
                        Icons.shopping_cart_outlined,
                        size: 25,
                        color: viewmodel.currentIndex == 1? iconcolor: fontColor,
                      ),
                      Text(
                        'carts',
                        style: TextStyle(fontSize: 7, color: viewmodel.currentIndex == 1? iconcolor: fontColor,),
                      ),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      viewmodel.currentIndex == 3;
                    });
                  },
                  child: Column(
                    children: [
                      Icon(
                        Icons.document_scanner_outlined,
                        size: 25,
                        color: viewmodel.currentIndex == 3? iconcolor: fontColor,
                      ),
                      Text(
                        'Orders',
                        style: TextStyle(fontSize: 7, color: viewmodel.currentIndex == 3? iconcolor: fontColor,),
                      ),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      viewmodel.currentIndex == 4;
                    });
                  },
                  child: Column(
                    children: [
                      Icon(
                        Icons.person,
                        size: 25,
                        color: viewmodel.currentIndex == 4? iconcolor: fontColor,
                      ),
                      Text(
                        'Account',
                        style: TextStyle(fontSize: 7, color: viewmodel.currentIndex == 4? iconcolor: fontColor,),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
              ),
            ),
          );
        });
  }

  _text(String text, Color colors) {
    return Text(
      text,
      style: TextStyle(color: colors),
    );
  }
}
