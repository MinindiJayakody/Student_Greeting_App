import 'package:flutter/material.dart'; 
void main() { 
runApp(const StudentGreetingApp()); 
} 
class StudentGreetingApp extends StatelessWidget { 
const StudentGreetingApp({super.key}); 
  @override 
  Widget build(BuildContext context) { 
    return MaterialApp( 
      debugShowCheckedModeBanner: false, 
      title: 'Student Greeting App', 
      theme: ThemeData( 
        colorScheme: ColorScheme.fromSeed( 
          seedColor: Colors.blue, 
        ), 
        useMaterial3: true, 
      ), 
      home: const GreetingPage(), 
    ); 
  } 
} 
  
class GreetingPage extends StatefulWidget { 
  const GreetingPage({super.key}); 
  
  @override 
  State<GreetingPage> createState() => _GreetingPageState(); 
} 
  
class _GreetingPageState extends State<GreetingPage> { 
  final TextEditingController nameController = TextEditingController(); 
  
  String message = 'Please enter your name.'; 
  
  void showGreeting() { 
    String studentName = nameController.text.trim(); 
  
    setState(() { 
      if (studentName.isEmpty) { 
        message = 'Please enter your name.'; 
      } else { 
        message = 'Welcome, $studentName!'; 
      } 
    }); 
  } 
  
  void resetApp() { 
    setState(() { 
      nameController.clear(); 
      message = 'Please enter your name.'; 
    }); 
  } 
  
  @override 
  void dispose() { 
    nameController.dispose(); 
    super.dispose(); 
  } 
  
  @override 
  Widget build(BuildContext context) { 
    return Scaffold( 
      appBar: AppBar( 
        title: const Text('Student Greeting App'), 
        centerTitle: true, 
      ), 
      body: Padding( 
        padding: const EdgeInsets.all(20), 
        child: Column( 
          mainAxisAlignment: MainAxisAlignment.center, 
          children: [ 
            const Icon(
                  Icons.school, 
              size: 90, 
              color: Colors.blue, 
            ), 
  
            const SizedBox(height: 20), 
  
            const Text( 
              'Welcome to Flutter', 
              style: TextStyle( 
                fontSize: 26, 
                fontWeight: FontWeight.bold, 
              ), 
            ), 
  
            const SizedBox(height: 25), 
  
            TextField( 
              controller: nameController, 
              decoration: const InputDecoration( 
                labelText: 'Student Name', 
                hintText: 'Enter your name', 
                border: OutlineInputBorder(), 
                prefixIcon: Icon(Icons.person), 
              ), 
            ), 
  
            const SizedBox(height: 20), 
  
            SizedBox( 
              width: double.infinity, 
              child: ElevatedButton( 
                onPressed: showGreeting, 
                child: const Text('Show Greeting'), 
              ), 
            ), 
  
            const SizedBox(height: 10), 
  
            SizedBox( 
              width: double.infinity, 
              child: OutlinedButton( 
                onPressed: resetApp, 
                child: const Text('Reset'), 
              ), 
            ), 
  
            const SizedBox(height: 30), 
  
            Text( 
              message, 
              textAlign: TextAlign.center, 
              style: const TextStyle( 
                fontSize: 22, 
                fontWeight: FontWeight.w500, 
              ), 
            ), 
          ], 
        ), 
      ), 
    ); 
  } 
}