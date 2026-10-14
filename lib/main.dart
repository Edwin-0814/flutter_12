import 'package:flutter/material.dart';

void main() {
  runApp(const FlutterWebApp());
}

class FlutterWebApp extends StatelessWidget {
  const FlutterWebApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Web Application',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const ResponsiveWebHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ResponsiveWebHomePage extends StatefulWidget {
  const ResponsiveWebHomePage({super.key});

  @override
  State<ResponsiveWebHomePage> createState() => _ResponsiveWebHomePageState();
}

class _ResponsiveWebHomePageState extends State<ResponsiveWebHomePage> {
  int _counter = 0;
  String _message = 'Click the button below';

  void _onWelcomePressed() {
    setState(() {
      _counter++;
      _message = 'Welcome! You clicked the button $_counter time(s).';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Web Application - Edwin Paul'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        actions: [
          IconButton(
            icon: const Icon(Icons.info_outline),
            onPressed: () {
              showAboutDialog(
                context: context,
                applicationName: 'Flutter Web Application',
                applicationVersion: '1.0.0',
                children: const [
                  Text('Developed for Experiment 12 - Build Web App with Flutter.'),
                ],
              );
            },
          ),
        ],
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth < 600) {
            return _buildMobileLayout(constraints);
          }

          return _buildDesktopLayout(constraints);
        },
      ),
    );
  }

  Widget _buildMobileLayout(BoxConstraints constraints) {
    return Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.phone_android, size: 64, color: Colors.deepPurple),
            const SizedBox(height: 12),
            const Text(
              'Mobile Web Layout',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              'Screen width: ${constraints.maxWidth.toStringAsFixed(1)}px (< 600px)',
              style: const TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: _onWelcomePressed,
              child: const Text('Welcome'),
            ),
            const SizedBox(height: 16),
            Text(_message, textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }

  Widget _buildDesktopLayout(BoxConstraints constraints) {
    return Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(32.0),
        child: Container(
          constraints: const BoxConstraints(maxWidth: 800),
          padding: const EdgeInsets.all(32.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.08),
                blurRadius: 16,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.desktop_windows, size: 80, color: Colors.deepPurple),
              const SizedBox(height: 16),
              const Text(
                'Desktop Web Layout',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(
                'Screen width: ${constraints.maxWidth.toStringAsFixed(1)}px (≥ 600px)',
                style: const TextStyle(color: Colors.grey, fontSize: 16),
              ),
              const SizedBox(height: 24),
              ElevatedButton.icon(
                icon: const Icon(Icons.waving_hand),
                onPressed: _onWelcomePressed,
                label: const Text('Welcome'),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                  textStyle: const TextStyle(fontSize: 18),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                _message,
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
