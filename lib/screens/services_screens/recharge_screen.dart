import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recharge_app/constants/assets.dart';

// ================== Recharge Screen ==================
class RechargeScreen extends StatefulWidget {
  const RechargeScreen({super.key});

  @override
  State<RechargeScreen> createState() => _RechargeScreenState();
}

class _RechargeScreenState extends State<RechargeScreen>
    with TickerProviderStateMixin {
  // #region State Variables
  int selectedTab = 0;
  // Prepaid controllers
  final TextEditingController _prepaidMobileController = TextEditingController();
  final TextEditingController _prepaidAmountController = TextEditingController();
  // Postpaid controllers
  final TextEditingController _postpaidMobileController = TextEditingController();
  final TextEditingController _postpaidAmountController = TextEditingController();
  // DTH controllers
  final TextEditingController _dthCustomerIdController = TextEditingController();
  final TextEditingController _dthAmountController = TextEditingController();
  late TabController _tabController;
  String? selectedNetwork;
  List<Map<String, String>> _offers = [];
  late TabController _offerTabController;
  final List<String> _offerTabs = [
    'Unlimited',
    'Data',
    'Talktime',
    'Roaming',
    'Ratecutter',
  ];
  // #endregion

  // #region Callback Handlers
  void _onTabChanged(int index) {
    setState(() {
      selectedTab = index;
    });
  }

  void _onContactPressed() {
    // TODO: Implement logic to open phone book/contacts.
  }

  void _onNetworkChanged(String? value) {
    setState(() {
      selectedNetwork = value;
    });
  }

  void _onCheckOfferPressed() {
    // TODO: Implement check offer logic
  }

  void _onPlanSheetPressed() {
    // TODO: Implement plan sheet logic
  }

  void _onProceedPressed() {
    _showConfirmationSheet();
  }

  void _onViewAllPressed() {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => const RecentRechargeScreen()),
    );
  }

  void _onRepeatRechargePressed(Map<String, String> recharge) {
    // TODO: Implement repeat recharge logic
  }
  void _onViewDetailsPressed(Map<String, String> offer) {
    // TODO: Implement view details logic for offer
  }
  void _onRechargeNowPressed(Map<String, String> offer, {String? idLabel, String? idValue, String? tab}) {
    if (tab == 'prepaid') {
      setState(() {
        _prepaidAmountController.text = offer['price']?.replaceAll(RegExp(r'[^0-9]'), '') ?? '';
      });
      _showConfirmationSheet(
        idLabel: idLabel,
        idValue: idValue,
        amount: _prepaidAmountController.text,
      );
    } else if (tab == 'postpaid') {
      setState(() {
        _postpaidAmountController.text = offer['price']?.replaceAll(RegExp(r'[^0-9]'), '') ?? '';
      });
      _showConfirmationSheet(
        idLabel: idLabel,
        idValue: idValue,
        amount: _postpaidAmountController.text,
      );
    } else if (tab == 'dth') {
      setState(() {
        _dthAmountController.text = offer['price']?.replaceAll(RegExp(r'[^0-9]'), '') ?? '';
      });
      _showConfirmationSheet(
        idLabel: idLabel,
        idValue: idValue,
        amount: _dthAmountController.text,
      );
    }
  }

  void _onRecentRepeatRechargePressed(Map<String, String> recharge) {
    // TODO: Implement repeat recharge logic from recent recharge screen
  }
  void _onRecentViewDetailsPressed(Map<String, String> recharge) {
    // TODO: Implement view details logic for recent recharge
  }
  void _onCustomerInfoPressed() {
    // TODO: Implement Customer INFO logic
  }
  void _onHeavyRefreshPressed() {
    // TODO: Implement Heavy Refresh logic
  }
  void _onMobileToDthIdPressed() {
    // TODO: Implement Mobile No. To DTH ID logic
  }
  void _onDthOfferTabChanged(int index) {
    setState(() {
      _selectedDthOfferTab = index;
    });
  }
  // #endregion

  // #region Lifecycle
  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: 3,
      vsync: this,
      initialIndex: selectedTab,
    );
    _tabController.addListener(() {
      if (_tabController.indexIsChanging) {
        setState(() {
          selectedTab = _tabController.index;
        });
      }
    });
    _offerTabController = TabController(length: _offerTabs.length, vsync: this);
    _offerTabController.addListener(() {
      if (_offerTabController.indexIsChanging) {
        setState(() {});
      }
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    _offerTabController.dispose();
    _prepaidMobileController.dispose();
    _prepaidAmountController.dispose();
    _postpaidMobileController.dispose();
    _postpaidAmountController.dispose();
    _dthCustomerIdController.dispose();
    _dthAmountController.dispose();
    super.dispose();
  }
  // #endregion

  // #region Build
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Column(
        children: [
          _buildTabBar(),
          const SizedBox(height: 16),
          _BannerSection(),
          const SizedBox(height: 16),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                SingleChildScrollView(child: _prepaidTabView(context)),
                SingleChildScrollView(child: _postpaidTabView(context)),
                SingleChildScrollView(child: _dthTabView(context)),
              ],
            ),
          ),
        ],
      ),
    );
  }
  // #endregion

  // #region AppBar
  AppBar _buildAppBar() {
    return AppBar(
      actionsPadding: const EdgeInsets.only(right: 16),
        leading: const BackButton(),
        title: const Text('Recharge'),
        actions: [
          Row(
            children: [
              Image.asset(AppAssets.add_money, height: 24),
              Text(
                'Add Money',
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ],
    );
  }
  // #endregion

  // #region TabBar
  Widget _buildTabBar() {
    return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: TabBar(
              indicatorWeight: 4,
              indicatorSize: TabBarIndicatorSize.tab,
              indicatorColor: Colors.black54,
              dividerColor: Colors.grey,
              controller: _tabController,
        onTap: _onTabChanged,
              tabs: [
                Tab(
            child: _TabWidget(
                    selectedTab: selectedTab,
                    label: 'Prepaid',
              iconPath: AppAssets.prepaidIcon,
                    index: 0,
                  ),
                ),
                Tab(
            child: _TabWidget(
                    selectedTab: selectedTab,
                    label: 'Postpaid',
              iconPath: AppAssets.postpaidIcon,
                    index: 1,
                  ),
                ),
                Tab(
            child: _TabWidget(
                    selectedTab: selectedTab,
                    label: 'DTH',
              iconPath: AppAssets.dthIcon,
                    index: 2,
            ),
          ),
        ],
      ),
    );
  }
  // #endregion

  // #region Prepaid Tab View
  Widget _prepaidTabView(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
      margin: const EdgeInsets.only(top: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 10,
            offset: const Offset(0, -2),
          ),
        ],
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildPrepaidMobileField(),
          const SizedBox(height: 10),
          _buildMobileHint(),
          const SizedBox(height: 10),
          _buildNetworkDropdown(),
          const SizedBox(height: 10),
          _buildPrepaidAmountField(),
          const SizedBox(height: 10),
          _buildAmountHint(),
          const SizedBox(height: 16),
          _buildOfferButtons(),
          const SizedBox(height: 16),
          _buildWalletBalance(),

          const SizedBox(height: 16),
          _buildProceedButton(),
          if (selectedNetwork != null) ...[
            const SizedBox(height: 24),
            _buildOfferTabBar(),
            const SizedBox(height: 8),
            _buildVerticalOfferCards(),
          ],
          const SizedBox(height: 24),
          _buildRecentRechargeHeader(),
          const SizedBox(height: 12),
          _buildRecentRechargeList(),
        ],
      ),
    );
  }

  Widget _buildPrepaidMobileField() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: TextField(
              controller: _prepaidMobileController,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
          prefixIcon: Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: CircleAvatar(
              radius: 15,
              backgroundColor: Colors.red,
              child: Icon((Icons.phone_android_rounded)),
            ),
          ),
                hintText: 'Mobile Number',
                suffixIcon: IconButton(
            icon: Image.asset(AppAssets.contact),
            onPressed: _onContactPressed,
                ),
              ),
            ),
    );
  }

  Widget _buildPrepaidAmountField() {
    return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: TextField(
              controller: _prepaidAmountController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.currency_rupee),
                hintText: 'Enter Amount',
              ),
            ),
    );
  }

  Widget _buildMobileHint() {
    return Text(
            'Please recheck your Mobile Number',
            style: GoogleFonts.poppins(
              fontSize: 12,
              color: Colors.deepPurple,
              fontWeight: FontWeight.w900,
            ),
    );
  }

  Widget _buildAmountHint() {
    return Text(
      'Incorrect Recharge wont be refundable.',
      style: GoogleFonts.poppins(
        fontSize: 12,
        color: Colors.deepPurple,
        fontWeight: FontWeight.w900,
      ),
    );
  }

  Widget _buildNetworkDropdown() {
    return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: DropdownButtonFormField<String>(
              value: selectedNetwork,
              hint: Row(
                children: [
                  CircleAvatar(
              backgroundColor: Colors.red,
              radius: 16,
              child: Image.asset(AppAssets.airtel, height: 24),
                  ),
                  const SizedBox(width: 8),
                  const Text('Network'),
                ],
              ),
              items: const [
                DropdownMenuItem(
                  value: 'Airtel',
                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: AssetImage('assets/airtel.png'),
                        radius: 14,
                      ),
                      SizedBox(width: 8),
                      Text('Airtel'),
                    ],
                  ),
                ),
                DropdownMenuItem(
                  value: 'VI',
                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        backgroundImage: AssetImage('assets/vodafone idea.png'),
                        radius: 14,
                      ),
                      SizedBox(width: 8),
                      Text('VI'),
                    ],
                  ),
                ),
                DropdownMenuItem(
                  value: 'Jio',
                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: AssetImage('assets/jio.png'),
                        radius: 14,
                      ),
                      SizedBox(width: 8),
                      Text('Jio'),
                    ],
                  ),
                ),
              ],
        onChanged: _onNetworkChanged,
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
              ),
            ),
    );
  }

  Widget _buildOfferButtons() {
    return Row(
            children: [
              Expanded(
                child: ElevatedButton(
            onPressed: _onCheckOfferPressed,
                  style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
                    backgroundColor: Colors.green,
                  ),
                  child: const Text('Check Offer'),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: ElevatedButton(
            onPressed: _onPlanSheetPressed,
                  style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
                    backgroundColor: Colors.amber,
                  ),
                  child: const Text('Plan Sheet'),
                ),
              ),
            ],
    );
  }

  Widget _buildWalletBalance() {
    return Row(
            children: [
        CircleAvatar(
          backgroundColor: Colors.deepPurple,
          radius: 16,
          child: Image.asset(AppAssets.depositIcon, height: 24),
        ),
              SizedBox(width: 8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
              Text(
              "Wallet Balance",
              style: GoogleFonts.poppins(
                fontSize: 12,
                fontWeight: FontWeight.w800,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              "Rs 349/-",
              style: GoogleFonts.poppins(
                fontSize: 10,
                fontWeight: FontWeight.w600,
              ),
              ),
            ],
          ),
      ],
    );
  }

  Widget _buildProceedButton() {
    return SizedBox(
            width: double.infinity,
      height: 48,
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [
              Color(0xFF8F45FA),
              Color(0xFF6F13F5),
            ], // Deep purple gradient
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
            child: ElevatedButton(
          onPressed: _onProceedPressed,
              style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            elevation: 0,
          ),
          child: const Text(
            'Proceed',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }

  Widget _buildRecentRechargeHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
            'Recent Recharge',
          style: GoogleFonts.poppins(
            fontSize: 18,
            fontWeight: FontWeight.w900,
            color: Colors.black,
          ),
        ),
        TextButton(
          onPressed: _onViewAllPressed,
          child: Row(
            children: [
              Text(
                'View All',
                style: GoogleFonts.poppins(
                  color: Colors.deepPurple,
                  fontSize: 10,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const Icon(
                Icons.chevron_right,
                color: Colors.deepPurple,
                size: 16,
          ),
        ],
      ),
        ),
      ],
    );
  }
  // #endregion

  // #region Recharge Tile
  Widget _buildRecentRechargeList() {
    // Example data, replace with your actual data source
    final List<Map<String, String>> recentRecharges = [
      {
        'network': 'Airtel',
        'number': '9876543210',
        'time': '28 May 2024 | 00:02:25 PM',
        'amount': 'Rs 545/-',
      },
      {
        'network': 'Jio',
        'number': '9876543210',
        'time': '28 May 2024 | 00:02:25 PM',
        'amount': 'Rs 545/-',
      },
    ];

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: recentRecharges.length,
        separatorBuilder: (context, index) =>
            const Divider(height: 1, thickness: 1),
        itemBuilder: (context, index) {
          final recharge = recentRecharges[index];
          return ListTile(
        leading: CircleAvatar(
              radius: 16,
              backgroundImage: AssetImage(
                'assets/${recharge['network']!.toLowerCase()}.png',
              ),
            ),
            title: Text(
              recharge['number']!,
              style: GoogleFonts.poppins(fontSize: 10),
            ),
            subtitle: Text(
              recharge['time']!,
              style: GoogleFonts.poppins(fontSize: 8),
            ),
        trailing: SizedBox(
              width: 100,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Success',
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      color: Colors.green,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  Text(
                    recharge['amount']!,
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  FittedBox(
                    fit: BoxFit.scaleDown,
                    child: TextButton(
                      onPressed: () => _onRecentRepeatRechargePressed(recharge),
                style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                        minimumSize: Size.zero,
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                  'Repeat Recharge',
                            style: GoogleFonts.poppins(
                              fontSize: 10,
                              color: Colors.deepPurple,
                              fontWeight: FontWeight.w800,
                            ),
                          ),

                          const Icon(
                            Icons.chevron_right,
                            size: 16,
                            color: Colors.deepPurple,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  // #endregion

  Widget _postpaidTabView(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
      margin: const EdgeInsets.only(top: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 10,
            offset: const Offset(0, -2),
          ),
        ],
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildPostpaidMobileField(),
          const SizedBox(height: 10),
          Text(
            'Please recheck your Postpaid Number',
            style: GoogleFonts.poppins(
              fontSize: 12,
              color: Colors.deepPurple,
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 10),
          _buildNetworkDropdown(),
          const SizedBox(height: 10),
          _buildPostpaidAmountField(),
          const SizedBox(height: 10),
          Text(
            'Incorrect Bill Payment won\'t be refundable.',
            style: GoogleFonts.poppins(
              fontSize: 12,
              color: Colors.deepPurple,
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 16),
          _buildOfferButtons(),
          const SizedBox(height: 16),
          _buildWalletBalance(),
          const SizedBox(height: 16),
          _buildProceedButton(),
          const SizedBox(height: 24),
          _buildRecentRechargeHeader(),
          const SizedBox(height: 12),
          _buildRecentRechargeList(),
        ],
      ),
    );
  }

  Widget _buildPostpaidMobileField() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: TextField(
        controller: _postpaidMobileController,
        keyboardType: TextInputType.phone,
        decoration: InputDecoration(
          prefixIcon: Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: CircleAvatar(
              radius: 15,
              backgroundColor: Colors.red,
              child: Icon((Icons.phone_android_rounded)),
            ),
          ),
          hintText: 'Mobile Number',
          suffixIcon: IconButton(
            icon: Image.asset(AppAssets.contact),
            onPressed: _onContactPressed,
          ),
        ),
      ),
    );
  }

  Widget _buildPostpaidAmountField() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: TextField(
        controller: _postpaidAmountController,
        keyboardType: TextInputType.number,
        decoration: const InputDecoration(
          prefixIcon: Icon(Icons.currency_rupee),
          hintText: 'Enter Amount',
        ),
      ),
    );
  }

  Widget _buildOfferTabBar() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 0),
      child: TabBar(
        isScrollable: true, // Make tabs scrollable so all names are visible
        tabAlignment: TabAlignment.start, // Ensure tabs start from the left
        dividerColor: Colors.grey,
        controller: _offerTabController,
        indicator: UnderlineTabIndicator(
          borderSide: BorderSide(color: Colors.black, width: 2),
          insets: EdgeInsets.symmetric(horizontal: 10),
        ),
        indicatorSize: TabBarIndicatorSize.tab,
        labelStyle: GoogleFonts.poppins(
          fontWeight: FontWeight.bold,
          color: Colors.black,
          fontSize: 12,
        ),
        unselectedLabelStyle: GoogleFonts.poppins(
          fontWeight: FontWeight.bold,
          color: Colors.grey,
          fontSize: 12,
        ),
        tabs: _offerTabs.map((label) => Tab(text: label)).toList(),
        overlayColor: MaterialStateProperty.all(Colors.transparent),
      ),
    );
  }

  Widget _buildVerticalOfferCards() {
    // Mock data for each tab and network
    final offersByTabAndNetwork = {
      'Airtel': [
        [
          // Unlimited
          {
            'price': 'Rs 350/-',
            'validity': '28 Days',
            'data': '1.5 GB/ Day',
            'type': 'Unlimited',
            'desc': 'Local / STD',
            'popular': 'true',
          },
          {
            'price': 'Rs 419/-',
            'validity': '32 Days',
            'data': '2.5 GB/ Day',
            'type': 'Unlimited',
            'desc': 'Local / STD',
          },
          {
            'price': 'Rs 290/-',
            'validity': '24 Days',
            'data': '1 GB/ Day',
            'type': 'Unlimited',
            'desc': 'Local / STD',
          },
        ],
        [
          // Data
          {
            'price': 'Rs 98/-',
            'validity': 'NA',
            'data': '6 GB',
            'type': 'Data Booster',
            'desc': 'Add-on',
          },
        ],
        [
          // Talktime
          {
            'price': 'Rs 100/-',
            'validity': 'NA',
            'data': '-',
            'type': 'Talktime',
            'desc': 'Talktime Only',
          },
        ],
        [
          // Roaming
          {
            'price': 'Rs 199/-',
            'validity': '7 Days',
            'data': '1 GB/ Day',
            'type': 'Roaming',
            'desc': 'National',
          },
        ],
        [
          // Ratecutter
          {
            'price': 'Rs 52/-',
            'validity': '56 Days',
            'data': '-',
            'type': 'Ratecutter',
            'desc': 'Reduced call rates',
          },
        ],
      ],
      'Jio': [
        [
          // Unlimited
          {
            'price': 'Rs 299/-',
            'validity': '28 Days',
            'data': '2 GB/ Day',
            'type': 'Unlimited',
            'desc': 'Local / STD',
          },
        ],
        [
          // Data
          {
            'price': 'Rs 61/-',
            'validity': 'NA',
            'data': '6 GB',
            'type': 'Data Booster',
            'desc': 'Add-on',
          },
        ],
        [
          // Talktime
          {
            'price': 'Rs 155/-',
            'validity': 'NA',
            'data': '-',
            'type': 'Talktime',
            'desc': 'Talktime Only',
          },
        ],
        [
          // Roaming
          {
            'price': 'Rs 110/-',
            'validity': '7 Days',
            'data': '1 GB/ Day',
            'type': 'Roaming',
            'desc': 'National',
          },
        ],
        [
          // Ratecutter
          {
            'price': 'Rs 25/-',
            'validity': '30 Days',
            'data': '-',
            'type': 'Ratecutter',
            'desc': 'Reduced call rates',
          },
        ],
      ],
      // Add more networks as needed
    };

    final network = selectedNetwork ?? '';
    final tabIndex = _offerTabController.index;
    final offers =
        offersByTabAndNetwork[network] != null &&
            offersByTabAndNetwork[network]!.length > tabIndex
        ? offersByTabAndNetwork[network]![tabIndex]
        : [];

    if (offers.isEmpty) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 24),
        child: Center(
          child: Text(
            'No offers available for this category.',
            style: GoogleFonts.poppins(fontSize: 12, color: Colors.grey),
          ),
        ),
      );
    }

    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: offers.length,
      separatorBuilder: (context, index) => const SizedBox(height: 16),
      itemBuilder: (context, index) {
        final offer = offers[index];
        return Stack(
          children: [
            Card(
              color: const Color(0xFF8F45FA),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(width: 10),
                        Text(
                          offer['price'] ?? '',
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontWeight: FontWeight.w800,
                            fontSize: 16,
                          ),
                        ),
                        const Spacer(),
                        if ((offer['popular'] ?? 'false') == 'true')
                          Image.asset(
                            AppAssets.markIcon,
                            height: 24,
                            width: 24,
                          ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Validity',
                              style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                            Text(
                              offer['validity'] ?? '',
                              style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontSize: 10,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(width: 14),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Data',
                              style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                            Text(
                              offer['data'] ?? '',
                              style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontSize: 10,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(width: 14),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              offer['type'] ?? '',
                              style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontWeight: FontWeight.w800,
                                fontSize: 10,
                              ),
                            ),
                            Text(
                              offer['desc'] ?? '',
                              style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontWeight: FontWeight.w800,
                                fontSize: 10,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(width: 16),
                        TextButton(
                          onPressed: () => _onViewDetailsPressed(offer),
                          child: Text(
                            'View Details',
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                              fontSize: 8,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 20),
                    SizedBox(
                      width: double.infinity,
                      height: 40,
                      child: ElevatedButton(
                        onPressed: () => _onRechargeNowPressed(offer, tab: 'prepaid'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          elevation: 0,
                        ),
                        child: Text(
                          'Recharge Now',
                          style: GoogleFonts.poppins(
                            color: const Color(0xFF8F45FA),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  // DTH Tab State
  int _selectedDthOfferTab = 0;
  final List<String> _dthOfferTabs = [
    '12 Month',
    '6 Month',
    '3 Month',
    '2 Month',
    '1 Month',
  ];

  Widget _dthTabView(BuildContext context) {
    // DTH providers
    final dthProviders = [
      {'label': 'Airtel DTH', 'icon': 'assets/airtel.png'},
      {'label': 'D2H', 'icon': 'assets/d2h.png'},
      {'label': 'Sun Direct', 'icon': 'assets/sun direct.png'},
      {'label': 'TATA Play', 'icon': 'assets/tata play.png'},
    ];

    // Ensure uniqueness and robust fallback
    final dthLabels = dthProviders.map((p) => p['label']).toSet();
    String? dthDropdownValue = selectedNetwork;
    print('selectedNetwork: $selectedNetwork');
    print('dthLabels: $dthLabels');
    if (dthDropdownValue == null || !dthLabels.contains(dthDropdownValue)) {
      dthDropdownValue = null;
    }

    // DTH offers mock (list of lists, one per tab)
    final dthOffersByTab = [
      [ // 12 Month
        {
          'price': 'Rs 1299/-',
          'validity': '365 Days',
          'sd': 'SD/HD',
          'hd': 'HD',
          'popular': 'true',
        },
      ],
      [ // 6 Month
        {
          'price': 'Rs 699/-',
          'validity': '180 Days',
          'sd': 'SD',
          'hd': 'HD',
        },
      ],
      [ // 3 Month
        {
          'price': 'Rs 399/-',
          'validity': '90 Days',
          'sd': 'SD',
          'hd': 'HD',
        },
      ],
      [ // 2 Month
        {
          'price': 'Rs 299/-',
          'validity': '60 Days',
          'sd': 'SD',
          'hd': 'HD',
        },
      ],
      [ // 1 Month
        {
          'price': 'Rs 149/-',
          'validity': '30 Days',
          'sd': 'SD',
          'hd': 'HD',
        },
      ],
    ];

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
      margin: const EdgeInsets.only(top: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 10,
            offset: const Offset(0, -2),
          ),
        ],
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          // Customer ID or Mobile No
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: TextField(
              controller: _dthCustomerIdController,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                prefixIcon: Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: CircleAvatar(
                    radius: 15,
                    backgroundColor: Colors.red,
                    child: const Icon(Icons.perm_identity, color: Colors.white),
                  ),
                ),
                hintText: 'Customer ID or Mobile No',
                suffixIcon: IconButton(
                  icon: Image.asset(AppAssets.contact),
                  onPressed: _onContactPressed,
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          _buildMobileHint(),
          const SizedBox(height: 10),
          // DTH Network Dropdown
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: DropdownButtonFormField<String>(
              value: dthDropdownValue,
              hint: Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 16,
                    child: Image.asset(AppAssets.airtel, height: 24),
                  ),
                  const SizedBox(width: 8),
                  const Text('Airtel DTH'),
                ],
              ),
              items: dthProviders.map((provider) {
                return DropdownMenuItem(
                  value: provider['label'],
                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: AssetImage(provider['icon']!),
                        radius: 14,
                        onBackgroundImageError: (_, __) {},
                      ),
                      const SizedBox(width: 8),
                      Text(provider['label']!),
                    ],
                  ),
                );
              }).toList(),
              onChanged: _onNetworkChanged,
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          // Amount Field
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: TextField(
              controller: _dthAmountController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                prefixIcon: Padding(
                  padding: const EdgeInsets.only(right: 10.0, left: 10),
                  child: CircleAvatar(
                    radius: 16,
                    backgroundColor: Colors.red,
                    child: const Icon(
                      Icons.currency_rupee,
                      color: Colors.white,
                    ),
                  ),
                ),
                hintText: 'Enter Amount',
              ),
            ),
          ),
          const SizedBox(height: 10),
          _buildAmountHint(),
          const SizedBox(height: 16),
          // Action Buttons (2 rows)
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: _onCustomerInfoPressed,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFF7F50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text('Customer INFO'),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: ElevatedButton(
                  onPressed: _onPlanSheetPressed,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey.shade700,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text('Plan Sheet'),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: _onHeavyRefreshPressed,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF3B82F6),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text('Heavy Refresh'),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: ElevatedButton(
                  onPressed: _onMobileToDthIdPressed,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF22C55E),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text('Mobile No. To DTH ID'),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          _buildWalletBalance(),
          const SizedBox(height: 16),
          _buildProceedButton(),
          const SizedBox(height: 24),
          // DTH Offer Tabs
          _buildDthOfferTabBar(),
          const SizedBox(height: 8),
          _buildDthOfferCards(
            (_selectedDthOfferTab >= 0 && _selectedDthOfferTab < dthOffersByTab.length)
                ? dthOffersByTab[_selectedDthOfferTab]
                : [],
          ),
          const SizedBox(height: 24),
          _buildRecentRechargeHeader(),
          const SizedBox(height: 12),
          _buildRecentRechargeList(),
        ],
      ),
    );
  }

  Widget _buildDthOfferTabBar() {
    return Container(
      child: TabBar(
        controller: TabController(
          length: _dthOfferTabs.length,
          vsync: this,
          initialIndex: _selectedDthOfferTab,
        ),
        isScrollable: true,
        dividerColor: Colors.black26,
        tabAlignment: TabAlignment.start,
        indicator: const UnderlineTabIndicator(
          borderSide: BorderSide(color: Colors.black, width: 2),
        ),
        labelStyle: GoogleFonts.poppins(
          fontWeight: FontWeight.bold,
          fontSize: 12,
          color: Colors.black,
        ),
        unselectedLabelStyle: GoogleFonts.poppins(
          fontWeight: FontWeight.bold,
          fontSize: 10,
          color: Colors.grey,
        ),
        tabs: _dthOfferTabs.map((label) => Tab(text: label)).toList(),
        onTap: _onDthOfferTabChanged,
      ),
    );
  }

  Widget _buildDthOfferCards(List<Map<String, String>> offers) {
    if (offers.isEmpty) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 24),
        child: Center(
          child: Text(
            'No offers available for this category.',
            style: GoogleFonts.poppins(fontSize: 12, color: Colors.grey),
          ),
        ),
      );
    }
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: offers.length,
      separatorBuilder: (context, index) => const SizedBox(height: 16),
      itemBuilder: (context, index) {
        final offer = offers[index];
        return Stack(
          children: [
            Card(
              color: const Color(0xFF8F45FA),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          offer['price'] ?? '',
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontWeight: FontWeight.w800,
                            fontSize: 16,
                          ),
                        ),
                        const Spacer(),
                        if ((offer['popular'] ?? 'false') == 'true')
                          Image.asset(AppAssets.markIcon, height: 20),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Validity',
                              style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              offer['validity'] ?? '',
                              style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontSize: 10,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(width: 16),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              offer['sd'] ?? '',
                              style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                            const SizedBox(width: 4),
                            Text(
                              offer['hd'] ?? '',
                              style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontSize: 10,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(width: 16),
                        TextButton(
                          onPressed: () => _onViewDetailsPressed(offer),
                          child: Text(
                            'View Details',
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                              fontSize: 8,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: double.infinity,
                      height: 40,
                      child: ElevatedButton(
                        onPressed: () => _onRechargeNowPressed(
                          offer,
                          idLabel: 'Customer ID',
                          idValue: _dthCustomerIdController.text,
                          tab: 'dth',
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          elevation: 0,
                        ),
                        child: Text(
                          'Recharge Now',
                          style: GoogleFonts.poppins(
                            color: const Color(0xFF8F45FA),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  void _showConfirmationSheet({String? idLabel, String? idValue, String? amount}) {
    showModalBottomSheet(
      elevation: 20,
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return FractionallySizedBox(
          heightFactor: 0.9,
          child: ConfirmationSheet(
            network: selectedNetwork ?? '',
            idLabel: idLabel ?? 'Mobile Number',
            idValue: idValue ?? '',
            amount: amount ?? '',
          ),
        );
      },
    );
  }
}

// ================== Tab Widget ==================
class _TabWidget extends StatelessWidget {
  final String label;
  final String iconPath;
  final int index;
  final int selectedTab;
  const _TabWidget({
    super.key,
    required this.selectedTab,
    required this.label,
    required this.iconPath,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 120),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircleAvatar(
            radius: 16,
            backgroundColor: selectedTab == index
                ? const Color(0xff6B11EB)
                : Colors.grey.shade300,
            child: Image.asset(
              iconPath,
              height: 24,
              color: selectedTab == index
                  ? const Color(0xffffffff)
                  : Colors.grey,
            ),
          ),
          const SizedBox(width: 4),
          Flexible(
            child: Text(
              label,
              style: GoogleFonts.poppins(
                fontSize: 12,
                color: selectedTab == index
                    ? const Color(0xff121212)
                    : Colors.grey,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}

// ================== Banner Section ==================
class _BannerSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              Container(
                width: 180,
                margin: const EdgeInsets.symmetric(horizontal: 8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  image: const DecorationImage(
                    image: AssetImage(
                      'assets/banners/Tata-Sky-Recharge-Plans-1.jpg 1.png',
                    ),
                    fit: BoxFit.cover,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
              ),
              Container(
                width: 180,
                margin: const EdgeInsets.symmetric(horizontal: 8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  image: const DecorationImage(
                    image: AssetImage(
                      'assets/banners/sun-direct-new-connections-offer 1.png',
                    ),
                    fit: BoxFit.cover,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
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
}

// ConfirmationSheet widget
class ConfirmationSheet extends StatelessWidget {
  final String network;
  final String idLabel;
  final String idValue;
  final String amount;
  const ConfirmationSheet({
    super.key,
    required this.network,
    required this.idLabel,
    required this.idValue,
    required this.amount,
  });

  @override
  Widget build(BuildContext context) {
    // Map network to logo asset and display name
    final networkLogo =
        {
          'Airtel': 'assets/airtel.png',
          'Jio': 'assets/jio.png',
          'VI': 'assets/vodafone idea.png',
          // Add more as needed
        }[network] ??
        'assets/airtel.png';

    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(28),
          topRight: Radius.circular(28),
        ),
        // boxShadow: [
        //   BoxShadow(
        //     color: Colors.black12,
        //     blurRadius: 16,
        //     offset: Offset(0, -4),
        //   ),
        // ],
      ),
      child: SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 24),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 40,
                    backgroundImage: AssetImage(networkLogo),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    network,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 24),
                  _InfoCard(
                    icon: idLabel == 'Customer ID' ? Icons.perm_identity : Icons.phone_android_rounded,
                    label: idLabel,
                    value: idValue,
                  ),
                  const SizedBox(height: 16),
                  _InfoCard(
                    icon: Icons.currency_rupee,
                    label: 'Amount',
                    value: amount,
                  ),
                ],
              ),
              const SizedBox(height: 32),
              Spacer(),
              SizedBox(
                width: double.infinity,
                height: 52,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Color(0xFF8F45FA), Color(0xFF6F13F5)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ElevatedButton(
                    onPressed: () async {
                      Navigator.of(context).pop();
                      await Future.delayed(const Duration(milliseconds: 200));
                      showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        backgroundColor: Colors.transparent,
                        builder: (context) => const RechargeSuccessSheet(),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 0,
                    ),
                    child: const Text(
                      'Confirm and Pay',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}

class _InfoCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  const _InfoCard({
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 2, horizontal: 0),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: Colors.red,
            radius: 18,
            child: Icon(icon, color: Colors.white, size: 22),
          ),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: const TextStyle(fontSize: 12, color: Colors.black),
              ),
              const SizedBox(height: 2),
              Text(
                value,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// Success Modal
class RechargeSuccessSheet extends StatelessWidget {
  const RechargeSuccessSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black.withOpacity(0.2),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 48),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        color: Color(0xff00891E),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(14),
                          topRight: Radius.circular(14),
                        ),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.white, width: 2),
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.check,
                              color: Colors.white,
                              size: 32,
                            ),
                          ),
                          const SizedBox(height: 12),
                          const Text(
                            'Recharge Succesfull',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 24,
                      ),
                      child: Column(
                        children: [
                          _SuccessRow(label: 'Paid Amount', value: '- ₹ 249'),
                          _SuccessRow(label: 'Calls', value: '- Unlimited'),
                          _SuccessRow(label: 'Data', value: '- 1.5 GB Per day'),
                          _SuccessRow(label: 'SMS', value: '- 100 SMS'),
                          _SuccessRow(
                            label: 'Date',
                            value: '- 15 - Oct - 2024',
                          ),
                          _SuccessRow(
                            label: 'Transaction ID',
                            value: '- T1234-5678-9012-3456',
                          ),
                        ],
                      ),
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
}

class _SuccessRow extends StatelessWidget {
  final String label;
  final String value;
  const _SuccessRow({required this.label, required this.value});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Text(
              label,
              style: const TextStyle(fontSize: 14, color: Colors.black87),
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(
              value,
              style: const TextStyle(fontSize: 14, color: Colors.black87),
            ),
          ),
        ],
      ),
    );
  }
}

// Recent Recharge Screen
class RecentRechargeScreen extends StatelessWidget {
  const RecentRechargeScreen({super.key});

  void _onRecentRepeatRechargePressed(Map<String, String> recharge) {
    // TODO: Implement repeat recharge logic from recent recharge screen
  }
  void _onRecentViewDetailsPressed(Map<String, String> recharge) {
    // TODO: Implement view details logic for recent recharge
  }

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> recentRecharges = [
      {
        'network': 'Airtel',
        'number': '9876543210',
        'time': '28 May 2024 | 00:02:25 PM',
        'amount': 'Rs 545/-',
      },
      {
        'network': 'Jio',
        'number': '9876543210',
        'time': '28 May 2024 | 00:02:25 PM',
        'amount': 'Rs 545/-',
      },
      {
        'network': 'sundirect',
        'number': '9876543210',
        'time': '28 May 2024 | 00:02:25 PM',
        'amount': 'Rs 545/-',
      },
      {
        'network': 'Airtel',
        'number': '9876543210',
        'time': '28 May 2024 | 00:02:25 PM',
        'amount': 'Rs 545/-',
      },
      {
        'network': 'Jio',
        'number': '9876543210',
        'time': '28 May 2024 | 00:02:25 PM',
        'amount': 'Rs 545/-',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text('Recent Recharge'),
        leading: const BackButton(),
      ),
      body: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
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
        child: Align(
          alignment: Alignment.topCenter,
          child: Container(
            constraints: BoxConstraints(
              // Max height is 60% of screen or enough for all items, whichever is smaller
              maxHeight: MediaQuery.of(context).size.height * 0.6,
            ),
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.08),
                  blurRadius: 10,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: ListView.separated(
              shrinkWrap: true,
              physics: const ClampingScrollPhysics(),
              itemCount: recentRecharges.length,
              separatorBuilder: (context, index) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: const Divider(
                  height: 1,
                  thickness: 1,
                  color: Colors.black26,
                ),
              ),
              itemBuilder: (context, index) {
                final recharge = recentRecharges[index];
                return ListTile(
                  leading: CircleAvatar(
                    radius: 16,
                    backgroundColor: Colors.grey[200],
                    child: ClipOval(
                      child: Image.asset(
                        'assets/${recharge['network']!.toLowerCase()}.png',
                        fit: BoxFit.cover,
                        width: 32,
                        height: 32,
                        errorBuilder: (context, error, stackTrace) => Icon(
                          Icons.signal_cellular_alt,
                          color: Colors.deepPurple,
                          size: 20,
                        ),
                      ),
                    ),
                  ),
                  title: Text(
                    recharge['number']!,
                    style: GoogleFonts.poppins(fontSize: 10),
                  ),
                  subtitle: Text(
                    recharge['time']!,
                    style: GoogleFonts.poppins(fontSize: 8),
                  ),
                  trailing: SizedBox(
                    width: 100,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Success',
              style: GoogleFonts.poppins(
                            fontSize: 14,
                            color: Colors.green,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        Text(
                          recharge['amount']!,
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        FittedBox(
                          fit: BoxFit.scaleDown,
                          child: TextButton(
                            onPressed: () =>
                                _onRecentRepeatRechargePressed(recharge),
                            style: TextButton.styleFrom(
                              padding: EdgeInsets.zero,
                              minimumSize: Size.zero,
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  'Repeat Recharge',
                                  style: GoogleFonts.poppins(
                                    fontSize: 10,
                                    color: Colors.deepPurple,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                                const Icon(
                                  Icons.chevron_right,
                                  size: 16,
                                  color: Colors.deepPurple,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
