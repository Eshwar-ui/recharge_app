import 'package:flutter/material.dart';

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
    return Scaffold(
      backgroundColor: Color(0xFFF6F0FA),
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
        backgroundColor: Color(0xFFF6F0FA),
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
          IconButton(
            icon: Icon(Icons.notifications_none, color: Colors.black),
            onPressed: _onNotificationPressed,
          ),
          IconButton(
            icon: Icon(Icons.chat_bubble_outline_rounded, color: Colors.green),
            onPressed: _onWhatsAppPressed,
          ),
          IconButton(
            icon: Icon(Icons.person_outline, color: Colors.black),
            onPressed: _onProfilePressed,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 8),
              // Top Action Cards
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildActionCard(
                    Icons.account_balance_wallet,
                    'Add Money',
                    _onAddMoneyPressed,
                    color: Color(0xFFB388FF),
                  ),
                  _buildActionCard(
                    Icons.qr_code,
                    'My QR',
                    _onMyQRPressed,
                    color: Color(0xFF80DEEA),
                  ),
                  _buildActionCard(
                    Icons.receipt_long,
                    'Transaction Report',
                    _onTransactionReportPressed,
                    color: Color(0xFFFFCC80),
                  ),
                  _buildActionCard(
                    Icons.description,
                    'Wallet Summary',
                    _onWalletSummaryPressed,
                    color: Color(0xFFB39DDB),
                  ),
                ],
              ),
              SizedBox(height: 12),
              // Info Banner
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 6),
                decoration: BoxDecoration(
                  color: Color(0xFFE1D7F0),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: Text(
                    'RECHARGE  500 NUMBERS TO EARN POINTS . REDEEM THOSE',
                    style: TextStyle(
                      color: Color(0xFF8F17E6),
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 12),
              // Service Shortcuts
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildServiceCard(
                    Icons.send,
                    'Money Transfer',
                    _onMoneyTransferPressed,
                  ),
                  _buildServiceCard(Icons.atm, 'Micro ATM', _onMicroATMPressed),
                  _buildServiceCard(Icons.fingerprint, 'AEPS', _onAEPS1Pressed),
                  _buildServiceCard(
                    Icons.fingerprint,
                    'AEPS 2',
                    _onAEPS2Pressed,
                  ),
                ],
              ),
              SizedBox(height: 12),
              // Wallet Info
              Row(
                children: [
                  Expanded(
                    child: _buildWalletInfo(
                      'Wallet Balance',
                      'Rs 349/-',
                      Colors.green,
                    ),
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: _buildWalletInfo(
                      'Outstanding Wallet',
                      'Rs 0/-',
                      Colors.black,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 12),
              // Promo Banners
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 80,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        image: DecorationImage(
                          image: AssetImage('assets/placeholder_banner.png'),
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
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: Container(
                      height: 80,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        image: DecorationImage(
                          image: AssetImage('assets/placeholder_banner.png'),
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
                  ),
                ],
              ),
              SizedBox(height: 12),
              // Recharge Shortcuts
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 16, horizontal: 12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 8,
                      offset: Offset(0, 2),
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _buildRechargeShortcut(
                          Icons.phone_android,
                          'Mobile',
                          _onRechargeMobilePressed,
                        ),
                        _buildRechargeShortcut(
                          Icons.tv,
                          'DTH',
                          _onRechargeDTHPressed,
                        ),
                        _buildRechargeShortcut(
                          Icons.shop,
                          'Playstore',
                          _onRechargePlaystorePressed,
                        ),
                        _buildRechargeShortcut(
                          Icons.local_gas_station,
                          'Gas',
                          _onRechargeGasPressed,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 24),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _onFabPressed,
        backgroundColor: Color(0xFF8F17E6),
        child: Icon(Icons.add, color: Colors.white, size: 32),
        elevation: 4,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 8,
        child: Container(
          height: 64,
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildNavItem(Icons.home, 'Samypay', 0, _onNavSamypay),
              _buildNavItem(Icons.bar_chart, 'Report', 1, _onNavReport),
              SizedBox(width: 48), // space for FAB
              _buildNavItem(Icons.apps, 'Others', 3, _onNavOthers),
              _buildNavItem(Icons.person, 'Account', 4, _onNavAccount),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildActionCard(
    IconData icon,
    String label,
    VoidCallback onTap, {
    Color? color,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 70,
        height: 70,
        decoration: BoxDecoration(
          color: color ?? Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.07),
              blurRadius: 8,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 32, color: Colors.white),
            SizedBox(height: 6),
            Text(
              label,
              style: TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildServiceCard(IconData icon, String label, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 70,
        height: 70,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.07),
              blurRadius: 8,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 32, color: Color(0xFF8F17E6)),
            SizedBox(height: 6),
            Text(
              label,
              style: TextStyle(
                color: Color(0xFF8F17E6),
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildWalletInfo(String label, String value, Color valueColor) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: TextStyle(color: Colors.black54, fontSize: 13)),
          SizedBox(height: 6),
          Text(
            value,
            style: TextStyle(
              color: valueColor,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRechargeShortcut(
    IconData icon,
    String label,
    VoidCallback onTap,
  ) {
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
            child: Icon(icon, color: Color(0xFF8F17E6), size: 28),
          ),
          SizedBox(height: 6),
          Text(label, style: TextStyle(fontSize: 12, color: Colors.black87)),
        ],
      ),
    );
  }

  Widget _buildNavItem(
    IconData icon,
    String label,
    int index,
    VoidCallback onTap,
  ) {
    final isSelected = _selectedNavIndex == index;
    return Expanded(
      child: InkWell(
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
            Icon(
              icon,
              color: isSelected ? Color(0xFF8F17E6) : Colors.black38,
              size: 26,
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
      ),
    );
  }
}
