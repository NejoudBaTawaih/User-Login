import 'package:flutter/material.dart';
import 'User.dart'; //call properties of class User

void main() {
  runApp(const HomePage());
}

Map<String, User> users = {
  "Nejoud123@hotmail.com":
      User(email: 'Nejoud123@hotmail.com', password: '123321'),
  "s3oud123@hotmail.com":
      User(email: 's3oud123@hotmail.com', password: '123321'),
};

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isSecured = true;
  //t is used to read the current value, set the value, and listen for changes to the text field.

  TextEditingController emailController = TextEditingController();
  TextEditingController paswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 4, 49, 128),
          title: const Text(
            'Login Screen',
            style: TextStyle(color: Colors.white, fontSize: 30),
          ),
          centerTitle: true,
        ),
        // To add background image and add more items inside others
        body: /* Stack(
          //children: [
          Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                 image: AssetImage('assets/'),
                 fit: BoxFit.cover, // Adjust the fit as needed
                ),
              ),
            ),*/

            // Used to add a movable view and use Column to display it vertically
            SingleChildScrollView(
          child: Column(
            children: [
              Image.asset('images/ima_2.png', height: 250, width: 250),
              const SizedBox(height: 180),
              // Add space inside border
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    // Enter email or ID
                    TextFormField(
                      controller: emailController,
                      decoration: const InputDecoration(
                        label: Text("Enter Student ID"),
                        prefixIcon: Icon(Icons.person), //left icons
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 15),
                    // Password
                    TextFormField(
                      controller: paswordController,
                      obscureText: isSecured,
                      decoration: InputDecoration(
                        label: const Text("Enter password"),
                        prefixIcon: const Icon(Icons.lock),
                        suffixIcon: IconButton(
                          icon: Icon(isSecured
                              ? Icons.remove_red_eye
                              : Icons.visibility_off),
                          onPressed: () {
                            setState(() {
                              isSecured = !isSecured;
                            });
                          },
                        ),
                        border: const OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 15),

                    // Allow user to interact with input email and password
                    InkWell(
                      onTap: () {
                        String email = emailController.text;
                        String password = paswordController.text;

                        if (users.containsKey(email) &&
                            password == users[email]!.password) {
                          //and not null
                          print('Loggin');
                        } else {
                          print('worng login');
                        }
                      },
                      // Class
                      child: Container(
                        // Child to add only one widget
                        padding: const EdgeInsets.all(25),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: const Color.fromARGB(255, 4, 66, 118),
                        ),
                        // To add two items together at the same time, use Row
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // Take more items
                            Icon(
                              Icons.login,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Log in",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        // ],
        // ),
      ),
    );
  }
}
