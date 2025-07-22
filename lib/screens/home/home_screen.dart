import 'package:flutter/material.dart';
import 'package:recharge_app/constants/assets.dart';
import 'package:marquee/marquee.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Method blocks for all button/icon presses
  void _onAddMoneyPressed() {}
  void _onMyQRPressed() {}
  void _onTransactionReportPressed() {}
  void _onWalletSummaryPressed() {}
  void _onMoneyTransferPressed() {}
  void _onMicroATMPressed() {}
  void _onAEPS1Pressed() {}
  void _onAEPS2Pressed() {}
  void _onSearchPressed() {}
  void _onNotificationPressed() {}
  void _onWhatsAppPressed() {}
  void _onProfilePressed() {}
  void _onRechargeMobilePressed() {}
  void _onRechargeDTHPressed() {}
  void _onRechargePlaystorePressed() {}
  void _onRechargeGasPressed() {}
  void _onNavSamypay() {}
  void _onNavReport() {}
  void _onNavAllServices() {}
  void _onNavOthers() {}
  void _onNavAccount() {}
  void _onFabPressed() {}

  int _selectedNavIndex = 2;

  @override
  Widget build(BuildContext context) {
    final device = MediaQuery.of(context);

    final String walletAmount = '349';
    final String OutstandingWallet = '0';

    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Color(0xFF8F17E6)),
              child: Text(
                'Menu',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Profile'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Logout'),
              onTap: () {},
            ),
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: Color(0xFFE7D0FF),
        elevation: 0,
        leading: Builder(
          builder: (context) => IconButton(
            icon: Icon(Icons.menu, color: Colors.black),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
        title: Image.asset('assets/logo.png', height: 40),
        centerTitle: false,
        actions: [
          IconButton(
            icon: Icon(Icons.search, color: Colors.black),
            onPressed: _onSearchPressed,
          ),

          GestureDetector(
            onTap: _onWhatsAppPressed,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Image.asset(AppAssets.whatsapp, height: 28, width: 28),
            ),
          ),
          IconButton(
            icon: Icon(Icons.notifications_none, color: Colors.black),
            onPressed: _onNotificationPressed,
          ),
        ],
      ),
      body: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top Action Cards
              _topActionCardsSection(device),
              SizedBox(height: 8),
              // Info Banner
              marquee(),
              SizedBox(height: 12),
              // Service Shortcuts
              walletservice_section(device, walletAmount, OutstandingWallet),

              SizedBox(height: 12),

              // Wallet Info
              bannerSection(context),
              SizedBox(height: 12),
              // Recharge Shortcuts
              Container(
                width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: 16),
                padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(4),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 8,
                      spreadRadius: 5,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Recharge',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 12),
                    Divider( color: Colors.grey[300], height: 1),
                    SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _buildRechargeShortcut(
                          imagePath: AppAssets.rechargeMobile,
                          
                           label: 'Mobile', onTap: _onRechargeMobilePressed,
                        ),
                        _buildRechargeShortcut(
                          imagePath: AppAssets.rechargeDTH,
                          label: 'DTH',
                          onTap: _onRechargeDTHPressed,
                        ),
                        _buildRechargeShortcut(
                          imagePath: AppAssets.rechargePlaystore,
                          label: 'Playstore',
                          onTap: _onRechargePlaystorePressed,
                        ),
                        _buildRechargeShortcut(
                          imagePath: AppAssets.rechargeGas,
                          label: 'Gas',
                          onTap: _onRechargeGasPressed,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 24),
            ],
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(shape: CircleBorder(),
        onPressed: _onFabPressed,
        backgroundColor: Color(0xFF8F17E6),
        child: Icon(Icons.add, color: Colors.white, size: 32),
        elevation: 4,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(height: 69,
        shape: CircularNotchedRectangle(),
        notchMargin: 8,
        child: Container(
          // height: 80,
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildNavItem(AppAssets.logo, 'Samypay', 0, _onNavSamypay),
              _buildNavItem(AppAssets.navReport, 'Report', 1, _onNavReport),
              SizedBox(width: 48), // space for FAB
              _buildNavItem(AppAssets.navOthers, 'Others', 3, _onNavOthers),
              _buildNavItem(AppAssets.navProfile, 'Account', 4, _onNavAccount),
            ],
          ),
        ),
      ),
    );
  }

  SizedBox bannerSection(BuildContext context) {
    return SizedBox(
              height: 150,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.6,
                        margin: EdgeInsets.symmetric(horizontal: 8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          image: DecorationImage(
                            image: AssetImage(
                              'assets/banners/Tata-Sky-Recharge-Plans-1.jpg 1.png',
                            ),
                            fit: BoxFit.cover,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.05),
                              blurRadius: 8,
                              offset: Offset(0, 2),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.85,
                        margin: EdgeInsets.symmetric(horizontal: 8),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          image: DecorationImage(
                            image: AssetImage(
                              'assets/banners/sun-direct-new-connections-offer 1.png',
                            ),
                            fit: BoxFit.cover,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.05),
                              blurRadius: 8,
                              offset: Offset(0, 2),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
  }

  Container marquee() {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 16),

      padding: EdgeInsets.symmetric(vertical: 6, horizontal: 16),
      decoration: BoxDecoration(
        color: Color(0xFFE1D7F0),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: SizedBox(
          height: 22,
          child: Marquee(
            text: 'RECHARGE  500 NUMBERS TO EARN POINTS . REDEEM THOSE POINTS',
            style: TextStyle(
              color: Color(0xFF8F17E6),
              fontWeight: FontWeight.bold,
              fontSize: 13,
            ),
            scrollAxis: Axis.horizontal,
            crossAxisAlignment: CrossAxisAlignment.center,
            blankSpace: 40.0,
            velocity: 40.0,
            pauseAfterRound: Duration(seconds: 1),
            startPadding: 10.0,
            accelerationDuration: Duration(seconds: 1),
            accelerationCurve: Curves.linear,
            decelerationDuration: Duration(milliseconds: 500),
            decelerationCurve: Curves.easeOut,
          ),
        ),
      ),
    );
  }

  Container walletservice_section(
    MediaQueryData device,
    String walletAmount,
    String OutstandingWallet,
  ) {
    return Container(
      height: 200,
      margin: EdgeInsets.symmetric(horizontal: 16),

      // color: Colors.amberAccent,
      child: Stack(
        children: [
          Container(
            height: 150,
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xFF52D3E1), Color(0xFF9EF9EA)],
              ),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 20,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Spacer(),
                _wallet_options(
                  image: AppAssets.moneyTransfer,
                  text: 'Money Transfer',
                  ontap: _onMoneyTransferPressed,
                ),
                _wallet_options(
                  image: AppAssets.microATM,
                  text: 'Micro ATM',
                  ontap: _onMicroATMPressed,
                ),
                _wallet_options(
                  image: AppAssets.aeps,
                  text: 'AEPS',
                  ontap: _onAEPS1Pressed,
                ),
                _wallet_options(
                  image: AppAssets.aeps,
                  text: 'AEPS 2',
                  ontap: _onAEPS2Pressed,
                ),
                // Spacer(),
              ],
            ),
          ),
          Positioned(
            bottom: 10,
            left: 20,
            right: 20,
            child: Container(
              width: device.size.width * 0.7,
              height: 70,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 10,
                    color: Colors.black.withOpacity(.2),
                  ),
                ],
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CircleAvatar(
                        backgroundColor: Color(0xff237E3C),
                        child: Icon(
                          Icons.account_balance_wallet_outlined,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Wallet Balance',
                            style: TextStyle(
                              fontWeight: FontWeight.w800,
                              color: Colors.grey,
                              fontSize: 12,
                            ),
                          ),
                          Text(
                            'Rs $walletAmount',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w900,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),

                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        backgroundColor: Color(0xff237E3C),
                        child: Icon(Icons.currency_rupee, color: Colors.white),
                      ),
                      SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Outstanding Wallet',
                            style: TextStyle(
                              fontWeight: FontWeight.w800,
                              color: Colors.grey,
                              fontSize: 10,
                            ),
                          ),
                          Text(
                            'Rs $OutstandingWallet',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w900,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  SizedBox _topActionCardsSection(MediaQueryData device) {
    return SizedBox(
      child: Stack(
        children: [
          ClipPath(
            clipper: _BottomCurvedClipper(),
            child: Container(
              width: double.infinity,
              height: device.size.height * 0.15,
              padding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
              color: Color(0xFFE7D0FF), // or any background color you want
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
            child: Row(
              spacing: 10,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildActionCard(
                  AppAssets.addMoney,
                  'Add \nMoney',
                  _onAddMoneyPressed,
                  color1: Color(0xFF815FE6),
                  color2: Color(0xFFBB83E8),
                ),
                _buildActionCard(
                  AppAssets.myQR,
                  'My QR',
                  _onMyQRPressed,
                  color1: Color(0xff51D3E1),
                  color2: Color(0xFF9DFAE8),
                ),
                _buildActionCard(
                  AppAssets.transactionReport,
                  'Transaction Report',
                  _onTransactionReportPressed,
                  color1: Color(0xFFF7BB9F),
                  color2: Color(0xFFFFE69C),
                ),
                _buildActionCard(
                  AppAssets.walletSummary,
                  'Wallet Summary',
                  _onWalletSummaryPressed,
                  color1: Color(0xFFAD7BF4),
                  color2: Color(0xFF76A0EC),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionCard(
    String icon,
    String label,
    VoidCallback onTap, {
    Color? color1,
    Color? color2,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 80,
        height: 120,
        padding: EdgeInsets.all(5),
        decoration: ShapeDecoration(
          gradient: LinearGradient(
            begin: Alignment(0.50, -0.00),
            end: Alignment(0.50, 1.00),
            colors: [
              color1 ?? const Color(0xFF8F17E6),
              color2 ?? const Color(0xFF8F17E6),
            ],
            // stops: [0.00, 1.00],
          ),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: Image.asset(
                icon,

                // color: Colors.white,
              ),
            ),
            SizedBox(height: 4),
            Text(
              textAlign: TextAlign.center,
              label,
              style: TextStyle(
                color: Colors.black,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  
    Widget _buildRechargeShortcut({
    
    required String imagePath,
    required String label,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: Color(0xFFF6F0FA),
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 8,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: 
                 Container(padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 8,
                        offset: Offset(0, 2),
                      ),
                    ],
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    ),
                   child: Image.asset(
                      imagePath,
                      width: 28,
                      height: 28,
                      // color: Color(0xFF8F17E6),
                    ),
                 )
                
          ),
          SizedBox(height: 6),
          Text(label, style: TextStyle(fontSize: 12, color: Colors.black87)),
        ],
      ),
    );
  }

  Widget _buildNavItem(
    String imagePath,
    String label,
    int index,
    VoidCallback onTap,
  ) {
    final isSelected = _selectedNavIndex == index;
    return InkWell(
      onTap: () {
        setState(() {
          _selectedNavIndex = index;
        });
        onTap();
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            imagePath,
            height: 24,
            width: 24,
            color: isSelected ? Color(0xFF8F17E6) : Colors.black38,
          ),
          SizedBox(height: 2),
          Text(
            label,
            style: TextStyle(
              fontSize: 11,
              color: isSelected ? Color(0xFF8F17E6) : Colors.black38,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}

class _wallet_options extends StatelessWidget {
  final String image;
  final String text;
  final Function ontap;
  const _wallet_options({
    super.key,
    required this.image,
    required this.text,
    required this.ontap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => ontap(),
      child: Column(
        children: [
          Image.asset(image, height: 70),
          SizedBox(
            width: 55,
            child: Text(
              text,
              style: TextStyle(fontWeight: FontWeight.w600),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}

// Custom clipper for a smooth upward curve at the bottom
class _BottomCurvedClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height - 40);
    path.quadraticBezierTo(
      size.width / 2,
      size.height,
      size.width,
      size.height - 40,
    );
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
