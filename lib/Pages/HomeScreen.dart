import 'package:flutter/material.dart';
import 'package:food_yum/data_source/all_data_source.dart';
import 'package:food_yum/models/model_home.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(toolbarHeight: 0, backgroundColor: Color(0xffE5E5E9)),
      backgroundColor: const Color(0xffE5E5E9),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const header(),
            const SizedBox(
              height: 10,
            ),
            const Text("Category",
                style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(
              height: 5,
            ),
            firstGrid(),
            const SizedBox(
              height: 10,
            ),
            const mainFoodItems()
          ],
        ),
      ),
    );
  }
}

class header extends StatelessWidget {
  const header({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          " Hi, What are we\n eating today? ",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        Image.asset(
          "assets/user_photo.png",
          height: 40,
        ),
      ],
    );
  }
}

class firstGrid extends StatelessWidget {
  firstGrid({super.key});

  List<catagry_model>? allcata = all_data_source().loaddata();

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      //scrollDirection: Axis.horizontal,
      itemCount: allcata?.length,
      itemBuilder: (context, index) {
        return Container(
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(10))),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Image.asset(allcata![index].img, height: 40),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: FittedBox(
                  child: Text(
                allcata![index].cataname,
                style: const TextStyle(fontWeight: FontWeight.bold),
              )),
            )
          ]),
        );
      },
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          crossAxisSpacing: 15,
          mainAxisSpacing: 10,
          mainAxisExtent: 95),
    );
  }
}

class mainFoodItems extends StatelessWidget {
  const mainFoodItems({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Sweets Foods (${all_data_source.allfooditems.length} items)",
            style: TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(
          height: 10,
        ),
        GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          itemCount: all_data_source.allfooditems.length,
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, mainAxisSpacing: 5, crossAxisSpacing: 15),
          itemBuilder: (context, index) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                        all_data_source.allfooditems[index]['img'])),
                const SizedBox(
                  height: 5,
                ),
                Text(all_data_source.allfooditems[index]['name'],
                    style: const TextStyle(fontWeight: FontWeight.bold)),
                Text(
                  all_data_source.allfooditems[index]['price'],
                  style: const TextStyle(color: Color(0xff97989F)),
                )
              ],
            );
          },
        ),
      ],
    );
  }
}
