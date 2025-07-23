import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recharge_app/components/customAppBar.dart';

class TransactionsReportScreen extends StatelessWidget {
  const TransactionsReportScreen({super.key});

  void _search(BuildContext context) {
    // Implement search functionality here
    ScaffoldMessenger.of(context).showSnackBar(
      // snackBarAnimationStyle: AnimationStyle(
      //   duration: Duration(seconds: 1),
      //   curve: Curves.easeInOut,
      // ),
      const SnackBar(content: Text('Search functionality not implemented')),
    );
  }

  @override
  Widget build(BuildContext context) {
    final device = MediaQuery.of(context).size;

    TextEditingController fromController = TextEditingController();
    TextEditingController toController = TextEditingController();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomServiceAppBar(title: 'Transactions'),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),

          clipBehavior: Clip.none,
          margin: EdgeInsets.only(top: 20),
          width: double.infinity,
          // height: double.infinity,
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
              // Filters
              Row(
                children: [
                  Expanded(
                    child: DateField(label: "From", controller: fromController),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: DateField(label: "To", controller: toController),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            blurRadius: 5,
                            spreadRadius: 2,
                            offset: const Offset(0, 0),
                          ),
                        ],
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: "Search Number",
                          prefixIcon: const Icon(Icons.search),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ),
                  ),

                  GestureDetector(
                    onTap: () => _search(context),
                    child: Container(
                      margin: const EdgeInsets.only(left: 10),
                      height: 55,
                      width: device.width * 0.3,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [Color(0xff8F45FA), Color(0xff6F13F5)],
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            blurRadius: 5,
                            spreadRadius: 2,
                            offset: const Offset(0, 0),
                          ),
                        ],
                      ),
                      child: Center(
                        child: Text(
                          'search',
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w700,
                            fontSize: 12,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // Transaction Cards
              TransactionCard(
                status: "Success",
                statusColor: Colors.green,
                amount: "545",
                provider: "Airtel Prepaid",
                phone: "9876543210",
                icon: Icons.signal_cellular_alt_rounded,
                referenceId: "87467264247289",
                dateTime: "28 May 2024 | 00:02:25 PM",
                openingBalance: "Rs 8878.16",
                cashback: "Rs 5",
                currentBalance: "Rs 8338.16",
                transactionid: '1234567890',
              ),
              TransactionCard(
                status: "Approved",
                statusColor: Colors.green,
                amount: "1500",
                provider: "Fund Request",
                phone: "Sekar - 7788996655",
                icon: Icons.person,
                referenceId: "87467264247289",
                dateTime: "28 May 2024 | 00:02:25 PM",
                openingBalance: "Rs 10378.16",
                cashback: "Rs 0",
                currentBalance: "Rs 8879.16",
                transactionid: '1234567891',
              ),
              TransactionCard(
                status: "Failed",
                statusColor: Colors.red,
                amount: "545",
                provider: "Sun Direct",
                phone: "9876543210",
                icon: Icons.tv,
                referenceId: "87467264247289",
                dateTime: "28 May 2024 | 00:02:25 PM",
                reason: "Network Issue",
                openingBalance: "Rs 10378.16",
                cashback: "Rs 0",
                currentBalance: "Rs 10378.16",
                transactionid: '1234567892',
              ),
              TransactionCard(
                status: "Pending",
                statusColor: Colors.amber,
                amount: "545",
                provider: "Airtel Prepaid",
                phone: "9876543210",
                icon: Icons.signal_cellular_alt_rounded,
                referenceId: "87467264247289",
                dateTime: "28 May 2024 | 00:02:25 PM",
                openingBalance: "Rs 8878.16",
                cashback: "Rs 5",
                currentBalance: "Rs 8338.16",
                transactionid: '1234567893',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Date Picker Field
class DateField extends StatefulWidget {
  final String label;
  final TextEditingController controller;
  const DateField({super.key, required this.label, required this.controller});

  @override
  State<DateField> createState() => _DateFieldState();
}

class _DateFieldState extends State<DateField> {
  Future<void> _pickDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2022),
      lastDate: DateTime(2100),
    );

    if (picked != null) {
      setState(() {
        widget.controller.text = "${picked.day}/${picked.month}/${picked.year}";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 5,
            spreadRadius: 2,
            offset: const Offset(0, 0),
          ),
        ],
      ),

      child: TextField(
        controller: widget.controller,
        readOnly: true,
        decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          hintText: widget.label,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide.none,
          ),
          suffixIcon: IconButton(
            icon: const Icon(Icons.calendar_today),
            onPressed: _pickDate,
          ),
        ),
      ),
    );
  }
}

// Transaction Card Widget
class TransactionCard extends StatelessWidget {
  final String status;
  final Color statusColor;
  final String amount;
  final String provider;
  final String phone;
  final IconData icon;
  final String? providerImageUrl;
  final String referenceId;
  final String dateTime;
  final String openingBalance;
  final String cashback;
  final String currentBalance;
  final String? reason;
  final String transactionid;

  const TransactionCard({
    super.key,
    required this.status,
    required this.statusColor,
    required this.amount,
    required this.provider,
    required this.phone,
    required this.icon,
    this.providerImageUrl,
    required this.referenceId,
    required this.dateTime,
    required this.openingBalance,
    required this.cashback,
    required this.currentBalance,
    this.reason,
    required this.transactionid,
  });

  _disputepressed(BuildContext context) {
    // Implement dispute functionality here
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Dispute functionality not implemented')),
    );
  }

  _shareButton(BuildContext context) {
    // Implement share functionality here
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Share functionality not implemented')),
    );
  }

  @override
  Widget build(BuildContext context) {
    final device = MediaQuery.of(context).size;
    Color getStatusColor(String status) {
      switch (status) {
        case "Success":
        case "Approved":
          return Color(0xffAADDB1);
        case "Failed":
          return Colors.red;
        case "Pending":
          return Colors.amber;
        default:
          return Colors.grey; // Default color for unknown status
      }
    }

    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 5,
            spreadRadius: 2,
            offset: const Offset(0, 0),
          ),
        ],
      ),
      child: Card(
        elevation: 0,
        clipBehavior: Clip.antiAlias,
        margin: const EdgeInsets.symmetric(vertical: 10),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Stack(
          children: [
            //back round circle
            Positioned(
              top: -250,
              right: -200,
              child: Container(
                width: 400,
                height: 400,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    colors: [getStatusColor(status), getStatusColor(status)],
                  ),
                ),
              ),
            ),

            //content
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //row 1
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Reference ID: $referenceId",
                        style: GoogleFonts.poppins(
                          fontSize: 9,
                          color: Color(0xff7B7B7B),
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const Spacer(),
                      Text(
                        dateTime,
                        style: GoogleFonts.poppins(
                          fontSize: 10,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(width: 5),
                      Icon(Icons.copy_outlined, color: Colors.black, size: 16),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.grey.shade200,
                          image: providerImageUrl != null
                              ? DecorationImage(
                                  image: NetworkImage(providerImageUrl!),
                                  fit: BoxFit.cover,
                                )
                              : null,
                        ),
                        child: providerImageUrl == null
                            ? Icon(icon, color: Colors.black87)
                            : null,
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              provider,
                              style: GoogleFonts.poppins(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              phone,
                              style: GoogleFonts.poppins(
                                fontSize: 10,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          const SizedBox(height: 4),
                          Text(
                            status,
                            textAlign: TextAlign.end,
                            style: GoogleFonts.poppins(
                              color: Colors.black,
                              fontWeight: FontWeight.w700,
                              fontSize: 14,
                            ),
                          ),
                          Text(
                            "Rs $amount/-",
                            textAlign: TextAlign.end,
                            style: GoogleFonts.poppins(
                              color: Colors.black,
                              fontWeight: FontWeight.w700,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Transaction Details",
                        style: GoogleFonts.poppins(
                          fontSize: 10,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        "Transaction ID: $transactionid",
                        style: GoogleFonts.poppins(
                          fontSize: 10,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Opening Balance",
                            style: GoogleFonts.poppins(
                              fontSize: 10,
                              fontWeight: FontWeight.w600,
                              color: Colors.grey,
                            ),
                          ),
                          Text(
                            openingBalance,
                            style: GoogleFonts.poppins(
                              fontSize: 10,
                              fontWeight: FontWeight.w600,
                              color: Color(0xffBC2525),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: 10),

                      Container(
                        height: 32,
                        width: 1,
                        color: Colors.black26,
                        margin: const EdgeInsets.symmetric(horizontal: 8),
                      ),
                      SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Cashback",
                            style: GoogleFonts.poppins(
                              fontSize: 10,
                              fontWeight: FontWeight.w600,
                              color: Colors.grey,
                            ),
                          ),
                          Text(
                            cashback,
                            style: GoogleFonts.poppins(
                              fontSize: 10,
                              fontWeight: FontWeight.w600,
                              color: Color(0xff7115F6),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: 10),
                      Container(
                        height: 32,
                        width: 1,
                        color: Colors.black26,
                        margin: const EdgeInsets.symmetric(horizontal: 8),
                      ),
                      SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Current Balance",
                            style: GoogleFonts.poppins(
                              fontSize: 10,
                              fontWeight: FontWeight.w600,
                              color: Colors.grey,
                            ),
                          ),
                          const SizedBox(height: 2),

                          Text(
                            currentBalance,
                            style: GoogleFonts.poppins(
                              fontSize: 10,
                              fontWeight: FontWeight.w600,
                              color: Color(0xff25BC46),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () => _disputepressed(context),
                        child: Container(
                          // margin: const EdgeInsets.only(left: 10),
                          height: 40,
                          width: device.width * 0.4,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [Color(0xff8F45FA), Color(0xff6F13F5)],
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.2),
                                blurRadius: 5,
                                spreadRadius: 2,
                                offset: const Offset(0, 0),
                              ),
                            ],
                          ),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Dispute',
                                  style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 12,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(width: 5),
                                Icon(
                                  Icons.gavel,
                                  color: Colors.white,
                                  size: 16,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 5),
                      GestureDetector(
                        onTap: () => _shareButton(context),
                        child: Container(
                          // margin: const EdgeInsets.only(left: 10),
                          height: 40,
                          width: device.width * 0.4,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [Color(0xff8F45FA), Color(0xff6F13F5)],
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.2),
                                blurRadius: 5,
                                spreadRadius: 2,
                                offset: const Offset(0, 0),
                              ),
                            ],
                          ),
                          child: Center(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Share',
                                  style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 12,
                                    color: Colors.white,
                                  ),
                                ),
                                Icon(
                                  Icons.share,
                                  color: Colors.white,
                                  size: 16,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
