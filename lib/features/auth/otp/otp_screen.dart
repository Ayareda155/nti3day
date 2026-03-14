import 'package:flutter/material.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  List<TextEditingController> controllers =
      List.generate(4, (index) => TextEditingController());
  List<FocusNode> focusNodes = List.generate(4, (index) => FocusNode());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildIcon(),
            SizedBox(height: 24),
            buildTitle(),
            SizedBox(height: 8),
            buildSubTitle(),
            SizedBox(height: 40),
            buildOtpFields(),
            SizedBox(height: 40),
            buildConfirmButton(),
            SizedBox(height: 20),
            buildResendRow(),
          ],
        ),
      ),
    );
  }

  Widget buildIcon() {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        color: Color(0xFF1AACB0),
        shape: BoxShape.circle,
      ),
      child: Icon(Icons.lock_open_outlined, size: 50, color: Colors.white),
    );
  }

  Widget buildTitle() {
    return Text(
      'OTP Verification',
      style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
    );
  }

  Widget buildSubTitle() {
    return Text(
      'Enter the code sent to your phone',
      style: TextStyle(fontSize: 13, color: Color(0xFF9E9E9E)),
    );
  }

  Widget buildOtpFields() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(4, (index) => buildOtpBox(index)),
    );
  }

  Widget buildOtpBox(int index) {
    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xFF1AACB0), width: 1.5),
        borderRadius: BorderRadius.circular(12),
      ),
      child: TextField(
        controller: controllers[index],
        focusNode: focusNodes[index],
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        maxLength: 1,
        style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        decoration: InputDecoration(
          counterText: '',
          border: InputBorder.none,
        ),
        onChanged: (value) {
          if (value.isNotEmpty && index < 3) {
            FocusScope.of(context).requestFocus(focusNodes[index + 1]);
          }
          if (value.isEmpty && index > 0) {
            FocusScope.of(context).requestFocus(focusNodes[index - 1]);
          }
        },
      ),
    );
  }

  Widget buildConfirmButton() {
    return Container(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xFF1AACB0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Text(
          'Confirm',
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
      ),
    );
  }

  Widget buildResendRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Didn't receive the code? "),
        GestureDetector(
          onTap: () {},
          child: Text(
            'Resend',
            style: TextStyle(
              color: Color(0xFFE63950),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}