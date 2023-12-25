import 'package:flutter/material.dart';
import 'second_screen.dart';

class FirstScreen extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController sentenceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text('First Screen'),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Stack(
        children: [
          Image.asset(
            'assets/background.png',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 113,
                  width: 113,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    image: DecorationImage(
                      image: AssetImage('assets/ic_photo.jpg'),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                SizedBox(height: 50),
                Container(
                  width: 310,
                  height: 41,
                  child: TextFormField(
                    controller: nameController,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(),
                      ),
                      labelText: 'Name',
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  width: 310,
                  height: 41,
                  child: TextFormField(
                    controller: sentenceController,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(),
                      ),
                      labelText: 'Polindrome',
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),
                ),
                SizedBox(height: 40),
                Container(
                  width: 310,
                  height: 47,
                  child: ElevatedButton(
                    onPressed: () {
                      bool isPalindrome =
                          checkPalindrome(sentenceController.text);
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text('Palindrome Check'),
                          content: Text(
                              isPalindrome ? 'Palindrome' : 'Not Palindrome'),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: Text('OK'),
                            ),
                          ],
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      backgroundColor: Color(0xFF2B637B),
                    ),
                    child: Text('Check'),
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  width: 310,
                  height: 47,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SecondScreen(
                            name: nameController.text,
                          ),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      backgroundColor: Color(0xFF2B637B),
                    ),
                    child: Text('Next'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  bool checkPalindrome(String text) {
    String reversedText = text.split('').reversed.join('');
    return text == reversedText;
  }
}
