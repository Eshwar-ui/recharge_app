import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomServiceAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;

  const CustomServiceAppBar({super.key, required this.title, this.actions});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: const Icon(Icons.chevron_left, color: Colors.black, size: 32),
        onPressed: () => Navigator.of(context).pop(),
      ),
      automaticallyImplyLeading: true,
      title: Text(
        title,
        style: GoogleFonts.poppins(
          color: Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
      ),
      actions: actions,
      backgroundColor: Colors.transparent,
      elevation: 0,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
