import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:third_iteration/widgets/custom_text.dart';

class CommodityCodes extends StatelessWidget {
  const CommodityCodes({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: 215.h,
          padding: REdgeInsets.all(16.r),
          width: double.infinity,
          decoration: const BoxDecoration(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                text: 'Commodity Codes',
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                color: const Color(0xff54565B),
              ),
              SizedBox(height: 13.h),
              const Divider(),
              SizedBox(height: 13.h),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 6.w,
                    height: 6.w,
                    color: const Color(0xffC81107),
                  ),
                  SizedBox(width: 13.11.w),
                  CustomText(
                    text: 'maz',
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w700,
                    color: const Color(0xff8B908B),
                  ),
                ],
              ),
              SizedBox(height: 13.h),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 6.w,
                    height: 6.w,
                    color: const Color(0xffC81107),
                  ),
                  SizedBox(width: 13.11.w),
                  CustomText(
                    text: 'ssc',
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w700,
                    color: const Color(0xff8B908B),
                  ),
                ],
              ),
              SizedBox(height: 13.h),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 6.w,
                    height: 6.w,
                    color: const Color(0xffC81107),
                  ),
                  SizedBox(width: 13.11.w),
                  CustomText(
                    text: 'sg',
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w700,
                    color: const Color(0xff8B908B),
                  ),
                ],
              ),
              SizedBox(height: 13.h),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 6.w,
                    height: 6.w,
                    color: const Color(0xffC81107),
                  ),
                  SizedBox(width: 13.11.w),
                  CustomText(
                    text: 'sb',
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w700,
                    color: const Color(0xff8B908B),
                  ),
                ],
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 231.h,
          right: 10.w,
          child: CircleAvatar(
            radius: 20.r,
            backgroundColor: Colors.white,
            child: SvgPicture.asset('assets/icons/close.svg'),
          ),
        ),
      ],
    );
  }
}

class ConfirmDeliveryModal extends StatelessWidget {
  const ConfirmDeliveryModal({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 380.h,
      padding: REdgeInsets.symmetric(horizontal: 20.r),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 8.h),
          Container(
            width: 56.w,
            height: 4.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(11.r),
              color: const Color(
                0xff47494E,
              ),
            ),
          ),
          SizedBox(height: 28.h),
          Image.asset(
            'assets/images/combox-scale.png',
            width: 114.w,
            height: 114.w,
          ),
          SizedBox(height: 14.h),
          CustomText(
            text: 'Submit?',
            fontSize: 20.sp,
            fontWeight: FontWeight.w700,
          ),
          SizedBox(height: 9.h),
          CustomText(
            text: 'accept-delivery',
            textAlign: TextAlign.center,
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
          ),
          SizedBox(height: 44.h),
          Row(
            children: [
              MaterialButton(
                onPressed: () => Navigator.pop(context),
                minWidth: 154.w,
                height: 56.h,
                shape: RoundedRectangleBorder(
                  side: const BorderSide(
                    color: Color(0xffE1261C),
                  ),
                  borderRadius: BorderRadius.circular(100.r),
                ),
                child: CustomText(
                  text: 'cancel',
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w700,
                  color: const Color(0xffE1261C),
                ),
              ),
              SizedBox(width: 13.w),
              MaterialButton(
                onPressed: () {
                  Navigator.pop(context);
                  showModalBottomSheet(
                    context: context,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20.r),
                        topLeft: Radius.circular(20.r),
                      ),
                    ),
                    builder: (context) => const DeliveryConfirmedModal(),
                  );
                },
                minWidth: 154.w,
                height: 56.h,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100.r),
                ),
                color: const Color(0xffE1261C),
                child: CustomText(
                  text: 'proceed',
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class DeliveryConfirmedModal extends StatelessWidget {
  const DeliveryConfirmedModal({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 375.h,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 8.h),
          Container(
            width: 56.w,
            height: 4.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(11.r),
              color: const Color(
                0xff47494E,
              ),
            ),
          ),
          SizedBox(height: 28.h),
          Image.asset(
            'assets/images/memoji.png',
            width: 114.w,
            height: 114.w,
          ),
          SizedBox(height: 14.h),
          CustomText(
            text: 'delivery-logged',
            textAlign: TextAlign.center,
            fontSize: 20.sp,
            fontWeight: FontWeight.w700,
          ),
          SizedBox(height: 80.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              MaterialButton(
                onPressed: () => Navigator.pop(context),
                minWidth: 315.w,
                height: 56.h,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100.r),
                ),
                color: const Color(0xffE1261C),
                child: CustomText(
                  text: 'proceed',
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
