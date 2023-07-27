import 'package:flutter/material.dart';

class Task1 extends StatelessWidget {
  const Task1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Drawer"),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            const UserAccountsDrawerHeader(
              accountName: Text("Mohammad Zeino"),
              accountEmail: Text("mho.samer147@gmail.com"),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(
                  "https://img.freepik.com/free-photo/man-wearing-waistcoat_1368-2886.jpg?w=740&t=st=1690463983~exp=1690464583~hmac=d560fcb8503a92f7af614e709212a87fe0ca220b3a61b94d3307a38b428fa2ca",
                ),
              ),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    "https://img.freepik.com/free-photo/abstract-textured-backgound_1258-30436.jpg?w=740&t=st=1690464039~exp=1690464639~hmac=13011857c5f34453511de8e9bde35ee37358b8ec70846e62b7e19bee7ae34fa1",
                  ),
                  fit: BoxFit.fill,
                ),
              ),
              otherAccountsPictures: [
                CircleAvatar(
                  backgroundColor: Colors.white,
                  backgroundImage: NetworkImage(
                    "https://img.freepik.com/free-photo/hesitant-puzzled-unshaven-man-shruggs-shoulders-bewilderment-feels-indecisive-has-bristle-trendy-haircut-dressed-blue-stylish-shirt-isolated-white-wall-clueless-male-poses-indoor_273609-16518.jpg?w=740&t=st=1690464108~exp=1690464708~hmac=64330f69ccac2bd1efabad638e8113305b8fa7e62890dee2233bc1d742cb1130",
                  ),
                ),
                CircleAvatar(
                  backgroundColor: Colors.white,
                  backgroundImage: NetworkImage(
                    "https://img.freepik.com/free-photo/young-middle-east-woman-standing-pink-background-with-hand-chin-thinking-about-question-pensive-expression-smiling-thoughtful-face-doubt-concept_839833-4527.jpg?w=740&t=st=1690464137~exp=1690464737~hmac=98631914e15059584a2d441f315732ec4835ef3e1a7a3c2a86f1f02d2f6bc1ce",
                  ),
                ),
              ],
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text("Home"),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.account_box),
              title: const Text("About"),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.grid_3x3_outlined),
              title: const Text("Products"),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.contact_mail),
              title: const Text("Contact"),
              onTap: () {},
            )
          ],
        ),
      ),
    );
  }
}
