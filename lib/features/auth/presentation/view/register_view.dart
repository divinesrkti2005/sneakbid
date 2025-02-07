import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../view_model/signup/register_bloc.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  final TextEditingController _fnameController = TextEditingController();
  final TextEditingController _lnameController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.deepPurple, Colors.blue],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Form(
              key: _key,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 30),
                  // Back Button
                  Align(
                    alignment: Alignment.centerLeft,
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back, color: Colors.white),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Title
                  const Text(
                    "Create Your Account",
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Join the SneakBid community and start bidding today.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white70,
                    ),
                  ),
                  const SizedBox(height: 40),
                  // Glass-like Card
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        // First Name Field
                        TextFormField(
                          controller: _fnameController,
                          style: const TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            labelText: "First Name",
                            labelStyle: const TextStyle(color: Colors.white70),
                            prefixIcon: const Icon(Icons.person_outline, color: Colors.white),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: const BorderSide(color: Colors.white38),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: const BorderSide(color: Colors.white),
                            ),
                            filled: true,
                            fillColor: Colors.white.withOpacity(0.05),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Enter your first name';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 20),
                        // Last Name Field
                        TextFormField(
                          controller: _lnameController,
                          style: const TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            labelText: "Last Name",
                            labelStyle: const TextStyle(color: Colors.white70),
                            prefixIcon: const Icon(Icons.person_outline, color: Colors.white),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: const BorderSide(color: Colors.white38),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: const BorderSide(color: Colors.white),
                            ),
                            filled: true,
                            fillColor: Colors.white.withOpacity(0.05),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Enter your last name';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 20),
                        // Username Field
                        TextFormField(
                          controller: _usernameController,
                          style: const TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            labelText: "Username",
                            labelStyle: const TextStyle(color: Colors.white70),
                            prefixIcon: const Icon(Icons.person, color: Colors.white),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: const BorderSide(color: Colors.white38),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: const BorderSide(color: Colors.white),
                            ),
                            filled: true,
                            fillColor: Colors.white.withOpacity(0.05),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Enter your username';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 20),
                        // Phone Field
                        TextFormField(
                          controller: _phoneController,
                          style: const TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            labelText: "Phone Number",
                            labelStyle: const TextStyle(color: Colors.white70),
                            prefixIcon: const Icon(Icons.phone, color: Colors.white),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: const BorderSide(color: Colors.white38),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: const BorderSide(color: Colors.white),
                            ),
                            filled: true,
                            fillColor: Colors.white.withOpacity(0.05),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Enter your phone number';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 20),
                        // Password Field
                        TextFormField(
                          controller: _passwordController,
                          obscureText: true,
                          style: const TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            labelText: "Password",
                            labelStyle: const TextStyle(color: Colors.white70),
                            prefixIcon: const Icon(Icons.lock_outline, color: Colors.white),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: const BorderSide(color: Colors.white38),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: const BorderSide(color: Colors.white),
                            ),
                            filled: true,
                            fillColor: Colors.white.withOpacity(0.05),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Enter your password';
                            }
                            if (value.length < 6) {
                              return 'Password must be at least 6 characters';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 20),
                        // Create Account Button
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              if (_key.currentState!.validate()) {
                                context.read<RegisterBloc>().add(
                                      Registercustomer(
                                        context: context,
                                        fName: _fnameController.text,
                                        lName: _lnameController.text,
                                        phone: _phoneController.text,
                                        username: _usernameController.text,
                                        password: _passwordController.text,
                                      ),
                                    );
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              backgroundColor: Colors.transparent,
                              shadowColor: Colors.transparent,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                                side: const BorderSide(color: Colors.white),
                              ),
                            ),
                            child: const Text(
                              "Create Account",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
