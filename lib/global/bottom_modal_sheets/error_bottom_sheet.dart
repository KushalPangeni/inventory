import 'package:flutter/material.dart';
import 'package:inventory/global/widgets/app_button.dart';
import 'package:inventory/global/widgets/app_text.dart';

bool _isBottomSheetVisible = false;

Future<void> showErrorBottomSheet(BuildContext context,
    {required String error, required String description, Widget? image,double leftPadding = 38}) async {
  if (_isBottomSheetVisible) return;

  _isBottomSheetVisible = true;

  await customShowBottomSheet(
    context,
    Wrap(
      alignment: WrapAlignment.center,
      crossAxisAlignment: WrapCrossAlignment.start,
      children: [
        Column(
          children: [
            BottomSheetHeader(
              header: 'Error',
              headerColor: Colors.red,
              leftPadding: leftPadding,
            ),
            const SizedBox(height: 16),
            AppText(error),
            const SizedBox(height: 8),

            AppText(
              description,
              maxLines: 10,
              textAlign: TextAlign.center,
              style: const TextStyle().defaultTextStyle(
                color: const Color(0xFF959595),
              ),
            ),
            const SizedBox(height: 26),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: AppButton(
                title: 'Ok',
                onPressed: () {
                  Navigator.of(context).pop();
                  _isBottomSheetVisible = false;
                },
              ),
            ),
            const SizedBox(height: 32),
          ],
        )
      ],
    ),
  ).whenComplete(() {
    _isBottomSheetVisible = false;
  });
}

customShowBottomSheet(BuildContext context, Widget widget,
    {bool? isDismissible = true}) async {
  await showModalBottomSheet(
      backgroundColor: Colors.white,
      elevation: 0,
      isScrollControlled: true,
      isDismissible: isDismissible!,
      enableDrag: false,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(16))),
      context: context,
      builder: (context) {
        return widget;
      });
}


class BottomSheetHeader extends StatelessWidget {
  final String header;
  final Color headerColor;
  final bool? showClearIcon;
  final Function()? onClear;
  final double leftPadding;

  const BottomSheetHeader(
      {super.key,
        required this.header,
        this.headerColor = Colors.black,
        this.showClearIcon = false,
        this.onClear,  this.leftPadding = 38});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        const SizedBox(height: 12),
        Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(left: leftPadding, right: 0, top: 0, bottom: 0),
                child: const SizedBox(),
              ),
              AppText(
                header,
                style: const TextStyle().defaultTextStyle(color: headerColor, fontSize: 16),
              ),
              showClearIcon!
                  ? Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: onClear,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 0, right: 20, top: 0, bottom: 0),
                    child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8), color: const Color(0xFFF4F4F4)),
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text('x'),
                        )),
                  ),
                ),
              )
                  : const SizedBox(),
            ],
          ),
        ),
        const SizedBox(height: 20),

        const DividerWithNoPadding()
      ],
    );
  }
}

class DividerWithNoPadding extends StatelessWidget {
  const DividerWithNoPadding({super.key});

  @override
  Widget build(BuildContext context) {
    return const Divider(
      height: 0,
      color: Color(0xFFEFEFEF),
      indent: 0,
      thickness: 1,
    );
  }
}
