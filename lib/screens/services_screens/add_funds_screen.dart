import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AddFundsScreen extends StatefulWidget {
  AddFundsScreen({super.key});

  @override
  State<AddFundsScreen> createState() => _AddFundsScreenState();
}

class _AddFundsScreenState extends State<AddFundsScreen> {
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

  void _requestMoney(BuildContext context) {
    // Logic to handle adding money
    // This could involve form validation, API calls, etc.
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text('Requested money successfully!')));
  }

  final TextEditingController _fromBankController = TextEditingController();

  final TextEditingController _toBankController = TextEditingController();

  final TextEditingController _paymentmodeController = TextEditingController();
  final TextEditingController _transactionNumberController =
      TextEditingController();
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _remarksController = TextEditingController();

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
          'Fund Request',
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
              hintText: 'From Bank',
              controller: _fromBankController,
            ),
            _buildInputField(
              hintText: 'To Bank',
              controller: _toBankController,
            ),
            // date picker
            GestureDetector(
              onTap: () async {
                DateTime? pickedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2100),
                );
                if (pickedDate != null) {
                  _dateController.text = "${pickedDate.toLocal()}".split(
                    ' ',
                  )[0];
                }
              },
              child: AbsorbPointer(
                child: _buildInputField(
                  hintText: 'Payment Date',
                  controller: _dateController,
                ),
              ),
            ),
            _buildInputField(
              hintText: 'Payment Mode',
              controller: _paymentmodeController,
            ),
            _buildInputField(
              hintText: 'Transaction Number',
              controller: _transactionNumberController,
            ),
            _buildInputField(hintText: 'Amount', controller: _amountController),
            _buildInputField(
              hintText: 'Remarks',
              controller: _remarksController,
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
                    'Send Request',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w700,
                      fontSize: 24,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              onPressed: () => _requestMoney(context),
            ),
          ],
        ),
      ),
    );
  }
}
