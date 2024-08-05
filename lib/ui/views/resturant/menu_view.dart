import 'package:flutter/material.dart';
import 'package:food_delivery/ui/common/app_colors.dart';
import 'package:food_delivery/ui/views/resturant/menu_viewmodel.dart';
import 'package:stacked/stacked.dart';

class MenuView extends StatefulWidget {
  const MenuView({super.key});

  @override
  State<MenuView> createState() => _MenuViewState();
}

class _MenuViewState extends State<MenuView> {
  @override
  Widget build(BuildContext context) {
   return ViewModelBuilder.reactive(viewModelBuilder: () => MenuViewmodel(), builder: (context, viewmodel, child){
    return  Container(
      height: double.infinity,
      decoration: BoxDecoration(
        gradient: gradient,
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          forceMaterialTransparency: true,
          leading: const Icon(Icons.arrow_back_ios),
          actions: [Icon(Icons.favorite)],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(child: const Image(image: AssetImage("assets/images/image 18.png"))),
              Positioned(
                top: 20,
                child: Container(
                  width: 353,
                  height: 154,
                  decoration: BoxDecoration(
                    color: Colors.purple.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(30)
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          const SizedBox(width: 3),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _text("Kinka Izakaya", fontColor),
          
                              Row(
                                children: [
                                  _text("2972 Westheimer Rd. Santa Ana", fontColor),
                                  const SizedBox(width: 10),
                                  const Icon(Icons.arrow_forward_ios,color: fontColor),
                                ],
                              ),
                              const SizedBox(height: 10),
                            ],
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: [
                              _text("Delivery fee", fontColor),
                              _text("Rs 300", fontColor),
                            ],
                          ),
                          Column(
                            children: [
                              _text("Delivery fee", fontColor),
                              _text("Rs 300", fontColor),
                            ],
                          ),
                          Column(
                            children: [
                              _text("Delivery fee", fontColor),
                              _text("Rs 300", fontColor),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 10),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                        width: 197,
                        height: 44,
                        decoration: BoxDecoration(
          
                          borderRadius: BorderRadius.circular(10),
                          color: const Color.fromARGB(255, 15, 4, 116).withOpacity(0.5),
                        ),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Container(
                                width: 90,
                                height: 36,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: const Color.fromARGB(255, 219, 15, 255).withOpacity(0.5),
                                ),
                                child: Center(child: _text("Delivery", fontColor)),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Container(
          
                                child: Center(child: _text("Take Out", fontColor)),
                              ),
                            ),
          
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                        width: 140,
                        height: 44,
                        decoration: BoxDecoration(
          
                          borderRadius: BorderRadius.circular(10),
                          color: const Color.fromARGB(255, 15, 4, 116).withOpacity(0.5),
                        ),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Row(
                                children: [
                                  const Icon(Icons.person_add_alt,color: fontColor),
                                  const SizedBox(width: 5,),
                                  Center(child: _text("Group Order", fontColor)),
                                ],
                              ),
                            ),
          
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
          
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Icon(Icons.search,color: fontColor,),
                    _text("Featured items", fontColor),
                    _text("Appetizers", fontColor),
                    _text("Sushi", Colors.white)
                  ],
                ),
              ),
          
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.0),
                child: Divider(
                  color: fontColor,
                ),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
                  child:  _text("Featured items", fontColor),
                ),
              ),
          
          
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Column(
                  children: [
                    GestureDetector(onTap: (){viewmodel.nav();},child: const Image(image: AssetImage("assets/images/Image4.png"))),
                    const SizedBox(height: 20),
                    const Image(image: AssetImage("assets/images/Image4.png")),
                  ],
                ),
              ),
            ],
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