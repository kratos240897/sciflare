import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

final mediaQuery = MediaQueryData.fromWindow(WidgetsBinding.instance.window);
final height = mediaQuery.size.height;
final width = mediaQuery.size.width;

SizedBox hSpace(double value) {
  return SizedBox(width: value);
}

SizedBox vSpace(double value) {
  return SizedBox(height: value);
}

hideLoading(BuildContext context) {
    Navigator.pop(context);
  }

showLoading(BuildContext context) {
  showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => AlertDialog(
            insetPadding: EdgeInsets.zero,
            contentPadding: EdgeInsets.zero,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0))),
            content: Builder(
              builder: (context) {
                return SizedBox(
                  height: height * 0.25,
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Loading...',
                          style: Theme.of(context)
                              .textTheme
                              .headline6
                              ?.copyWith(
                                  fontSize: 20.0,
                                  ),
                        ),
                        vSpace(12.0),
                        const CupertinoActivityIndicator(),
                      ],
                    ),
                  ),
                );
              },
            ),
          ));
}

showSnackBar(
    String title, String message, BuildContext context, bool isSucess) async {
  ScaffoldMessenger.of(context).hideCurrentSnackBar();
  final snackBar = SnackBar(
      duration: const Duration(seconds: 5),
      dismissDirection: DismissDirection.horizontal,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      behavior: SnackBarBehavior.floating,
      margin: const EdgeInsets.all(15.0),
      content: SizedBox(
        height: height * 0.080,
        child: Row(children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                decoration: BoxDecoration(
                    color: isSucess ? Colors.green : Colors.red,
                    borderRadius: BorderRadius.circular(5.0)),
                width: 10.0,
              ),
              hSpace(15.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,
                      style: Theme.of(context).textTheme.headline5?.copyWith(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black)),
                  vSpace(5.0),
                  SizedBox(
                    width: width * 0.70,
                    child: Text(message,
                        maxLines: 2,
                        style: Theme.of(context).textTheme.headline5?.copyWith(
                            fontSize: 14.0,
                            overflow: TextOverflow.ellipsis,
                            fontWeight: FontWeight.bold,
                            color: Colors.black)),
                  ),
                ],
              ),
            ],
          ),
          const Spacer(),
          GestureDetector(
            onTap: () => ScaffoldMessenger.of(context).hideCurrentSnackBar(),
            child: const Icon(
              Icons.close,
              color: Colors.black,
            ),
          )
        ]),
      ));
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
