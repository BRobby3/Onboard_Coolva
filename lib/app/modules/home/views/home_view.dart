import 'package:flutter/material.dart';
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
      body: StreamBuilder<List<Map<String, dynamic>>>(
        stream: controller.jobsStream,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          final jobs = snapshot.data ?? [];

          // Sort jobs by date descending (latest first)
          jobs.sort((a, b) {
            final dateA = DateTime.tryParse(a['date'] ?? '') ?? DateTime(1970);
            final dateB = DateTime.tryParse(b['date'] ?? '') ?? DateTime(1970);
            return dateB.compareTo(dateA);
          });

          return ListView.builder(
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
