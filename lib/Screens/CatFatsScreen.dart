import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CatFactsScreen extends StatefulWidget {
  @override
  _CatFactsScreenState createState() => _CatFactsScreenState();
}

class _CatFactsScreenState extends State<CatFactsScreen> {
  String? _randomFact;

  @override
  void initState() {
    super.initState();
    fetchCatFact();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    fetchCatFact(); // Fetch a new fact whenever the dependencies change
  }

  void fetchCatFact() async {
    try {
      final response = await http.get(Uri.parse('https://catfact.ninja/fact'));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        if (!mounted) return; // Check if the widget is still in the tree
        setState(() {
          _randomFact = data['fact'];
        });
      } else {
        throw Exception('Failed to load cat fact');
      }
    } catch (e) {
      print(e.toString()); // For debugging
      if (!mounted) return; // Check if the widget is still in the tree
      setState(() {
        _randomFact = 'Failed to fetch fact';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cat Fact'),
        backgroundColor: Color(0xFFA0522D),
      ),
      body: _randomFact == null
          ? Center(child: CircularProgressIndicator())
          : Center(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset(
                    'assetFolder/Cat.png',
                    width: MediaQuery.of(context)
                        .size
                        .width, // Set the width to the screen width
                    height: MediaQuery.of(context).size.height *
                        0.90, // Set the height to half the screen height
                    fit: BoxFit.cover,
                  ), // Replace with your image asset path
                  Positioned(
                    left: 150,
                    top: 450,
                    child: Container(
                      width: 130,
                      height: 100,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(
                            0.7), // Optional for better readability
                        borderRadius: BorderRadius.circular(
                            10), // Optional for rounded corners
                      ),
                      child: SingleChildScrollView(
                        // Makes the text scrollable
                        child: Text(
                          _randomFact!,
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                          ),
                          overflow: TextOverflow.fade, // Handles text overflow
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
