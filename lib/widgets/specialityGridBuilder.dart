import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Provider
import 'package:oladoc/providers/specialityProvider.dart';

class SpecialityGrid extends StatelessWidget {
  final int itemCount;

  SpecialityGrid({@required this.itemCount});

  @override
  Widget build(BuildContext context) {
    final specialititesPro = Provider.of<SpecialityProvider>(context);

    return GridView.builder(
      shrinkWrap: true,
      physics: ScrollPhysics(),
      itemCount: itemCount,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        childAspectRatio: 0.95,
        crossAxisCount: 3,
        crossAxisSpacing: 3,
        mainAxisSpacing: 3,
      ),
      itemBuilder: (ctx, i) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: CircleAvatar(
              maxRadius: 35,
              backgroundImage: AssetImage(
                specialititesPro.specialities[i].image,
              ),
            ),
          ),
          Container(
            // color: Colors.cyan,
            padding: EdgeInsets.all(2),
            child: AutoSizeText(
              specialititesPro.specialities[i].title,
              style: Theme.of(context).textTheme.bodyText1.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
              textAlign: TextAlign.center,
              maxLines: 2,
            ),
          ),
        ],
      ),
    );
  }
}
