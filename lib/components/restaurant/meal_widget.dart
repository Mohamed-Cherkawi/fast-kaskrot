import 'package:fast_kaskrot/models/meal.dart';
import 'package:fast_kaskrot/service/local_storage_service.dart';
import 'package:fast_kaskrot/util/AppColor.dart';
import 'package:flutter/material.dart';

class MealWidget extends StatefulWidget {
  final Meal meal;
  IconData icon = Icons.add;

   MealWidget({
    super.key,
    required this.meal,
  });

  @override
  State<MealWidget> createState() => _MealWidgetState();
}

class _MealWidgetState extends State<MealWidget> {
  final LocalStorageService localStorageService = LocalStorageService();


  @override
  void initState(){
    super.initState();
    checkIfMealIsAlreadyInCart();
  }
  void checkIfMealIsAlreadyInCart() async{
    final List<String>? mealsIdsResponse = await localStorageService.getStringList();
    if(mealsIdsResponse!.contains(widget.meal.id.toString())){
        setState(() {
          widget.icon = Icons.check;
        });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      margin: const EdgeInsets.symmetric(vertical: 15),
      padding: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            margin: const EdgeInsets.only(right: 10),
            width: 100,
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(8)),
                image: DecorationImage(
                    image: AssetImage('assets/images/${widget.meal.imageName}'),
                    fit: BoxFit.cover)),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.meal.title,
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    letterSpacing: 1),
              ),
              Text('Availability : ${widget.meal.availability}'),
              Text(widget.meal.description),
              SizedBox(
                width: 220,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '\$${widget.meal.price.toString()}',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(4),
                      decoration: const BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.all(Radius.circular(8))),
                      child: ( widget.icon == Icons.add )
                          ?
                          InkWell(
                        child:  Icon(widget.icon, color: AppColor.iconColor),
                        onTap: () {
                          showModalBottomSheet(
                              barrierColor: Colors.white.withOpacity(0.4),
                              backgroundColor: AppColor.scaffoldBackColor,
                              context: context,
                              builder: (BuildContext context) {
                                return SizedBox(
                                  height: 120,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          const Text(
                                            'Do You Really Want To Add ',
                                          ),
                                          Text(
                                            widget.meal.title,
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                          const Text(
                                            ' To Your Cart ?',
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          ElevatedButton(
                                              onPressed: () {
                                                  localStorageService.addMealIdToList(widget.meal.id.toString());
                                                  debugPrint("#################################");
                                                  Navigator.pop(context);
                                                  setState(() {
                                                    widget.icon = Icons.check;
                                                  });
                                              },
                                              style: ButtonStyle(
                                                backgroundColor:
                                                    MaterialStateProperty.all<
                                                            Color>(
                                                        Colors.green.shade800),
                                              ),
                                              child: const Text('Confirm')),
                                          ElevatedButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              style: ButtonStyle(
                                                backgroundColor:
                                                    MaterialStateProperty.all<
                                                        Color>(Colors.red),
                                              ),
                                              child: const Text('Close')),
                                        ],
                                      ),
                                    ],
                                  ),
                                );
                              });
                        },)
                          :
                          Icon(widget.icon , color: AppColor.iconColor)
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
