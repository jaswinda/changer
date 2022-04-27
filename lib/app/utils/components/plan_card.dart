import 'package:changer/app/utils/colors.dart';
import 'package:changer/app/utils/sizes.dart';
import 'package:flutter/material.dart';

class PlanCard extends StatelessWidget {
  final String type;
  final String commission;
  final String minimum;
  final String maximum;
  final Function? onTap;
  const PlanCard(
      {Key? key,
      this.type = "Silver",
      this.minimum = "5",
      this.maximum = "100",
      this.onTap,
      this.commission = "5%"})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap!(),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: AppSizes.percentWidth(2),
          vertical: AppSizes.percentHeight(1),
        ),
        child: Container(
          width: AppSizes.percentWidth(50) - AppSizes.percentWidth(2) * 2,
          decoration: BoxDecoration(
            //gradient colors
            gradient: const LinearGradient(
              colors: [
                Colors.grey,
                Colors.white,
                Colors.grey,
                Colors.grey,
                Colors.white,
                Colors.grey,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),

            borderRadius: BorderRadius.circular(10.0),
            //shadow
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                spreadRadius: 5,
                blurRadius: 5,
                offset: const Offset(3, 3), // changes position of shadow
              ),
            ],
          ),
          child: Column(
            children: [
              SizedBox(
                height: AppSizes.percentHeight(1),
              ),
              CircleAvatar(
                backgroundColor: primaryColor,
                radius: AppSizes.percentWidth(12),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(type,
                        style: TextStyle(
                            color: Colors.amber,
                            fontSize: AppSizes.percentWidth(4))),
                    Text(
                      commission,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: AppSizes.percentWidth(6)),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: const BoxDecoration(
                    color: primaryColor,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        customRow(key: "Minimum", value: minimum),
                        Divider(
                          color: Colors.blue[100],
                        ),
                        customRow(key: "Maximum", value: maximum),
                        Divider(
                          color: Colors.blue[100],
                        ),
                        customRow(key: "Duration", value: "After 24 Hours"),
                        Divider(
                          color: Colors.blue[100],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: AppSizes.percentHeight(1),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget customRow({required String key, required String value}) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppSizes.percentWidth(2)),
      child: Row(
        children: [
          Expanded(
            child: Text(key,
                style: TextStyle(
                  fontSize: AppSizes.percentWidth(2.8),
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                )),
          ),
          Expanded(
            child: Text(value,
                style: TextStyle(
                  fontSize: AppSizes.percentWidth(2.8),
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                )),
          ),
        ],
      ),
    );
  }
}
