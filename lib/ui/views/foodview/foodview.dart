import 'package:flutter/material.dart';
import 'package:food_delivery/ui/common/app_colors.dart';
import 'package:food_delivery/ui/views/foodview/food_viewmodel.dart';
import 'package:stacked/stacked.dart';

class FoodView extends StatefulWidget {
  const FoodView({super.key});

  @override
  State<FoodView> createState() => _FoodViewState();
}

class _FoodViewState extends State<FoodView> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(viewModelBuilder: ()=> FoodViewmodel(), builder: (context, viewmodel, child){
    return  Container(
      decoration: BoxDecoration(gradient: gradient),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          forceMaterialTransparency: true,
          leading: const Icon(
            Icons.arrow_back_ios,
            color: fontColor,
          ),
          actions: const [
             Icon(
              Icons.favorite,
              color: fontColor,
            ),
             Icon(
              Icons.menu,
              color: fontColor,
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const Image(image: AssetImage("assets/images/Image 17.png")),
              Container(
                width: 353,
                height: 253,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color.fromARGB(255, 193, 8, 225).withOpacity(0.2),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _text("Udon Miso", fontColor, 20.5),
                    const SizedBox(height: 5),
                    _text("Rs 400", fontColor, 20.5),
                    const SizedBox(height: 5),
                    _text(
                        "Our Udon Miso is a comforting bowl of \nthick, handmade udon noodles in a rich\nmiso broth, garnished with tofu, spring \nonions, and vegetables.",
                        Colors.white.withOpacity(0.5),16.5),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12.0,horizontal: 15.0),
                      child: Container(
                        width: 105,
                        height: 38,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: const Color.fromARGB(255, 28, 20, 65).withOpacity(0.6)
                        ),
                        child: Row(
                          children: [
                            IconButton(onPressed: (){}, icon: const Icon(Icons.remove,color: fontColor,)),
                            _text("1", fontColor, 15.0),
                            IconButton(onPressed: (){}, icon: const Icon(Icons.add,color: fontColor,)),
                          ],
                        ),
                      ),
                    ),
          
                  ],
                ),
              ),
              Divider(
                color: fontColor.withOpacity(0.3),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Column(
          
                  children: [
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _text("Noodles Type", fontColor, 18.0),
                          _text("Requires", Colors.white.withOpacity(0.4), 15.0)
                        ],
                      ),
                    const SizedBox(height: 10,),
          
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _text("Thin", fontColor, 16.0),
                        Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            border: Border.all(
                                color:fontColor.withOpacity(0.4)
                            ),
                            color: const Color.fromARGB(255, 28, 20, 65),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 9.0,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _text("Thick", fontColor, 16.0),
                        Checkbox(
                            value: viewmodel.isChacked,
                            onChanged: (newValue) {
                              setState(() {
                                viewmodel.isChacked = newValue;
                              });

                            }),
                      ],
                    ),
                    SizedBox(
                      height: 9.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _text("Udon", fontColor, 16.0),
                        Checkbox(
                            value: viewmodel.isChacked,
                            onChanged: (newValue) {
                              setState(() {
                                viewmodel.isChacked = newValue;
                              });

                            }),
                      ],
                    ),
                    SizedBox(
                      height: 9.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _text("Thin", fontColor, 16.0),
                        Checkbox(
                            value:viewmodel.isChacked,
                            tristate: true,
                            onChanged: (newValue) {
                              setState(() {
                               viewmodel.isChacked = newValue;
                              });
                            }),
                      ],
                    ),
                     ElevatedButton(
                                  onPressed: () {
                                    
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color.fromARGB(97, 48, 0, 192),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                  ),
                                  child: const Center(
                                    child:  Text(
                                      "Add To Basket",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
    });
  }

  _text(String text, Color colors, double size) {
    return Text(
      text,
      style: TextStyle(color: colors, fontSize: size),
    );
  }
}