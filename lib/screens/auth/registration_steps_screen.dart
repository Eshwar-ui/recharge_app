import 'package:flutter/material.dart';

class RegistrationStepsScreen extends StatefulWidget {
  const RegistrationStepsScreen({Key? key}) : super(key: key);

  @override
  State<RegistrationStepsScreen> createState() =>
      _RegistrationStepsScreenState();
}

class _RegistrationStepsScreenState extends State<RegistrationStepsScreen> {
  int _currentStep = 0;

  final List<String> _steps = ['PERSONAL', 'ADDRESS', 'KYC'];

  // Controllers for PERSONAL step
  final _accountTypeController = TextEditingController();
  final _businessNameController = TextEditingController();
  final _gstNumberController = TextEditingController();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _dobController = TextEditingController();
  final _emailController = TextEditingController();
  final _mobileController = TextEditingController();

  // Controllers for ADDRESS step
  final _addressController = TextEditingController();
  final _pincodeController = TextEditingController();
  final _villageController = TextEditingController();
  final _talukController = TextEditingController();
  final _districtController = TextEditingController();
  final _stateController = TextEditingController();

  // Controllers for KYC step
  final _aadhaarController = TextEditingController();
  final _panController = TextEditingController();

  @override
  void dispose() {
    _accountTypeController.dispose();
    _businessNameController.dispose();
    _gstNumberController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    _dobController.dispose();
    _emailController.dispose();
    _mobileController.dispose();
    _addressController.dispose();
    _pincodeController.dispose();
    _villageController.dispose();
    _talukController.dispose();
    _districtController.dispose();
    _stateController.dispose();
    _aadhaarController.dispose();
    _panController.dispose();
    super.dispose();
  }

  void _onNextPressed() {
    if (_currentStep < _steps.length - 1) {
      setState(() {
        _currentStep++;
      });
    } else {
      // TODO: Submit registration
    }
  }

  void _onPreviousPressed() {
    if (_currentStep > 0) {
      setState(() {
        _currentStep--;
      });
    }
  }

  void _onUploadAadhaar() {
    // TODO: Implement Aadhaar upload logic
  }
  void _onUploadPan() {
    // TODO: Implement PAN upload logic
  }
  void _onUploadPhoto() {
    // TODO: Implement photo upload logic
  }

  Widget _buildTabBar() {
    return Row(
      children: List.generate(_steps.length, (index) {
        final isActive = index == _currentStep;
        return Expanded(
          child: Column(
            children: [
              Text(
                _steps[index],
                style: TextStyle(
                  fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
                  color: isActive ? Color(0xFF8F17E6) : Colors.black38,
                  fontSize: 15,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 6),
              Container(
                height: 3,
                width: 60,
                decoration: BoxDecoration(
                  color: isActive ? Color(0xFF8F17E6) : Colors.grey[300],
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }

  Widget _buildPersonalForm() {
    return Column(
      children: [
        _buildField(_accountTypeController, 'Account Type'),
        SizedBox(height: 14),
        _buildField(_businessNameController, 'Business Name'),
        SizedBox(height: 14),
        _buildField(_gstNumberController, 'GST Number'),
        SizedBox(height: 14),
        _buildField(_firstNameController, 'First Name'),
        SizedBox(height: 14),
        _buildField(_lastNameController, 'Last Name'),
        SizedBox(height: 14),
        _buildField(_dobController, 'DOB'),
        SizedBox(height: 14),
        _buildField(_emailController, 'Email ID'),
        SizedBox(height: 14),
        _buildField(_mobileController, 'Mobile Number'),
      ],
    );
  }

  Widget _buildField(TextEditingController controller, String hint) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          hintText: hint,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: Colors.white,
          contentPadding: EdgeInsets.symmetric(vertical: 18, horizontal: 16),
        ),
      ),
    );
  }

  Widget _buildStepContent() {
    switch (_currentStep) {
      case 0:
        return _buildPersonalForm();
      case 1:
        return Column(
          children: [
            // Address (multiline)
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 8,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: TextField(
                controller: _addressController,
                maxLines: 4,
                decoration: InputDecoration(
                  hintText: 'Address',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 18,
                    horizontal: 16,
                  ),
                ),
              ),
            ),
            SizedBox(height: 14),
            _buildField(_pincodeController, 'Pincode'),
            SizedBox(height: 14),
            _buildField(_villageController, 'Village'),
            SizedBox(height: 14),
            _buildField(_talukController, 'Taluk'),
            SizedBox(height: 14),
            _buildField(_districtController, 'District'),
            SizedBox(height: 14),
            _buildField(_stateController, 'State'),
          ],
        );
      case 2:
        return Column(
          children: [
            _buildField(_aadhaarController, 'Enter Aadhaar Number'),
            SizedBox(height: 14),
            _buildField(_panController, 'Enter PAN Number'),
            SizedBox(height: 14),
            _buildUploadButton('Upload Aadhaar Card', _onUploadAadhaar),
            SizedBox(height: 14),
            _buildUploadButton('Upload PAN Card', _onUploadPan),
            SizedBox(height: 14),
            _buildUploadButton('Upload Your Photo', _onUploadPhoto),
          ],
        );
      default:
        return SizedBox.shrink();
    }
  }

  Widget _buildUploadButton(String label, VoidCallback onPressed) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(10),
          onTap: onPressed,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 16),
            child: Row(
              children: [
                Icon(Icons.cloud_upload_outlined, color: Colors.grey[600]),
                SizedBox(width: 12),
                Text(
                  label,
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Registration',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 24),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: _buildTabBar(),
              ),
              SizedBox(height: 18),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 0),
                child: Container(
                  width: double.infinity,

                  padding: EdgeInsets.symmetric(vertical: 24, horizontal: 12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.08),
                        blurRadius: 16,
                        spreadRadius: 2,
                        offset: Offset(0, -2),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      _buildStepContent(),
                      SizedBox(height: 32),
                      Row(
                        children: [
                          if (_currentStep > 0)
                            Expanded(
                              child: OutlinedButton(
                                onPressed: _onPreviousPressed,
                                style: OutlinedButton.styleFrom(
                                  fixedSize: Size(double.infinity, 50),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  side: BorderSide(color: Color(0xFF8F17E6)),
                                  // padding: EdgeInsets.symmetric(vertical: 2),
                                ),
                                child: Text(
                                  'Previous',
                                  style: TextStyle(
                                    color: Color(0xFF8F17E6),
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          if (_currentStep > 0) SizedBox(width: 16),
                          Expanded(
                            child: SizedBox(
                              height: 50,
                              child: ElevatedButton(
                                onPressed: _onNextPressed,
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  padding: EdgeInsets.zero,
                                  elevation: 0,
                                ),
                                child: Ink(
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [
                                        Color(0xFF8F17E6),
                                        Color(0xFF5F4DEE),
                                      ],
                                      begin: Alignment.centerLeft,
                                      end: Alignment.centerRight,
                                    ),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Container(
                                    alignment: Alignment.center,
                                    child: Text(
                                      _currentStep < _steps.length - 1
                                          ? 'Next'
                                          : 'Register',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 24),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
