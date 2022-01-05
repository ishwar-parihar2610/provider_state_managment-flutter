import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_state_managment/provider/eligibility_screen_provider.dart';

class HomePage extends StatelessWidget {
  final ageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<EligibilityScreenProvider>(
      create: (context) => EligibilityScreenProvider(),
      child: Builder(
        builder: (context) {
          return Scaffold(
            appBar: AppBar(
              title: const Text("Provider"),
            ),
            body: Center(
              child: Consumer<EligibilityScreenProvider>(
                  builder: (context, provider, child) {
                return Container(
                  padding: EdgeInsets.all(30),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: (provider.isEligible)
                                ? Colors.orangeAccent
                                
                                    : Colors.red
                                   ),
                        height: 50,
                        width: 50,
                      ),
                      SizedBox(height: 16),
                      TextFormField(
                        controller: ageController,
                        decoration: InputDecoration(
                            hintText: "Give Your age",
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                    color: Colors.black, width: 2)),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                    color: Colors.black, width: 2))),
                      ),
                      SizedBox(height: 16),
                      Container(
                        height: 50,
                        width: double.infinity,
                        child: ElevatedButton(
                            onPressed: () {
                              final int age =
                                  int.parse(ageController.text.trim());
                              provider.checkEligibilty(age);
                            },
                            child: const Text(
                              "Check",
                              style: TextStyle(color: Colors.white),
                            )),
                      ),
                      SizedBox(height: 16),
                      Text(provider.eligibilityMessage),
                    ],
                  ),
                );
              }),
            ),
          );
        },
      ),
    );
  }
}
