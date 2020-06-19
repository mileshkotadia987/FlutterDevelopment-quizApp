import 'package:flutter/material.dart';
import 'package:quizzler/widgets/widgets.dart';

class Result extends StatefulWidget {
  final int correct,incorrect,total;
  Result({@required this.correct,@required this.incorrect,@required this.total});
  @override
  _ResultState createState() => _ResultState();
}

class _ResultState extends State<Result> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("${widget.correct}/${widget.total}"),
              SizedBox(
                height: 8,
              ),
              Text("You answered ${widget.correct} are correctly"
                  "and ${widget.incorrect} answers incorrectly"),
              SizedBox(
                height: 14,
              ),
              GestureDetector(
                onTap: (){
                  Navigator.pop(context);
                },
                child: blueButton(context: context,label: "Go To Home"),),
            ],
          ),
        ),
      ),
    );
  }
}
