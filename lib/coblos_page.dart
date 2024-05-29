import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CoblosPage extends StatefulWidget {
  @override
  _CoblosPageState createState() => _CoblosPageState();
}

class _CoblosPageState extends State<CoblosPage> {
  late SharedPreferences _prefs;
  bool _isLoggedIn = false;
  List<String> _votedCandidates = [];

  @override
  void initState() {
    super.initState();
    _initSharedPreferences();
  }

  Future<void> _initSharedPreferences() async {
    _prefs = await SharedPreferences.getInstance();
    setState(() {
      _isLoggedIn = _prefs.getBool('isLoggedIn') ?? false;
      _votedCandidates = _prefs.getStringList('votedCandidates') ?? [];
    });
  }

  Future<void> _voteCandidate(String candidate) async {
    if (_isLoggedIn &&
        _votedCandidates.length < 3 &&
        !_votedCandidates.contains(candidate)) {
      _votedCandidates.add(candidate);
      await _prefs.setStringList('votedCandidates', _votedCandidates);
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Success'),
            content: Text('You have successfully voted for $candidate'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    } else if (!_isLoggedIn) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('You need to login/register to vote'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    } else if (_votedCandidates.contains(candidate)) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('You have already voted for $candidate'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    } else if (_votedCandidates.length >= 3) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('You can only vote for 3 candidates'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pemilihan'),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: <Widget>[
          Text('Daftar Para Calon Kandidat:'),
          ElevatedButton(
            onPressed: () => _voteCandidate('Candidate A'),
            child: Text('Anies & Muhaimin'),
          ),
          ElevatedButton(
            onPressed: () => _voteCandidate('Candidate B'),
            child: Text('Prabowo & Gibran'),
          ),
          ElevatedButton(
            onPressed: () => _voteCandidate('Candidate C'),
            child: Text('Ganjar & Mahfud'),
          ),
        ],
      ),
    );
  }
}
