// ignore_for_file: file_names

import 'package:act_management/cat_api_repo.dart';
import 'package:act_management/cat_items_model.dart';
import 'package:act_management/register_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Categories>? categories;
  @override
  void initState() {
    Future.delayed(Duration.zero, () async {
      await catItemsApi();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple.shade100,
        title: const Text("Home"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("Home page loaded successfully, After Registration."),
            Expanded(
              flex: 3,
              child: GridView.builder(
                  itemCount: categories?.length ?? 0,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 2.0,
                      mainAxisSpacing: 6.0),
                  itemBuilder: ((context, index) {
                    return Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey.shade200),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.network(
                            categories?[index].imageUrl ?? 'N/A',
                            height: 120,
                          ),
                          Text(categories?[index].categoryName ?? 'N/A'),
                        ],
                      ),
                    );
                  })),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                    onPressed: () {
                      alertBox("Are you sure, you want to logout?", "Logout");
                    },
                    child: const Text("Logout")),
                ElevatedButton(
                    onPressed: () {
                      alertBox(
                          "Are you sure, you want to delete your account permenantly?",
                          "Delete");
                    },
                    child: const Text("Delete Account")),
              ],
            )
          ],
        ),
      ),
    );
  }

  alertBox(String msg, String buttonText) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Text(msg),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text("Cancel"),
          ),
          TextButton(
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const RegisterScreen()),
                  (route) => false);
            },
            child: Text(buttonText),
          ),
        ],
      ),
    );
  }

  catItemsApi() async {
    final getDetails = await CatRepo().getCategoryItems();
    setState(() {
      categories = getDetails.categories;
    });
  }
}
