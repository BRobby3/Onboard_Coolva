import 'package:flutter/material.dart';
import 'package:onboard_coolva/app/core/values/constants/job_app_status_constants.dart';
import 'package:get/get.dart';
import 'package:onboard_coolva/app/routes/app_pages.dart';
import 'package:onboard_coolva/app/core/values/assets/app_text_style.dart';
import '../widgets/job_card.dart';
import 'package:onboard_coolva/app/core/theme/app_color.dart';

import '../controllers/home_controller.dart';

String timeAgo(DateTime date) {
  final now = DateTime.now();
  final diff = now.difference(date);

  if (diff.inMinutes < 60) {
    return '${diff.inMinutes} menit yang lalu';
  } else if (diff.inHours < 24) {
    return '${diff.inHours} jam yang lalu';
  } else if (diff.inDays < 30) {
    return '${diff.inDays} hari yang lalu';
  } else if (diff.inDays < 365) {
    return '${(diff.inDays / 30).floor()} bulan yang lalu';
  } else {
    return '${(diff.inDays / 365).floor()} tahun yang lalu';
  }
}

final List<Map<String, dynamic>> jobs = [
  {
    'status': JobApplicationStatus.applied,
    'date': '2025-05-31 10:00:00',
    'title': 'Senior Software Engineer - Cloud Infrastructure',
    'company': 'Tokopedia',
  },
  {
    'status': JobApplicationStatus.noResponse,
    'date': '2025-05-31 14:30:00',
    'title': 'Mobile Developer',
    'company': 'Tokopedia',
  },
  {
    'status': JobApplicationStatus.interview,
    'date': '2025-05-06 09:00:00',
    'title': 'iOS Developer',
    'company': 'Tokopedia',
  },
  {
    'status': JobApplicationStatus.onTest,
    'date': '2025-05-31 08:00:00',
    'title': 'Data Analytics',
    'company': 'Tokopedia',
  },
  {
    'status': JobApplicationStatus.ghosting,
    'date': '2025-05-18 12:00:00',
    'title': 'UI Designer',
    'company': 'Tokopedia',
  },
  {
    'status': JobApplicationStatus.rejected,
    'date': '2025-04-01 15:00:00',
    'title': 'AI Engineer',
    'company': 'Tokopedia',
  },
  {
    'status': JobApplicationStatus.offering,
    'date': '2025-05-25 11:00:00',
    'title': 'Media Social Manager',
    'company': 'Tokopedia',
  },
  {
    'status': JobApplicationStatus.noticed,
    'date': '2024-12-01 13:00:00',
    'title': 'Product Manager',
    'company': 'Tokopedia',
  },
];

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          'Track This Job!',
          style: AppTextStyle.appBar,
        ),
        scrolledUnderElevation: 0.0,
        backgroundColor: Colors.white,
      ),
      backgroundColor: AppColor.neutral100,
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: jobs.length,
        itemBuilder: (context, index) {
          final job = jobs[index];
          final date = DateTime.tryParse(job['date'] ?? '') ?? DateTime.now();
          final timePassed = timeAgo(date);

          return Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: JobCard(
              job: job,
              timePassed: timePassed,
              onTap: () {
                Get.toNamed(
                  Routes.DETAIL,
                  arguments: job,
                );
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(Routes.ADD_JOB);
        },
        backgroundColor: AppColor.primary500,
        shape: const CircleBorder(),
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
