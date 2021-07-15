import 'package:dotted_border/dotted_border.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:funfy/components/sizeclass/SizeConfig.dart';
import 'package:funfy/utils/colors.dart';
import 'package:funfy/utils/fontsname.dart';
import 'package:funfy/utils/imagesIcons.dart';
import 'package:funfy/utils/strings.dart';

class YourOrderSum extends StatefulWidget {
  @override
  _YourOrderSumState createState() => _YourOrderSumState();
}

class _YourOrderSumState extends State<YourOrderSum> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.homeBackgroundLite,
          centerTitle: true,
          title: Text(
            "Your Order Summery",
            style: TextStyle(
                color: AppColors.white,
                fontSize: size.width * 0.05,
                fontFamily: Fonts.dmSansMedium),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            color: AppColors.homeBackgroundLite,
            padding: EdgeInsets.all(9.0),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.all(Radius.circular(size.width * 0.02)),
                    color: AppColors.greenCont,
                  ),
                  height: SizeConfig.screenHeight * 0.10,
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        "assets/svgicons/card.svg",
                        color: Colors.white,
                        height: size.width * 0.075,
                      ),
                      SizedBox(
                        width: SizeConfig.screenWidth * 0.03,
                      ),
                      Text(
                        "Payment status",
                        style: TextStyle(
                            color: AppColors.white,
                            fontSize: size.width * 0.05,
                            fontFamily: Fonts.dmSansMedium),
                      ),
                      Spacer(),
                      Text(
                        "PAID",
                        style: TextStyle(
                            color: AppColors.white,
                            fontSize: size.width * 0.05,
                            fontFamily: Fonts.dmSansBold),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: SizeConfig.screenHeight * 0.05,
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: size.width * 0.04,
                      vertical: size.height * 0.02),
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.borderColor),
                    borderRadius:
                        BorderRadius.all(Radius.circular(size.width * 0.02)),
                    color: AppColors.homeBackground,
                  ),
                  //  height: SizeConfig.screenHeight * 0.10,
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Pack La Havana",
                            style: TextStyle(
                                color: AppColors.white,
                                fontSize: size.width * 0.05,
                                fontFamily: Fonts.dmSansBold),
                          ),
                          SizedBox(
                            height: SizeConfig.screenHeight * 0.02,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ConstrainedBox(
                                  constraints: BoxConstraints(
                                      maxWidth: SizeConfig.screenWidth * 0.68),
                                  child: Text(
                                    Strings.lorem,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        color: AppColors.itemDescription,
                                        fontSize: size.width * 0.04,
                                        fontFamily: Fonts.dmSansRegular),
                                  )),
                              // Spacer(),
                              Container(
                                  height: size.height * 0.08,
                                  width: size.width * 0.18,
                                  // color: Colors.blue,
                                  child: Image.network(
                                    Images.beerNetwork,
                                  ))
                            ],
                          ),
                          SizedBox(
                            height: size.height * 0.03,
                          ),
                          sameItem3(
                              size: size,
                              topTile: "Alcohol",
                              title: "Ron Bucanero Anejo",
                              decription: "70 CL",
                              price: "25.88"),
                          SizedBox(
                            height: size.height * 0.03,
                          ),
                          sameItem3(
                              size: size,
                              topTile: "Mix",
                              title: "Ron Bucanero Anejo",
                              decription: "70 CL",
                              price: "25.88"),
                          SizedBox(
                            height: size.height * 0.03,
                          ),
                          sameItem3(
                              size: size,
                              topTile: "Extras",
                              title: "Ron Bucanero Anejo",
                              decription: "70 CL",
                              price: "25.88"),
                          SizedBox(
                            height: SizeConfig.screenHeight * 0.05,
                          ),
                          Container(
                            width: SizeConfig.screenWidth * 0.82,
                            child: DottedLine(
                              dashLength: 10,
                              dashGapLength: 13,
                              lineThickness: 2,
                              dashColor: Colors.grey,
                              dashGapColor: AppColors.homeBackground,
                            ),
                          ),
                          SizedBox(
                            height: SizeConfig.screenHeight * 0.04,
                          ),
                          Container(
                            width: SizeConfig.screenWidth * 0.80,
                            child: Row(
                              children: [
                                Text(
                                  "Other Taxes",
                                  style: TextStyle(
                                      color: AppColors.white,
                                      fontSize: size.width * 0.05,
                                      fontFamily: Fonts.dmSansMedium),
                                ),
                                Spacer(),
                                Text(
                                  "€ 24.99",
                                  style: TextStyle(
                                      color: AppColors.white,
                                      fontSize: size.width * 0.05,
                                      fontFamily: Fonts.dmSansBold),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: SizeConfig.screenHeight * 0.04,
                          ),
                          Container(
                            width: SizeConfig.screenWidth * 0.80,
                            child: Row(
                              children: [
                                Text(
                                  "Grand Total",
                                  style: TextStyle(
                                      color: AppColors.white,
                                      fontSize: size.width * 0.06,
                                      fontFamily: Fonts.dmSansMedium),
                                ),
                                Spacer(),
                                Text(
                                  Strings.euro + " " + "96.00",
                                  style: TextStyle(
                                      color: AppColors.white,
                                      fontSize: size.width * 0.065,
                                      fontFamily: Fonts.dmSansBold),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      //Image.asset(name)
                    ],
                  ),
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.02),
                Container(
                  width: SizeConfig.screenWidth,
                  height: SizeConfig.screenHeight * 0.10,
                  child: DottedBorder(
                    radius: Radius.elliptical(100, 100),
                    color: AppColors.borderColor,
                    // gap: 3,
                    strokeWidth: 1,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        // crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.access_time,
                            color: AppColors.white,
                          ),
                          SizedBox(
                            width: SizeConfig.screenWidth * 0.03,
                          ),
                          Text(
                            "Delivery Status",
                            style: TextStyle(
                                color: AppColors.white,
                                fontSize: size.width * 0.05,
                                fontFamily: Fonts.dmSansMedium),
                          ),
                          Spacer(),
                          Column(
                            children: [
                              SizedBox(height: SizeConfig.screenHeight * 0.02),
                              Text(
                                "25 JUNE, Today",
                                style: TextStyle(
                                    color: AppColors.itemDescription,
                                    fontSize: size.width * 0.04,
                                    fontFamily: Fonts.dmSansMedium),
                              ),
                              Text(
                                "Till 04:00 PM",
                                style: TextStyle(
                                    color: AppColors.itemDescription,
                                    fontSize: size.width * 0.04,
                                    fontFamily: Fonts.dmSansMedium),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.04),
              ],
            ),
          ),
        ));
  }
}

Widget sameItem3(
    {size, String? topTile, String? title, String? decription, String? price}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        "($topTile)",
        style: TextStyle(
            color: AppColors.itemDescription,
            fontSize: size.width * 0.03,
            fontFamily: Fonts.dmSansRegular),
      ),
      SizedBox(
        height: SizeConfig.screenHeight * 0.01,
      ),
      Text(
        "$title",
        style: TextStyle(
            color: AppColors.white,
            fontSize: size.width * 0.05,
            fontFamily: Fonts.dmSansMedium),
      ),
      Container(
        width: SizeConfig.screenWidth * 0.80,
        child: Row(
          children: [
            Text(
              "$decription",
              style: TextStyle(
                  color: AppColors.itemDescription,
                  fontSize: size.width * 0.04,
                  fontFamily: Fonts.dmSansMedium),
            ),
            Spacer(),
            Text(
              Strings.euro + " " + "$price",
              style: TextStyle(
                  color: AppColors.white,
                  fontSize: size.width * 0.05,
                  fontFamily: Fonts.dmSansMedium),
            )
          ],
        ),
      )
    ],
  );
}
