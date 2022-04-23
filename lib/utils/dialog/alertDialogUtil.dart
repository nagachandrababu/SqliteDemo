import 'package:flutter/material.dart';
import 'package:test_demo/utils/common/app_colors.dart';

class AlertDialogUtil {
  static showProgressDialog(BuildContext context) async {
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
          content: Builder(
            builder: (context) {
              // Get available height and width of the build area of this widget. Make a choice depending on the size.
              //var height = MediaQuery.of(context).size.height;
              //var width = MediaQuery.of(context).size.width;
              return SizedBox(
                height: 120,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const CircularProgressIndicator(),
                    const SizedBox(height: 10),
                    Container(
                        margin: const EdgeInsets.only(left: 7),
                        child: const Text("Please Wait...")),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }

  static showAlertDialog(BuildContext context, String title, String text) async {
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: SizedBox(
            height: 200,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 2,
                  child: Center(
                    child: Text(
                      title,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 2),
                Expanded(
                  flex: 2,
                  child: Center(
                    child: Container(
                      margin: const EdgeInsets.only(left: 15, right: 10),
                      child: Text(
                        text,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ),
                const Divider(
                  color: Colors.grey,
                  thickness: 0.4,
                ),
                Expanded(
                  flex: 2,
                  child: Center(
                    child: SizedBox(
                      height: 40,
                      width: 80,
                      child: RaisedButton(
                        // focusColor: Colors.blue,
                        color: colorPrimary,
                        shape: const StadiumBorder(),
                        splashColor: const Color.fromRGBO(224, 105, 131, 1.0),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text(
                          'Ok',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 5),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget showProgressAlertDialog(BuildContext context)  {
    return AlertDialog(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
      ),
      content: Builder(
        builder: (context) {
          // Get available height and width of the build area of this widget. Make a choice depending on the size.
            return SizedBox(
            height: 120,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const CircularProgressIndicator(),
                const SizedBox(height: 10),
                Container(
                    margin: const EdgeInsets.only(left: 7),
                    child: const Text("Please Wait...")),
              ],
            ),
          );
        },
      ),
    );


  }



}
