import 'package:flutter/material.dart';
import 'package:nuha_mobile_app/common/styles.dart';

class HelloPage extends StatelessWidget {
  const HelloPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(children: [
        Center(
          child: Container(
            margin: const EdgeInsets.only(top: 92, bottom: 22),
            height: 330,
            width: 330,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('images/hello.webp'), fit: BoxFit.cover)),
          ),
        ),
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text("Hello", style: Theme.of(context).textTheme.headline5),
              Container(
                margin: const EdgeInsets.fromLTRB(71, 10, 71, 0),
                child: Text(
                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                  style: Theme.of(context).textTheme.bodyText2,
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                  margin: const EdgeInsets.only(bottom: 26, top: 74),
                  width: 200,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/sign-in');
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Sign In',
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2!
                              .copyWith(color: Colors.white),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        const Icon(
                          Icons.arrow_forward_outlined,
                          color: Colors.white,
                          size: 14.0,
                        )
                      ],
                    ),
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                        backgroundColor: secondaryColor),
                  )),
              Container(
                  width: 200,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/sign-up');
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Sign Up',
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2!
                              .copyWith(color: Colors.black),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        const Icon(
                          Icons.arrow_forward_outlined,
                          color: Colors.black,
                          size: 14.0,
                        )
                      ],
                    ),
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                        backgroundColor: iconColor),
                  ))
            ],
          ),
        )
      ]),
    );
  }
}
