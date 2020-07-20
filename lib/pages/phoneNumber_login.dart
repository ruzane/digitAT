import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:digitAT/widgets/alerts.dart';
import 'package:flutter_country_picker/flutter_country_picker.dart';
import 'package:flutter/services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:digitAT/pages/verification_number.dart';
class PhoneLogin extends StatefulWidget {
  @override
  _PhoneLoginState createState() => _PhoneLoginState();
}

class _PhoneLoginState extends State<PhoneLogin> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String countryCode = "";
  String phoneNumber = "";
  @override
  Widget build(BuildContext context) {
      return Scaffold(
        backgroundColor: Color(0xeeffffff),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.close,color: Colors.black),
            onPressed: (){    
              Navigator.of(context).pushNamed('/signup');
            },
          ),
        ),
        body: ListView(
          children:[
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(top: 30.0),
              child: Image(
                image:AssetImage("images/verification.png"),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 12.0),
              child: Text(
                "Enter your mobile number we will send \n you the OTP verify later",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 11.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Poppins'
                ),
              ),
            ),
            Container(
              height: 180.0,
              margin: EdgeInsets.only(top:12.0,right:12.0,left:12.0),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Column(
                children:[
                  Form(
                    key: _formKey,
                    child: Row(
                      children: <Widget>[
                        Container(
                          height: 40.0,
                          width:MediaQuery.of(context).size.width*0.27,
                          margin: EdgeInsets.only(top: 20.0 ,left: 12.0,right: 12.0),
                          decoration: BoxDecoration(
                            border: Border.all(width: 1.0,color: Color(0xdddddddd)),
                            borderRadius: BorderRadius.circular(12.0),                          
                          ),
                            child:Center(
                              child: CountryPicker(
                                dense: false,
                                showFlag:
                                true, //displays flag, true by default
                                showDialingCode:
                                true, //displays dialing code, false by default
                                showName: false, //eg. 'GBP'
                                onChanged: (Country country) {
                                  setState(() {
                                    _selected = country;
                                  });
                                },
                                dialingCodeTextStyle:  TextStyle(
                                  fontSize:
                                  (18),),
                                nameTextStyle:  TextStyle(
                                  fontSize:(18),),
                                selectedCountry: _selected,
                              ),
                            ),
                        ),
                        Expanded(
                          child: Container(
                          height: 40.0,
                          margin: EdgeInsets.only(top: 20.0 ,left: 12.0,right: 12.0),
                          decoration: BoxDecoration(
                            border: Border.all(width: 1.0,color: Color(0xdddddddd)),
                            borderRadius: BorderRadius.circular(12.0),                          
                          ),
                            child:Center(
                              child: FormBuilderTextField(
                                initialValue: "",
                                controller: phoneNumberController,
                                attribute: 'phoneNumber',
                                validators: [
                                  FormBuilderValidators.required()
                                ],
                                keyboardType: TextInputType.number,                            
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.only(top: 6,left:12,right: 12),
                                  border: InputBorder.none, 
                                  suffixIcon:Icon(Icons.verified_user),
                                  prefixText: "",
                                  prefixStyle: TextStyle(
                                    color: Colors.black
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top:50.0,bottom: 20.0,right:30.0,left: 30.0 ),
                    height: 40,
                    child: RaisedButton(
                      color: Theme.of(context).accentColor,
                      onPressed: (){
                        sendOTP(context);
                      },
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      child: Container(
                        child:  Center(
                          child:Text(
                            'Submit', 
                            style:  TextStyle(
                              fontSize: 18.0, 
                              color: Theme.of(context).primaryColor,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.bold,
                            ),
                          ),  
                        ),
                      ),   
                    ),
                  ),      
                ],
              ),
            ),
          ],
        ),
    );
  }
  Country _selected=Country.ZW;
  String phoneNo;
  String verificationId;
  String errorMessage = '';
  FirebaseAuth _auth = FirebaseAuth.instance;
  TextEditingController phoneNumberController = new TextEditingController();
  void sendOTP(BuildContext context) {
    this.phoneNo="+"+this._selected.dialingCode+" "+this.phoneNumberController.text;
    print("passing argument"+this.phoneNo);
    verifyPhone(this.phoneNo);
  }

  void verifyUser() {

    print("passing argument"+this.phoneNo);
    Navigator.of(context).pop();
//    Navigator.of(context).pushNamed('/verification');
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) =>
            VerificationNumber(this.phoneNo,this.verificationId),
      ),
    );
  }

  Future<void> verifyPhone(String userPhoneNumber) async {
    showAlertDialog(context,"Sending OTP");
    final PhoneCodeSent smsOTPSent = (String verId, [int forceCodeResend]) {
      this.verificationId = verId;
      verifyUser();
    };
    try {

      await _auth.verifyPhoneNumber(
          phoneNumber: userPhoneNumber, // PHONE NUMBER TO SEND OTP
          codeAutoRetrievalTimeout: (String verId) {
            this.verificationId = verId;
          },
          codeSent:
          smsOTPSent, // WHEN CODE SENT THEN WE OPEN DIALOG TO ENTER OTP.
          timeout: const Duration(seconds: 45),
          verificationCompleted: (AuthCredential phoneAuthCredential) {
            print(phoneAuthCredential);
            Navigator.of(context).pop();

          },
          verificationFailed: (AuthException exception) {
            Navigator.of(context).pop();
            print('${exception.message}');
          });
    } catch (e) {
      Navigator.of(context).pop();
      handleError(e);
    }
  }
  handleError(PlatformException error) {
    print("Something went wrong");
    print(error);
    Navigator.of(context).pop();
    switch (error.code) {
      case 'ERROR_INVALID_VERIFICATION_CODE':
        FocusScope.of(context).requestFocus(new FocusNode());
        setState(() {
          errorMessage = 'You have entered an invalid OTP';
        });
//        Navigator.of(context).pop();

//        smsOTPDialog(context).then((value) {
//          print('sign in');
//        });
        break;
      default:
        setState(() {
          errorMessage = error.message;
          print(errorMessage);
          Navigator.of(context).pop();
        });

        break;
    }
  }
}