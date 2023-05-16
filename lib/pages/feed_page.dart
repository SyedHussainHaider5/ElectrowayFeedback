import "package:feedback_module/widgets/post.dart";
import "package:flutter/material.dart";

class feed_Page extends StatelessWidget {
  const feed_Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("All Posts"),
      ),
      body: ListView(
        children: [
          post(
              username: "Syed Hussain Haider Bukhari",
              email: "syedhussainhaider5@gmail,com",
              text:
                  "It is a long established fact that a reader will be ribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like)."),
          SizedBox(
            height: 10,
          ),
          post(
              username: "Syed Hussain Haider Bukhari",
              email: "syedhussainhaider5@gmail,com",
              text:
                  "It is a long established fact that a reader will be ribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like)"),
          post(
              username: "Syed Hussain Haider Bukhari",
              email: "syedhussainhaider5@gmail,com",
              text:
                  "It is a long established fact that a reader will be ribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like)."),
          post(
              username: "Syed Hussain Haider Bukhari",
              email: "syedhussainhaider5@gmail,com",
              text:
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Elit ullamcorper dignissim cras tincidunt. Sed euismod nisi porta lorem mollis aliquam. Sagittis aliquam malesuada bibendum arcu vitae elementum curabitur vitae nunc. Cras fermentum odio eu feugiat. Ipsum nunc aliquet bibendum enim facilisis gravida. Felis eget nunc lobortis mattis. Blandit aliquam etiam erat velit scelerisque. Augue ut lectus arcu bibendum. Sed odio morbi quis commodo odio aenean sed. Consectetur libero id faucibus nisl tincidunt. Urna condimentum mattis pellentesque id. Tellus id interdum velit laoreet id donec ultrices. Massa enim nec dui nunc mattis enim ut tellus elementum. Diam quis enim lobortis scelerisque fermentum dui. Feugiat scelerisque varius morbi enim nunc. Dui faucibus in ornare quam viverra. Rhoncus urna neque viverra justo nec. Euismod nisi porta lorem mollis aliquam. Turpis egestas maecenas pharetra convallis posuere. Scelerisque eu ultrices vitae auctor eu augue. Arcu dictum varius duis at consectetur lorem donec massa sapien. Nisi lacus sed viverra tellus in hac. Consequat ac felis donec et odio. A diam sollicitudin tempor id eu nisl nunc. Quam elementum pulvinar etiam non quam lacus suspendisse. Posuere ac ut consequat semper viverra nam libero justo. Quisque sagittis purus sit amet volutpat consequat. Quis imperdiet massa tincidunt nunc pulvinar sapien. Odio ut sem nulla pharetra diam sit amet nisl suscipit. Vulputate sapien nec sagittis aliquam malesuada bibendum arcu vitae elementum. Blandit turpis cursus in hac habitasse.\n\n Ut eu sem integer vitae justo eget magna. Viverra nam libero justo laoreet sit amet. Facilisi nullam vehicula ipsum a. Tincidunt tortor aliquam nulla facilisi cras fermentum odio eu. Risus sed vulputate odio ut enim. Tincidunt ornare massa eget egestas purus viverra accumsan in nisl. Elit at imperdiet dui accumsan."),
        ],
      ),
      drawer: Drawer(),
    );
  }
}
