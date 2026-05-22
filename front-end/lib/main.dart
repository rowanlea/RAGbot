import 'package:flutter/material.dart';
import 'widgets/side_nav.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const RagbotApp());
}

class RagbotApp extends StatelessWidget {
  const RagbotApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RAGbot',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF0057D8),
          brightness: Brightness.light,
        ),
        useMaterial3: true,
      ),
      home: const ShellPage(),
    );
  }
}

class ShellPage extends StatefulWidget {
  const ShellPage({super.key});

  @override
  State<ShellPage> createState() => _ShellPageState();
}

class _ShellPageState extends State<ShellPage> {
  String _selectedRoute = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          SideNav(
            selectedRoute: _selectedRoute,
            onSelect: (route) => setState(() => _selectedRoute = route),
          ),
          Expanded(
            child: HomeScreen(route: _selectedRoute),
          ),
        ],
      ),
    );
  }
}
