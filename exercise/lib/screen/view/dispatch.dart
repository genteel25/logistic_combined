import 'package:exercise/screen/view/stateless_view.dart';
import 'package:exercise/screen/widget/dispatch_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../controller/dispatch.dart';
import '../widget/custom_text.dart';
import '../widget/dispatch_tile.dart';
import '../widget/submit_modal.dart';

class DispatchView extends StatelessView<DispatchScreen, DispatchController> {
  const DispatchView(DispatchController state, {Key? key})
      : super(state, key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: (controller.addedDispatch || !controller.addDispatch)
          ? null
          : BottomAppBar(
              child: Container(
                height: 79.h,
                width: 375.w,
                color: const Color(0xffF2F2F2),
                padding:
                    REdgeInsets.symmetric(horizontal: 17.r, vertical: 10.r),
                child: MaterialButton(
                  onPressed: () {
                    showModalBottomSheet(
                      isScrollControlled: true,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(24.r),
                        ),
                      ),
                      isDismissible: false,
                      enableDrag: false,
                      barrierColor: Colors.grey[900]!.withOpacity(0.5),
                      context: context,
                      builder: (context) {
                        return SubmitModal(controller: controller);
                      },
                    );
                  },
                  color: const Color(0xffE1261C),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100.r),
                  ),
                  minWidth: 341.w,
                  height: 50.h,
                  child: CustomText(
                    text: 'submit',
                    align: TextAlign.center,
                    weight: FontWeight.w700,
                    size: 16.sp,
                    color: const Color(0xfff2f2f2),
                  ),
                ),
              ),
            ),
      body: Stack(
        children: [
          Positioned(
            top: 43.h,
            child: Container(
              width: 375.w,
              height: 101.h,
              color: const Color(0xff47494E),
              child: SvgPicture.asset(
                'asset/images/container_bg.svg',
                width: 375.w,
                height: 118.h,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            top: 72.h,
            left: 15.w,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () => controller.returnToPreviousScreen(),
                  child: Container(
                    width: 48.w,
                    height: 48.w,
                    padding: REdgeInsets.all(13.r),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.25.r),
                      color: Colors.white,
                    ),
                    child: const Icon(
                      Icons.arrow_back_ios,
                    ),
                  ),
                ),
                SizedBox(width: 16.w),
                CustomText(
                  text: 'OTC-363-22573378487015320',
                  weight: FontWeight.w600,
                  size: 14.sp,
                  align: TextAlign.center,
                  color: const Color(0xffc9c8c6),
                )
              ],
            ),
          ),
          controller.addedDispatch
              ? Positioned(
                  top:
                      controller.animationController.value == 0 ? 309.h : 400.h,
                  left: 0.w,
                  right: 0.w,
                  bottom: 0.h,
                  child: Stack(children: [
                    Positioned(
                      bottom: 0.h,
                      child: Image.asset('asset/images/icons/dispatchBack.png'),
                    ),
                    Positioned(
                      bottom: 32.h,
                      right: 18.w,
                      child: Container(
                        width: 48.w,
                        height: 48.h,
                        decoration: BoxDecoration(
                          color: const Color(0xffe1261c),
                          borderRadius: BorderRadius.circular(48),
                        ),
                        child: GestureDetector(
                            onTap: () {
                              controller.editDispatch();
                            },
                            child: Image.asset('asset/images/icons/fab.png')),
                      ),
                    ),
                    DispatchTile(controller: controller)
                  ]),
                )
              : controller.addDispatch
                  ? Positioned(
                      bottom: 0.h,
                      top: 284.h,
                      left: 0.w,
                      right: 0.w,
                      child: Column(
                        children: [
                          CustomTextFields(controller: controller),
                        ],
                      ),
                    )
                  : Positioned(
                      top: 250.h,
                      left: 0,
                      right: 0,
                      bottom: 0,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Spacer(),
                          SvgPicture.asset('asset/images/icons/lifter.svg'),
                          SizedBox(height: 8.97.h),
                          const CustomText(text: 'no-log'),
                          SizedBox(height: 32.h),
                          MaterialButton(
                            onPressed: () => controller.dispatchHandler(),
                            color: const Color(0xffE1261C),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(100.r),
                            ),
                            minWidth: 237.w,
                            height: 56.h,
                            child: CustomText(
                              text: 'log-dispatch',
                              color: const Color(0xfffff7f7),
                              weight: FontWeight.w700,
                              size: 16.sp,
                            ),
                          ),
                          const Spacer(),
                        ],
                      ),
                    ),
          Positioned(
            top: 144.h,
            child: Container(
              padding: REdgeInsets.fromLTRB(26.w, 15.h, 26.w, 0),
              height: controller.animationController.value == 0 ? 140.h : 235.h,
              width: 375.w,
              color: const Color(0xffEBEBEB),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(
                        align: TextAlign.center,
                        text: 'buyer',
                        color: const Color(0xff47494E),
                        weight: FontWeight.w700,
                        size: 12.sp,
                      ),
                      CustomText(
                        align: TextAlign.center,
                        text: 'Dangote | 5000112353',
                        color: const Color(0xff47494E),
                        weight: FontWeight.w400,
                        size: 12.sp,
                      ),
                    ],
                  ),
                  SizedBox(height: 12.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(
                        align: TextAlign.center,
                        text: 'seller',
                        color: const Color(0xff47494E),
                        weight: FontWeight.w700,
                        size: 12.sp,
                      ),
                      CustomText(
                        align: TextAlign.center,
                        text: 'Hybrid | 9900112234',
                        color: const Color(0xff47494E),
                        weight: FontWeight.w400,
                        size: 12.sp,
                      ),
                    ],
                  ),
                  SizedBox(height: 14.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(
                        align: TextAlign.center,
                        text: 'volume',
                        color: const Color(0xff47494E),
                        weight: FontWeight.w700,
                        size: 12.sp,
                      ),
                      CustomText(
                        align: TextAlign.center,
                        text: '1000 MT',
                        color: const Color(0xff47494E),
                        weight: FontWeight.w400,
                        size: 12.sp,
                      ),
                    ],
                  ),
                  if (!controller.animationController.isAnimating &&
                      controller.animationController.value != 0.0)
                    SizedBox(height: 14.h),
                  if (!controller.animationController.isAnimating &&
                      controller.animationController.value != 0.0)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(
                          align: TextAlign.center,
                          text: "buyer-price",
                          color: const Color(0xff47494E),
                          weight: FontWeight.w700,
                          size: 12.sp,
                        ),
                        CustomText(
                          align: TextAlign.center,
                          text: '280,000',
                          color: const Color(0xff47494E),
                          weight: FontWeight.w400,
                          size: 12.sp,
                        ),
                      ],
                    ),
                  if (!controller.animationController.isAnimating &&
                      controller.animationController.value != 0.0)
                    SizedBox(height: 14.h),
                  if (!controller.animationController.isAnimating &&
                      controller.animationController.value != 0.0)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(
                          align: TextAlign.center,
                          text: "seller-price",
                          color: const Color(0xff47494E),
                          weight: FontWeight.w700,
                          size: 12.sp,
                        ),
                        CustomText(
                          align: TextAlign.center,
                          text: '250,000',
                          color: const Color(0xff47494E),
                          weight: FontWeight.w400,
                          size: 12.sp,
                        ),
                      ],
                    ),
                  if (!controller.animationController.isAnimating &&
                      controller.animationController.value != 0.0)
                    SizedBox(height: 14.h),
                  if (!controller.animationController.isAnimating &&
                      controller.animationController.value != 0.0)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(
                          align: TextAlign.center,
                          text: 'delivered-volume',
                          color: const Color(0xff47494E),
                          weight: FontWeight.w700,
                          size: 12.sp,
                        ),
                        CustomText(
                          text: '0 / 1000',
                          align: TextAlign.center,
                          color: const Color(0xff47494E),
                          weight: FontWeight.w400,
                          size: 12.sp,
                        ),
                      ],
                    ),
                  SizedBox(height: 14.h),
                  GestureDetector(
                    onTap: () => controller.playContainerAnimation(),
                    child: Container(
                      height: 20.h,
                      width: 80.w,
                      decoration: BoxDecoration(
                        color: const Color(0xffE1261C),
                        borderRadius: BorderRadius.circular(4.r),
                      ),
                      child: Center(
                        child: CustomText(
                          align: TextAlign.center,
                          text: controller.animationController.value == 0
                              ? 'view-more'
                              : 'collapse',
                          color: Colors.white,
                          size: 12.sp,
                          weight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20.h),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
