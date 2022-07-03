import 'package:flutter/material.dart';
import 'package:resep_makanan/models/recipe.dart';
import 'package:resep_makanan/utils/constants.dart';

class DetailScreenMobile extends StatefulWidget {
  final Recipe recipe;

  const DetailScreenMobile({Key? key, required this.recipe}) : super(key: key);

  @override
  State<DetailScreenMobile> createState() => _DetailScreenMobileState();
}

class _DetailScreenMobileState extends State<DetailScreenMobile> {
  bool isDescription = true, isIngredients = false, isSteps = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 20),
                child: ConstrainedBox(
                    constraints: BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.width * 0.8,
                      maxHeight: MediaQuery.of(context).size.width * 0.5,
                    ),
                    child: Image.asset('images/${widget.recipe.thumbnail}')),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10),
                child: Text(
                  widget.recipe.name,
                  textAlign: TextAlign.center,
                  style: boldTextStyle.merge(
                      const TextStyle(fontSize: 30, fontFamily: 'Arima')),
                ),
              ),
              Text('${widget.recipe.author} | ${widget.recipe.datePublished}\n',
                  textAlign: TextAlign.center),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.alarm),
                      Container(
                          margin: const EdgeInsets.only(left: 5),
                          child: Text(widget.recipe.times))
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(Icons.restaurant),
                      Container(
                          margin: const EdgeInsets.only(left: 5),
                          child: Text(widget.recipe.servings))
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(Icons.poll),
                      Container(
                          margin: const EdgeInsets.only(left: 5),
                          child: Text(widget.recipe.difficulty))
                    ],
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsets.only(top: 10),
                child: Divider(
                  thickness: 2,
                  color: Colors.grey.withOpacity(0.35),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                      onPressed: () {
                        setState(() {
                          isDescription = true;
                          isIngredients = false;
                          isSteps = false;
                        });
                      },
                      icon: Icon(
                        isDescription
                            ? Icons.description_rounded
                            : Icons.description_outlined,
                        color: isDescription ? Colors.black : Colors.grey,
                      )),
                  IconButton(
                      onPressed: () {
                        setState(() {
                          isDescription = false;
                          isIngredients = true;
                          isSteps = false;
                        });
                      },
                      icon: Icon(
                        isIngredients
                            ? Icons.shopping_basket_rounded
                            : Icons.shopping_basket_outlined,
                        color: isIngredients ? Colors.black : Colors.grey,
                      )),
                  IconButton(
                      onPressed: () {
                        setState(() {
                          isDescription = false;
                          isIngredients = false;
                          isSteps = true;
                        });
                      },
                      icon: Icon(
                        isSteps
                            ? Icons.microwave_rounded
                            : Icons.microwave_outlined,
                        color: isSteps ? Colors.black : Colors.grey,
                      ))
                ],
              ),
              Divider(
                thickness: 2,
                color: Colors.grey.withOpacity(0.35),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 7.5),
                child: Center(
                  child: Text(
                    (() {
                      if (isDescription) {
                        return 'Deskripsi';
                      } else if (isIngredients) {
                        return 'Bahan-Bahan';
                      } else if (isSteps) {
                        return 'Langkah-Langkah';
                      } else {
                        return '';
                      }
                    })(),
                    style: boldTextStyle.copyWith(fontSize: 22.5),
                  ),
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.only(
                          left: 10, right: 10, bottom: 10),
                      child: Text(
                        (() {
                          if (isDescription) {
                            return widget.recipe.description;
                          } else if (isIngredients) {
                            String ingredients = '';

                            widget.recipe.ingredients
                                .asMap()
                                .forEach((index, element) {
                              ingredients +=
                                  '${index + 1}. $element${index + 1 != widget.recipe.ingredients.length ? '\n' : ''}';
                            });

                            return ingredients;
                          } else if (isSteps) {
                            String steps = '';

                            widget.recipe.steps
                                .asMap()
                                .forEach((index, element) {
                              steps +=
                                  '${index + 1}. $element${index + 1 != widget.recipe.steps.length ? '\n' : ''}';
                            });

                            return steps;
                          } else {
                            return '';
                          }
                        })(),
                        style: const TextStyle(height: 1.5),
                        textAlign: TextAlign.justify,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
