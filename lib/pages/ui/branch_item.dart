import 'package:flutter/material.dart';

import '../../data/data_model.dart';
import 'package:url_launcher/url_launcher.dart' as UrlLauncher;

class BranchItem extends StatelessWidget {
  Function() onTap;
  Branch branch;

  BranchItem(this.onTap, this.branch, {super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Color(0x398b8b8b),
              spreadRadius: 2.0,
              blurRadius: 7.0,
              offset: Offset(0, 0),
            )
          ],
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(16.0),
          ),
        ),
        margin: const EdgeInsets.only(
          left: 16.0,
          right: 16.0,
          top: 8.0,
          bottom: 8.0,
        ),
        child: Container(
          margin: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 2,
                    child: Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(left: 16.0, top: 8.0),
                          alignment: Alignment.centerLeft,
                          child: Text(
                            branch.name,
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 8.0,
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 16.0),
                          alignment: Alignment.centerLeft,
                          child: Text(
                            branch.address,
                            style: const TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 8.0,
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      alignment: Alignment.topRight,
                      margin:
                          const EdgeInsets.only(left: 8.0, right: 16.0, top: 8.0),
                      child: branch.isActive
                          ? Text(
                              "${branch.workHourEnd} gacha ochiq",
                              textAlign: TextAlign.right,
                              style: const TextStyle(
                                color: Colors.green,
                              ),
                            )
                          : Text(
                              "${branch.workHourStart} gacha yopiq",
                              textAlign: TextAlign.right,
                              style: const TextStyle(
                                color: Colors.red,
                              ),
                            ),
                    ),
                  ),
                ],
              ),
              const Divider(indent: 16.0, endIndent: 16.0),
              Container(
                margin: const EdgeInsets.only(
                  left: 16.0,
                  right: 16.0,
                  bottom: 8.0,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          Container(
                            alignment: Alignment.centerLeft,
                            child: const Text(
                              "Ish vaqti:",
                              style: TextStyle(color: Colors.grey),
                            ),
                          ),
                          SizedBox(
                            height: 8.0,
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Du-Yak: ${branch.workHourStart}-${branch.workHourEnd}",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 16.0),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Container(
                            alignment: Alignment.centerRight,
                            child: const Text(
                              "Telefon:",
                              style: TextStyle(color: Colors.grey),
                            ),
                          ),
                          const SizedBox(
                            height: 8.0,
                          ),
                          InkWell(
                            onTap: (){
                              UrlLauncher.launch("tel://${branch.phone}");
                            },
                            child: Container(
                              alignment: Alignment.centerRight,
                              child: Text(
                                "${branch.phone}",
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 16.0,
                                ),
                                textAlign: TextAlign.right,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
