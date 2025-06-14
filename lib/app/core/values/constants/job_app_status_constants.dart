import 'package:flutter/material.dart';
import 'package:onboard_coolva/app/core/theme/app_color.dart';

enum JobApplicationStatus {
  applied,
  interview,
  onTest,
  ghosting,
  rejected,
  offering,
  noticed,
  noResponse,
}

extension JobApplicationStatusExtension on JobApplicationStatus {
  String get label {
    switch (this) {
      case JobApplicationStatus.applied:
        return 'Applied';
      case JobApplicationStatus.interview:
        return 'Interview';
      case JobApplicationStatus.onTest:
        return 'On Test';
      case JobApplicationStatus.ghosting:
        return 'Ghosting';
      case JobApplicationStatus.rejected:
        return 'Rejected';
      case JobApplicationStatus.offering:
        return 'Offering';
      case JobApplicationStatus.noticed:
        return 'Noticed';
      case JobApplicationStatus.noResponse:
        return 'No Response';
    }
  }

  Color get bgColor {
    switch (this) {
      case JobApplicationStatus.applied:
        return AppColor.primary100;
      case JobApplicationStatus.interview:
        return AppColor.info100;
      case JobApplicationStatus.onTest:
        return AppColor.warning100;
      case JobApplicationStatus.ghosting:
        return const Color(0x40000000); // 0.25 opacity black
      case JobApplicationStatus.rejected:
        return AppColor.danger100;
      case JobApplicationStatus.offering:
        return AppColor.success100;
      case JobApplicationStatus.noticed:
        return const Color(0xFFC7C3FF);
      case JobApplicationStatus.noResponse:
        return const Color(0xFFC7C9CD);
    }
  }

  Color get textColor {
    switch (this) {
      case JobApplicationStatus.applied:
        return AppColor.primary500;
      case JobApplicationStatus.interview:
        return AppColor.info700;
      case JobApplicationStatus.onTest:
        return AppColor.warning600;
      case JobApplicationStatus.ghosting:
        return const Color(0xFF000000);
      case JobApplicationStatus.rejected:
        return AppColor.danger500;
      case JobApplicationStatus.offering:
        return AppColor.success700;
      case JobApplicationStatus.noticed:
        return const Color(0xFF6C5CE7);
      case JobApplicationStatus.noResponse:
        return const Color(0xFF57606F);
    }
  }
}