import 'package:flutter/material.dart';

/// This class [HomePageMobileView] which specifically used to render Mobile UI
class HomePageMobileView extends StatelessWidget {
  final List<String> pdaAccount;
  final String lamPorts;
  const HomePageMobileView(
      {super.key, required this.pdaAccount, required this.lamPorts});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Solana Staking App",
            style: TextStyle(fontSize: 34, fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            height: 35,
          ),
          Text(
            "PDA Accounts: ${pdaAccount.first.substring(0, 16)}",
            style: const TextStyle(fontSize: 24),
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            "PDA Accounts: ${pdaAccount.last.substring(0, 17)}",
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
