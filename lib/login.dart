import 'package:demo/home.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:awesome_page_transitions/awesome_page_transitions.dart';

class Login extends StatefulWidget {
  const Login({Key key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool ispassshow = false;
  bool _rememberme = false;

  //Handle and notify changes made in email and password textfields
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                    child: Container(
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius:
                          BorderRadius.only(bottomLeft: Radius.circular(100)),
                      gradient: LinearGradient(
                          colors: <Color>[Colors.blue[300], Colors.blue[200]],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Padding(padding: const EdgeInsets.only(top: 30)),
                      Text(
                        "Wanderlust",
                        //Import font from Google Fonts
                        style: GoogleFonts.pacifico(
                            textStyle: Theme.of(context).textTheme.headline2,
                            fontWeight: FontWeight.w400,
                            color: Colors.white),
                      ),
                      Container(
                        child: Image.asset("assets/images/travel.gif"),
                        height: 180.0,
                        width: 180.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 100),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                        ),
                      )
                    ],
                  ),
                )),
                Expanded(
                    child: Container(
                  color: Colors.grey[200],
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Material(
                          elevation: 6.0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40)),
                          child: TextField(
                            controller: email,
                            keyboardType: TextInputType.emailAddress,
                            textInputAction: TextInputAction.next,
                            onEditingComplete: () =>
                                FocusScope.of(context).nextFocus(),
                            style: TextStyle(
                                fontSize: 18, color: Colors.grey[900]),
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(top: 14),
                              prefixIcon: Icon(Icons.email),
                              border: InputBorder.none,
                              hintText: "Email ",
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Material(
                          elevation: 6.0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40)),
                          child: TextField(
                            controller: password,
                            obscureText: !ispassshow,
                            keyboardType: TextInputType.text,
                            textInputAction: TextInputAction.done,
                            onEditingComplete: () =>
                                FocusScope.of(context).unfocus(),
                            style: TextStyle(
                                fontSize: 18, color: Colors.grey[900]),
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(top: 14),
                              prefixIcon: Icon(Icons.lock),
                              border: InputBorder.none,
                              suffixIcon: IconButton(
                                //Show/hide password
                                icon: Icon(ispassshow
                                    ? Icons.visibility
                                    : Icons.visibility_off),
                                onPressed: () {
                                  setState(() {
                                    ispassshow = !ispassshow;
                                  });
                                },
                              ),
                              hintText: "Password ",
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Checkbox(
                                checkColor: Colors.white,
                                value: _rememberme,
                                activeColor: Colors.blue[300],
                                onChanged: (value) {
                                  setState(() {
                                    _rememberme = !_rememberme;
                                  });
                                }),
                            Text("Remember me"),
                            Expanded(
                                child: Text(
                              "Forgot Password",
                              textDirection: TextDirection.ltr,
                              textAlign: TextAlign.right,
                            ))
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        gradientbutton(),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Don\'t have an account?",
                              style: TextStyle(color: Colors.grey[700]),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Signup",
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                )),
              ],
            ),
          ),
        ),
      ),
    );
  }

  //Dialog box for incorrect email/password entered
  Future<void> _errorPopup() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Sorry, you have entered an incorrect email/password.'),
              ],
            ),
          ),
          actions: <Widget>[
            //If user clicks retry they will be redirected to the login screen again
            TextButton(
              child: Text('Retry'),
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Login()));
              },
            ),
          ],
        );
      },
    );
  }

  //Dialog box for empty email/password textfield but user has clicked login
  Future<void> _emptyFieldPopup() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('A valid email/password is required.'),
              ],
            ),
          ),
          actions: <Widget>[
            //If user clicks retry they will be redirected to the login screen again
            TextButton(
              child: Text('Retry'),
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Login()));
              },
            ),
          ],
        );
      },
    );
  }

  Widget gradientbutton() {
    return InkWell(
      splashColor: Colors.white,
      onTap: () {
        FocusScope.of(context).unfocus();
        //Check if the inputted details match the default email and password
        if (email.text == "cictapps@wvsu.edu.ph" && password.text == "toor") {
          //Proceeds to home page if it is correct
          Navigator.push(
              context,
              //Login screen to home screen transition
              AwesomePageRoute(
                transitionDuration: Duration(milliseconds: 600),
                exitPage: widget,
                enterPage: HomeScreen(),
                transition: ZoomOutSlideTransition(),
              ));
        }

        //Dialog box will pop up if email/password is not entered but user pressed login
        else if (email.text.isEmpty || password.text.isEmpty) {
          _emptyFieldPopup();
        }

        //Dialog box will pop up if incorrect
        else {
          _errorPopup();
        }
      },
      child: Material(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
        elevation: 6.0,
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: <Color>[Colors.blue[200], Colors.blue[300]]),
              borderRadius: BorderRadius.circular(40)),
          height: 60,
          width: MediaQuery.of(context).size.width * 0.75,
          child: Center(
              child: Text(
            'Login',
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          )),
        ),
      ),
    );
  }
}
