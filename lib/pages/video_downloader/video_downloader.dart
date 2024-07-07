import 'package:flutter/material.dart';

class VideoDownloaderScreen extends StatelessWidget {
  const VideoDownloaderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Privacy Policy",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              ...[
                "This Privacy Policy describes Our policies and procedures on the collection, use and disclosure of Your information when You use the Service and tells You about Your privacy rights and how the law protects You."
              ].map(
                (e) => Text(e),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Information from Third-Party Social Media Services",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                  "The Company allows You to create an account and log in to use the Service through the following Third-party Social Media Services:"),
              const SizedBox(
                height: 8,
              ),
              ...["Google", "Facebook"].map(
                (e) => Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Text(
                    e,
                    style: const TextStyle(fontSize: 14),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              ...[
                "If You decide to register through or otherwise grant us access to a Third-Party Social Media Service, We may collect Personal data that is already associated with Your Third-Party Social Media Service's account, such as Your name, Your email address, Your activities or Your contact list associated with that account.",
                "You may also have the option of sharing additional information with the Company through Your Third-Party Social Media Service's account. If You choose to provide such information and Personal Data, during registration or otherwise, You are giving the Company permission to use, share, and store it in a manner consistent with this Privacy Policy.",
                "We may process the account data you provide by using the app and create it through your account only for the purposes of login or registration, third-party services, such as Apple ID, Google account and Facebook account.",
                "Except as provided in this privacy policy, we will not transfer any of your personal data to third parties."
              ].map((e) => Column(
                    children: [
                      Text(e),
                      const SizedBox(
                        height: 4,
                      )
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
