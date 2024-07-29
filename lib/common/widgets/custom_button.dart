import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final Color? color;

  const CustomButton({
    Key? key,
    required this.onTap,
    required this.text,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(double.infinity, 50),
        backgroundColor:
            Colors.transparent, // Use transparent background for gradient
        elevation: 5, // Add elevation for shadow
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12), // Rounded corners
        ),
        side: BorderSide(
          color: color ??
              Colors.transparent, // Border color or transparent if none
          width: 2,
        ),
        shadowColor: Colors.black.withOpacity(0.3), // Shadow color
      ),
      child: Ink(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 8, 53, 19), // Lighter green
              Color.fromARGB(255, 19, 24, 20), // Darker green
            ],
            stops: [0.0, 1.0],
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Container(
          alignment: Alignment.center,
          child: Text(
            text,
            style: TextStyle(
              color: color == null ? Colors.white : color,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}
