import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recharge_app/constants/assets.dart';

class AddMoneyScreen extends StatefulWidget {
  const AddMoneyScreen({super.key});

  @override
  State<AddMoneyScreen> createState() => _AddMoneyScreenState();
}

class _AddMoneyScreenState extends State<AddMoneyScreen> {
  _onUPItap() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const UPIscreen()),
    );
  }

  _onbanktransfertap() {}

  @override
  Widget build(BuildContext context) {
    final device = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Text(
          'Add Money',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        width: double.infinity,
        height: device.height * 0.8,
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 32),

        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 10,
              offset: Offset(0, -2),
            ),
          ],
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: Column(
          spacing: 16,
          children: [
            _AddMoneyButton(
              device: device,
              ontap: _onUPItap,
              buttonname: 'UPI',
              image: AppAssets.upiIcon,
            ),
            _AddMoneyButton(
              device: device,
              ontap: _onbanktransfertap,
              buttonname: 'Bank Transfer Request',
              image: AppAssets.bankTransfer,
            ),
          ],
        ),
      ),
    );
  }
}

class _AddMoneyButton extends StatelessWidget {
  const _AddMoneyButton({
    super.key,
    required this.device,
    required this.ontap,
    required this.buttonname,
    required this.image,
  });

  final Size device;
  final Function() ontap;
  final String buttonname;
  final String image;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        width: double.infinity,
        height: device.height * 0.08,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 10,
              offset: Offset(0, 0),
            ),
          ],
        ),
        child: Row(
          children: [
            Image.asset(image, height: 80, width: 80),
            SizedBox(width: 10),
            SizedBox(
              width: device.width * 0.6,
              child: Text(
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                buttonname,
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class UPIscreen extends StatelessWidget {
  const UPIscreen({super.key});

  void _onupibuttonTap(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const AddMoneyWalletscreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    final device = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Text(
          'Add Money',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        width: double.infinity,
        height: device.height * 0.8,
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 32),

        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 10,
              offset: Offset(0, -2),
            ),
          ],
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: Column(
          spacing: 16,
          children: [
            GestureDetector(
              onTap: () => _onupibuttonTap(context),
              child: Container(
                width: double.infinity,
                height: device.height * 0.08,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 10,
                      offset: Offset(0, 0),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Image.asset(AppAssets.upiIcon, height: 80, width: 80),
                    SizedBox(width: 10),
                    SizedBox(
                      width: device.width * 0.6,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            'Pay using only Phone Pe, Gpay, Paytm, BHIM, UPI App no any',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            'Charge: Free',
                            style: TextStyle(
                              fontSize: 8,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AddMoneyWalletscreen extends StatelessWidget {
  const AddMoneyWalletscreen({super.key});

  final String walletamount = '349';
  void _addmoney(BuildContext context) {
    // Logic to add money to the wallet
    print('Add money button tapped');
    showbottomSheet(context);
  }

  void _onGpaytap() {
    // Logic for GPay tap
    print('GPay tapped');
  }

  void _onphonepaytap() {
    // Logic for PhonePe tap
    print('PhonePe tapped');
  }

  void showbottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          height: 200,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: IconButton(
                  icon: Icon(Icons.close, size: 30),
                  onPressed: () => Navigator.pop(context),
                ),
              ),
              SizedBox(height: 16),
              Row(
                children: [
                  SizedBox(width: 16),
                  GestureDetector(
                    onTap: _onGpaytap,
                    child: Image.asset(AppAssets.gpay, height: 50, width: 50),
                  ),
                  SizedBox(width: 16),
                  GestureDetector(
                    onTap: _onphonepaytap,
                    child: Image.asset(
                      AppAssets.phonepay,
                      height: 50,
                      width: 50,
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final device = MediaQuery.of(context).size;
    TextEditingController amountController = TextEditingController();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Text(
          'Add Money',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        width: double.infinity,
        height: device.height,
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 32),

        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 10,
              offset: Offset(0, -2),
            ),
          ],
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: Column(
          children: [
            walletImageBalance(device),
            SizedBox(height: 16),
            payusing(device, amountController),
            Spacer(),
            ElevatedButton(
              style: ButtonStyle(
                fixedSize: WidgetStateProperty.all(Size(device.width, 50)),
                backgroundColor: WidgetStateProperty.all(Colors.transparent),
                overlayColor: WidgetStateProperty.all(Colors.transparent),
                shadowColor: WidgetStateProperty.all(Colors.transparent),
                shape: WidgetStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              child: Ink(
                height: 50,
                width: device.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Color(0xff8F45FA), Color(0xff6F13F5)],
                  ),
                ),
                child: Center(
                  child: Text(
                    'Add Money',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w700,
                      fontSize: 24,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              onPressed: () => _addmoney(context),
            ),
          ],
        ),
      ),
    );
  }

  Column payusing(Size device, TextEditingController amountController) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Pay Using',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w900,
            color: Colors.black,
          ),
        ),
        SizedBox(height: 16),
        // payusing selection
        Container(
          width: double.infinity,
          height: device.height * 0.08,
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 10,
                offset: Offset(0, 0),
              ),
            ],
          ),
          child: Row(
            children: [
              Image.asset(AppAssets.upiIcon, height: 80, width: 80),
              SizedBox(width: 10),
              SizedBox(
                width: device.width * 0.6,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      'Pay using only Phone Pe, Gpay, Paytm, BHIM, UPI App no any',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      'Charge: Free',
                      style: TextStyle(
                        fontSize: 8,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 16),
        //textfield for amount
        Container(
          width: double.infinity,
          height: device.height * 0.08,
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 10,
                offset: Offset(0, 0),
              ),
            ],
          ),
          child: TextField(
            controller: amountController,
            keyboardType: TextInputType.number,
            style: TextStyle(fontSize: 18),
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(horizontal: 16),
              border: InputBorder.none,
              hintText: 'Enter Amount',
              hintStyle: TextStyle(fontSize: 18, color: Colors.grey.shade600),
            ),
          ),
        ),
        SizedBox(height: 16),
        Text(
          '  Note: Minimum ₹500 to add money to wallet',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.bold,
            fontSize: 12,
            color: Colors.red,
          ),
        ),
      ],
    );
  }

  Column walletImageBalance(Size device) {
    return Column(
      spacing: 16,
      children: [
        Image.asset(
          AppAssets.wallet,
          fit: BoxFit.cover,
          height: device.height * 0.11,
        ),
        SizedBox(height: 8),
        Text(
          'Wallet Balance: ₹ $walletamount',
          style: GoogleFonts.poppins(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: Colors.deepPurple,
          ),
        ),
      ],
    );
  }
}
