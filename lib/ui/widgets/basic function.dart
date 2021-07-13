import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:funfy/components/sizeclass/SizeConfig.dart';
import 'package:funfy/utils/colors.dart';

String bannerImage =
    "https://png.pngtree.com/thumb_back/fw800/back_our/20190621/ourmid/pngtree-tmall-beer-festival-e-commerce-carnival-banner-image_193689.jpg";

class SlidingBannerProviderDetails extends StatelessWidget {
  final image;
  const SlidingBannerProviderDetails({this.image});

  @override
  Widget build(BuildContext context) {
    // print("fjd $image");
    return Container(
      child: FadeInImage(
        width: SizeConfig.screenWidth,
        placeholder: NetworkImage(bannerImage),
        image: NetworkImage(bannerImage),
        fit: BoxFit.cover,
      ),
    );
  }
}

class TicketFun extends StatefulWidget {
  @override
  _TicketFunState createState() => _TicketFunState();
}

class _TicketFunState extends State<TicketFun> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      width: SizeConfig.screenWidth,
      child: Column(
        children: [
          //  SizedBox(height: SizeConfig.screenHeight * 0.02,),
          Stack(
            children: [
              SizedBox(
                  width: SizeConfig.screenWidth,
                  child: SvgPicture.asset(
                    "assets/images/Rectangle84.svg",
                    fit: BoxFit.fill,
                  )),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Container(
                 height: SizeConfig.screenHeight * 0.13,
                  child: Padding(
                    // padding: const EdgeInsets.all(8.0),
                    padding: EdgeInsets.symmetric(
                        horizontal: size.width * 0.05,
                        vertical: size.height * 0.001),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            margin: EdgeInsets.only(top: size.height * 0.005),
                            child:
                                SvgPicture.asset("assets/images/ticket.svg")),
                        SizedBox(
                          width: size.width * 0.02,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              alignment: Alignment.topCenter,
                              width: SizeConfig.screenWidth * 0.40,
                              child: Text(
                                "Tickdfgsdfgsdfgdfgetwewfrhtjykkuk",
                                style: TextStyle(
                                  color: AppColors.white,
                                  fontSize: 22,
                                  fontFamily: "DM Sans Bold",
                                ),
                                textAlign: TextAlign.start,
                                maxLines: 1,
                                softWrap: true,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Container(
                              width: SizeConfig.screenWidth * 0.40,
                              child: Text(
                                "You will enjoy an entranceentranceentranceentranceentranceentranceentranceentranceentranceentrance",
                                textAlign: TextAlign.start,
                                maxLines: 2,
                                softWrap: true,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    color: AppColors.brownlite, fontSize: 14),
                              ),
                            ),
                          ],
                        ),
                        Spacer(),
                        Column(
                          children: [
                            Text(
                              "€ 12.29",
                              style: TextStyle(
                                  color: AppColors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: SizeConfig.screenHeight * 0.03,
                            ),

                            // + - buttons
                            Row(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    border: Border.all(color: AppColors.white),
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(size.width * 0.01)),
                                  ),
                                  height: SizeConfig.screenHeight * 0.04,
                                  width: SizeConfig.screenWidth * 0.08,
                                  child: Center(
                                      child: Text(
                                    "-",
                                    style: TextStyle(
                                      color: AppColors.white,
                                      fontFamily: "DM Sans Medium",
                                      fontSize: size.width * 0.04,
                                    ),
                                  )),
                                ),
                                SizedBox(
                                  width: SizeConfig.screenWidth * 0.03,
                                ),

                                // center number
                                Text(
                                  "0",
                                  style: TextStyle(
                                      fontFamily: "DM Sans Medium",
                                      fontSize: size.width * 0.04,
                                      color: AppColors.white),
                                ),
                                SizedBox(
                                  width: SizeConfig.screenWidth * 0.03,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    color: AppColors.skin,
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(size.width * 0.01)),
                                  ),
                                  height: SizeConfig.screenHeight * 0.04,
                                  width: SizeConfig.screenWidth * 0.08,
                                  child: Center(
                                      child: Text(
                                    "+",
                                    style: TextStyle(
                                        fontFamily: "DM Sans Medium",
                                        fontSize: size.width * 0.04,
                                        color: AppColors.homeBackground),
                                  )),
                                ),
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          // SizedBox(
          //   height: SizeConfig.screenHeight * 0.02,
          // ),
        ],
      ),
    );
  }
}
