import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class OrderFood extends StatefulWidget {
  const OrderFood({Key? key}) : super(key: key);

  @override
  State<OrderFood> createState() => _OrderFoodState();
}

class _OrderFoodState extends State<OrderFood> {

  final SwiperController _control = SwiperController();
  int inx = 0;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: inx > 0 ?
        InkWell(
          onTap: (){
            setState(() {
              _control.previous(animation: true);
            });
          },
          child: Icon(Icons.arrow_back_ios,color: Colors.grey.withOpacity(0.75),size: 18,),) : const SizedBox(),
        actions: [
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text("Skip",
                style: GoogleFonts.montserrat(
                    color: Colors.grey.withOpacity(0.75),
                    fontWeight: FontWeight.w600,
                    fontSize: 14
                ),),
            ),
          )
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height*0.75,
              width: MediaQuery.of(context).size.width,
              child: Swiper(
                itemBuilder: (BuildContext context, int index) {
                  return
                    index == 0 ? orderFood() :
                    index == 1 ? cookingSafe() :
                    index == 2 ? quickDelivery() : orderFood();
                },
                itemCount: 3,
                loop: false,
                viewportFraction: 0.9,
                scale: 0.85,
                onIndexChanged: (_){
                  setState(() {
                    inx = _;
                  });
                },
                controller: _control,
                physics: const BouncingScrollPhysics(),
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        height: 20,
                        child: ListView.builder(
                          itemCount: 3,
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context,index){
                            return Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 3),
                              child: index != inx ?
                              Container(
                                height: 5,
                                width: 5,
                                decoration: BoxDecoration(
                                  color: Colors.grey.withOpacity(0.5),
                                  shape: BoxShape.circle,
                                ),
                              ) : Container(
                                height: 7,
                                width: 7,
                                decoration: BoxDecoration(
                                  color: Colors.deepPurple.shade900,
                                  shape: BoxShape.circle,
                                ),
                              ),
                            );
                          },
                        ),
                      )
                    ],
                  ),
                  inx != 2 ?
                  GestureDetector(
                    onTap: (){
                      setState(() {
                        _control.next(animation: true);
                      });
                    },
                    child: Container(
                      height: 55,
                      width: 55,
                      decoration: BoxDecoration(
                        color: Colors.deepPurple.shade900,
                        shape: BoxShape.circle,
                      ),
                      alignment: Alignment.center,
                      child: Text("Next",
                        style: GoogleFonts.montserrat(
                            color: Colors.white,
                            fontSize: 13,
                            fontWeight: FontWeight.w600
                        ),),
                    ),
                  ) : GestureDetector(
                    onTap: (){
                      // setState(() {
                      //   _control.next(animation: true);
                      // });
                    },
                    child: Container(
                      height: 55,
                      width: 55,
                      decoration: BoxDecoration(
                        color: Colors.deepPurple.shade900,
                        shape: BoxShape.circle,
                      ),
                      alignment: Alignment.center,
                      child: Text("Start",
                        style: GoogleFonts.montserrat(
                            color: Colors.white,
                            fontSize: 13,
                            fontWeight: FontWeight.w600
                        ),),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  orderFood(){
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Order Your Food",
              style: GoogleFonts.montserrat(
                color: Colors.black,
                fontWeight: FontWeight.w700,
                fontSize: 24,
              ),),

            Padding(
              padding: const EdgeInsets.only(right: 40,top: 15),
              child: Text("Now you can order food any time right your mobile",
                style: GoogleFonts.montserrat(
                  color: Colors.black.withOpacity(0.35),
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                ),),
            ),
          ],
        ),
        Center(child: SvgPicture.asset("assets/images/selectFood.svg",width: MediaQuery.of(context).size.width < 400 ? MediaQuery.of(context).size.width*0.6 : MediaQuery.of(context).size.width*0.3,)),
      ],
    );
  }

  cookingSafe(){
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Center(child: SvgPicture.asset("assets/images/cooking.svg",width: MediaQuery.of(context).size.width < 400 ? MediaQuery.of(context).size.width*0.6 : MediaQuery.of(context).size.width*0.3,)),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Cooking Safe Food",
              style: GoogleFonts.montserrat(
                color: Colors.black,
                fontWeight: FontWeight.w700,
                fontSize: 24,
              ),),

            Padding(
              padding: const EdgeInsets.only(right: 40,top: 15),
              child: Text("We are maintaining safety and we keep clean while making food ",
                style: GoogleFonts.montserrat(
                  color: Colors.black.withOpacity(0.35),
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                ),),
            ),
          ],
        ),

      ],
    );
  }

  quickDelivery(){
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Text("Quick Delivery",
              style: GoogleFonts.montserrat(
                color: Colors.black,
                fontWeight: FontWeight.w700,
                fontSize: 24,
              ),),

            Padding(
              padding: const EdgeInsets.only(right: 40,top: 15),
              child: Text("Order your favorite meals will be immediately deliver",
                style: GoogleFonts.montserrat(
                  color: Colors.black.withOpacity(0.35),
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                ),),
            ),
          ],
        ),
        Center(child: SvgPicture.asset("assets/images/dilivery.svg",width: MediaQuery.of(context).size.width < 400 ? MediaQuery.of(context).size.width*0.6 : MediaQuery.of(context).size.width*0.3,)),
      ],
    );
  }

}
