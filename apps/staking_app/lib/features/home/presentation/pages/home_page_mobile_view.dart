import 'package:flutter/material.dart';

/// This class [HomePageMobileView] which specifically used to render Mobile UI
class HomePageMobileView extends StatelessWidget {
  final String pdaAccount;
  final String lamPorts;
  const HomePageMobileView(
      {super.key, required this.pdaAccount, required this.lamPorts});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        children: [
          Text(
            "PDA Accounts: $pdaAccount",
            style: const TextStyle(fontSize: 24),
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            "lamPorts : $lamPorts",
            style: const TextStyle(fontSize: 24),
          )
        ],
      ),
    );
  }
}
