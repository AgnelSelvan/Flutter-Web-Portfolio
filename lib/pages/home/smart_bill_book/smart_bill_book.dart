import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SmartBillBookPrivacyPolicyScreen extends StatelessWidget {
  const SmartBillBookPrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Privacy Policy for Smart Bill Book",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              ...[
                "At Smart Bill Book, your privacy is our priority. This Privacy Policy explains what information we collect, how we use it, and how we ensure your data is secure."
              ].map(
                (e) => Text(e),
              ),
              const SizedBox(
                height: 20,
              ),
              const PrivacyPolicy(
                title: "1. Information We Collect",
                description:
                    "We collect and store the following types of information to provide and improve our services:",
                subTitles: [
                  "User Account Information: Name, email address, phone number, and business details."
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              const PrivacyPolicy(
                title: "2. How We Use Your Information",
                description:
                    "We use the information solely for the following purposes:",
                subTitles: [
                  "To provide and operate the billing software features.",
                  "To assist you in managing your business records and transactions.",
                  "To improve the performance and usability of the software.",
                ],
                note:
                    'We do not share, sell, or disclose your data to third parties under any circumstances.',
              ),
              const SizedBox(
                height: 30,
              ),
              const PrivacyPolicy(
                title: "3. Data Storage",
                subTitles: [
                  "All user data is stored securely in locally on your device.",
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              const PrivacyPolicy(
                title: "4. Data Security",
                description:
                    "We are committed to safeguarding your data and employ the following practices:",
                subTitles: [
                  "Encryption of sensitive data during storage and transmission.",
                  "Regular security audits and updates to prevent unauthorized access.",
                  "Role-based access controls to restrict access to stored data.",
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              const PrivacyPolicy(
                title: "5. Data Sharing",
                description:
                    "We do not share your personal or business data with any third party. The data you enter into the software remains private and is used only as described in this policy.",
                subTitles: [],
              ),
              const SizedBox(
                height: 30,
              ),
              const Text(
                "6. Contact Us",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                  "If you have any questions or concerns about this Privacy Policy, please reach out to us:"),
              GestureDetector(
                  onTap: () {
                    final Uri _emailLaunchUri = Uri(
                        scheme: 'mailto',
                        path: 'agnel.selvan.dev@gmail.com',
                        queryParameters: {
                          'subject': 'Enquiry related to Smart Bill Book'
                        });
                    launch(_emailLaunchUri.toString());
                  },
                  child: const Text("Email: agnel.selvan.dev@gmail.com")),
              const SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy(
      {super.key,
      required this.title,
      this.description,
      required this.subTitles,
      this.note});
  final String title;
  final String? description;
  final List<String> subTitles;
  final String? note;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        if (description != null) ...[
          const SizedBox(
            height: 10,
          ),
          Text(description!),
        ],
        const SizedBox(
          height: 8,
        ),
        ...subTitles.map(
          (e) => Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Row(
              children: [
                Container(
                  width: 5,
                  height: 5,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  width: 6,
                ),
                Expanded(
                  child: Text(
                    e,
                    style: const TextStyle(fontSize: 14),
                  ),
                ),
              ],
            ),
          ),
        ),
        if (note != null) ...[
          const SizedBox(
            height: 10,
          ),
          Text(
            note!,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ],
    );
  }
}
