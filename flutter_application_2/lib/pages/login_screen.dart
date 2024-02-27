import 'package:flutter/material.dart';
import 'package:flutter_application_2/pages/list_screen.dart';
import 'package:flutter_application_2/pages/register_screen.dart';

class LoginScreen   extends StatefulWidget{
  const LoginScreen({super.key});
@override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  bool  isObscured = true; 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:const Color.fromARGB(255, 182, 2, 2),
        title: const  Text('Rostic\'s', style: TextStyle(color: Colors.white),), centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const TextField(
              decoration: InputDecoration(
                hintText: 'Логин',
                border:  OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              obscureText: isObscured, 
              decoration: InputDecoration(
                hintText: 'Пароль',
                border:const OutlineInputBorder(),
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      isObscured = !isObscured; 
                    });
                  },
                  icon: Icon(isObscured ? Icons.visibility : Icons.visibility_off),
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ListScreen()),
                );
              },
              child:const  Text('Вход'),
            ),
            const SizedBox(height: 10),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>const  RegisterScreen()),
                );
              },
              child:const Text('Регистрация'),
            ),
          ],
        ),
      ),
    );
  }
}