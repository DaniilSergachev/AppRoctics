import 'package:flutter/material.dart';
import 'package:flutter_application_2/pages/list_screen.dart';

class RegisterScreen extends StatefulWidget {
   const RegisterScreen({super.key});

  @override
  RegisterScreenState createState() => RegisterScreenState();
}

class RegisterScreenState extends State<RegisterScreen> {
  bool isObscured = true; // Переменная для хранения состояния скрытия пароля

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
              obscureText: isObscured, // Используем переменную для скрытия пароля
              decoration: InputDecoration(
                hintText: 'Пароль',
                border:const OutlineInputBorder(),
                // Добавляем иконку-переключатель для отображения/скрытия пароля
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      isObscured = !isObscured; // Переключение состояния скрытия пароля
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
              child: const Text('Регистрация'),
            ),
            const SizedBox(height: 10),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Назад'),
            ),
          ],
        ),
      ),
    );
  }
}
