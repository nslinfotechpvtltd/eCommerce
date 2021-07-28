import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:funfy/apis/introApi.dart';
import 'package:funfy/components/navigation.dart';
import 'package:funfy/ui/screens/auth/signin.dart';
import 'package:funfy/ui/widgets/roundContainer.dart';
import 'package:funfy/utils/Constants.dart';
import 'package:funfy/utils/InternetCheck.dart';
import 'package:funfy/utils/colors.dart';
import 'package:funfy/utils/fontsname.dart';
import 'package:funfy/utils/imagesIcons.dart';
import 'package:funfy/utils/langauge_constant.dart';
import 'package:funfy/utils/strings.dart';
// import 'dart:io' show Platform;

import '../../../main.dart';
import '../home.dart';
import '../intro.dart';

class TranslationPage extends StatefulWidget {
  final bool fromSplash;
  const TranslationPage({Key? key, required this.fromSplash}) : super(key: key);

  @override
  _SigninState createState() => _SigninState();
}
enum SingingCharacter { English, Spanish }

class _SigninState extends State<TranslationPage> {

  next() async {
    var net = await Internetcheck.check();
    if (net != true) {
      Internetcheck.showdialog(context: context);
    } else {
      var introdata = await getIntrodata();
      if ( introdata.length != 0 && introdata != [] ) {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => Constants.prefs?.getString("token") != null &&
                Constants.prefs?.getString("token") != ""
                ? Home()
                : Intro()));
      } else {
        print("no intro data");

        Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => Constants.prefs?.getString("token") != null &&
                Constants.prefs?.getString("token") != ""
                ? Home()
                : Signin()));
      }
    }
  }

  final _scaffoldKey = new GlobalKey<ScaffoldState>();
  TextEditingController _emailController = TextEditingController();

  TextEditingController _passwordController = TextEditingController();

  String devicetype = "ios";
  bool _passeye = true;
  bool _credentialsError = false;
  String _emailError = "";

  // String _emailError = "";
  String _passwordError = "";
  bool _loading = false;
  Map facebookdata = {};
  TextEditingController facebookEmailController = TextEditingController();
  String facebookEmailError = "";
var newValue ;
  SingingCharacter? _character;

  void changeLanguage(String enes) async{
    Locale locale = await setLocale(enes);
    MyApp.setLocale(context, locale);
  }
  @override
  void initState() {
    var radioini = Constants.prefs!.getString(Strings.radioValue);
    print("first language" + radioini.toString());
    _character  = radioini == null?SingingCharacter.English:radioini == "en"?SingingCharacter.English:SingingCharacter.Spanish;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    var size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: true,
            key: _scaffoldKey,
            body: Stack(
                alignment: Alignment.topLeft,
                children: [
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(Images.loginBackground),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: size.height * 0.15,
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(size.height * 0.04,0.0,size.height * 0.04,0.0,),
                      height: size.height * 0.10,
                      child: SvgPicture.asset("assets/pngicons/Translationicon.svg"),
                    ),
                    // app logo
                    SizedBox(
                      height: size.height * 0.05,
                    ),

                    // title

                    Container(
                      margin:
                      EdgeInsets.symmetric(horizontal: size.width * 0.07),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                "${getTranslated(context, "welcometo")}",
                                // Strings.welcometo,
                                style: TextStyle(
                                  // fontFamily: Fonts.dmSansMedium,
                                    fontSize: size.width * 0.048,
                                    color: AppColors.inputTitle),
                              ),
                              SizedBox(
                                width: size.width * 0.02,
                              ),
                              Text(
                                "${getTranslated(context, "funfypartyapp")}",
                                // Strings.funfypartyapp,
                                style: TextStyle(
                                  // fontFamily: Fonts.dmSansMedium,
                                    fontSize: size.width * 0.048,
                                    color: AppColors.white),
                              ),
                            ],
                          ),
                          Text(
                            "${getTranslated(context, "ChooseLanguage")}",
                            //  Strings.TranslationPage,
                            style: TextStyle(
                                fontSize: size.width * 0.088,
                                fontFamily: Fonts.abrilFatface,
                                color: Colors.white),
                          ),
                          SizedBox(
                            height: size.height * 0.015,
                          ),

                        ],
                      ),
                    ),
                    // or
                    SizedBox(
                      height: size.height * 0.05,
                    ),
                    ListTile(
                      title: const Text('English'),
                      trailing: Radio<SingingCharacter>(
                        activeColor: AppColors.radioColor,
                        value: SingingCharacter.English,
                        groupValue: _character,
                        onChanged: (SingingCharacter? value) {
                          setState(() {
                            _character = value;
                            if(value == SingingCharacter.English){
                               newValue = "en";
                              changeLanguage(newValue);
                              print(newValue);
                            }else{
                               newValue = "es";
                              changeLanguage(newValue);
                              print(newValue);
                            }

                          });

                        },
                      ),
                    ),
                    Divider(
                      thickness: size.height * 0.0006,
                      color: Colors.white,
                    ),
                    ListTile(
                      title: const Text('Spanish'),
                      trailing: Radio<SingingCharacter>(
                        activeColor: AppColors.radioColor,
                        value: SingingCharacter.Spanish,
                        groupValue: _character,
                        onChanged: (SingingCharacter? value) {
                          setState(() {
                            _character = value;
                            if(value == SingingCharacter.English){
                               newValue = "en";
                              changeLanguage(newValue);
                              print(newValue);
                            }else{
                              newValue = "es";
                              changeLanguage(newValue);
                              print(newValue);
                            }
                          });
                        },
                      ),
                    ),
                    // forgot password
                    SizedBox(
                      height: size.height * 0.20,
                    ),
// TranslationPage Button
                    Center(
                      child: GestureDetector(
                        onTap: () {
                          Constants.prefs?.setString(Strings.radioValue, newValue ?? "es");
                         if(widget.fromSplash) {
                           next();
                           //  navigatorPushFun(context, TranslationPage(fromSplash: true));
                         }else{
                           Navigator.pop(context);
                         }
                        },
                        child: roundedBox(
                            width: size.width * 0.78,
                            height: size.height * 0.058,
                            backgroundColor: AppColors.siginbackgrond,
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                "${getTranslated(context, "Proceed")}",
                                // Strings.TranslationPage,
                                style: TextStyle(
                                    fontFamily: Fonts.dmSansMedium,
                                    fontSize: size.width * 0.05,
                                    color: AppColors.white),
                              ),
                            )),
                      ),
                    ),

                    SizedBox(
                      height: size.height * 0.05,
                    ),
                  ],
                ),
              ),
              _loading
                  ? Center(
                  child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                          AppColors.siginbackgrond)))
                  : SizedBox()
            ])));
  }
}

socialSigninButton({context, String? title, String? iconImage, func}) {
  var size = MediaQuery.of(context).size;
  return GestureDetector(
    onTap: func,
    child: Stack(
      alignment: Alignment.centerLeft,
      children: [
        roundedBox(
            width: size.width * 0.78,
            height: size.height * 0.053,
            backgroundColor: Colors.white,
            child: Align(
              alignment: Alignment.center,
              child: Text(
                // "${getTranslated(context, "title")}",
                title.toString(),
                style: TextStyle(
                  color: AppColors.fbappletitle,
                  fontFamily: Fonts.dmSansMedium,
                  // fontSize: size.width * 0.045,
                  fontSize: size.width * 0.04,
                ),
              ),
            )),
        Positioned(
          left: size.width * 0.101,
          child: Container(
              width: size.width * 0.05,
              child: Image.asset(
                iconImage.toString(),
                // height: size.height * 0.02,
                width: size.width * 0.07,
                fit: BoxFit.cover,
              )),
        ),
      ],
    ),
  );
}
