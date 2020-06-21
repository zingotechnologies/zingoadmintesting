import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:zingoadmin/pages/LoginPage.dart';
import 'package:zingoadmin/pages/dashboardPage.dart';

enum AuthenticationStatus {
  NOT_DETERMINED,
  NOT_LOGGED_IN,
  LOGGED_IN
}


class ColourSys {
  static Color originalLight = Color(0xff435480);
  static Color originalDark = Color(0xff1c263d);

  static Color primary = Color(0xff312a57);
  static Color primaryLight = Color(0xff3a2357);
  static Color grey = Color(0xff2e2a45);
  static Color secondary = Color(0xff3c3563);
  static Color secondaryLight = Color(0xff251f42);
  static Color secondaryDark = Color(0xff2f1f42);
}

class Strings {
  static var stepOneTitle = "Your Property Out There";
  static var stepOneContent = "Have your property advertised to and viewed by thousands of students from varsities near you";
  static var stepTwoTitle = "Migration Proccess Eased";
  static var stepTwoContent = "Easily manage the move-in process, leasing and all documentation, and state all your rules and regulations";
  static var stepThreeTitle = "Ease Of Use";
  static var stepThreeContent = "Manage all property operations, tenant transactions and communications throughout their stay, all in one place";
}

// ignore: must_be_immutable
class Welcome extends StatefulWidget {

  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {

  AuthenticationStatus authenticationStatus = AuthenticationStatus.NOT_LOGGED_IN;

  PageController _pageController;
  int currentIndex = 0;

  @override
  void initState() {
    _pageController = PageController(
      initialPage: 0
    );
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColourSys.secondary,
      body: _bodyCheck()
    );
  }


  Widget _bodyCheck(){
    switch(authenticationStatus){
      case AuthenticationStatus.LOGGED_IN:
        return Dashboard();
        break;
      case AuthenticationStatus.NOT_LOGGED_IN:
        return _buildBody();
        break;
      case AuthenticationStatus.NOT_DETERMINED:
        return _buildBody();
        break;
      default:
        return _buildBody();
    }
  }

  Widget _buildBody(){
    return Stack(
      alignment: Alignment.bottomCenter,
      children: <Widget>[
        PageView(
          onPageChanged: (int page){
            setState(() {
              currentIndex = page;
            });
          },
          controller: _pageController,
          children: <Widget>[
            makePage(
              advert: 'assets/HouseType.flr',
              animation: 'Demo Mode',
              title: Strings.stepOneTitle,
              content: Strings.stepOneContent,
            ),
            makePage(
              advert: 'assets/RobotStudy.flr',
              animation: 'forward',
              title: Strings.stepTwoTitle,
              content: Strings.stepTwoContent,
            ),
            makePage(
              advert: 'assets/SpaceHover.flr',
              height: 220.0,
              width: 250.0,
              animation: 'hover',
              title: Strings.stepThreeTitle,
              content: Strings.stepThreeContent,
            )
          ],
        ),
        Container(
          margin: const EdgeInsets.only(bottom: 80.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: _buildIndicators()
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Row(
            children: <Widget>[
              Expanded(
                child: GestureDetector(
                  onTap: (){
                    print("Browse");
                  },
                  child: Container(
                    height: 50.0,
                    decoration: BoxDecoration(
                      color: ColourSys.originalLight
                    ),
                    child: Center(
                      child: Text("Browse", style: TextStyle(color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.bold)),
                    )
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => LogInPage()));
                  },
                  child: Container(
                    height: 50.0,
                    decoration: BoxDecoration(
                        color: ColourSys.originalLight
                    ),
                    child: Center(
                      child: Text("SIGN IN", style: TextStyle(color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.bold)),
                    )
                  ),
                ),
              )
            ],
          )
        )
      ],
    );
  }

  Widget makePage({advert, animation, title, height = 180.0, width = 250.0, content}){
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 50.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Container(
              height: height,
              width: width,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5.0),
                child: FlareActor(advert, alignment: Alignment.center, fit: BoxFit.fill, animation: animation),
              ),
              decoration: BoxDecoration(
                  color: ColourSys.originalLight,
                  borderRadius: BorderRadius.circular(5.0),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black26,
                        offset: Offset(0, 10),
                        blurRadius: 10
                    )
                  ]
              ),
            ),
          ),
          SizedBox(height: 20.0),
          Text(title, textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 30.0, fontWeight: FontWeight.bold)),
          SizedBox(height: 20.0),
          Text(content, textAlign: TextAlign.center, style: TextStyle(color: Colors.white70, fontSize: 20.0, fontWeight: FontWeight.w400))
        ],
      ),
    );
  }

  Widget _indicatorCheck(bool check){
    return AnimatedContainer(
      duration: Duration(milliseconds: 250),
      height: 8.0,
      width: check ? 30.0: 8.0,
      margin: const EdgeInsets.only(right: 5.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            offset: Offset(0, 2),
            blurRadius: 2
          )
        ]
      ),
    );
  }

  List<Widget> _buildIndicators(){

    List<Widget> indicators = [];

    for(int i = 0; i < 3; i++){
      if(currentIndex == i){
        indicators.add(_indicatorCheck(true));
      } else {
        indicators.add(_indicatorCheck(false));
      }
    }

    return indicators;

  }
}
