import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AddBankScreen extends StatefulWidget {
  const AddBankScreen({super.key});

  @override
  State<AddBankScreen> createState() => _AddBankScreenState();
}

class _AddBankScreenState extends State<AddBankScreen> {
  Widget _buildInputField({
    required String hintText,
    required TextEditingController controller,
  }) {
    return Container(
      width: double.infinity,
      height: 60,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Center(
        child: TextField(
          controller: controller,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: hintText,
            hintStyle: GoogleFonts.poppins(
              color: Colors.grey.shade600,
              fontWeight: FontWeight.w700,
              fontSize: 10,
            ),
            contentPadding: EdgeInsets.symmetric(horizontal: 16),
          ),
        ),
      ),
    );
  }

  void _addbank(BuildContext context) {
    // Logic to handle adding money
    // This could involve form validation, API calls, etc.
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text('added bank successfully!')));
  }

  final TextEditingController _selectbankcontroller = TextEditingController();

  final TextEditingController _accountNumberController =
      TextEditingController();
  final TextEditingController _accountholderController =
      TextEditingController();
  final TextEditingController _accountTypeController = TextEditingController();
  final TextEditingController _IFSCCodeController = TextEditingController();
  final TextEditingController _branchController = TextEditingController();
  final TextEditingController _registeredMobileNumberController =
      TextEditingController();

  final TextEditingController _dateController = TextEditingController();

  // Set the initial value of the date controller to today's date
  @override
  void initState() {
    _dateController.text = "${DateTime.now().toLocal()}".split(' ')[0];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final device = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Text(
          'Add Bank',
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
          spacing: 16,
          children: [
            _buildInputField(
              hintText: 'Select Bank',
              controller: _selectbankcontroller,
            ),
            _buildInputField(
              hintText: 'Account Number',
              controller: _accountNumberController,
            ),

            // date picker
            _buildInputField(
              hintText: 'Account Holder Name',
              controller: _accountholderController,
            ),
            _buildInputField(
              hintText: 'account Type',
              controller: _accountTypeController,
            ),
            _buildInputField(
              hintText: 'IFSC Code',
              controller: _IFSCCodeController,
            ),
            _buildInputField(hintText: 'Branch', controller: _branchController),
            _buildInputField(
              hintText: 'Registered Mobile Number',
              controller: _registeredMobileNumberController,
            ),
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
                    'ADD',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w700,
                      fontSize: 24,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              onPressed: () => _addbank(context),
            ),
          ],
        ),
      ),
    );
  }
}
