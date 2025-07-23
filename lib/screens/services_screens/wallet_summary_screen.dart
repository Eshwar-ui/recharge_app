import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recharge_app/components/customAppBar.dart';
import 'package:recharge_app/constants/assets.dart';
import 'package:recharge_app/screens/services_screens/transactions_report_screen.dart';

class WalletSummaryScreen extends StatelessWidget {
  const WalletSummaryScreen({super.key});

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
    TextEditingController fromController = TextEditingController();
    TextEditingController toController = TextEditingController();
    return Scaffold(
      appBar: CustomServiceAppBar(title: 'Wallet Summary'),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),

          clipBehavior: Clip.none,
          margin: EdgeInsets.only(top: 20),
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
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
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),

                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 10,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Text(
                      'Total Balance',
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
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
                  GestureDetector(
                    onTap: () => _search(context),
                    child: Container(
                      margin: const EdgeInsets.only(left: 10),
                      height: 55,
                      width: MediaQuery.of(context).size.width * 0.3,
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
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),

              TransactionTile(
                title: "Cashback",
                dateTime: "08-10-2022 09:45:25 AM",
                amount: "9",
                isCredit: true,
                balance: "46.32",
              ),

              TransactionTile(
                title: "Recharge",
                dateTime: "08-10-2022 09:45:25 AM",
                amount: "250.00",
                isCredit: false,
                balance: "46.32",
              ),
              TransactionTile(
                title: "Bank Transfer",
                dateTime: "08-10-2022 09:45:25 AM",
                amount: "1000.00",
                isCredit: true,
                balance: "46.32",
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TransactionTile extends StatelessWidget {
  final String title; // e.g., "Cashback" or "Recharge"
  final String dateTime; // e.g., "08-10-2022 09:45:25 AM"
  final String amount; // e.g., "250.00"
  final bool isCredit; // true = green, false = red
  final String balance; // e.g., "46.32"

  const TransactionTile({
    super.key,
    required this.title,
    required this.dateTime,
    required this.amount,
    required this.isCredit,
    required this.balance,
  });

  String get _imageForTitle {
    switch (title.toLowerCase()) {
      case 'cashback':
        return AppAssets.cashback;
      case 'recharge':
        return AppAssets.recharge;
      default:
        return AppAssets.bankTransfer; // fallback image
    }
  }

  @override
  Widget build(BuildContext context) {
    final amountColor = isCredit ? Colors.green : Colors.red;
    final sign = isCredit ? '+' : '-';

    return Container(
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.symmetric(vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          // Icon
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              _imageForTitle,
              width: 48,
              height: 48,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 12),

          // Title & Date
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  dateTime,
                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ],
            ),
          ),

          // Amount & Balance
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '$sign ₹ $amount',
                style: TextStyle(
                  color: amountColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                '₹ $balance',
                style: const TextStyle(fontSize: 14, color: Colors.black87),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
