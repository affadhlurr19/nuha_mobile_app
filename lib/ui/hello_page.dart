import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nuha_mobile_app/common/styles.dart';

class HelloPage extends StatelessWidget {
  static const String routeName = '/hello';

  const HelloPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
            systemOverlayStyle: const SystemUiOverlayStyle(
                statusBarColor: Colors.white,
                statusBarBrightness: Brightness.light,
                statusBarIconBrightness: Brightness.dark),
            toolbarHeight: 0,
            backgroundColor: Colors.white,
            elevation: 0),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Container(
                  margin: const EdgeInsets.only(top: 32, bottom: 22),
                  height: 330,
                  width: 330,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/hello.webp'),
                          fit: BoxFit.cover)),
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
                        "Nuha akan menjadi teman setia dalam mengelola keuanganmu. Mulailah meningkatkan literasi keuanganmu sekarang dan capailah kebebasan finansial.",
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
                            Navigator.pushNamed(context, '/login');
                          },
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30)),
                              backgroundColor: secondaryColor),
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
                        )),
                    SizedBox(
                        width: 200,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/register');
                          },
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30)),
                              backgroundColor: iconColor),
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
                        ))
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
