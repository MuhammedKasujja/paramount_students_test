import 'package:flutter/material.dart';
import 'package:paramount_students/app_utils/helper/helper.dart';
import 'package:paramount_students/ui/profile/models/profile_data.dart';
import 'package:paramount_students/ui/profile/view_model/profile_view_model.dart';

class SABT extends StatefulWidget {
  final Widget child;
  const SABT({
    Key? key,
    required this.child,
  }) : super(key: key);
  @override
  _SABTState createState() {
    return _SABTState();
  }
}

class _SABTState extends State<SABT> {
  ScrollPosition? _position;
  bool? _visible;
  @override
  void dispose() {
    _removeListener();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _removeListener();
    _addListener();
  }

  void _addListener() {
    _position = Scrollable.of(context).position;
    _position?.addListener(_positionListener);
    _positionListener();
  }

  void _removeListener() {
    _position?.removeListener(_positionListener);
  }

  void _positionListener() {
    final FlexibleSpaceBarSettings? settings = context
        .dependOnInheritedWidgetOfExactType(aspect: FlexibleSpaceBarSettings);
    bool visible =
        settings == null || settings.currentExtent <= settings.minExtent;
    if (_visible != visible) {
      setState(() {
        _visible = visible;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: _visible!,
      child: Container(
        margin: topPadding(0),
        child: widget.child,
      ),
    );
  }
}

Widget profileInfo(
  BuildContext context, {
  String type = '',
  String name = '',
}) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 20),
    child: Row(
      children: [
        SizedBox(
          width: appWidth(context) * 0.4,
          child: sText("$type:", size: 14, align: TextAlign.left),
        ),
        Expanded(child: Container()),
        SizedBox(
          width: appWidth(context) * 0.49,
          child: sText(
            name,
            weight: FontWeight.w500,
            size: 14,
          ),
        ),
      ],
    ),
  );
}

class ProfileAppBar extends StatelessWidget {
  final ProfileViewModel model;
  const ProfileAppBar({
    super.key,
    required this.model,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      elevation: 0,
      leading: IconButton(
        padding: EdgeInsets.zero,
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Center(
            child: Icon(
          Icons.arrow_back,
          color: appBlackText,
        )),
      ),
      centerTitle: false,
      title: SABT(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: sText(
                  model.userData.fullName!.isEmpty
                      ? "Paramount Student"
                      : model.userData.fullName,
                  color: appBlackText,
                  size: 18,
                  maxLines: 1,
                  weight: FontWeight.bold),
            ),
            Container(
              child: sText(
                  model.userData.email!.isEmpty
                      ? "help@paramountstudents.com"
                      : model.userData.email,
                  color: appBlackText,
                  size: 16,
                  maxLines: 1),
            ),
          ],
        ),
      ),
      actions: [
        IconButton(
          padding: EdgeInsets.zero,
          onPressed: () {},
          icon: const Center(
              child: Icon(
            Icons.edit,
            color: appBlackText,
          )),
        ),
      ],
      expandedHeight: 320,
      floating: false,
      pinned: true,
      backgroundColor: appYellowText,
      flexibleSpace: FlexibleSpaceBar(
        background: Container(
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                children: [
                  Container(
                    color: appYellowText,
                    height: 180,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(3.0),
                        height: 120,
                        width: 120,
                        margin: const EdgeInsets.only(top: 135, left: 10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          border: Border.all(
                            width: 1.0,
                            color: Colors.white,
                          ),
                          image: model.userData.document!.formalPhoto == null
                              ? const DecorationImage(
                                  image: AssetImage(
                                    "assets/images/home_page_banner1.png",
                                  ),
                                )
                              : DecorationImage(
                                  image: NetworkImage(
                                    model.userData.document!.formalPhoto!,
                                  ),
                                ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  sText(
                      model.userData.fullName!.isEmpty
                          ? "Paramount Student"
                          : model.userData.fullName,
                      align: TextAlign.center,
                      weight: FontWeight.bold),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    decoration: BoxDecoration(
                      border: Border.all(color: appYellowText),
                    ),
                    child: sText(
                      model.userData.email!.isEmpty
                          ? "help@paramountstudents.com"
                          : model.userData.email,
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class VerifiedButton extends StatelessWidget {
  const VerifiedButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          border: Border.all(color: Colors.green)),
      child: Row(
        children: [
          const Icon(
            Icons.verified,
            color: Colors.green,
          ),
          const SizedBox(
            width: 3,
          ),
          sText("Verified", color: Colors.green, size: 12),
        ],
      ),
    );
  }
}

///To be used

class ProfileCard extends StatefulWidget {
  final ProfileDetailsModel profileDetailsModel;
  final Widget dropDownWidgets;
  const ProfileCard({
    super.key,
    required this.profileDetailsModel,
    required this.dropDownWidgets,
  });

  @override
  State<ProfileCard> createState() => _ProfileCardState();
}

class _ProfileCardState extends State<ProfileCard> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              if (widget.profileDetailsModel.isVisible) {
                widget.profileDetailsModel.isVisible = false;
              } else {
                widget.profileDetailsModel.isVisible = true;
              }
            });
          },
          child: Card(
            margin: EdgeInsets.zero,
            elevation: 2,
            shadowColor: Colors.grey[100],
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: Row(
                children: [
                  displayLocalImage(widget.profileDetailsModel.imagePath,
                      radius: 0),
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                    child: sText(widget.profileDetailsModel.title,
                        weight: FontWeight.bold, size: 16),
                  ),
                  Expanded(child: Container()),
                  Container(
                    child: displayLocalImage(
                      !widget.profileDetailsModel.isVisible
                          ? "arrow_down.png"
                          : "arrow_up.png",
                      radius: 0,
                    ),
                  ),
                  widget.profileDetailsModel.isVisible
                      ? widget.dropDownWidgets
                      : const SizedBox(
                          height: 40,
                        )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
