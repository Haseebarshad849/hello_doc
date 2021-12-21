import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';

// Provider
import '../providers/categoryProvider.dart';


class CategoryGrid extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final categoriesPro =Provider.of<CategoryProvider>(context);
    // final products = showFav ? productsData.favoritesProducts: productsData.items;

    return GridView.builder(
      shrinkWrap: true,
      physics: ScrollPhysics(),
      itemCount: categoriesPro.categories.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        childAspectRatio: 0.65,
        crossAxisCount: 4,
        crossAxisSpacing: 3,
        mainAxisSpacing: 3,
      ),
      itemBuilder: (ctx, i) => Card(
        elevation: 4,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(categoriesPro.categories[i].image,)
                )
              ),
                height: MediaQuery.of(context).size.height/10,
                // child: Image.asset(categoriesPro.categories[i].image,fit: BoxFit.cover,),
            ),
            Container(
              padding: EdgeInsets.all(2),
                child: AutoSizeText(
                    categoriesPro.categories[i].title,
                  style: Theme.of(context).textTheme.bodyText1,
                  maxFontSize: 12,
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  softWrap: true,
                ),
            ),
          ],
        ),
      ),
    );
  }
}