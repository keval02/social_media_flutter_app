import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:textfield_tags/textfield_tags.dart';

import 'app_color.dart';
import 'constants.dart';

class SocialMediaScreen extends StatefulWidget {
  const SocialMediaScreen({Key? key}) : super(key: key);

  @override
  State<SocialMediaScreen> createState() => _SocialMediaScreenState();
}

class _SocialMediaScreenState extends State<SocialMediaScreen> {
  double _distanceToField = 0.0;
  TextfieldTagsController _controller = TextfieldTagsController();
  TextEditingController commentController = TextEditingController();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _distanceToField = MediaQuery.of(context).size.width;
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  void initState() {
    super.initState();
    _controller = TextfieldTagsController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("자유톡"),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.notifications_none_rounded,
                color: Colors.grey,
              ))
        ],
        leading: IconButton(
            onPressed: () {}, icon: const Icon(Icons.arrow_back_ios)),
      ),
      body: screenView(),
    );
  }

  Widget screenView() {
    return Stack(
      children: [
        SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              profile(),
              const Padding(
                padding: EdgeInsets.only(left: 15.0, right: 15.0, top: 8),
                child: Text(
                  "지난 월요일에 했던 이벤트 중 가장 괜찮은 상품 뭐야?",
                  style: TextStyle(
                      color: AppColor.textColorBlack,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 15.0, right: 15.0),
                child: Text(
                    "지난 월요일에 2023년 S/S 트렌드 알아보기 이벤트 참석했던 팝들아~ \n 혹시 어떤 상품이 제일 괜찮았어?\n\n후기 올라오는거 보면 로우라이즈? 그게 제일 반응 좋고 그 테이블이\n제일 재밌었다던데 맞아???\n\n올해 로우라이즈가 트렌드라길래 나도 도전해보고 싶은데 말라깽이가\n아닌 사람들도 잘 어울릴지 너무너무 궁금해ㅜㅜ로우라이즈 테이블에\n있었던 팝들 있으면 어땠는지 후기 좀 공유해주라~~!"),
              ),
              textFieldTags(),
              imageWidget(context),
              favouriteSection(),
              Divider(
                color: Colors.grey[200],
              ),
              commentWidget(),
              commnetFavorite(),
              replyComment(),
              replyCommentFavorite(),
              Container(
                margin: EdgeInsets.only(
                    bottom: MediaQuery.of(context).size.height * 0.1),
              )
            ],
          ),
        ),
        Positioned(
          bottom: 0,
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.08,
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                Divider(
                  color: Colors.grey[100],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Wrap(
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(left: 8.0),
                          child: Icon(Icons.image, color: AppColor.grey),
                        ),
                        Container(
                          padding: const EdgeInsets.only(left: 8.0),
                          width: MediaQuery.of(context).size.width * 0.75,
                          child: TextFormField(
                            decoration: const InputDecoration(
                              hintText:"댓글을 남겨주세요.",
                              enabledBorder: UnderlineInputBorder( //<-- SEE HERE
                                borderSide: BorderSide(
                                    width: 0, color: AppColor.transparent),
                              ),
                              focusedBorder: UnderlineInputBorder( //<-- SEE HERE
                                borderSide: BorderSide(
                                    width: 0, color: AppColor.transparent),
                              ),
                            ),
                            controller: commentController,
                          ),
                        ),
                      ],
                    ),
                    Wrap(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Text("등록"),
                        )
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget replyCommentFavorite() {
    return Container(
      margin: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.21),
      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 8.0, right: 8.0),
            child: IconWithText(icon: Icons.favorite_border, text: "5"),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8.0),
            child: Row(
              children: [
                SizedBox(
                    height: MediaQuery.of(context).size.height * 0.025,
                    width: MediaQuery.of(context).size.width * 0.06,
                    child: SvgPicture.asset(
                      Constants.chatImage,
                      color: AppColor.iconColor,
                    )),
                const Text(
                  "5",
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget replyComment() {
    return Container(
      margin: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.115),
      padding: const EdgeInsets.only(left: 15.0, right: 15.0),
      child: Stack(
        children: [
          const Positioned(
            right: 0,
            top: 0,
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: IconWithText(icon: Icons.more_horiz_outlined),
            ),
          ),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      roundImage(),
                      Container(
                        margin: EdgeInsets.only(
                            left: 8,
                            top: MediaQuery.of(context).size.height * 0.025),
                        child: const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Text(
                                  "ㅇㅅㅇ ",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 18),
                                ),
                                Visibility(
                                  visible: false,
                                  child: Icon(
                                    Icons.check_circle,
                                    color: AppColor.darkGreen,
                                  ),
                                ),
                                Text(
                                  "1일전",
                                  style: TextStyle(
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.115),
                // width: MediaQuery.of(context).size.width * 0.115,
                child: Row(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.65,
                      child: const Text(
                        "오 대박! 라이브 리뷰 오늘 올라온대요? 챙겨봐야겠다\n",
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget commnetFavorite() {
    return Container(
      margin: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.115),
      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: IconWithText(icon: Icons.favorite_border, text: "5"),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              children: [
                SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                    width: MediaQuery.of(context).size.width * 0.06,
                    child: SvgPicture.asset(
                      Constants.chatImage,
                      color: AppColor.iconColor,
                    )),
                const Text(
                  "5",
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget commentWidget() {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0, right: 15.0),
      child: Stack(
        children: [
          const Positioned(
            right: 0,
            top: 0,
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: IconWithText(icon: Icons.more_horiz_outlined),
            ),
          ),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      roundImage(),
                      Container(
                        margin: EdgeInsets.only(
                            left: 8,
                            top: MediaQuery.of(context).size.height * 0.025),
                        child: const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Text(
                                  "안녕 나 응애 ",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 18),
                                ),
                                Icon(
                                  Icons.check_circle,
                                  color: AppColor.darkGreen,
                                ),
                                Text(
                                  "1일전",
                                  style: TextStyle(
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.115),
                // width: MediaQuery.of(context).size.width * 0.115,
                child: Row(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.7,
                      child: const Text(
                        "어머 제가 있던 테이블이 제일 반응이 좋았나보네요🤭\n"
                        "우짤래미님도 아시겠지만 저도 일반인 몸매 그 이상도 이하도\n"
                        "아니잖아요?! 그런 제가 기꺼이 도전해봤는데 생각보다\n"
                        "괜찮았어요! 오늘 중으로 라이브 리뷰 올라온다고 하니\n"
                        "꼭 봐주세용~!",
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget roundImage() {
    return Container(
      decoration: const BoxDecoration(
          color: AppColor.containerFillCircleColor,
          shape: BoxShape.circle
          ),
      margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.025),
      height: MediaQuery.of(context).size.height * 0.055,
      width: MediaQuery.of(context).size.width * 0.05,
      child: Image.asset(Constants.userImage),
    );
  }

  Widget favouriteSection() {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: IconWithText(icon: Icons.favorite_border, text: "5"),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              children: [
                SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                    width: MediaQuery.of(context).size.width * 0.06,
                    child: SvgPicture.asset(
                      Constants.chatImage,
                      color: AppColor.iconColor,
                    )),
                const Text(
                  "5",
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
                width: MediaQuery.of(context).size.width * 0.06,
                child: SvgPicture.asset(
                  Constants.savedImage,
                  color: AppColor.iconColor,
                )),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: IconWithText(icon: Icons.more_horiz_outlined),
          ),
        ],
      ),
    );
  }

  Widget imageWidget(BuildContext context) {
    final platform = Theme.of(context).platform;
    return Container(
        margin: const EdgeInsets.all(1),
        height: MediaQuery.of(context).size.height * 0.5,
        width: MediaQuery.of(context).size.width,
        child: CachedNetworkImage(
          imageUrl: platform == TargetPlatform.android ||
                  platform == TargetPlatform.iOS
              ? "https://wjddnjs754.cafe24.com/web/product/small/202303/5b9279582db2a92beb8db29fa1512ee9.jpg"
              : Constants.mainImage,
          fit: BoxFit.fill,
          progressIndicatorBuilder: (context, url, downloadProgress) =>
              SizedBox(
                  height: 20,
                  width: 20,
                  child: Center(
                      child: CircularProgressIndicator(
                          value: downloadProgress.progress))),
          errorWidget: (context, url, error) => const Icon(Icons.error),
        ));
  }

  Widget textFieldTags() {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0, right: 15.0),
      child: TextFieldTags(
        textfieldTagsController: _controller,
        inputfieldBuilder: (context, tec, fn, error, onChanged, onSubmitted) {
          return ((context, sc, tags, onTagDelete) {
            return TextField(
              maxLines: 3,
              controller: tec,
              focusNode: fn,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: _controller.hasTags ? '' : "Enter tag...",
                errorText: error,
                prefixIconConstraints:
                    BoxConstraints(maxWidth: _distanceToField * 0.74),
                prefixIcon: tags.isNotEmpty
                    ? SingleChildScrollView(
                        controller: sc,
                        scrollDirection: Axis.horizontal,
                        child: Row(
                            children: tags.map((String tag) {
                          return Container(
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(20.0),
                              ),
                              color: AppColor.textTagsColor,
                            ),
                            margin: const EdgeInsets.symmetric(horizontal: 5.0),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10.0, vertical: 5.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                InkWell(
                                  child: Text(
                                    '#$tag',
                                    style: const TextStyle(
                                        color: AppColor.textTagsTextColor),
                                  ),
                                  onTap: () {
                                    if (kDebugMode) {
                                      print("$tag selected");
                                    }
                                  },
                                ),
                                const SizedBox(width: 4.0),
                                InkWell(
                                  child: const Icon(
                                    Icons.cancel,
                                    size: 14.0,
                                    color: Color.fromARGB(255, 233, 233, 233),
                                  ),
                                  onTap: () {
                                    onTagDelete(tag);
                                  },
                                )
                              ],
                            ),
                          );
                        }).toList()),
                      )
                    : null,
              ),
              onChanged: onChanged,
              onSubmitted: onSubmitted,
            );
          });
        },
        initialTags: const [
          '2023',
          'TODAYISMONDAY',
          'TOP',
          'POPS!',
          'WOW',
          'ROW'
        ],
        textSeparators: const [' ', ','],
        letterCase: LetterCase.normal,
        validator: (String tag) {
          if (tag == 'php') {
            return 'No, please just no';
          } else if (_controller.getTags!.contains(tag)) {
            return 'you already entered that';
          }
          return null;
        },
      ),
    );
  }

  Widget profile() {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0, right: 15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // SizedBox(
          //   width: MediaQuery.of(context).size.width * 0.04,
          // ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              roundImage(),
              Container(
                margin: EdgeInsets.only(
                    left: 8, top: MediaQuery.of(context).size.height * 0.025),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          "안녕 나 응애 ",
                          style: TextStyle(color: Colors.black, fontSize: 18),
                        ),
                        Icon(
                          Icons.check_circle,
                          color: AppColor.darkGreen,
                        ),
                        Text("1일전", style: TextStyle(color: Colors.grey)),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "165cm",
                          style: TextStyle(color: Colors.grey),
                        ),
                        SizedBox(
                          width: 2,
                        ),
                        Text("- 53kg", style: TextStyle(color: Colors.grey)),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          Container(
            margin:
                EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.01),
            height: MediaQuery.of(context).size.height * 0.04,
            width: MediaQuery.of(context).size.width * 0.25,
            child: ElevatedButton(
              onPressed: () {},
              style:
                  ElevatedButton.styleFrom(backgroundColor: AppColor.darkGreen),
              child: const Text(
                "팔로우",
                style: TextStyle(color: Colors.white),
              ),
            ),
          )
          // Container(),
        ],
      ),
    );
  }
}

class IconWithText extends StatelessWidget {
  final IconData icon;
  final String? text;

  const IconWithText({
    super.key,
    required this.icon,
    this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: AppColor.iconColor,
        ),
        Text(
          text ?? "",
          style: const TextStyle(fontSize: 18),
        ),
      ],
    );
  }
}
