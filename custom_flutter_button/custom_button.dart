import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onTap;
  final String buttonText;
  final bool isLoading;
  final double fontSize;
  final double buttonRadius;
  final Color buttonBgColor;
  final Color buttonFontColor;
  final FontWeight buttonFontWeight;
  final double buttonWidth;
  final double buttonHeight;
  final double elevation; // Butonun basılınca ne kadar yükseldiği

  const CustomButton({
    super.key,
    required this.onTap,
    required this.buttonText,
    required this.isLoading,
    required this.fontSize,
    required this.buttonRadius,
    required this.buttonBgColor,
    required this.buttonFontWeight,
    required this.buttonWidth,
    required this.buttonHeight,
    required this.buttonFontColor,
    this.elevation = 5.0, // Varsayılan olarak 5 elevation
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * buttonWidth,
      height: MediaQuery.of(context).size.width * buttonHeight,
      child: ElevatedButton(
        onPressed:
            isLoading
                ? null
                : onTap, // Eğer `isLoading` true ise buton disable edilir.
        style: ElevatedButton.styleFrom(
          backgroundColor: buttonBgColor, // Buton arka plan rengi
          elevation: elevation, // Butonun basılınca yükselme efekti
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              buttonRadius,
            ), // Butonun yuvarlaklığı
          ),
        ),
        child:
            isLoading
                ? CircularProgressIndicator(
                  color: buttonFontColor,
                ) // Yükleme animasyonu
                : Text(
                  buttonText,
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width * fontSize,
                    fontWeight: buttonFontWeight,
                    color: buttonFontColor,
                  ),
                ),
      ),
    );
  }
}
