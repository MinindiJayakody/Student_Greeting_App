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
          seedColor: const Color(0xFF7C3AED), 
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
  
class _GreetingPageState extends State<GreetingPage> 
    with SingleTickerProviderStateMixin { 
  final TextEditingController nameController = TextEditingController(); 
  late AnimationController _animationController; 
  late Animation<double> _fadeAnimation; 
  
  String message = 'Please enter your name.'; 
  bool _showMessage = false; 
  
  @override 
  void initState() { 
    super.initState(); 
    _animationController = AnimationController( 
      duration: const Duration(milliseconds: 800), 
      vsync: this, 
    ); 
    _fadeAnimation = Tween<double>(begin: 0, end: 1).animate( 
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut), 
    ); 
  } 
  
  void showGreeting() { 
    String studentName = nameController.text.trim(); 
  
    setState(() { 
      if (studentName.isEmpty) { 
        message = 'Please enter your name.'; 
      } else { 
        message = 'Welcome, $studentName!'; 
      } 
      _showMessage = true; 
    }); 
    _animationController.forward(from: 0); 
  } 
  
  void resetApp() { 
    setState(() { 
      nameController.clear(); 
      message = 'Please enter your name.'; 
      _showMessage = false; 
    }); 
    _animationController.reset(); 
  } 
  
  @override 
  void dispose() { 
    nameController.dispose(); 
    _animationController.dispose(); 
    super.dispose(); 
  } 
  
  @override 
  Widget build(BuildContext context) { 
    return Scaffold( 
      appBar: AppBar( 
        title: const Text('Student Greeting App', 
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24), 
        ), 
        centerTitle: true, 
        elevation: 0, 
        flexibleSpace: Container( 
          decoration: const BoxDecoration( 
            gradient: LinearGradient( 
              colors: [Color(0xFF7C3AED), Color(0xFF3B82F6)], 
              begin: Alignment.topLeft, 
              end: Alignment.bottomRight, 
            ), 
          ), 
        ), 
      ), 
      body: Container( 
        decoration: const BoxDecoration( 
          gradient: LinearGradient( 
            colors: [Color(0xFFF3E8FF), Color(0xFFE0E7FF)], 
            begin: Alignment.topCenter, 
            end: Alignment.bottomCenter, 
          ), 
        ), 
        child: SingleChildScrollView( 
          child: Padding( 
            padding: const EdgeInsets.all(20), 
            child: Column( 
              mainAxisAlignment: MainAxisAlignment.center, 
              children: [ 
                const SizedBox(height: 30), 
                
                Container( 
                  decoration: BoxDecoration( 
                    shape: BoxShape.circle, 
                    gradient: const LinearGradient( 
                      colors: [Color(0xFF7C3AED), Color(0xFF3B82F6)], 
                      begin: Alignment.topLeft, 
                      end: Alignment.bottomRight, 
                    ), 
                    boxShadow: [ 
                      BoxShadow( 
                        color: const Color(0xFF7C3AED).withOpacity(0.4), 
                        blurRadius: 20, 
                        spreadRadius: 5, 
                      ), 
                    ], 
                  ), 
                  padding: const EdgeInsets.all(15), 
                  child: const Icon( 
                    Icons.school, 
                    size: 90, 
                    color: Colors.white, 
                  ), 
                ), 
  
                const SizedBox(height: 30), 
  
                ShaderMask( 
                  shaderCallback: (bounds) => const LinearGradient( 
                    colors: [Color(0xFF7C3AED), Color(0xFF3B82F6)], 
                    begin: Alignment.topLeft, 
                    end: Alignment.bottomRight, 
                  ).createShader(bounds), 
                  child: const Text( 
                    'Welcome to Flutter', 
                    style: TextStyle( 
                      fontSize: 32, 
                      fontWeight: FontWeight.bold, 
                      color: Colors.white, 
                    ), 
                  ), 
                ), 
  
                const SizedBox(height: 35), 
  
                Card( 
                  elevation: 8, 
                  shadowColor: const Color(0xFF7C3AED).withOpacity(0.3), 
                  shape: RoundedRectangleBorder( 
                    borderRadius: BorderRadius.circular(15), 
                  ), 
                  child: Padding( 
                    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5), 
                    child: TextField( 
                      controller: nameController, 
                      style: const TextStyle(fontSize: 16), 
                      decoration: InputDecoration( 
                        labelText: 'Student Name', 
                        hintText: 'Enter your name', 
                        hintStyle: TextStyle( 
                          color: Colors.grey[400], 
                        ), 
                        labelStyle: const TextStyle( 
                          color: Color(0xFF7C3AED), 
                          fontWeight: FontWeight.w600, 
                        ), 
                        border: InputBorder.none, 
                        prefixIcon: const Icon( 
                          Icons.person, 
                          color: Color(0xFF7C3AED), 
                        ), 
                      ), 
                    ), 
                  ), 
                ), 
  
                const SizedBox(height: 25), 
  
                SizedBox( 
                  width: double.infinity, 
                  height: 55, 
                  child: ElevatedButton( 
                    onPressed: showGreeting, 
                    style: ElevatedButton.styleFrom( 
                      gradient: const LinearGradient( 
                        colors: [Color(0xFF7C3AED), Color(0xFF3B82F6)], 
                        begin: Alignment.topLeft, 
                        end: Alignment.bottomRight, 
                      ), 
                      shape: RoundedRectangleBorder( 
                        borderRadius: BorderRadius.circular(12), 
                      ), 
                      elevation: 5, 
                      shadowColor: const Color(0xFF7C3AED).withOpacity(0.4), 
                    ), 
                    child: const Row( 
                      mainAxisAlignment: MainAxisAlignment.center, 
                      children: [ 
                        Icon(Icons.check_circle, color: Colors.white), 
                        SizedBox(width: 10), 
                        Text( 
                          'Show Greeting', 
                          style: TextStyle( 
                            fontSize: 18, 
                            fontWeight: FontWeight.bold, 
                            color: Colors.white, 
                          ), 
                        ), 
                      ], 
                    ), 
                  ), 
                ), 
  
                const SizedBox(height: 12), 
  
                SizedBox( 
                  width: double.infinity, 
                  height: 55, 
                  child: OutlinedButton( 
                    onPressed: resetApp, 
                    style: OutlinedButton.styleFrom( 
                      side: const BorderSide( 
                        color: Color(0xFF7C3AED), 
                        width: 2, 
                      ), 
                      shape: RoundedRectangleBorder( 
                        borderRadius: BorderRadius.circular(12), 
                      ), 
                    ), 
                    child: const Row( 
                      mainAxisAlignment: MainAxisAlignment.center, 
                      children: [ 
                        Icon( 
                          Icons.refresh, 
                          color: Color(0xFF7C3AED), 
                        ), 
                        SizedBox(width: 10), 
                        Text( 
                          'Reset', 
                          style: TextStyle( 
                            fontSize: 18, 
                            fontWeight: FontWeight.bold, 
                            color: Color(0xFF7C3AED), 
                          ), 
                        ), 
                      ], 
                    ), 
                  ), 
                ), 
  
                const SizedBox(height: 40), 
  
                if (_showMessage) 
                  FadeTransition( 
                    opacity: _fadeAnimation, 
                    child: ScaleTransition( 
                      scale: Tween<double>(begin: 0.8, end: 1).animate( 
                        CurvedAnimation(parent: _animationController, curve: Curves.easeOut), 
                      ), 
                      child: Card( 
                        elevation: 10, 
                        shadowColor: const Color(0xFF3B82F6).withOpacity(0.4), 
                        shape: RoundedRectangleBorder( 
                          borderRadius: BorderRadius.circular(15), 
                        ), 
                        child: Container( 
                          decoration: BoxDecoration( 
                            gradient: const LinearGradient( 
                              colors: [Color(0xFF3B82F6), Color(0xFF0EA5E9)], 
                              begin: Alignment.topLeft, 
                              end: Alignment.bottomRight, 
                            ), 
                            borderRadius: BorderRadius.circular(15), 
                          ), 
                          padding: const EdgeInsets.symmetric( 
                            horizontal: 20, 
                            vertical: 25, 
                          ), 
                          child: Text( 
                            message, 
                            textAlign: TextAlign.center, 
                            style: const TextStyle( 
                              fontSize: 24, 
                              fontWeight: FontWeight.bold, 
                              color: Colors.white, 
                            ), 
                          ), 
                        ), 
                      ), 
                    ), 
                  ), 
  
                const SizedBox(height: 30), 
              ], 
            ), 
          ), 
        ), 
      ), 
    ); 
  } 
}