import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/cubit_cart_products.dart';
import '../cubit/cubit_isSeeAllProduct.dart';
import '../cubit/cubit_prodect.dart';
import '../cubit/states.dart';
import '../model/shoesProduct.dart';
import '../model/user_model.dart';
import '../resources/core/route_management.dart';
import '../widgets/custom_list_view_home_page.dart';

class HomePage extends StatefulWidget {

  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex=0;


  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      // backgroundColor: Color(0xfff8f9fa),
      resizeToAvoidBottomInset: false,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, RouteName.cartProducts);
          context.read<CubitCartProduct>().products;
        },
        // backgroundColor: Colors.blue,
        elevation: 8.0,
        highlightElevation: 12,
        // splashColor: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(45),
        ),
        child: Icon(Icons.lock_outline, color: Colors.white),
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 18,
            right: 8.0,
            left: 8.0,
            bottom: 8.0,
          ),
          child: Column(
            children: [
              ListTile(
                titleAlignment: ListTileTitleAlignment.center,
                leading: Icon(Icons.pattern),
                title: Text(
                  "Store location",
                  textAlign: TextAlign.center,
                  // style: TextStyle(color: Colors.grey),
                ),
                subtitle: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.location_on_sharp, color: Colors.red),
                    Text(
                      "Mondolibug, Sylhet",
                      style: TextStyle(
                        // color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                trailing: IconButton(
                   onPressed: (){
                     Navigator.pushNamed(context,RouteName.sideMenu);
                   },
                   icon:  Icon(Icons.notification_add)),
                minLeadingWidth: 5.0,
              ),
              SizedBox(height: 10),
              TextFormField(
                decoration: InputDecoration(
                  hintText: "Looking for shoes",
                  prefixIcon: Icon(Icons.search_rounded),
                  // border: OutlineInputBorder(
                  //   borderRadius: BorderRadius.circular(18),
                  //   borderSide: BorderSide(color: Colors.transparent),
                  // ),
                  // enabledBorder: OutlineInputBorder(
                  //   borderRadius: BorderRadius.circular(18),
                  //   borderSide: BorderSide(color: Colors.transparent),
                  // ),
                ),
              ),
              SizedBox(height: 10),
              CustomListViewHomePage(),
              Row(
                children: [
                  Text(
                    "Popular Shoes",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Spacer(),
                  BlocBuilder<SeeAllProduct,IsSeeAllProductState>(
                    builder:(context,state)=>

                        GestureDetector(
                      onTap: () {
                       context.read<SeeAllProduct>().toggleGridView();
                      },
                      child: Text(
                        "see all",
                        style: TextStyle(
                          fontSize: 18,
                          color: Color(0xff5B9EE1),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 5),

              BlocConsumer<ProductsCubit, ProductState>(
                listener: (context, state) {},
                builder: (context, state) {
                  final cubit= context.read<ProductsCubit>();
                  if (state is LoadProductState && cubit.products.isEmpty) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is FailProductState) {
                    return Center(
                      child: Text(
                        "Error: ${state.message}",
                        style: const TextStyle(color: Colors.red),
                      ),
                    );
                  } else if (cubit.products.isNotEmpty) {
                    return
                      BlocBuilder<SeeAllProduct, IsSeeAllProductState>(
                        builder: (context, state) {
                          final cubit = context.read<ProductsCubit>();

                          return Column(
                            children: [
                              GridView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: state.isSeeAllProductGridView
                                    ? cubit.products.length
                                    : (cubit.products.length > 2 ? 2 : cubit.products.length),
                                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 8,
                                  mainAxisSpacing: 8,
                                  childAspectRatio: 3 / 4,
                                ),
                                itemBuilder: (context, index) {
                                  final product = cubit.products[index];
                                  return GestureDetector(
                                    onTap: () {
                                      Navigator.pushNamed(
                                        context,
                                        RouteName.detailsProduct,
                                        arguments: product,
                                      );
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: theme.scaffoldBackgroundColor,
                                        borderRadius: BorderRadius.circular(20),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Theme.of(context).brightness == Brightness.dark
                                          ? Colors.white24
                                          : Colors.black26,
                                            blurRadius: 2,
                                            spreadRadius: 1,
                                            offset: const Offset(-1, 0),
                                          ),
                                        ],
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Image.network(
                                              product.image,
                                              height: 100,
                                              width: double.infinity,
                                              fit: BoxFit.contain,
                                            ),
                                            Text(
                                              product.title,
                                              style: const TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold,
                                                color: Color(0xff5B9EE1),
                                              ),
                                            ),
                                            Text(
                                              product.shortDescription,
                                              style: const TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            const Spacer(),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text(
                                                  "${product.price}\$",
                                                  style: const TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                const Spacer(),
                                                Align(
                                                  alignment: Alignment.bottomRight,
                                                  child: Container(
                                                    decoration: const BoxDecoration(
                                                      color: Color(0xff5B9EE1),
                                                      borderRadius: BorderRadius.only(
                                                        bottomRight: Radius.circular(20),
                                                      ),
                                                    ),
                                                    child: IconButton(
                                                      icon: const Icon(
                                                        Icons.add,
                                                        size: 20,
                                                        color: Colors.white,
                                                      ),
                                                      onPressed: () {
                                                        context
                                                            .read<CubitCartProduct>()
                                                            .addProduct(product);
                                                      },
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),

                              const SizedBox(height: 10),

                              // ✅ New Arrivals
                              Row(
                                children: [
                                  const Text(
                                    "New Arrivals",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const Spacer(),
                                  GestureDetector(
                                    onTap: () {
                                      context.read<SeeAllProduct>().toggleListView();
                                    },
                                    child: const Text(
                                      "see all",
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: Color(0xff5B9EE1),
                                      ),
                                    ),
                                  ),
                                ],
                              ),

                              // ✅ ListView
                              ListView.builder(
                                itemCount:  state.isSeeAllProductListView
                                    ? 5
                                    : 1,
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemBuilder: (context, index) {
                                  final product = cubit.products[index];
                                  return Container(
                                    padding: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color:theme.scaffoldBackgroundColor,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withAlpha(40),
                                          blurRadius: 5,
                                          spreadRadius: 5,
                                          offset: const Offset(-1, 0),
                                        ),
                                      ],
                                    ),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                product.title,
                                                maxLines: 2,
                                                overflow: TextOverflow.ellipsis,
                                                style: const TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold,
                                                  color: Color(0xff5B9EE1),
                                                ),
                                              ),
                                              Text(
                                                product.shortDescription,
                                                maxLines: 2,
                                                overflow: TextOverflow.ellipsis,
                                                style: const TextStyle(fontSize: 15),
                                              ),
                                              Text(
                                                "${product.price}\$",
                                                maxLines: 2,
                                                overflow: TextOverflow.ellipsis,
                                                style: const TextStyle(fontSize: 18),
                                              ),
                                            ],
                                          ),
                                        ),
                                        const SizedBox(width: 8),
                                        Image.network(product.image, height: 120),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ],
                          );
                        },
                      );

                  } else {
                    return const Center(child: Text("No products found"));
                  }
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        // color: Colors.white,
        elevation: 20,
        notchMargin: 8,
        shape: CircularNotchedRectangle(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () {
                setState(() {
                  currentIndex = 0;
                });
              },
              icon: Icon(
                Icons.home_filled,
                color: currentIndex == 0
                    ? theme.bottomNavigationBarTheme.selectedIconTheme?.color
                    : theme.bottomNavigationBarTheme.unselectedIconTheme?.color,
              ),
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  currentIndex = 1;
                });
              },
              icon: Icon(
                Icons.favorite_border,
                color: currentIndex == 1 ?  theme.bottomNavigationBarTheme.selectedIconTheme?.color
                  : theme.bottomNavigationBarTheme.unselectedIconTheme?.color,
              ),
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  currentIndex = 2;
                });
                Navigator.pushNamed(context,  RouteName.cartProducts);
              },
              icon: Icon(
                Icons.notifications_none,
                color: currentIndex == 2  ? theme.bottomNavigationBarTheme.selectedIconTheme?.color
                    : theme.bottomNavigationBarTheme.unselectedIconTheme?.color,
              ),
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  currentIndex = 3;
                });
                Navigator.pushNamed(context, RouteName.profilePage);
              },
              icon: Icon(
                Icons.person_outline,
                color: currentIndex == 3  ? theme.bottomNavigationBarTheme.selectedIconTheme?.color
                    : theme.bottomNavigationBarTheme.unselectedIconTheme?.color,
              ),
            ),
          ],
        ),
      ),


    );
  }
}
