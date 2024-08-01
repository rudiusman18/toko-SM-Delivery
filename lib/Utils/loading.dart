import 'package:flutter/material.dart';
import 'package:toko_sm_delivery/Utils/theme.dart';

class Loading extends StatelessWidget {
  const Loading({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black.withAlpha(99),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(30),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircularProgressIndicator(
                color: green,
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                "Loading...",
                style: urbanist,
              )
            ],
          ),
        ),
      ),
    );
  }
}
