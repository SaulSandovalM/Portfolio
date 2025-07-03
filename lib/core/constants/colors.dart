import 'package:flutter/material.dart';

class CustomColor {
  // Fondo principal (estilo GitHub/dark)
  static const Color backgroundBase = Color(0xFF0D1117);
  static const Color backgroundCard = Color(0xFF1C1C1E); // Fondo tarjetas

  // Colores de texto
  static const Color textPrimary = Colors.white;
  static final Color textSecondary = Colors.grey.shade400;
  static final Color textMuted = Colors.grey.shade600;

  // Colores de acento (puede ajustar para estilo cyberpunk si desea)
  static const Color accent = Colors.deepPurpleAccent;
  static const Color accentHover = Colors.deepPurple;

  // Botones y bordes
  static final Color buttonBackground = Colors.deepPurple.withOpacity(0.1);
  static const Color border = Colors.deepPurpleAccent;

  // Alternativas cyberpunk (si las quiere después)
  static const Color cyberGreen = Color(0xFF00FF9C);
  static const Color neonPink = Color(0xFFFF007F);
  static const Color terminalBlack = Color(0xFF0B0C10);

  // Colores de la nav
  static const Color navText = Color(0xFFCCCCCC);
  static const Color navBarBg = backgroundBase;
  static const Color navBorder = Color(0xFF2C2C2E);
}
