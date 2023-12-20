import 'package:flutter/material.dart';
import 'package:nomnom/src/models/food_model.dart';
import 'package:nomnom/src/screens/foods/components/food_item.dart';

class MostPopularSection extends StatefulWidget {
  const MostPopularSection({super.key});

  @override
  State<MostPopularSection> createState() => _MostPopularSectionState();
}

class _MostPopularSectionState extends State<MostPopularSection> {
  List<FoodModel> foods = [
    const FoodModel(
      plateImageUrl: 'assets/foods/1.png',
      title: 'Garlic Aioli Chicken Wings + Glazed Yams',
      description:
          'Indulge in a tantalizing fusion of flavors with the Garlic Aioli Chicken Wings + Glazed Yams, a culinary masterpiece that marries the bold essence of savory chicken wings with the sweet and tender allure of glazed yams. The chicken wings, flawlessly cooked to achieve a crispy exterior and succulent interior, are generously coated in a luscious garlic aioli. The aioli, with its creamy texture and robust garlic undertones, elevates the wings to a new level of gastronomic delight. Paired alongside are the glazed yams, bathed in a delectable caramelized coating that strikes the perfect balance between sweetness and warmth. The contrast between the savory, garlicky chicken wings and the sweet, caramelized yams creates a harmonious dance of flavors that captivates the taste buds. This dish is a symphony of textures and tastes, showcasing the artistry of culinary craftsmanship and making Garlic Aioli Chicken Wings + Glazed Yams an irresistible choice for those seeking a truly satisfying and memorable dining experience.',
      price: 12.99,
      rate: 4.5,
    ),
    const FoodModel(
      plateImageUrl: 'assets/foods/2.png',
      title: 'Cooked Meat and Sauce Platter',
      description:
          'A sumptuous feast for the senses, the Cooked Meat and Sauce Platter is a culinary masterpiece that tantalizes taste buds and satisfies cravings with its rich and savory combination. This delectable platter showcases expertly cooked meats, ranging from succulent roasted chicken and tender beef cuts to flavorful grilled sausages, each infused with a symphony of herbs and spices that elevate the dining experience. What truly sets this dish apart is the accompanying array of sauces that add a burst of flavor and depth to every bite. From zesty chimichurri to velvety mushroom gravy, the sauces not only complement the meats but also offer a delightful contrast, creating a harmonious symphony of tastes. The Cooked Meat and Sauce Platter is a celebration of culinary craftsmanship, inviting diners to savor the artistry and indulge in a truly satisfying gastronomic adventure.',
      price: 13.99,
      rate: 3.5,
    ),
    const FoodModel(
      plateImageUrl: 'assets/foods/3.png',
      title: 'Healthy Salmon + Veggies + Quinoa dish',
      description:
          'Embark on a journey of wellness with the Healthy Salmon + Veggies + Quinoa dish, a vibrant and nourishing ensemble that epitomizes the marriage of flavor and nutrition. At the heart of this culinary creation is the impeccably cooked salmon, its flaky texture and rich omega-3 fatty acids providing a healthful foundation. Paired with a colorful medley of fresh, crisp vegetables such as vibrant bell peppers, nutrient-packed spinach, and earthy cherry tomatoes, the dish bursts with vitamins and antioxidants. The inclusion of quinoa, a protein-packed whole grain, adds a wholesome and hearty element, creating a well-balanced meal that sustains and energizes. The symphony of flavors is further enhanced by a light drizzle of lemon vinaigrette, imparting a citrusy brightness that ties the elements together. This Healthy Salmon + Veggies + Quinoa dish not only satiates the palate but also exemplifies a commitment to well-being, making it a delightful choice for those seeking a delicious and nutritious dining experience.',
      price: 10.99,
      rate: 2.5,
    ),
  ];

  PageController? controller;

  double currentPage = 0;

  @override
  void initState() {
    controller = PageController(
      initialPage: 0,
      viewportFraction: 0.55,
    );
    controller!.addListener(() {
      setState(() {
        currentPage = controller!.page!;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 32,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Most',
                style: TextStyle(
                  color: Color(0xFF4F4D4E),
                  fontSize: 32,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                'Popular Food',
                style: TextStyle(
                  color: Color(0xFF4F4D4E),
                  fontSize: 32,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        _buildItems(context),
        const SizedBox(
          height: 16,
        ),
      ],
    );
  }

  _buildItems(BuildContext context) {
    return Expanded(
      child: PageView(
        controller: controller,
        scrollDirection: Axis.horizontal,
        children: foods.map((food) {
          double distance = 0;
          distance = (foods.indexOf(food) - currentPage).abs();
          double centerness = 0;

          if (distance <= 1) {
            centerness = (1 - distance).abs();
          }

          return Transform.translate(
            offset: Offset(-((MediaQuery.sizeOf(context).width / 2 - 50) / 2 - 16), 0),
            child: FoodItem(
              food: food,
              centerness: centerness,
              color: foods.indexOf(food).isEven ? const Color(0xFF4A7E83) : const Color(0xFFFF8E20),
            ),
          );
        }).toList(),
      ),
    );
  }
}
