import '../auth/auth_util.dart';
import '../change_password/change_password_widget.dart';
import '../chose_menu/chose_menu_widget.dart';
import '../create_account/create_account_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../main.dart';
import '../phone_sign_in/phone_sign_in_widget.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginWidget extends StatefulWidget {
  LoginWidget({Key key}) : super(key: key);

  @override
  _LoginWidgetState createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  TextEditingController emailAddressController;
  TextEditingController passwordController;
  bool passwordVisibility;
  bool _loadingButton1 = false;
  bool _loadingButton2 = false;
  bool _loadingButton3 = false;
  bool _loadingButton4 = false;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    emailAddressController = TextEditingController();
    passwordController = TextEditingController();
    passwordVisibility = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 1,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.grayLines,
          image: DecorationImage(
            fit: BoxFit.cover,
            image: Image.asset(
              'assets/images/bg.png',
            ).image,
          ),
          border: Border.all(
            color: FlutterFlowTheme.white,
          ),
        ),
        child: Align(
          alignment: AlignmentDirectional(0, 1),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(24, 70, 0, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(77, 0, 0, 0),
                      child: Image.asset(
                        'assets/images/logo.png',
                        width: 180,
                        height: 150,
                        fit: BoxFit.fitHeight,
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 36, 0, 0),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.white,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 3, 0, 0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(20, 16, 20, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: AutoSizeText(
                                  'ค้นหาช่างใกล้ตัวคุณ',
                                  style: FlutterFlowTheme.title2.override(
                                    fontFamily: 'Overpass',
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () async {
                                  await Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => PhoneSignInWidget(),
                                    ),
                                  );
                                },
                                child: Container(
                                  width: 40,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.white,
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: Color(0xFFDBE2E7),
                                    ),
                                  ),
                                  child: InkWell(
                                    onTap: () async {
                                      await Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              PhoneSignInWidget(),
                                        ),
                                      );
                                    },
                                    onDoubleTap: () async {
                                      await Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              ChoseMenuWidget(),
                                        ),
                                      );
                                    },
                                    child: Icon(
                                      Icons.call_rounded,
                                      color: Color(0xFF090F13),
                                      size: 24,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(20, 16, 20, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: TextFormField(
                                  controller: emailAddressController,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelText: 'Email Address',
                                    labelStyle:
                                        FlutterFlowTheme.bodyText1.override(
                                      fontFamily: 'Overpass',
                                      color: Color(0xFF95A1AC),
                                    ),
                                    hintText: 'Enter your email here...',
                                    hintStyle:
                                        FlutterFlowTheme.bodyText1.override(
                                      fontFamily: 'Overpass',
                                      color: Color(0xFF95A1AC),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0xFFDBE2E7),
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0xFFDBE2E7),
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    filled: true,
                                    fillColor: FlutterFlowTheme.white,
                                    contentPadding:
                                        EdgeInsetsDirectional.fromSTEB(
                                            16, 24, 0, 24),
                                  ),
                                  style: FlutterFlowTheme.bodyText1.override(
                                    fontFamily: 'Overpass',
                                    color: Color(0xFF2B343A),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(20, 16, 20, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: TextFormField(
                                  controller: passwordController,
                                  obscureText: !passwordVisibility,
                                  decoration: InputDecoration(
                                    labelText: 'Password',
                                    labelStyle:
                                        FlutterFlowTheme.bodyText1.override(
                                      fontFamily: 'Overpass',
                                      color: Color(0xFF95A1AC),
                                    ),
                                    hintText: 'Enter your password here...',
                                    hintStyle:
                                        FlutterFlowTheme.bodyText1.override(
                                      fontFamily: 'Overpass',
                                      color: Color(0xFF95A1AC),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0xFFDBE2E7),
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0xFFDBE2E7),
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    filled: true,
                                    fillColor: FlutterFlowTheme.white,
                                    contentPadding:
                                        EdgeInsetsDirectional.fromSTEB(
                                            16, 24, 0, 24),
                                    suffixIcon: InkWell(
                                      onTap: () => setState(
                                        () => passwordVisibility =
                                            !passwordVisibility,
                                      ),
                                      child: Icon(
                                        passwordVisibility
                                            ? Icons.visibility_outlined
                                            : Icons.visibility_off_outlined,
                                        color: Color(0xFF95A1AC),
                                        size: 22,
                                      ),
                                    ),
                                  ),
                                  style: FlutterFlowTheme.bodyText1.override(
                                    fontFamily: 'Overpass',
                                    color: Color(0xFF2B343A),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(20, 12, 20, 16),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              FFButtonWidget(
                                onPressed: () async {
                                  setState(() => _loadingButton1 = true);
                                  try {
                                    await Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            ChangePasswordWidget(),
                                      ),
                                    );
                                  } finally {
                                    setState(() => _loadingButton1 = false);
                                  }
                                },
                                text: 'Forgot Password?',
                                options: FFButtonOptions(
                                  width: 120,
                                  height: 40,
                                  color: FlutterFlowTheme.white,
                                  textStyle:
                                      FlutterFlowTheme.subtitle2.override(
                                    fontFamily: 'Overpass',
                                    color: Color(0xFF090F13),
                                    fontSize: 12,
                                  ),
                                  elevation: 0,
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                    width: 1,
                                  ),
                                  borderRadius: 12,
                                ),
                                loading: _loadingButton1,
                              ),
                              FFButtonWidget(
                                onPressed: () async {
                                  setState(() => _loadingButton2 = true);
                                  try {
                                    final user = await signInWithEmail(
                                      context,
                                      emailAddressController.text,
                                      passwordController.text,
                                    );
                                    if (user == null) {
                                      return;
                                    }

                                    await Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => NavBarPage(
                                            initialPage: 'neartheMechanic'),
                                      ),
                                      (r) => false,
                                    );
                                  } finally {
                                    setState(() => _loadingButton2 = false);
                                  }
                                },
                                text: 'Login',
                                options: FFButtonOptions(
                                  width: 130,
                                  height: 50,
                                  color: FlutterFlowTheme.primaryColor,
                                  textStyle:
                                      FlutterFlowTheme.subtitle2.override(
                                    fontFamily: 'Overpass',
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  elevation: 2,
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                    width: 1,
                                  ),
                                  borderRadius: 8,
                                ),
                                loading: _loadingButton2,
                              )
                            ],
                          ),
                        ),
                        Divider(
                          height: 2,
                          thickness: 2,
                          indent: 20,
                          endIndent: 20,
                          color: Color(0xFFDBE2E7),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 12),
                          child: FFButtonWidget(
                            onPressed: () async {
                              setState(() => _loadingButton3 = true);
                              try {
                                await Navigator.push(
                                  context,
                                  PageTransition(
                                    type: PageTransitionType.fade,
                                    duration: Duration(milliseconds: 250),
                                    reverseDuration:
                                        Duration(milliseconds: 250),
                                    child: CreateAccountWidget(),
                                  ),
                                );
                              } finally {
                                setState(() => _loadingButton3 = false);
                              }
                            },
                            text: 'Create Account',
                            options: FFButtonOptions(
                              width: 170,
                              height: 40,
                              color: FlutterFlowTheme.white,
                              textStyle: FlutterFlowTheme.subtitle2.override(
                                fontFamily: 'Overpass',
                                color: FlutterFlowTheme.primaryColor,
                              ),
                              elevation: 0,
                              borderSide: BorderSide(
                                color: Colors.transparent,
                                width: 1,
                              ),
                              borderRadius: 12,
                            ),
                            loading: _loadingButton3,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 12),
                          child: FFButtonWidget(
                            onPressed: () async {
                              setState(() => _loadingButton4 = true);
                              try {
                                final user = await signInAnonymously(context);
                                if (user == null) {
                                  return;
                                }
                                await Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => NavBarPage(
                                        initialPage: 'neartheMechanic'),
                                  ),
                                  (r) => false,
                                );
                              } finally {
                                setState(() => _loadingButton4 = false);
                              }
                            },
                            text: 'Continue as Guest',
                            icon: Icon(
                              Icons.person_outline,
                              size: 15,
                            ),
                            options: FFButtonOptions(
                              width: 220,
                              height: 40,
                              color: FlutterFlowTheme.white,
                              textStyle: FlutterFlowTheme.subtitle2.override(
                                fontFamily: 'Overpass',
                                color: FlutterFlowTheme.primaryColor,
                              ),
                              elevation: 0,
                              borderSide: BorderSide(
                                color: Colors.transparent,
                                width: 1,
                              ),
                              borderRadius: 12,
                            ),
                            loading: _loadingButton4,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
